WITH AggregatedData AS
(
    SELECT
        location,
        System.Timestamp() AS windowEnd,

        AVG(iceThickness) AS avgIceThickness,
        MIN(iceThickness) AS minIceThickness,
        MAX(iceThickness) AS maxIceThickness,

        AVG(surfaceTemp) AS avgSurfaceTemp,
        MIN(surfaceTemp) AS minSurfaceTemp,
        MAX(surfaceTemp) AS maxSurfaceTemp,

        MAX(snowAccumulation) AS maxSnowAccumulation,
        AVG(externalTemp) AS avgExternalTemp,

        COUNT(*) AS readingCount

    FROM [CST8916-IoTHub]

    GROUP BY
        location,
        TumblingWindow(minute, 5)
)

SELECT
    location,
    windowEnd,
    avgIceThickness,
    minIceThickness,
    maxIceThickness,
    avgSurfaceTemp,
    minSurfaceTemp,
    maxSurfaceTemp,
    maxSnowAccumulation,
    avgExternalTemp,
    readingCount,

    CASE
        WHEN avgIceThickness >= 30
             AND maxSnowAccumulation < 2
             AND avgSurfaceTemp <= -5
        THEN 'Safe'

        WHEN avgIceThickness >= 15
        THEN 'Caution'

        ELSE 'Unsafe'
    END AS safetyStatus

INTO [SensorData]
FROM AggregatedData;


SELECT *
INTO [canal-archive]
FROM [CST8916-IoTHub];
