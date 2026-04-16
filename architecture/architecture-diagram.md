```mermaid
flowchart LR
    A[Python Data Simulator]

    subgraph B[Azure IoT Hub]
        D1[dows-lake-device]
        D2[fifth-avenue-device]
        D3[nac-device]
    end

    C[Azure Stream Analytics Aggregation Query]
    E[Azure Cosmos DB Aggregated Data]
    F[Azure Blob Storage Raw Telemetry Archive]
    G[Dashboard Application]

    A -->|send telemetry| D1
    A -->|send telemetry| D2
    A -->|send telemetry| D3

    D1 --> C
    D2 --> C
    D3 --> C

    C -->|aggregated output| E
    C -->|raw output| F

    G -->|HTTP request for dashboard data| E
