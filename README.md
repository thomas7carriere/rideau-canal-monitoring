# CST8916 - Final Project

## Student Information
- **Name:** Thomas de Haan Carriere
- **Student ID:** 41276876
- **Course:** CST8916 

## Repository Links

### 1. Main Documentation Repository
- **URL:** https://github.com/thomas7carriere/rideau-canal-monitoring
- **Description:** Complete project documentation, architecture, screenshots, and guides

### 2. Sensor Simulation Repository
- **URL:** https://github.com/thomas7carriere/rideau-canal-sensor-simulation
- **Description:** IoT sensor simulator code

### 3. Web Dashboard Repository
- **URL:** https://github.com/thomas7carriere/rideau-canal-dashboard
- **Description:** Web dashboard application

## Demo

- **Video Demo:** https://youtu.be/gtDjWlopZ40

## System Architecture

Documentated and explain in the architecture diagram

## Implementation Overview

- IoT Sensor Simulation: a python application which connects three devices to the IoT hub using their connection strings. Generates random temperature, accumulation and ice thickness data from three locations.
- Azure IoT Hub configuration: configured with three devices, each corresponding to a different location along the canal.
- Stream Analytics job: ingests the data from the IoT hub devices. 1. Outputs the raw data to blob storage. 2. Analyze the device data to report average device readings and a safety recommendation on the ice quiality for skating.
- Cosmos DB setup: a simple database which is configured as the output for the aggregated data processed by the stream analytics job.
- Blob Storage configuration: blob storage configured as an output for the raw data received by the stream analytics job.
- Web Dashboard: a python flask application displaying the aggregated data from the stream analytics job by connecting to the Cosmos DB.
- Azure App Service deployment: 

## Setup Instructions

## Results and Analysis

## Challenges and Solutions

## AI Tools Disclosure

Chatgpt was used to help debug and generate code for the python applications

