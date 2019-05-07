install.packages("devtools");
library(devtools);
install_github("ohdsi/StudyProtocolSandbox/DataQuality",args="--no-multiarch")
library(DataQuality)

# make sure achilles() has been executed some time prior running this function)
# workDatabseSchema should contain Achilles tables
# connectionDetails are standard OHDSI details for database connection
achilles()

createMIAD <- function(connectionDetails,
                       cdmDatabaseSchema,
                       workDatabaseSchema,
                       outputFolder='C:/Users/emmanburgonia/Desktop',
                       level = 3)

install.packages("devtools")
library(devtools)
install_github("ohdsi/StudyProtocolSandbox/DataQuality",args="--no-multiarch")
library(DataQuality)