workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        user = person "User"
        system = softwareSystem "Software System" {
            !docs ./
            !adrs ./decision-records
            webapp = container "Web Application" {
                !docs ./components/webapp/detailed-design.md
                controller = component "Controller" {
                    description "Handles HTTP requests and responses"
                    technology "Spring MVC"
                }
                service = component "Service" {
                    description "Business logic layer"
                    technology "Spring Service"
                }
                repository = component "Repository" {
                    description "Data access layer"
                    technology "Spring Data JPA"
                }
            }
            db = container "Database Schema" {
                tags "Database"
            }
        }

        user -> system.webapp.controller "Uses"
        system.webapp.controller -> system.webapp.service "Invokes"
        system.webapp.service -> system.webapp.repository "Uses"
        system.webapp.repository -> system.db "Reads from and writes to"


        production = deploymentEnvironment "Production" {
            deploymentNode "Server 1" {
                containerInstance system.webapp
                deploymentNode "Database Server" {
                    containerInstance system.db
                }
            }
            deploymentNode "Server 2" {
                containerInstance system.webapp
                deploymentNode "Database Server" {
                    containerInstance system.db
                }
            }
        }

    }

    views {

        systemContext system "Diagram1" {
            include *
            autolayout lr
        }

        container system "Diagram2" {
            include *
            autolayout lr
        }

        component system.webapp "WebAppComponentView" {
            include *
            autolayout lr
        }

        image system.webapp.controller "WebappControllerComponentCode" {
            image ./components/webapp/diagrams/controller-component.svg
        }

        deployment * production {
            include *
            autolayout
        }
        dynamic system requestDataFlow {
            title "Request data from database feature"
            user -> system.webapp "Requests data via API"
            system.webapp -> system.db "Queries for data using"
            autoLayout lr
        }

        styles {
            element "Element" {
                background #438DD4
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427B
            }
            element "Software System" {

            }
            element "Container" {

            }
            element "Database" {
                shape cylinder
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}