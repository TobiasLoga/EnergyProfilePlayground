
length (which (5 == c (0,1,2,3,4,5))) > 0


## Erzeugen der RDA -----

### Holen und Speichern der Building Type Matrix  -----

DF_BuildingTypeMatrix <- NA
DF_BuildingTypeMatrix <- read.delim ("clipboard")
save (DF_BuildingTypeMatrix, file = "DF_BuildingTypeMatrix.rda")

# Das funktioniert in Shiny nicht:
base::load ("data/DF_BuildingTypeMatrix.rda")

# Aber das hier funktioniert!!!!
base::load ("www/DF_BuildingTypeMatrix.rda")
# Das heißt es wird beim Laden mit relativer Adresse vom Skript-Ordner "R" ausgegangen!




## Test Einzel-Bausteine aus der Shiny App -----




MatrixPicName <- function (
    i_Col_BuildingType,
    i_Row_BuildingType
) {
  
  Code_BuildingType <- 
    DF_BuildingTypeMatrix [
      i_Row_BuildingType,
      paste0 (
        "Code_BuildingType_Column", 
        i_Col_BuildingType
      )]

  if (Code_BuildingType == "") {
    Name_Pic <- 
      "noimg.jpg"
  }  else {
    Name_Pic <- 
      paste0 (
        Code_BuildingType, 
        ".ReEx.001.jpg"
      )
  }
  
  return (Name_Pic)
  
} # End function MatrixPicName



BuildingTypeInfo <- function (
    i_Row_BuildingType,
    i_Col_BuildingType,
    ColumnName_FixedPart 
) {
  
  Info_BuildingType <- 
    DF_BuildingTypeMatrix [
      i_Row_BuildingType,
      paste0 (
        ColumnName_FixedPart, 
        i_Col_BuildingType
      )]

  if (is.na (Info_BuildingType)) {
    Info_BuildingType <- "-"
  }  
  
  if (Info_BuildingType == "") {
    Info_BuildingType <- "-"
  }  
  
  return (Info_BuildingType)
  
} # End function BuildingTypeInfo




i_Row_BuildingType <- 11
i_Col_BuildingType <- 1


MatrixPicName (
  i_Row_BuildingType = i_Row_BuildingType, 
  i_Col_BuildingType = i_Col_BuildingType
)

BuildingTypeInfo (
  i_Row_BuildingType = i_Row_BuildingType, 
  i_Col_BuildingType = i_Col_BuildingType,
  ColumnName_FixedPart = "Code_BuildingType_National_Column"
)








#ID_Dataset <- "Example.01"
#ID_Dataset <- "DE.MOBASY.WBG.0008.61"
ID_Dataset <- c ("Example.01", "DE.MOBASY.WBG.0008.61")


# TabulaTables <-
#   MobasyModel::GetParameterTables_RDataPackage

#View (tabuladata::u.class.constr)
#View (tabuladata::measure.f.default)



# 
# MobasyBuildingDataTables <- 
#   MobasyModel::GetBuildingData_RDataPackage (
#     myFilterName = "All"
#     #myFilterName = "Examples"
#     #      myFilterName = "WebTool"
#   )
# # [input$ID_Dataset]


#View (MobasyBuildingDataTables$Data_Input)





TabulaTables <- #reactive ({
  MobasyModel::GetParameterTables_RDataPackage ()
#})

MobasyBuildingDataTables <- #reactive ({
  MobasyModel::GetBuildingData_RDataPackage (
    myFilterName = "All"
    #myFilterName = "Examples"
    #      myFilterName = "WebTool"
  )
#})
# [input$ID_Dataset]

DF_Pool_Input_Prep1 <- #reactive ({
  RemoveStringFromDFColNames (
    myDataFrame = data.frame (MobasyBuildingDataTables  ["Data_Input"]),
    myStringToRemove = "Data_Input.")
#})

View (tabuladata::u.class.constr)
MobasyBuildingDataTables$Data_Input$Code_U_Class_National

DF_Pool_Input_Prep2 <- #reactive ({
  as.data.frame (
    cbind (
      data.frame (DF_Pool_Input_Prep1  [ , 1]),
      data.frame (DF_Pool_Input_Prep1 )
    )
  )
#})

DF_Pool_Input <- #reactive ({
  SetDFColNames (
    myDataFrame = DF_Pool_Input_Prep2 , 
    myColNames = c (
      "ID_Stack", 
      colnames (
        as.data.frame (
          DF_Pool_Input_Prep1 
        )
      )
    )
  )
