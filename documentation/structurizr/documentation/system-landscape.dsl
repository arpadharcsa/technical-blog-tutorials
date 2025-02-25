workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        user = person "User"
        system = softwareSystem "Software System" {
            !docs ./
            !adrs ./decision-records
            webapp = container "Web Application" {
                !docs ./components/webapp-detailed-design.md
            }
            db = container "Database Schema" {
                tags "Database"
            }
        }

        user -> system.webapp "Uses"
        system.webapp -> system.db "Reads from and writes to"
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

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #199b65
                shape person
            }
            element "Software System" {
                background #1eba79
            }
            element "Container" {
                background #23d98d
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