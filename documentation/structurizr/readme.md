# Project Overview

This project uses Structurizr to document the architecture of a software system. The documentation includes architecture decision records (ADRs) and system landscape diagrams.

## Docker Setup

The project includes a `docker-compose.yaml` file to run Structurizr Lite:

```yaml
services:
  structurizr:
    image: structurizr/lite:latest
    environment:
      STRUCTURIZR_WORKSPACE_FILENAME: system-landscape
    volumes:
      - ./documentation:/usr/local/structurizr
    ports:
      - "8080:8080"
```

## System Landscape
The system landscape is defined in the system-landscape.dsl file. It includes the following elements:  
- User: A person who uses the system.
- Software System: The main software system, which includes:
- Web Application: A container for the web application.
- Database Schema: A container for the database schema.

The relationships between these elements are also defined, along with views and styles for visual representation.

## Architecture Decision Records
The project follows the Architecture Decision Records (ADR) process to document architectural decisions. The ADRs are stored in the ```documentation/decision-records``` directory.

## Software Architectural Design
The software architectural design is documented in the ```software-architectural-design.md``` file.

## Detailed Component Design
The detailed design of the web application component is documented in the ```components/webapp-detailed-design.md``` file.


## Running the Project
To run the Structurizr Lite service, use the following command:

```bash
docker-compose up
```

Access the Structurizr Lite interface at http://localhost:8080.

## License
This project is licensed under the MIT License.