#})




DF_Pool_Output_Prep1 <- #reactive ({
  RemoveStringFromDFColNames (
    myDataFrame = data.frame (MobasyBuildingDataTables  ["Data_Output"]),
    myStringToRemove = "Data_Output.")
#})

DF_Pool_Output_Prep2 <- #reactive ({
  as.data.frame (
    cbind (
      data.frame (DF_Pool_Output_Prep1  [ , 1]),
      data.frame (DF_Pool_Output_Prep1 )
    )
  )
#})

DF_Pool_Output_Prep3 <- #reactive ({
  SetDFColNames (
    myDataFrame = DF_Pool_Output_Prep2 , 
    myColNames = c (
      "ID_Stack", 
      colnames (
        as.data.frame (
          DF_Pool_Output_Prep1 
        )
      )
    )
  )
#})

DF_Pool_Output <- #reactive ({
  cbind (
    DF_Pool_Output_Prep3  [ , (1:2)],
    DF_Pool_Input  [ , c("Date_Entry", "Date_Change")],
    DF_Pool_Output_Prep3  [ , (3:ncol (DF_Pool_Output_Prep3 ))]
  )
  
#})


# nicht umgesetzt, da doch nicht benötigt --> diesen Block später löschen
# 
# DF_Pool_CalcData_Prep1 <- #reactive ({
#   RemoveStringFromDFColNames (
#     myDataFrame = data.frame (MobasyBuildingDataTables  ["Data_Calc"]),
#     myStringToRemove = "Data_Calc.")
# #})
# 
# DF_Pool_CalcData_Prep2 <- #reactive ({
#   as.data.frame (
#     cbind (
#       data.frame (DF_Pool_CalcData_Prep1  [ , 1]),
#       data.frame (DF_Pool_CalcData_Prep1 )
#     )
#   )
# #})
# 
# DF_Pool_CalcData_Prep3 <- #reactive ({
#   SetDFColNames (
#     myDataFrame = DF_Pool_CalcData_Prep2 , 
#     myColNames = c (
#       "ID_Stack", 
#       colnames (
#         as.data.frame (
#           DF_Pool_CalcData_Prep1 
#         )
#       )
#     )
#   )
# #})
# 
# DF_Pool_CalcData <- #reactive ({
#   cbind (
#     DF_Pool_CalcData_Prep3  [ , (1:2)],
#     DF_Pool_Input  [ , c("Date_Entry", "Date_Change")],
#     DF_Pool_CalcData_Prep3  [ , (3:ncol (DF_Pool_CalcData_Prep3 ))]
#   )
# #})
# 





DF_Stack_Input <- 
  data.frame (
    DF_Pool_Input  [ID_Dataset, ]
  )  

DF_Calc_Input <- 
  data.frame (
    DF_Pool_Input  [ID_Dataset, ]
  )  

DF_Stack_Output <- 
  data.frame (
    DF_Pool_Output  [ID_Dataset, ]
  )  

DF_Calc_Output <- 
  data.frame (
    DF_Pool_Output  [ID_Dataset, ]
  )  


# nicht umgesetzt, da doch nicht benötigt --> diesen Block später löschen
# 
# DF_Stack_CalcData <- 
#   data.frame (
#     DF_Pool_CalcData  [ID_Dataset, ]
#   )  
# 
# DF_Calc_CalcData <- 
#   data.frame (
#     DF_Pool_CalcData  [ID_Dataset, ]
#   )  





myOutputTables  <- 
  MobasyModel::EnergyProfileCalc (
    TabulaTables = TabulaTables,
    myBuildingDataTables = 
      list (
        Data_Input  = DF_Stack_Input  [ID_Dataset, -1],
        Data_Output = DF_Stack_Output [ID_Dataset, -1]
      )
  )

View (myOutputTables$Data_Calc)
#View (myOutputTables$DF_Display_Energy)



ResultList <- 
  Calculate_Stack  (
    myDF_Stack_Input  = DF_Stack_Input   [ID_Dataset, ] ,
    myDF_Stack_Output = DF_Stack_Output  [ID_Dataset, ] ,
    TabulaTables = TabulaTables,
    ID_Calculate = ID_Dataset [2]
  )

View (ResultList$DF_Stack_Output)
View (ResultList$DF_Stack_CalcData)
View (ResultList$DF_Calc_ChartEnergyData)


DF_Calc_Output <-
  data.frame (
    ResultList$DF_Stack_Output
  )



