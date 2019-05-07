install.packages("devtools");library(devtools);
install_github("ohdsi/StudyProtocolSandbox/DataQuality",args="--no-multiarch")
library(DataQuality)

# make sure achilles() has been executed some time prior running this function)
# workDatabseSchema should contain Achilles tables
# connectionDetails are standard OHDSI details for database connection

createMIAD <- function(connectionDetails,
                       cdmDatabaseSchema,
                       workDatabaseSchema,
                       outputFolder='c:/temp/'
                       ,level = 3) 


install.packages("devtools")
library(devtools)
install_github("ohdsi/StudyProtocolSandbox/DataQuality",args="--no-multiarch")
library(DataQuality)
                       
#use your previous connectionDetails object with username and psw for database
#or get it from an external file 
source('c:/r/conn.R')  #

library(DataQuality)


workFolder <- 'c:/temp/DQStudy-dataset1'  #ideally, use one workFolder per database
dir.create(workFolder) 

#populate database parameters
cdmDatabaseSchema <-'datasetA'
resultsDatabaseSchema <-'datasetAResults' 


executeDQ(connectionDetails = connectionDetails,cdmDatabaseSchema = cdmDatabaseSchema,
          resultsDatabaseSchema = resultsDatabaseSchema,workFolder = workFolder)


#decide on a name under which you want to report results
dbName='myDatabase43'

#generate the zip file
packageResults(connectionDetails,cdmDatabaseSchema,workFolder,dbName)

#to see what is being used, inspect the zip file (or simply all files in the  export sub-folder of the workFolder (this  data subset is being submitted to the study team as a zip file)    

submitResults(exportFolder =file.path(workFolder,'export'),
              dbName = dbName,
              studyBucketName = 'ohdsi-study-dataquality',
              key=studyKey,
              secret =studySecret
)

workFolder <- 'c:/temp/DQStudy-dataset1'  #ideally, use one workFolder per database
dir.create(workFolder) 

#populate database parameters
cdmDatabaseSchema <-'datasetA'
resultsDatabaseSchema <-'datasetAResults' 


executeDQ(connectionDetails = connectionDetails,
          cdmDatabaseSchema = cdmDatabaseSchema,
          resultsDatabaseSchema = resultsDatabaseSchema,
          workFolder = workFolder
)

exportFolder<-file.path(workFolder,'export')

writeReport(exportFolder = exportFolder,
            outputFile = file.path(workFolder,'report.docx')
)

workFolder <- 'c:/temp/DQStudy-dataset1'  #ideally, use one workFolder per database
dir.create(workFolder) 

#populate database parameters
cdmDatabaseSchema <-'datasetA'
resultsDatabaseSchema <-'datasetAResults' 
#connectionDetails #make sure this object exists


cT<-checkThemis(connectionDetails = connectionDetails,
                cdmDatabaseSchema = cdmDatabaseSchema,
                resultsDatabaseSchema = resultsDatabaseSchema,
                outputFolder = workFolder
)

                       