DF_Calc_Output [ ,"Date_Change"] <- 
  as.character (Sys.time ())    
# !!! Aufgabe: Format verbessern, außerdem beim Einlesen von Excel schon in Tag/Zeit-Format verwandeln, 
# dabei as.POSIXct() verwenden (diesbezüglich GTZ-Skript anschauen)     



DF_Calc_InterimResults <-
  data.frame(
    ResultList$DF_Stack_CalcData
  )


#ResultList$DF_Calc_ChartEnergyData

DF_Calc_ChartEnergyData <-
  data.frame(
    ResultList$DF_Calc_ChartEnergyData
  )















## Only call this if you want to show the chart in the browser 
options (viewer = NULL) 


## Load the energy data
load ("Input/Data/Example/myOutputTables.rda") 
# This is a dataframe generated by the functions MobasyCalc () and EnergyProfileCalc () 
# of the R package MobasyModel
DF_EnergyData <-
  myOutputTables$DF_Display_Energy

## 1 Heat need
## Chart displaying the energy balance of the building fabric and the heat need
## Example building: "DE.MOBASY.WBG.0008.05"

ChartData_HeatNeed <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_HeatNeed",
    mySheetName =     "DF_ChartData"
  )

ChartSettings_HeatNeed <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_HeatNeed",
    mySheetName =     "DF_Settings"
  )

ShowBarChart  (
  myChartSettings = ChartSettings_HeatNeed [1, ],
  myChartData     = ChartData_HeatNeed,
  DF_EnergyData   = DF_Calc_ChartEnergyData,
  Index_Dataset   = 1,
  Code_Language   = "GER",
  #Code_Language  = "ENG",
  Set_MaxY_Auto   = TRUE,
  Do_FlipChart    = FALSE,
  stackStrategy   = 'samesign'
)


## 2 Final energy
## Chart displaying the final energy demand
## Example building: "DE.MOBASY.NH.0033.05"

ChartData_FinalEnergy <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_FinalEnergy",
    mySheetName =     "DF_ChartData"
  )

ChartSettings_FinalEnergy <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_FinalEnergy",
    mySheetName =     "DF_Settings"
  )

ShowBarChart  (
  myChartSettings = ChartSettings_FinalEnergy,
  myChartData     = ChartData_FinalEnergy,
  DF_EnergyData   = DF_EnergyData,
  Index_Dataset   = which (DF_EnergyData$ID_Dataset == "DE.MOBASY.NH.0033.05"),
  Code_Language   = "GER",
  #Code_Language  = "ENG",
  Set_MaxY_Auto   = TRUE,
  Do_FlipChart    = FALSE,
  stackStrategy   = 'samesign'
)


## 3 Expectation ranges
## Chart displaying expectation ranges of the heat need and the final energy demand
## Example building: "DE.MOBASY.NH.0033.05"

ChartData_ExpectationRanges <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_Uncertainties",
    mySheetName =     "DF_ChartData"
  )

ChartSettings_ExpectationRanges <-
  LoadChartSettings (
    mySourceType =    "Excel",
    myFileName =      "ChartSettings_Uncertainties",
    mySheetName =     "DF_Settings"
  )

ShowBarChart  (
  myChartSettings = ChartSettings_ExpectationRanges,
  myChartData     = ChartData_ExpectationRanges,
  DF_EnergyData   = DF_EnergyData,
  Index_Dataset   = which (DF_EnergyData$ID_Dataset == "DE.MOBASY.NH.0033.05"),
  Code_Language   = "GER",
  #Code_Language   = "ENG",
  Set_MaxY_Auto   = TRUE,
  Do_FlipChart    = TRUE,
  stackStrategy   = 'all'
)














save (ChartData_HeatNeed, file = "ChartData_HeatNeed.rda")
save (ChartSettings_HeatNeed, file = "ChartSettings_HeatNeed.rda")





















# Initialisierung
List_CalcStackTables <- 
  list (
    DF_Input = NA,
    DF_Output = NA
  )


List_CalcStackTables <- 
  AddToCalculationStack (
    DF_BuildingDataBase_Input = MobasyBuildingDataTables$Data_Input,
    DF_BuildingDataBase_Output = MobasyBuildingDataTables$Data_Output,
    ID_Dataset               = ID_Dataset,
    myDF_Stack_Input         = List_CalcStackTables$DF_Input,
    myDF_Stack_Output        = List_CalcStackTables$DF_Output
  )

View (List_CalcStackTables$DF_Input)
View (List_CalcStackTables$DF_Output)






DF_BuildingDataBase_Input <- MobasyBuildingDataTables$Data_Input
ncol (DF_BuildingDataBase_Input)


DF_BuildingDataBase_Stack_Input <- 
  as.data.frame (
    cbind (
      data.frame (DF_BuildingDataBase_Input  [ , 1]),
      data.frame (DF_BuildingDataBase_Input)
    ),
    col.names = names (c ("ID_Stack", colnames (as.data.frame (DF_BuildingDataBase_Input)))
  )
  )

ncol (DF_BuildingDataBase_Stack_Input)

colnames (DF_BuildingDataBase_Stack_Input) [1]


DF_BuildingDataBase_Stack_Input <- 
  SetDFColNames (
    myDataFrame = DF_BuildingDataBase_Stack_Input, 
    myColNames = c (
      "ID_Stack", 
      colnames (as.data.frame (DF_BuildingDataBase_Input))
    )
  )

View (DF_BuildingDataBase_Stack_Input [ , -1])










DT:::available_plugins()

#                     dataRender/ellipsis                   features/scrollResize                features/searchHighlight 
#                              "ellipsis"                          "scrollResize"                       "searchHighlight" 
#             filtering/accent-neutralise         filtering/diacritics-neutralise                     pagination/ellipses 
#                     "accent-neutralise"                 "diacritics-neutralise"                              "ellipses" 
#                        pagination/extjs                  pagination/four_button     pagination/full_numbers_no_ellipses 
#                                 "extjs"                           "four_button"              "full_numbers_no_ellipses" 
#                        pagination/input                    pagination/scrolling                       pagination/select 
#                                 "input"                             "scrolling"                                "select" 
# pagination/simple_incremental_bootstrap   pagination/simple_numbers_no_ellipses                         sorting/natural 
#          "simple_incremental_bootstrap"            "simple_numbers_no_ellipses"                               "natural" 








#####################################################################################X
## Planung / Aufgaben -----
#####################################################################################X
# 
# 
## (A) Oberfläche -----
# 
### |> Oberfläche -----
#   Grundlage  Inspiration: Oberfläche für erste Planung MOBASY-WebTool 
# 
### |> Eingabefelder für Variablen -----
#      > erster Test
#      > Rationalisierung: Variablenliste Input-Felder + Funktion, zumindest für Server-Funktion?  
# 
# 
## (B) Daten-Editor -----
# 
### |> Tabellen-Editor für Eingabedaten +++
#   
#   Beispiele für editierbare Tabellen sind hier zu finden:
#   https://rstudio.github.io/DT/shiny.html
#   
#   Aktueller Stand:   
#   Die Werte im Calculation Stack können editiert werden. 
#   Die geänderten Zahlen werden sofort in der Ausgabe-Tabelle dargestellt.  
#   Bei Knopfdruck "Neu berechnen" gehen die geänderten Werte in die Berechnung ein .
#   
#   Probleme:
#   > Das Speichern dauert etwas länger.
#   > Nach der Integration im Dashboard gibt es keinen horizontalen Scrollbalken mehr. 
#   > Durch Plugin gelöst: Nach Ändern eines Wertes 
#   wird die Scroll-Position in der Tabelle nicht mehr zurückgesetzt.  
# 
#   Aufgaben:
#   > 
#   > Statt der Tabellenanzeige der Eingabedaten kann der Editor verwendet werden.
#   > Hierzu müsste aber der Editor schon beim Schieben auf den Calculation Stack geladen werden.   
# 
# 
# 
## (C) Speichern und Laden von Daten-Tabellen -----  
# 
### |> Formatierung Gebäudetabellen -----
#   Die Gebäudedaten in MobasyBuildingDataTables sind noch nicht streng formatiert.
#   >> Check: Hatte ich das nicht schon gemacht? insbesondere wegen Boolschen Variablen?  
#   Das müsste eigentlich in MobasyModel::GetBuildingData_RDataPackage verbessert werden.
#   Das Datenformat müsste aus den Metadaten in den Kopfzeilen gebildet werden. 
# 
# 
## (D) GitHub, Shiny und R-Skript -----
#
###    |> renv Bibliotheken aus Arbeitsverzeichnis entfernen. -----
#         Wenn ich den Schalter nicht finde --> renv deinstallieren, den Ordner löschen und renv nochmal installieren       
# 
#       2025-02 neu installieren hat nichts gebracht




#####################################################################################X
## Erledigte Aufgaben -----
#####################################################################################X
# 
# 
