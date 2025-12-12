
# install.packages("shiny")
# install.packages ("shinyalert")
# install.packages ("shinydashboard")
# install.packages ("shinyjs")
# install.packages ("shinyWidgets")
# install.packages ("shinyBS")
# install.packages ("DT")
# install.packages ("echarts4r")
# install.packages ("devtools")
# install.packages("gitcreds")
# install.packages ("clidamonger")
# install.packages("shinylive")

# devtools::install_github ("IWUGERMANY/tabuladata")
# #renv::install (packages = "IWUGERMANY/tabuladata")
# renv::install (packages = "TobiasLoga/AuxFunctions")

# 
# devtools::install_github ("TobiasLoga/MobasyBuildingData")
## renv::install (packages = "TobiasLoga/MobasyBuildingData")

# renv::install (packages = "IWUGERMANY/clidamonger") # is used by MobasyModel
# renv::install (packages = "TobiasLoga/CliDaMon") # is used by MobasyModel

# devtools::install_github ("TobiasLoga/MobasyModel")
# # renv::install (packages = "TobiasLoga/MobasyModel")

# # renv::install (packages = "TobiasLoga/TabulaCharts")
# # devtools::install_github ("TobiasLoga/TabulaCharts")
# remotes::install_github ("TobiasLoga/TabulaCharts")
# install.packages("D:/TL/Entwicklung/R/GitHub/myRepos/TabulaCharts_0.1.1.tar.gz", repos = NULL, type = "source")

# install.packages("D:/TL/Entwicklung/R/GitHub/myRepos/MobasyBuildingData_0.1.2.tar.gz", repos = NULL, type = "source")
# install.packages("D:/TL/Entwicklung/R/GitHub/myRepos/MobasyBuildingData_0.1.0.tar.gz", repos = NULL, type = "source", 
#                  lib="C:/Users/Tobias.DOMIWU/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/6698a5f3")
# install.packages("D:/TL/Entwicklung/R/GitHub/myRepos/tabuladata_0.0.0.9000.tar.gz", repos = NULL, type = "source", 
#                  lib="C:/Users/Tobias.DOMIWU/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/6698a5f3")

# gitcreds::gitcreds_set()



# shinylive::export("R", "site")

# httpuv::runStaticServer("site/")

# usethis::use_github_action(url="https://github.com/posit-dev/r-shinylive/blob/actions-v1/examples/deploy-app.yaml")


# Information from:
# https://github.com/r-wasm/actions/tree/main/.github/workflows#release-file-system-image.yml
# Builds a WebAssembly file image and adds the files to a GitHub release.
#
# This is typically used within R packages to build and release a WebAssembly R package library image of your package and its dependencies. Because the assets are tied to a release, they will never be overwritten are are stable over time.

# usethis::use_github_action(
#   url = "https://raw.githubusercontent.com/r-wasm/actions/v2/examples/release-file-system-image.yml"
# )

# usethis::use_github_action(
#   url = "https://github.com/TobiasLoga/AuxFunctions/blob/main/.github/workflows/release-file-system-image.yml"
# )






library (renv)

library (shiny)
library (shinyalert)
library (shinydashboard)
library (shinyjs)
library (shinyWidgets)
#library (shinyBS)

library (bslib)

library (DT)

library (echarts4r)

library (tabuladata)
library (MobasyModel)
library (MobasyBuildingData)

library (TabulaCharts)



#####################################################################################X
## Load settings and templates -----
#####################################################################################X


# Load the chart settings  
ChartSettings_HeatNeed <- TabulaCharts::ChartSettings_HeatNeed
ChartSettings_FinalEnergy <- TabulaCharts::ChartSettings_FinalEnergy
ChartSettings_ExpectationRanges <- TabulaCharts::ChartSettings_ExpectationRanges

# Load the templates for the chart data   
ChartData_HeatNeed     <- TabulaCharts::ChartData_HeatNeed
ChartData_FinalEnergy     <- TabulaCharts::ChartData_FinalEnergy
ChartData_ExpectationRanges     <- TabulaCharts::ChartData_ExpectationRanges


# load("E:/TL/Entwicklung/R/GitHub/myRepos/EnergyProfileShinyApp/data/ChartData_HeatNeed.rda")
# load("E:/TL/Entwicklung/R/GitHub/myRepos/EnergyProfileShinyApp/data/ChartSettings_HeatNeed.rda")


## Load dataframe with building matrix information

base::load ("www/DF_BuildingTypeMatrix.rda")
# Note: Can only be loaded in this form from 




# ? nötig ?
#options (viewer = NULL)




#_-----

#####################################################################################X
## Constants -----
#####################################################################################X



SelectionList_ID_Pool_Initialise <- 
  MobasyBuildingData::DF_FilterBuildingData [ ,"EnergyProfileShinyApp"]
  #  MobasyBuildingData::DF_FilterBuildingData [ ,"Typology-DE_Example-Buildings"]

ID_Pool_Initialise <-
  "Example.01"
  #"DE.N.SFH.01.Gen.ReEx.001.001"
  #"DE.Template.01" # 2025-07-17 Das funktioniert nicht -> Meldung "Zeilennamen enthalten fehlende Werte"
  # -> Die Zeilennamen sind aber da, daher debuggen
  # Kann auch sein, dass MobasyModel den Datensatz nicht rechnen kann und der Fehler dadurch entsteht. 

ID_Stack_Initialise <- 
  ID_Pool_Initialise

SelectionList_ID_Stack_Initialise <- c (
  ID_Stack_Initialise
)



SelectionList_ID_TypologyExampleBuildings <- 
   MobasyBuildingData::DF_FilterBuildingData [ ,"Typology-DE_Example-Buildings"]




#SelectionList_ID_Pool_Initialise <- MobasyBuildingData::Data_Output$ID_Dataset

#ID_Pool_Initialise <- "Example.01" 
#ID_Pool_Initialise <- "DE.MOBASY.WBG.0008.61" 

# SelectionList_ID_Stack_Initialise <- c ("---Empty---")
# ID_Stack_Initialise               <- "---Empty---"


#SelectionList_ID_Stack_Initialise <- c ("Example.01")
#SelectionList_ID_Stack_Initialise <- c ("Example.01", "Example.02")
#ID_Stack_Initialise <- "Example.01"



# SelectionList_ID_Stack_Initialise <- c (
#   "DE.N.SFH.06.Gen.ReEx.001.001"
#   )
# ID_Stack_Initialise <- "DE.N.SFH.06.Gen.ReEx.001.001"


# SelectionList_ID_Stack_Initialise <- c (
#   "Example.01",
#   "DE.MOBASY.WBG.0008.61", 
#   "DE.MOBASY.PHSP.AB.Var1", 
#   "DE.MOBASY.PHSP.C.Var1"
#   )
#ID_Stack_Initialise <- "Example.01" 
# ID_Stack_Initialise <-"DE.MOBASY.WBG.0008.61"


# SelectionList_ID_Stack_Initialise <- c ("DE.MOBASY.Template.0001.01")
# ID_Stack_Initialise <- "DE.MOBASY.Template.0001.01"


DefaultValue_ApplyCalibrationFactor <- TRUE
DefaultValue_ReferToLivingSpace     <- TRUE




Set_MaxY_Auto_ChartHeatNeed <- FALSE
y_Max_ManualInput_ChartHeatNeed <- 400 

Set_MaxY_Auto_ChartFinalEnergy <- FALSE
y_Max_ManualInput_ChartFinalEnergy <- 400 

Set_MaxY_Auto_ChartExpectationRanges <- FALSE
y_Max_ManualInput_ChartExpectationRanges <- 600 



Set_MaxY_Auto_ChartCompareLeft <- TRUE
y_Max_ManualInput_ChartCompareLeft <- 400 

Set_MaxY_Auto_ChartCompareRight <- TRUE
y_Max_ManualInput_ChartCompareRight <- 400 



Height_ChartCompare_Default <- 600
Height_ChartCompareLeft  <- Height_ChartCompare_Default
Height_ChartCompareRight <- Height_ChartCompare_Default



#####################################################################################X
### Styles -----

## Function for altering the background colour of input fields
# Script from https://stackoverflow.com/questions/50313540/r-shiny-conditionally-change-numericinput-background-colour

# The colour is assigned to the respective fields at the top of the server function. 

jsCode <- '
shinyjs.backgroundCol = function(params) {
var defaultParams = {
id : null,
col : "ivory"
};
params = shinyjs.getParams(params, defaultParams);
var el = $("#" + params.id);
el.css("background-color", params.col);
}'


PercentageHeight_Dashboard_MainPanel <- 78 # percentage value


Style_Height_Dashboard_MainPanel <- 
  paste0 (
    "height:",
    PercentageHeight_Dashboard_MainPanel,
    "vh !important; overflow-y: scroll"   
  )

#Style_Height_Dashboard_MainPanel <-  "height:75vh !important; overflow-y: scroll"

Style_TypologyMatrix_HeaderElement_Left <-
  "text-align: left; 
  border: 1px dotted grey; 
  height: 40px"

Style_TypologyMatrix_HeaderElement_Middle <-    
  "text-align: center; 
  border: 1px dotted grey; 
  height: 40px"

Style_TypologyMatrix_BodyElement_Left <-
  "text-align: left; 
  vertical-align: middle;
  border: 1px dotted grey; 
  height: 135px"

Style_TypologyMatrix_BodyElement_Middle <-    "
  text-align: center; 
  vertical-align: middle;
  border: 1px dotted grey;
  height: 135px;
"

Style_TypologyMatrix_BodyElement_Middle_Selected <-    "
  text-align: center; 
  vertical-align: middle;
  border: 1px dotted grey;
  height: 135px;
  background-color: blue;
"


#background-color: rgb(240, 240, 240); # very light grey
#background-color: rgb(255, 229, 180);
#background-color: rgb(255, 213, 128); # Info: https://htmlcolorcodes.com/colors/shades-of-orange/
#background-color: orange;


Style_TypologyMatrix_Button <- "
  border: 0px;
"
#background-color: transparent;


Style_TypologyMatrix_Button_Pressed <- "
  border: 0px;
  background-color: orange;
"
#background-color: rgb(255, 213, 128);

Style_TypologyMatrix_Picture <- "
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  height: 100px;
  width:  100px;
  display: block;
"

Style_TypologyMatrix_Picture_Selected <- "
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  background-color: orange;
  height: 100px;
  width:  100px;
  display: block;
"
#border: 3px;
#border-color: black;
#background-color: orange;
#border: 3px; doesn't work





ColumnStyle_Label_2Lines <- 
  "height:40px"
#"height:50px; border: 1px dotted lightgrey;"
# "height:50px; background:white"

ColumnStyle_Checkbox <- 
  "height: 25px"

ColumnStyle_OpaqueElements_HeaderRow <- 
  "height: 60px; border: 1px dotted lightgrey;"
# "height: 50px; border: 1px solid grey;",


ColumnStyle_OpaqueElements_ConstructionType <- 
  "height: 60px; border: 1px dotted lightgrey;"
# "height: 50px; border: 1px solid grey;",






# ## 2025-05-09 ausprobiert und wieder abgeschaltet 
#
# #####################################################################################X
### CSS Styles -----
# 
# ## CSS doubleScroll 
# 
# # The following is used to have a scrollbar at the top and at the bottom of a large table 
# # Source: https://stackoverflow.com/questions/62703411/r-shiny-table-with-horizontal-scrollbar-both-at-the-top-and-at-the-bottom
# 
# js <- "
# $(document).ready(function(){
#   $('#dtable').on('shiny:value', function(e){
#     setTimeout(function(){
#       $('#dtable table').wrap('<div id=\"scrolldiv\"></div>');
#       $('#scrolldiv').doubleScroll({
#         contentElement: $('table'),
#           scrollCss: {                
#               'overflow-x': 'scroll',
#               'overflow-y': 'hidden'
#           },
#           contentCss: {
#               'overflow-x': 'scroll',
#               'overflow-y': 'hidden'
#           },
#         resetOnWindowResize: true
#       });
#       setTimeout(function(){$(window).resize();}, 100);
#     }, 0);
#   });
# });
# "
# 
# CSS <- "
# .doubleScroll-scroll-wrapper {
#   clear: both;
# }
# "





#####################################################################################X
### List of input fields / input variable names  -----


InputVariableNames <- c (
  #  "ID_Dataset",
  "Name_Variant",
  "Year_State",
  "Year_State_First",
  "Year_State_Last",
  "Year_Building",
  "ID_Zone_LocationBuilding",
  "n_Block",
  "n_House",
  "n_Storey",
  "n_Dwelling",
  "A_C_Floor_Intake",
  "Code_TypeFloorArea_A_C_Floor_Intake",
  "Code_BuildingPart_A_C_Floor_Intake",
  "Code_AttachedNeighbours",
  "Code_ComplexFootprint",
  "Code_AtticCond",
  "Code_ComplexRoof",
  "Code_CellarCond",
  "Indicator_Cellar_Insulated",
  "h_Ceiling",
  "Indicator_Roof_Constr_Massive",
  "Indicator_Roof_Constr_Wood",
  "Indicator_Ceiling_Constr_Massive",
  "Indicator_Ceiling_Constr_Wood",
  "Indicator_Wall_Constr_Massive",
  "Indicator_Wall_Constr_Wood",
  "Indicator_Floor_Constr_Massive",
  "Indicator_Floor_Constr_Wood",
  "Code_InsulationType_Roof",
  "Code_InsulationType_Ceiling",
  "Code_InsulationType_Wall",
  "Code_InsulationType_Floor",
  "Year_Refurbishment_Roof",
  "Year_Refurbishment_Ceiling",
  "Year_Refurbishment_Wall",
  "Year_Refurbishment_Floor",
  "d_Insulation_Roof",
  "d_Insulation_Ceiling",
  "d_Insulation_Wall",
  "d_Insulation_Floor",
  "f_Insulation_Roof",
  "f_Insulation_Ceiling",
  "f_Insulation_Wall",
  "f_Insulation_Floor",
  "Indicator_InternalWallInsulation",
  
  "f_Area_WindowType2",
  "Code_NumberPanes_WindowType1",
  "Code_NumberPanes_WindowType2",
  "Indicator_LowE_WindowType1",
  "Indicator_LowE_WindowType2",
  "Code_Frame_WindowType1",
  "Code_Frame_WindowType2",
  "Indicator_PassiveHouseWindow_WindowType1",
  "Indicator_PassiveHouseWindow_WindowType2",
  "Year_Installation_WindowType1",
  "Year_Installation_WindowType2",
  "Code_ThermalBridging",
  "Code_Infiltration",

  "Indicator_Boiler_OilGas",	
  "Indicator_Boiler_OilGas_SysH",								
  "Indicator_Boiler_OilGas_SysW",
  "Code_Type_EC_Boiler_OilGas",
  "Code_BoilerType_OilGas",
  
  "Indicator_Boiler_Solid",	
  "Indicator_Boiler_Solid_SysH",								
  "Indicator_Boiler_Solid_SysW",
  "Code_Type_EC_Boiler_Solid",
  
  "Indicator_Heatpump",	
  "Indicator_Heatpump_SysH",								
  "Indicator_Heatpump_SysW",
  "Code_HeatpumpType",
  
  "Indicator_ElectricCentral",	
  "Indicator_ElectricCentral_SysH",								
  "Indicator_ElectricCentral_SysW",
  
  "Indicator_ThermalSolar",	
  "Indicator_ThermalSolar_SysH",								
  "Indicator_ThermalSolar_SysW",
  
  "Indicator_CHP",	
  "Indicator_CHP_SysH",								
  "Indicator_CHP_SysW",
  "Code_Type_EC_CHP",
  
  "Indicator_DistrictHeating",	
  "Indicator_DistrictHeating_SysH",								
  "Indicator_DistrictHeating_SysW",
  
  "Code_CentralisationType_SysHG",
  
  "Indicator_Storage_SysH",
  "Indicator_Storage_SysH_Immersion",
  "Indicator_Storage_SysH_InsideEnvelope",
  
  "Indicator_Distribution_SysH",
  "Indicator_Distribution_SysH_OutsideEnvelope",
  "Indicator_Distribution_SysH_PoorlyInsulated",
  "Indicator_Distribution_SysH_LowTemperature",
  
  "Indicator_Storage_SysW",
  "Indicator_Storage_SysW_Immersion",
  "Indicator_Storage_SysW_InsideEnvelope",
  
  "Indicator_Distribution_SysW",
  "Indicator_Distribution_SysW_CirculationLoop",
  "Indicator_Distribution_SysW_OutsideEnvelope",
  "Indicator_Distribution_SysW_PoorlyInsulated",
  
  "Code_Potential_ExternalWallInsulation",
  
  "Indicator_SysH_G_Decentral",
  "Indicator_SysH_G_Stove",
  "Code_Type_EC_Stove",
  
  "Indicator_SysH_G_Dec_DirectElectric",
  "Indicator_SysH_G_Dec_ElectricNightStorage",
  "Indicator_SysH_G_Dec_Heatpump",
  "Indicator_SysW_G_Decentral",
  "Indicator_SysW_G_Dec_ElectricStorage",
  "Indicator_SysW_G_Dec_ElectricTankless",
  "Indicator_SysW_G_Dec_GasTankless",
  
  "Indicator_SysVent_Mechanical",
  "Indicator_SysVent_HeatRec",
  "Indicator_SysPV",
  "Indicator_SysPV_ElectricStorage",
  
  "Indicator_SysHW_D_S_ExtraThickInsulation",
  
  "Code_BoundaryCond", 
  "Code_Climate",
  
  "Code_U_Class_National"
  
)



## not yet used:
#
# "Fraction_Input_SysH_G_Stove",
# "Fraction_Input_SysH_G_Dec_DirectElectric",
# "Fraction_Input_SysH_G_Dec_ElectricNightStorage",
# "Fraction_Input_SysH_G_Dec_Heatpump",
# "Fraction_Input_SysW_G_Dec_ElectricStorage",
# "Fraction_Input_SysW_G_Dec_ElectricTankless",
# "Fraction_Input_SysW_G_Dec_GasTankless",
# "Year_Installation_SysH_G_Stove",
# "Year_SysH_G_Dec_DirectElectric",
# "Year_SysH_G_Dec_ElectricNightStorage",
# "Year_SysH_G_Dec_Heatpump",
# "Year_Installation_SysW_G_Dec_ElectricStorage",
# "Year_Installation_SysW_G_Dec_ElectricTankless",
# "Year_Installation_SysW_G_Dec_GasTankless",
# "Year_Installation_SysVent_Mechanical",
# "Year_Installation_SysPV",
# "eta_SysVent_HeatRec"



List_UI_InputFields_Text <- c (
  #"ID_Dataset",
  "Name_Variant",
  "ID_Zone_LocationBuilding"
)
# Current number: 2 


List_UI_InputFields_Numeric <- c (
  
  "Year_State",
  "Year_State_First",
  "Year_State_Last",
  "Year_Building",
  "n_Block",
  "n_House",
  "n_Storey",
  "n_Dwelling",
  "A_C_Floor_Intake",
  "h_Ceiling",
  "Year_Refurbishment_Roof",
  "Year_Refurbishment_Ceiling",
  "Year_Refurbishment_Wall",
  "Year_Refurbishment_Floor",
  "d_Insulation_Roof",
  "d_Insulation_Ceiling",
  "d_Insulation_Wall",
  "d_Insulation_Floor",
  
  "Year_Installation_WindowType1",
  "Year_Installation_WindowType2"
  
) # Current number: 20


List_UI_InputFields_Numeric_Percent <- c (

  "f_Insulation_Roof",
  "f_Insulation_Ceiling",
  "f_Insulation_Wall",
  "f_Insulation_Floor",
  "f_Area_WindowType2"

) # Current number: 5



List_UI_InputFields_Slider <- c (
  
  # "A_C_Floor_Intake",
  "Year_Refurbishment_Roof_Slider",
  "Year_Refurbishment_Ceiling_Slider",
  "Year_Refurbishment_Wall_Slider",
  "Year_Refurbishment_Floor_Slider",
  "d_Insulation_Roof_Slider",
  "d_Insulation_Ceiling_Slider",
  "d_Insulation_Wall_Slider",
  "d_Insulation_Floor_Slider"
  
  ) # Current number = 8


List_UI_InputFields_Slider_Percent <- c (

  "f_Insulation_Roof_Slider",
  "f_Insulation_Ceiling_Slider",
  "f_Insulation_Wall_Slider",
  "f_Insulation_Floor_Slider",
  "f_Area_WindowType2_Slider"
)

  

List_UI_InputFields_CheckBox <- c (
  
  "Indicator_Cellar_Insulated",
  "Indicator_Roof_Constr_Massive",
  "Indicator_Roof_Constr_Wood",
  "Indicator_Ceiling_Constr_Massive",
  "Indicator_Ceiling_Constr_Wood",
  "Indicator_Wall_Constr_Massive",
  "Indicator_Wall_Constr_Wood",
  "Indicator_Floor_Constr_Massive",
  "Indicator_Floor_Constr_Wood",
  
  "Indicator_InternalWallInsulation",
  
  "Indicator_LowE_WindowType1",
  "Indicator_LowE_WindowType2",
  "Indicator_PassiveHouseWindow_WindowType1",
  "Indicator_PassiveHouseWindow_WindowType2",
  
  "Indicator_Boiler_OilGas",	
  "Indicator_Boiler_OilGas_SysH",								
  "Indicator_Boiler_OilGas_SysW",

  "Indicator_Boiler_Solid",	
  "Indicator_Boiler_Solid_SysH",								
  "Indicator_Boiler_Solid_SysW",

  "Indicator_Heatpump",	
  "Indicator_Heatpump_SysH",								
  "Indicator_Heatpump_SysW",

  "Indicator_ElectricCentral",	
  "Indicator_ElectricCentral_SysH",								
  "Indicator_ElectricCentral_SysW",
  
  "Indicator_ThermalSolar",	
  "Indicator_ThermalSolar_SysH",								
  "Indicator_ThermalSolar_SysW",
  
  "Indicator_CHP",	
  "Indicator_CHP_SysH",								
  "Indicator_CHP_SysW",

  "Indicator_DistrictHeating",	
  "Indicator_DistrictHeating_SysH",								
  "Indicator_DistrictHeating_SysW",
  
  "Indicator_Storage_SysH",
  "Indicator_Storage_SysH_Immersion",
  "Indicator_Storage_SysH_InsideEnvelope",
  
  "Indicator_Distribution_SysH",
  "Indicator_Distribution_SysH_OutsideEnvelope",
  "Indicator_Distribution_SysH_PoorlyInsulated",
  "Indicator_Distribution_SysH_LowTemperature",
  
  "Indicator_Storage_SysW",
  "Indicator_Storage_SysW_Immersion",
  "Indicator_Storage_SysW_InsideEnvelope",
  
  "Indicator_Distribution_SysW",
  "Indicator_Distribution_SysW_CirculationLoop",
  "Indicator_Distribution_SysW_OutsideEnvelope",
  "Indicator_Distribution_SysW_PoorlyInsulated",
  
  "Indicator_SysH_G_Decentral",
  "Indicator_SysH_G_Stove",
  
  "Indicator_SysH_G_Dec_DirectElectric",
  "Indicator_SysH_G_Dec_ElectricNightStorage",
  "Indicator_SysH_G_Dec_Heatpump",
  "Indicator_SysW_G_Decentral",
  "Indicator_SysW_G_Dec_ElectricStorage",
  "Indicator_SysW_G_Dec_ElectricTankless",
  "Indicator_SysW_G_Dec_GasTankless",
  
  "Indicator_SysVent_Mechanical",
  "Indicator_SysVent_HeatRec",
  "Indicator_SysPV",
  "Indicator_SysPV_ElectricStorage",
  
  "Indicator_SysHW_D_S_ExtraThickInsulation"
  
  
  
  
) # Current number: 13 + 1 + 9 + 12 + 14 = 34 + 14 + 14 = 63

  
List_UI_InputFields_RadioButton <- c (
  
  "Code_TypeFloorArea_A_C_Floor_Intake",
  "Code_BuildingPart_A_C_Floor_Intake",
  "Code_AttachedNeighbours",
  "Code_ComplexFootprint",
  "Code_AtticCond",
  "Code_ComplexRoof",
  "Code_CellarCond",
  "Code_InsulationType_Roof",
  "Code_InsulationType_Ceiling",
  "Code_InsulationType_Wall",
  "Code_InsulationType_Floor",
  
  "Code_NumberPanes_WindowType1",
  "Code_NumberPanes_WindowType2",
  "Code_Frame_WindowType1",
  "Code_Frame_WindowType2",
  "Code_ThermalBridging",
  "Code_Infiltration",
  
  "Code_Type_EC_Boiler_OilGas",
  "Code_BoilerType_OilGas",
  
  "Code_Type_EC_Boiler_Solid",
  
  "Code_HeatpumpType",
  
  "Code_Type_EC_CHP",
  
  "Code_CentralisationType_SysHG",
  
  "Code_Potential_ExternalWallInsulation",
  
  "Code_Type_EC_Stove",
  
  "Code_BoundaryCond", 
  "Code_Climate",
  
  "Code_U_Class_National"
  
  
) # Current number: 17 + 4 + 1 + 1 + 2 + 2 + 1 = 28
  


List_UI_Checkbox_InputNotAvailable <- 
  c (
    "Checkbox_Year_Refurbishment_Roof_InputNotAvailable",
    "Checkbox_d_Insulation_Roof_InputNotAvailable",
    "Checkbox_f_Insulation_Roof_InputNotAvailable",
    "Checkbox_Year_Refurbishment_Ceiling_InputNotAvailable",
    "Checkbox_d_Insulation_Ceiling_InputNotAvailable",
    "Checkbox_f_Insulation_Ceiling_InputNotAvailable",
    "Checkbox_Year_Refurbishment_Wall_InputNotAvailable",
    "Checkbox_d_Insulation_Wall_InputNotAvailable",
    "Checkbox_f_Insulation_Wall_InputNotAvailable",
    "Checkbox_Year_Refurbishment_Floor_InputNotAvailable",
    "Checkbox_d_Insulation_Floor_InputNotAvailable",
    "Checkbox_f_Insulation_Floor_InputNotAvailable",
    
    "Checkbox_f_Area_WindowType2_InputNotAvailable"
    
  ) # Current number: 13





#_ -----

#####################################################################################X
## Auxiliary functions -----
#####################################################################################X



RemoveStringFromDFColNames <- function (
    myDataFrame,
    myStringToRemove = ""
) {
  colnames (myDataFrame) <-
    gsub (
      pattern = myStringToRemove,
      replacement = "",
      x = colnames (myDataFrame)
    )
  return (myDataFrame)
}


SetDFColNames <- function (
    myDataFrame,
    myColNames 
) {
  colnames (myDataFrame) <-
    myColNames
  return (myDataFrame)
}



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
    ColumnName_FixedPart, 
    i_Row_BuildingType = 1,
    i_Col_BuildingType = 0
) {
  
  if (i_Row_BuildingType == 0) {
    
    ## Special Case: Empty elements for resetting
    
    Info_BuildingType <- "keins"
    
  } else {
    
    ## Standard case

    if (i_Col_BuildingType == 0) {
      
      # Variable name without index 
      
      Info_BuildingType <- 
        DF_BuildingTypeMatrix [
          i_Row_BuildingType,
          ColumnName_FixedPart 
        ]
      
      
    } else {
      
      # Variable name with index 
      
      Info_BuildingType <- 
        DF_BuildingTypeMatrix [
          i_Row_BuildingType,
          paste0 (
            ColumnName_FixedPart, 
            i_Col_BuildingType
          )]
      
    }
    
    
    
    if (is.na (Info_BuildingType)) {
      Info_BuildingType <- "-"
    }  
    
    if (Info_BuildingType == "") {
      Info_BuildingType <- "-"
    }  
    
  }
  
  
  return (Info_BuildingType)
  
} # End function BuildingTypeInfo






Construct_UI_MatrixActionButton <- function (
  i_Row_Matrix = 1,
  i_Col_Matrix = 1
) {

  Is_Available_Dataset <- TRUE

  
  Name_Picture <- MatrixPicName (
    i_Row_BuildingType = i_Row_Matrix,
    i_Col_BuildingType = i_Col_Matrix
  )
  
  if (Name_Picture == "noimg.jpg") {
    Name_Picture <- ""
    Is_Available_Dataset <- FALSE
  }
  
  ID_ActionButton <- paste0 ("Button_Load_Example_Type_", i_Row_Matrix, i_Col_Matrix)
  
  actionButton (
    inputId = ID_ActionButton,
    #label = "EFH_A",
    label = strong (
      BuildingTypeInfo (
        ColumnName_FixedPart = "Code_BuildingType_National_Column",
        i_Row_BuildingType = i_Row_Matrix,
        i_Col_BuildingType = i_Col_Matrix
        )
      ),
    #style = NULL,
    style = Style_TypologyMatrix_Button,
    #style = "border: 0px; background-color: transparent;",
    icon = icon (
      name = NULL,
      style =
        paste0 (
          "background: url('",
          Name_Picture,
          # MatrixPicName (
          #   i_Row_BuildingType = i_Row_Matrix,
          #   i_Col_BuildingType = i_Col_Matrix
          #   ),
          #"DE.N.SFH.01.Gen.ReEx.001.jpg",
          "');",
          Style_TypologyMatrix_Picture
        ) # End paste0
    ), # End icon
    width = NULL,
    
    
    
    # Comment: Cannot be done otherwise. Doesn't work as a loop and also not as a function

    onclick = "document.getElementById('Button_Load_Example_Type_11').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_12').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_13').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_14').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_21').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_22').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_23').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_24').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_31').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_32').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_33').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_34').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_41').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_42').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_43').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_44').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_51').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_52').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_53').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_54').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_61').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_62').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_63').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_64').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_71').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_72').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_73').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_74').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_81').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_82').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_83').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_84').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_91').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_92').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_93').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_94').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_101').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_102').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_103').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_104').style.backgroundColor = 'transparent';",
    
    onclick = "document.getElementById('Button_Load_Example_Type_111').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_112').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_113').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_114').style.backgroundColor = 'transparent';",
    
    
    
    onclick =
      paste0 (
        "document.getElementById('",
        ID_ActionButton,
        "').style.backgroundColor = 'orange';"
      ),
    
    
    
    ## Last row used for unselecting without loading (if a dataset from the stack is loaded to the calculation)
    
    onclick = "document.getElementById('Button_Load_Example_Type_241').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_242').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_243').style.backgroundColor = 'transparent';",
    onclick = "document.getElementById('Button_Load_Example_Type_244').style.backgroundColor = 'transparent';",
    
    
    
        
    
    #onclick = "document.getElementById('Button_Load_Example_Type_11')style.background-color = 'blue';"
    #onclick = "document.getElementById('Button_Load_Example_Type_11').style.color = 'red';",
    # Tipp aus https://github.com/rstudio/shiny/issues/3793
    
    
    
    
    # Loop doesn't work 
    #
    # for (i in (1:5)) {
    #   for (j in (1:4)) {
    # 
    #     onclick =
    #       paste0 (
    #         "document.getElementById('",
    #           "Button_Load_Example_Type_",
    #           i, j,
    #         "').style.backgroundColor = 'blue';"
    #       )
    #     
    #     # CurrentButtonName <-
    #     #   paste0 (
    #     #     "Button_Load_Example_Type_",
    #     #     i, j)
    #     # 
    #     # onclick =
    #     #   paste0 (
    #     #     "document.getElementById('",
    #     #     CurrentButtonName,
    #     #     "').style.backgroundColor = 'blue';"
    #     #   )
    # 
    #   } # End i loop
    # 
    # }, # End j loop
    
    
    disabled = !Is_Available_Dataset
    
  ) # End actionButton

} # End Construct_UI_MatrixActionButton



Construct_UI_BuildingTypeMatrix <- function (
    i_Row_Matrix = 1
) {
  

    fluidRow (
      
      column (
        1,
        style = Style_TypologyMatrix_BodyElement_Left,
        ""
      ), # End column
      
      column (
        1,
        style = Style_TypologyMatrix_BodyElement_Left,
        strong (
          BuildingTypeInfo (
            ColumnName_FixedPart = "Code_ConstructionYearClass_National",
            i_Row_BuildingType = i_Row_Matrix
          )
        )
        #"A"
      ), # End column
      
      column (
        2,
        style = Style_TypologyMatrix_BodyElement_Left,
        strong (
          BuildingTypeInfo (
            ColumnName_FixedPart = "Display_ConstructionYearClass",
            i_Row_BuildingType = i_Row_Matrix
          )
        )
        #"     ... 1859"
      ), # End column
      
      column (
        2,
        style = Style_TypologyMatrix_BodyElement_Middle,
        
        Construct_UI_MatrixActionButton (
          i_Row_Matrix = i_Row_Matrix,
          i_Col_Matrix = 1
        )
        
      ), # End column
      
      column (
        2,
        style = Style_TypologyMatrix_BodyElement_Middle,

        Construct_UI_MatrixActionButton (
          i_Row_Matrix = i_Row_Matrix,
          i_Col_Matrix = 2
        )

      ), # End column

      column (
        2,
        style = Style_TypologyMatrix_BodyElement_Middle,

        Construct_UI_MatrixActionButton (
          i_Row_Matrix = i_Row_Matrix,
          i_Col_Matrix = 3
        )

      ), # End column

      column (
        2,
        style = Style_TypologyMatrix_BodyElement_Middle,

        Construct_UI_MatrixActionButton (
          i_Row_Matrix = i_Row_Matrix,
          i_Col_Matrix = 4
        )

      ) # End column


      
      
      
            
      # column (
      #   2,
      #   style = Style_TypologyMatrix_BodyElement_Middle,
      #   actionButton (
      #     inputId = "Button_Load_Example_Type_13",
      #     label = "MFH_B",
      #     style = "border: 0px",
      #     icon = icon (
      #       name = NULL,
      #       style = "
      #                                 background: url('DE.N.MFH.01.Gen.ReEx.001.jpg');
      #                                 background-size: contain;
      #                                 background-position: center;
      #                                 background-repeat: no-repeat;
      #                                 height: 100px;
      #                                 width:  100px;
      #                                 display: block;
      #                               "),
      #     width = NULL,
      #     disabled = FALSE
      #   ), # End actionButton
      # ), # End column
      # 
      # column (
      #   2,
      #   style = Style_TypologyMatrix_BodyElement_Middle,
      #   actionButton (
      #     inputId = "Button_Load_Example_Type_14",
      #     label = "GMH_B",
      #     style = "border: 0px",
      #     icon = icon (
      #       name = NULL,
      #       style = paste0 (
      #         "background: url('DE.N.AB.01.Gen.ReEx.001.jpg');",
      #         "background-size: contain;
      #                                 background-position: center;
      #                                 background-repeat: no-repeat;
      #                                 height: 100px;
      #                                 width:  100px;
      #                                 display: block;"
      #       ),
      #     ),
      #     width = NULL,
      #     disabled = FALSE
      #   ), # End actionButton
      # ), # End column
      
      
    ) # End fluidRow
    
    
    
    
    
    

  
}







#####################################################################################X
## FUNCTION Calculate_EnergyDemand () - Calculate selected datasets of the calculation stack -----

# The calculation is performed on the basis of DF_Stack_Input and a list of stack dataset IDs  
# that should be recalculated. The list usually consists of only one dataset ID, but the concept is open to
# an extension to calculating several datasets at the same time in a future app version.      
# The output calculation stack DF_Stack_Output is provided to the function and also returned by the function
# modified in the rows that were identified by the dataset ID input.   

Calculate_EnergyDemand <- function (
    myDF_BuildingData_Input,
    myDF_BuildingData_Output,
    TabulaTables,
    ID_Calculate = NA,
    Include_TargetActualComparison = FALSE
){

  if (is.na (ID_Calculate)) {
    ID_Calculate <- rownames (myDF_BuildingData_Input)
    #ID_Calculate <- myDF_BuildingData_Input [ ,1]
  }
  
  if (Include_TargetActualComparison == FALSE) {
    
    List_OutputTables  <-
      MobasyModel::EnergyProfileCalc (
        TabulaTables = TabulaTables,
        myBuildingDataTables =
          list (
            Data_Input  = myDF_BuildingData_Input  [ID_Calculate, -1],
            Data_Output = myDF_BuildingData_Output [ID_Calculate, -1]
          ),
        Indicator_Include_UncertaintyAssessment = 1
      )
    # Note: the -1 is necessary to remove the calculation stack ID (column ID_Stack).
    # This datafield is not existing in the MOBASY building data table used as input and returned
    # by the function EnergyProfileCalc ().
    
  } else {

    ## Alternative calculation core: 
    ## MobasyCalc () includes the target / actual comparison 
    #  
    #  In principle this is working (on the calc dataset and also on all stack datasets). 
    #  However before loading the datasets to be calculated, the automatic calculation must be switched of,
    #  since it collides / interferes with the very long target actual calculation, which is done dataset by dataset 
    #  in MobasyCalc (). 
    #  It is also recommended to load all datasets at one time into the stack. 
    # 
    #  Next step: 
    #  > Include a parameter in this function to switch from EnergyProfileCalc () to MobasyCalc ()
    #  > The function with the parameter Include_TargetActualComparison == TRUE should only be called by an extra button.   
    #  > When pressing the extra button the automatic calculation should be switched off. 

    List_OutputTables  <-
      MobasyModel::MobasyCalc (
        TabulaTables = TabulaTables,
        myBuildingDataTables =
          list (
            Data_Input  = myDF_BuildingData_Input  [ID_Calculate, -1],
            Data_Output = myDF_BuildingData_Output [ID_Calculate, -1]
          ),
        StationClimateTables <-
          MobasyModel::GetStationClimate_RDataPackage ()
      )
    # # Note: the -1 is necessary to remove the calculation stack ID (column ID_Stack).
    # # This datafield is not existing in the MOBASY building data table used as input and returned
    # # by the function EnergyProfileCalc ().
    
  } # End else
  

  
  
  
  
  
  
  myDF_BuildingData_Output [ID_Calculate , -1] <- 
    List_OutputTables$Data_Output [ , ]
  
#  myDF_BuildingData_CalcData [ID_Calculate , -1] <- 
  myDF_Calc_InterimResults  <- 
    List_OutputTables$Data_Calc [ , ]
  
  myDF_Calc_ChartEnergyData <-
    List_OutputTables$DF_Display_Energy
  #List_OutputTables$List_Chart_HeatNeed$DF_HeatNeed_Data [ , ]
  
  
  # 2025-10-24 / ging nicht --> löschen
  #colnames(myDF_Calc_ChartEnergyData [ ,1]) <- "ID_Dataset" 
   # colnames (myDF_Calc_ChartEnergyData) <- 
   #   colnames (List_OutputTables$DF_Display_Energy)
  
  
  
  myResultList <- 
    list (
      DF_Stack_Output         = myDF_BuildingData_Output, # complete stack with updated row
      DF_Calc_InterimResults  = myDF_Calc_InterimResults, # complete stack with updated row
      DF_Calc_ChartEnergyData = 
        myDF_Calc_ChartEnergyData # only calculated dataset
    )
  
  
  # myDF_BuildingData_Output <- reactive ({
  #   SetDFColNames (
  #     myDataFrame = cbind (
  #       data.frame (DF_Stack_Input () [ ,1]),
  #       RemoveStringFromDFColNames (
  #         myDataFrame = data.frame ( List_OutputTables ()  ["Data_Output"]),
  #         myStringToRemove = "Data_Output."
  #       )
  #     ),
  #     myColNames  = 
  #       colnames (data.frame ( DF_Stack_Output_Prep1 () ))
  #   )
  # })
  # 
  # 
  # 
  # 
  # 
  # output$CalcStack_Input <-
  #   renderTable ({
  #     DF_Stack_Input () 
  #   })
  # 
  # output$CalcStack_Output <-
  #   renderTable ({
  #     (DF_Stack_Output () )
  #   })

  return (myResultList)  
  
    
} # End of function


#####################################################################################X
## FUNCTION UpdateInputFieldsFromDataFrame () - Update all input fields by values from selected dataset -----

# 2025-04-11 new version / test if usable for input from pool


UpdateInputFieldsFromDataFrame <- function (session, input, DF_Input)    
{
  
  # for (VariableName in List_UI_InputFields_Numeric) {
  #   
  #   updateSliderInput (
  #     session,
  #     paste0 (VariableName, "_Slider"),
  #     value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
  #   )
  # 
  # } # End loop 
  
  
  ## Assign values of text input variables to text input fields 
  
  for (VariableName in List_UI_InputFields_Text) {
    
    updateTextInput (
      session,
      VariableName,
      value = DF_Input [1, VariableName]
    )  
    
  } # End loop
  
  
  
  ## Assign values of numeric input variables to numeric input fields 
  
  for (VariableName in List_UI_InputFields_Numeric) {
    
    updateNumericInput (
      session,
      VariableName,
      value = DF_Input [1, VariableName]
    )  
    
  } # End loop
  
  
  ## Assign values of percent input variables to percent input fields.
  ## Attention: Use of factor 100! 
  
  for (VariableName in List_UI_InputFields_Numeric_Percent) {
    
    updateNumericInput (
      session,
      VariableName,
      value = 100 * DF_Input [1, VariableName]
    )  
    
  } # End loop
  
  
  ## Assign TRUE to checkboxes "Input not available" when the value of the 
  ## respective variable is NA 
  
  for (Name_NACheckbox in List_UI_Checkbox_InputNotAvailable) {
    
    VariableName <- 
      substring (
        text = Name_NACheckbox, 
        first = nchar ("Checkbox_") + 1, 
        last = nchar (Name_NACheckbox) - nchar ("_InputNotAvailable")
      )
    
    updateCheckboxInput (
      session = session,
      inputId = Name_NACheckbox,
      value = 1 * is.na (DF_Input [1, VariableName])  
    )  
    
  } # End loop
  
  
  ## Assign values of boolean variables to checkboxes 
  
  for (VariableName in List_UI_InputFields_CheckBox) {
    
    updateCheckboxInput (
      session = session,
      inputId = VariableName,
      value = DF_Input [1, VariableName]
    )  
    
  } # End loop
  
  
  ## Assign values of code variables to radio buttons  
  
  for (VariableName in List_UI_InputFields_RadioButton) {
    
    updateRadioButtons (
      session = session,
      inputId = VariableName,
      selected = DF_Input [1, VariableName]
    )  
    
  } # End loop
  
  
  # if (DF_Input [1, "f_Area_WindowType2"] == 0)
  #   {
  #     updateCheckboxInput (
  #       session = session,
  #       inputId = "Show_WindowType2",
  #       value = FALSE
  #     )    
  #   } else {
  #     updateCheckboxInput (
  #       session = session,
  #       inputId = "Show_WindowType2",
  #       value = TRUE
  #     )    
  #   }
  
  
  
  
  # updateSliderInput (
  #   session,
  #   "d_Insulation_Ceiling",
  #   value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"]
  # )  
  
  
  
} # End of function UpdateInputFieldsFromDataFrame ()









## 2025-04-11 - abgeschaltet, die Funktion ist jetzt universeller, siehe oben.
## Es wird nur ein Dataframe mit den Input-Daten übergeben 

# #####################################################################################X
# ## FUNCTION UpdateInputFieldsFromDFCalc () - Update all input fields by values from selected dataset -----
# 
# 
# UpdateInputFieldsFromDFCalc <- function (session, input, rv)    
# {
#   
#   # for (VariableName in List_UI_InputFields_Numeric) {
#   #   
#   #   updateSliderInput (
#   #     session,
#   #     paste0 (VariableName, "_Slider"),
#   #     value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
#   #   )
#   # 
#   # } # End loop 
#   
# 
#   ## Assign values of text input variables to text input fields 
#   
#   for (VariableName in List_UI_InputFields_Text) {
#     
#     updateTextInput (
#       session,
#       VariableName,
#       value = rv$DF_Calc_Input [1, VariableName]
#     )  
#     
#   } # End loop
#   
#   
#     
#   ## Assign values of numeric input variables to numeric input fields 
#   
#   for (VariableName in List_UI_InputFields_Numeric) {
#     
#     updateNumericInput (
#       session,
#       VariableName,
#       value = rv$DF_Calc_Input [1, VariableName]
#     )  
#     
#   } # End loop
#   
# 
#   ## Assign values of percent input variables to percent input fields.
#   ## Attention: Use of factor 100! 
#   
#   for (VariableName in List_UI_InputFields_Numeric_Percent) {
#     
#     updateNumericInput (
#       session,
#       VariableName,
#       value = 100 * rv$DF_Calc_Input [1, VariableName]
#     )  
#     
#   } # End loop
#   
#   
#   ## Assign TRUE to checkboxes "Input not available" when the value of the 
#   ## respective variable is NA 
#     
#   for (Name_NACheckbox in List_UI_Checkbox_InputNotAvailable) {
#     
#     VariableName <- 
#       substring (
#         text = Name_NACheckbox, 
#         first = nchar ("Checkbox_") + 1, 
#         last = nchar (Name_NACheckbox) - nchar ("_InputNotAvailable")
#       )
#     
#     updateCheckboxInput (
#       session = session,
#       inputId = Name_NACheckbox,
#       value = 1 * is.na (rv$DF_Calc_Input [1, VariableName])  
#     )  
#     
#   } # End loop
#   
#   
#   ## Assign values of boolean variables to checkboxes 
#     
#   for (VariableName in List_UI_InputFields_CheckBox) {
#     
#     updateCheckboxInput (
#       session = session,
#       inputId = VariableName,
#       value = rv$DF_Calc_Input [1, VariableName]
#     )  
#     
#   } # End loop
#   
#   
#   ## Assign values of code variables to radio buttons  
#   
#   for (VariableName in List_UI_InputFields_RadioButton) {
#     
#     updateRadioButtons (
#       session = session,
#       inputId = VariableName,
#       selected = rv$DF_Calc_Input [1, VariableName]
#     )  
#     
#   } # End loop
#   
#   
#   # if (rv$DF_Calc_Input [1, "f_Area_WindowType2"] == 0)
#   #   {
#   #     updateCheckboxInput (
#   #       session = session,
#   #       inputId = "Show_WindowType2",
#   #       value = FALSE
#   #     )    
#   #   } else {
#   #     updateCheckboxInput (
#   #       session = session,
#   #       inputId = "Show_WindowType2",
#   #       value = TRUE
#   #     )    
#   #   }
#   
# 
#   
#   
#   # updateSliderInput (
#   #   session,
#   #   "d_Insulation_Ceiling",
#   #   value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"]
#   # )  
#   
#   
#   
# } # End of function UpdateInputFieldsFromDFCalc ()
# 










#####################################################################################X
## not used - FUNCTION NOT USED UpdateInputFieldsFromStack () - Update all input fields by values from selected dataset -----

# 2024-09-27 Not used anymore


UpdateInputFieldsFromStack <- function (session, input, rv)    
  {

  # for (VariableName in List_UI_InputFields_Numeric) {
  #   
  #   updateSliderInput (
  #     session,
  #     paste0 (VariableName, "_Slider"),
  #     value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
  #   )
  # 
  # } # End loop 
  
  
  for (VariableName in List_UI_InputFields_Numeric) {
    
    updateNumericInput (
      session,
      VariableName,
      value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
    )  
    
  } # End loop
  
  
  for (VariableName in List_UI_InputFields_CheckBox) {
    
    updateCheckboxInput (
      session = session,
      inputId = VariableName,
      value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
    )  
    
  } # End loop

  
  for (VariableName in List_UI_InputFields_RadioButton) {
    
    updateRadioButtons (
      session = session,
      inputId = VariableName,
      selected = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, VariableName]
    )  
    
  } # End loop
  
  
    
    # updateSliderInput (
    #   session,
    #   "d_Insulation_Ceiling",
    #   value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"]
    # )  
    
    
    
  } # End of function UpdateInputFieldsFromStack ()




#####################################################################################X
## FUNCTION ObserveNotAvailableCheckbox_UpdateDFCalcVariable ()  ----- 
## Observe input field and update variable in calculation dataframe


ObserveNotAvailableCheckbox_UpdateDFCalcVariable <- function (
    Name_NACheckbox, 
    input = input, 
    rv = rv
    ) {
  
  # This function is used to observe checkboxes from a list that indicate that input values
  # are not available for a variable.
  # 
  # Rule for naming the checkbox: 
  # paste0 ("Checkbox_", Name_DFCalcVariable, "_InputNotAvailable")
  # 
  # In case of a change to FALSE it assigns NA to the variable of the calculation dataframe 
  # 
  # it assigns the new value to the variable of equal name in  
  # the calculation dataframe. 
  # 
  # The name of the input field may have a suffix that the calculation dataframe variable doesn't have.
  # Use the parameter SuffixInputField in this case.    
  
  observeEvent (
    AuxFunctions::Parse_StringAsCommand (paste0 ("DF$", Name_NACheckbox), DF = input), 
    {
      
      Name_InputField <- 
        substring (
          text = Name_NACheckbox, 
          first = nchar ("Checkbox_") + 1, 
          last = nchar (Name_NACheckbox) - nchar ("_InputNotAvailable")
        )
      
      
      if (AuxFunctions::Parse_StringAsCommand (paste0 ("DF$", Name_NACheckbox), DF = input) == 0) {
        
        if (Name_InputField %in% List_UI_InputFields_Numeric_Percent) {
          
          rv$DF_Calc_Input [1, Name_InputField] <-
            0.01 * 
            AuxFunctions::Parse_StringAsCommand (
              paste0 ("DF$", Name_InputField), 
              DF = input
            )
          
        } else {
          
          rv$DF_Calc_Input [1, Name_InputField] <-
            AuxFunctions::Parse_StringAsCommand (
              paste0 ("DF$", Name_InputField), 
              DF = input
            )
          
        } # End if else
        
        
      } else {

                
        rv$DF_Calc_Input [1, Name_InputField] <- NA
        
        
      } # End if else     
      
    })
  
}    # End function ObserveNotAvailableCheckbox_UpdateDFCalcVariable ()




#####################################################################################X
## FUNCTION ObserveInputField_UpdateDFCalcVariable ()  ----- 
## Observe input field and update stack variable


ObserveInputField_UpdateDFCalcVariable <- function (
    Name_InputField, 
    SuffixInputField = "", 
    input, rv) {
  
  # This function is used to observe input fields from a list.
  # In case of a change it assigns the new value to the variable of equal name in  
  # the calculation dataframe. 
  # 
  # The name of the input field may have a suffix that the calculation dataframe variable doesn't have.
  # Use the parameter SuffixInputField in this case.    

  
  observeEvent (
    AuxFunctions::Parse_StringAsCommand (
      paste0 ("DF$", Name_InputField, SuffixInputField), 
      DF = input
    ), 
    {
      
      if (Name_InputField %in% List_UI_InputFields_Numeric_Percent) {
        
        rv$DF_Calc_Input [1, Name_InputField] <-
          0.01 *
          AuxFunctions::Parse_StringAsCommand (
            paste0 ("DF$", Name_InputField, SuffixInputField), 
            DF = input
          )
        
      } else {
        
        rv$DF_Calc_Input [1, Name_InputField] <-
          AuxFunctions::Parse_StringAsCommand (
            paste0 ("DF$", Name_InputField, SuffixInputField), 
            DF = input
          )
        
      } # End if else
      
    })
  
  
  
  
  
    
  # observeEvent (
  #   AuxFunctions::Parse_StringAsCommand (
  #     paste0 ("DF$", Name_InputField, SuffixInputField), 
  #     DF = input
  #   ), 
  #   {
  #     rv$DF_Calc_Input [1, Name_InputField] <-
  #       AuxFunctions::Parse_StringAsCommand (
  #         paste0 ("DF$", Name_InputField, SuffixInputField), 
  #         DF = input
  #       )
  #   })
  
}    # End function ObserveInputField_UpdateDFCalcVariable ()












# bis 2024-09-27
#
# ObserveInputField_UpdateStackVariable <- function (Name_InputField, SuffixInputField = "", input, rv) {
# 
#   # This function is used to observe input fields from a list.
#   # In case of a change it assigns the new value to the variable of equal name in  
#   # the calculation stack. 
#   # 
#   # The name of the input field may have a suffix that the calculation stack variable doesn't have.
#   # Use the parameter SuffixInputField in this case.    
#     
#   observeEvent (
#     AuxFunctions::Parse_StringAsCommand (
#       paste0 ("DF$", Name_InputField, SuffixInputField), 
#       DF = input
#     ), 
#     {
#       rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, Name_InputField] <-
#         AuxFunctions::Parse_StringAsCommand (
#           paste0 ("DF$", Name_InputField, SuffixInputField), 
#           DF = input
#         )
#     })
#   
# }    # End function ObserveInputField_UpdateStackVariable ()
#   




#####################################################################################X
## FUNCTION ObserveInputField_UpdateNumericInputField ()  ----- 
## Observe input field (for example slider input) and update a related numeric input field


ObserveInputField_UpdateNumericInputField <- function (
    Name_InputField1, 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # If Name_InputField2 = "" it will be determined by omitting 
                          # the suffix of Name_InputField1  
    input = input, 
    rv = rv,
    session = session
    ) {
  
  # This function is used to observe input fields from a list.
  # In case of a change it assigns the new value to the a second input field 
  # 
  # The name of the input field 1 may be identical to input 2 with exeption of a suffix.
  # Use the parameter SuffixInputField1ToBeRemoved in this case.    
  
  if (Name_InputField2 == "") {
    Name_InputField2 <- substring (
      Name_InputField1, 
      first = 1, 
      last = nchar (Name_InputField1) - nchar (SuffixInputField1ToBeRemoved)
        )
    
  }
  
  
  observeEvent (
    AuxFunctions::Parse_StringAsCommand (
      paste0 ("DF$", Name_InputField1), 
      DF = input
    ), 
    {

      # if (!is.na (            # the first if is used to enable comparison 
      #       AuxFunctions::Parse_StringAsCommand (
      #         paste0 ("DF$", Name_InputField2),
      #         DF = input
      #       )
      #     )
      # ) {
        
      
      Value_InputField1 <- AuxFunctions::Parse_StringAsCommand (
        paste0 ("DF$", Name_InputField1),
        DF = input
      )
      
      if (is.na (Value_InputField1)) {
        Value_InputField1 = 0
      }
      
      
      Value_InputField2 <- AuxFunctions::Parse_StringAsCommand (
        paste0 ("DF$", Name_InputField2),
        DF = input
        )
      
      if (is.na (Value_InputField2)) {
        Value_InputField2 = 0
      }
      
      
      if (Value_InputField1 != Value_InputField2) {

        updateNumericInput (
          session = session,
          inputId = Name_InputField2,
          value = AuxFunctions::Parse_StringAsCommand (
            paste0 ("DF$", Name_InputField1),
            DF = input
          )
        )

      } # End if not equal
        
        
      # } else { # if the value of input field 2 is NA
      #   
      #   updateNumericInput (
      #     session = session,
      #     inputId = Name_InputField2,
      #     value = AuxFunctions::Parse_StringAsCommand (
      #       paste0 ("DF$", Name_InputField1), 
      #       DF = input
      #     )
      #   )
      #   
      #   
      #   
      # } # End if not NA
      
      
      
      
      ## This is not needed.
      ## Stack variable is updated as a consequence of the change of the input field 
      # rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, Name_InputField2] <-
      #   AuxFunctions::Parse_StringAsCommand (
      #     paste0 ("DF$", Name_InputField1), 
      #     DF = input
      #   )
      
    })
  
}    # End function ObserveInputField_UpdateNumericInputField ()





#####################################################################################X
## FUNCTION ObserveNumericInputField_UpdateSliderInputField ()  ----- 
## Observe numeric input field and update a related input field (for example slider input) 



ObserveNumericInputField_UpdateSliderInputField <- function (
    Name_TargetInputField, 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # If Name_SourceInputField = "" it will be determined by omitting 
    # the suffix of Name_TargetInputField  
    input = input, 
    rv = rv,
    session = session
) {
  
  # This function is used to observe numeric input fields from a list.
  # In case of a change it assigns the new value to a related input field (e.g. slider input) 
  # 
  # The name of the target input field may be identical to the source input field 
  # with exeption of a suffix.
  # Use the parameter Suffix_TargetInputField_ToBeRemoved in this case.    
  
  if (Name_SourceInputField == "") {
    Name_SourceInputField <- substring (
      Name_TargetInputField, 
      first = 1, 
      last = nchar (Name_TargetInputField) - nchar (Suffix_TargetInputField_ToBeRemoved)
    )
    
  }
  
  
  observeEvent (
    AuxFunctions::Parse_StringAsCommand (
      paste0 ("DF$", Name_SourceInputField), 
      DF = input
    ), 
    {
      
      updateSliderInput (
        session = session,
        inputId = Name_TargetInputField,
        value = AuxFunctions::Parse_StringAsCommand (
          paste0 ("DF$", Name_SourceInputField), 
          DF = input
        )
        ,
      )
      

    })
  
}    # End function ObserveNumericInputField_UpdateSliderInputField ()









#####################################################################################X
## FUNCTION ObserveMatrixButton_LoadDatasetFromPoolToCalculation ()  ----- 


ObserveMatrixButton_LoadDatasetFromPoolToCalculation <- function (
    i_Row = 1,
    i_Col = 1,
    input = input, 
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
) {

  
  ButtonName_Basis <- "Button_Load_Example_Type"  
  
  ButtonName <- paste0 (
    ButtonName_Basis, "_",
    i_Row,
    i_Col)
  
  ButtonEventName <- paste0 (
    "DF$",
    ButtonName
    )
  
  
  
  observeEvent (
    AuxFunctions::Parse_StringAsCommand (
      ButtonEventName,
      DF = input
    ), {
    #    input$Button_Load_Example_Type_23, {

      ## Determine the dataset ID
      
      ID_Dataset <-
        paste0 (
          BuildingTypeInfo (
            ColumnName_FixedPart = "Code_BuildingType_Column",
            i_Row_BuildingType = i_Row,
            i_Col_BuildingType = i_Col
          ),
          ".ReEx.001.001"
        )
      
      #ID_Dataset <- "DE.N.TH.05.Gen.ReEx.001.001"

      
      ## Assign the identified dataset to the calculation dataframe
      
      rv$DF_Calc_Input <-
        data.frame (
          DF_PoolData_Input [ID_Dataset, ]
        )

      rv$DF_Calc_Output <-
        data.frame (
          DF_PoolData_Output [ID_Dataset, ]
        )

      
      UpdateInputFieldsFromDataFrame (
        session = session, 
        input = input, 
        DF_Input = rv$DF_Calc_Input
        ) 
      
      
      
      updateTextInput (
        inputId = "TextInput_ID_Calc",
        value = rownames (rv$DF_Calc_Input [1,])
        #value = rv$DF_Calc_Input [1,1]
      )
      
      # Concept changed, now the Index is updated automatically with the actual value (no "-" anymore)
      # updateTextInput (
      #   inputId = "TextInput_Index_Stack",
      #   value = "-"
      # )
      # 
      # updateSelectInput (
      #   inputId = "SelectInput_ID_Dataset_Stack",
      #   selected = NA
      # )
      
      
      # 2025-05-23: The next three assignments are supposedly not used anymore 
      
      Name_BuildingType <- 
          BuildingTypeInfo (
            ColumnName_FixedPart = "Code_BuildingType_National_Column",
            i_Row_BuildingType = i_Row,
            i_Col_BuildingType = i_Col
        )
      
      ## Determine the current picture name 
      
      Name_Picture <- MatrixPicName (
        i_Row_BuildingType = i_Row,
        i_Col_BuildingType = i_Col
      )
      
      if (Name_Picture == "noimg.jpg") {
        Name_Picture <- ""
        Is_Available_Dataset <- FALSE
      }
      
      
      ## Assign the background colours 

      
      #runjs('document.getElementById("ButtonName").style.backgroundColor = "orange";')
      #Source: https://stackoverflow.com/questions/62019236/shiny-how-to-change-the-background-colour-of-a-button-while-it-is-clicked
      
            
      # updateActionButton (
      #   session = getDefaultReactiveDomain(),
      #   inputId = ButtonName,
      #   #class = "btn-waring",
      #   #style = Style_TypologyMatrix_Button_Pressed,
      #   #style = "warning",
      #   label = Name_BuildingType,
      #   icon = icon (
      #     name = NULL,
      #     style =
      #       paste0 (
      #         "background: url('",
      #         Name_Picture,
      #         #"DE.N.SFH.01.Gen.ReEx.001.jpg",
      #         "');",
      #         Style_TypologyMatrix_Picture_Selected, ";"
      #       ) # End paste0
      #   ), # End icon
      #   #icon = NULL,
      #   disabled = NULL
      # )
      
    }, # End tasks 

    ignoreInit = TRUE

  ) # End observe event Button_Load_Example_Type_xy

  
  
    
} # End of function








# # 2024-08-19 Funktion wird nicht mehr benutzt --> Löschen
# 
# #####################################################################################X
# ## ÜBERHOLT FUNCTION AddToCalculationStack () - Add current calculation dataset to the stack -----
# 
# 
# AddToCalculationStack <- function (
#     myDF_Stack_Input,
#     myDF_Stack_Output, 
#     myDF_Calculate_Input,
#     myDF_Calculate_Output,
#     Do_Replace = FALSE
# ) {
# 
#   if (Do_Replace == TRUE) {
#     
#     myDF_Stack_Input [myDF_Calculate_Input$ID_Stack , ] <-
#       myDF_Calculate_Input [myDF_Calculate_Input$ID_Stack , ]
# 
#     myDF_Stack_Output [myDF_Calculate_Output$ID_Stack , ] <-
#       myDF_Calculate_Input [myDF_Calculate_Output$ID_Stack , ]
#     
#   } else {
#     
#     myDF_Stack_Input <- 
#       #data.frame (
#         rbind (
#           myDF_Stack_Input,
#           myDF_Calculate_Input
#         )
#       #)
#     
#     myDF_Stack_Output <-
#       #data.frame (
#         rbind (
#           myDF_Stack_Output,
#           myDF_Calculate_Output
#         )
#       #) 
#     
#   }
#   
#   return (
#     List_CalcStackTables = 
#       list (
#         DF_Stack_Input  = myDF_Stack_Input,
#         DF_Stack_Output = myDF_Stack_Output 
#       )
#   )
#   
# } # End of function 



# AddToCalculationStack <- function (
#     DF_DataBase_Input,
#     DF_DataBase_Output,
#     ID_Dataset,
#     myDF_Stack_Input = NA,
#     myDF_Stack_Output = NA
# ) {
#   ## Test
#   # myDF_Stack_Input    <- List_CalcStackTables$DF_Input
#   # myDF_Stack_Output   <- List_CalcStackTables$DF_Output
#   
#   ## Function script
#   
#   Is_StackEmpty = TRUE
#   
#   if (! is.null (myDF_Stack_Input) ) {
#     if (! is.atomic (myDF_Stack_Input)) {
#       if (! is.na (myDF_Stack_Input)) {
#         Is_StackEmpty = FALSE
#       }
#     }
#   }
#   
#   if (Is_StackEmpty == TRUE) {
#     
#     myDF_Stack_Input <-
#       data.frame (
#         DF_DataBase_Input  
#       )
#     
#     myDF_Stack_Output <-
#       data.frame (
#         DF_DataBase_Output 
#       )
#     
#     myDF_Stack_Input <-
#       myDF_Stack_Input [ID_Dataset, ]
#     
#     myDF_Stack_Output <-
#       myDF_Stack_Output [ID_Dataset, ]
#     # Data_Output does not contain any data   
#     
#   } else {
#     
#     myDF_Stack_Input <-
#       rbind (
#         myDF_Stack_Input,
#         DF_DataBase_Input [ID_Dataset, ]
#       )
#     
#     myDF_Stack_Output <-
#       rbind (
#         myDF_Stack_Output,
#         DF_DataBase_Output [ID_Dataset, ]
#       )
#     # Data_Output does not contain any data   
#     
#   }
#   
#   return (
#     List_CalcStackTables = 
#       list (
#         DF_Input  = myDF_Stack_Input,
#         DF_Output = myDF_Stack_Output 
#       )
#   )
#   
# } # End of function 








#_ -----


#####################################################################################X
## USER INTERFACE -----
#####################################################################################X





ui <- shinydashboard::dashboardPage (

  
  shinydashboard::dashboardHeader (
    title = "Energieprofil"
  ),
  

  
  
  shinydashboard::dashboardSidebar ( 
    
    #minified = FALSE, 
    #collapsed = FALSE, 
    
    shinydashboard::sidebarMenu (
      shinydashboard::menuItem (
        "Info",      
        tabName = "Tab_Info",      
        icon = shiny::icon ("info-circle")
      ),
      
      shinydashboard::menuItem (
        "Dashboard", 
        tabName = "Tab_Dashboard",
        icon = shiny::icon ("building"),
        #        icon = fontawesome::fa ("chart-line"),
        #        icon = fontawesome::fa ("fa-solid fa-chart-line"),
        #          icon = icon ("fa-solid fa-chart-line"),
        #        icon = icon ("dashboard"),
        selected = TRUE
      ),
      
      shinydashboard::menuItem (
        "Vergleich",      
        tabName = "Tab_Comparison",      
        icon = shiny::icon ("chart-line", class = NULL, lib = "font-awesome")
      ),
      
      shinydashboard::menuItem (
        "Daten",     
        tabName = "Tab_Data",          
        icon = shiny::icon ("table")
      ),

      shinydashboard::menuItem (
        "Expertenbereich",
        tabName = "Tab_Expert",
        icon = shiny::icon ("table")
      )
      
    ) # End side barMenu
    
  ), # End dashboardSidebar 
  
  
  
  #######################################################################X
  ## Dashboard Body -----
  
  shinydashboard::dashboardBody (
    
    shinydashboard::tabItems (
      
      
      
      #######################################################################X
      ## tabItem "Tab_Info"  -----
      
      shinydashboard::tabItem (
        
        tabName = "Tab_Info",
        
        # h2 ("Information"),
        
        
        # Comment Tobias: I did not manage to source the file "info.Rmd" in 
        # shinyapps.io; see commented script below the text. Any suggestions are welcome :)  
        # Thus, I pasted the original text from "info.Rmd" into the script below.
        
        markdown ("
        
        
        
        
        
        
## IWU - Energieprofil - Shiny App - Development Version
Version: 28.11.2025

### Einführung 

Das Online-Tool 'Energieprofil' ermöglicht eine Abschätzung des typischen Energieverbrauchs für Heizung und Warmwasser von Wohngebäuden. Da es sich um eine physikalische Modellierung des Energieverbrauchs handelt, wird das Berechnungsergebnis als 'Energiebedarf' bezeichnet. Der Energiebedarf eines Gebäudes hängt von der Größe, der Gebäudeform und vor allem vom Baujahr des Gebäudes ab - der Grund für letzteres sind die im Laufe der Jahrzehnte stetig erhöhten energetischen Anforderungen an Neubauten. Auch bei Altbauten kann der Energiebedarf durch Wärmeschutzmaßnahmen, also die Wärmedämmung von Dach, Außenwand und Fußböden sowie durch Einbau energetisch hochwertiger Fenster erheblich gesenkt werden - wobei durchaus das Qualitätsniveau von Neubauten erreicht werden kann. 

Das Energieprofil-Online-Tool erlaubt es, die Einflüsse dieser Parameter auf den Energiebedarf abzuschätzen. Hierfür können verschiedene Beispielgebäude aus der deutschen Wohngebäudetypologie gewählt werden, die nach Größe, Gebäudeart und Baualter differenziert sind. Dabei sind die Beipielgebäde zunächst als nicht modernisiert angenommenen. Die Beispielgebäude können schrittweise modifiziert werden, z.B. können die Wohnfläche, die Anzahl der Geschosse, die Wärmedämmung, die energetische Qualität der Fenster auf den vorhandenen oder gewünschten Zustand eines realen Geäbudes angepasst werden und der Energiebedarf entsprechend ermittelt werden. Weiterhin kann die Wärmeversorgung modifiziert werden, in dem z.B. zusätzlich eine thermische Solaranlage oder statt des Kessels eine Wärmepumpe eingebaut wird. 

Auf der Grundlage der energierelevanten Gebäudeeigenschaften (Energieprofil-Indikatoren) wird zunächst eine Energiieblanzierung des Baukörpers vorgenommen: Das Ergebnis ist der Heizwärmebedarf. Addiert man hierzu die Wärmemenge, die in Form von Warmwasser gezapft wird, erhält man den Gesamtwärmebedarf, den das Heizsystem decken muss. Nach Auswahl eines Heizsystems, das aus der Wärmeverteilung, den gegebenfalls erforderlichen Wärmespeichern und einem oder mehrerer Wärmeerzeuger besteht, wird der Bedarf an Endenergie berechnet, der differenziert nach Energieträger (Gas, Heizöl, Fernwärme, Strom, Biomasse) vom Tool ausgegeben wird. Die für die Wärmeversorgung eingesetzten Energieträger können aus ökonomischer und ökologischer Sicht unterschiedlich bewertet werden. Die Bewertung ist jedoch (noch) nicht Gegenstand des Online-Tools. 

Die Berechnung erfolgt uner Annahme von 'standardisierten Bewohnern' :-) das heißt unabhängig vom Energiestandard wird eine Raumtemperatur von 20°C während des Tages in beheizten Räumen und ein gewisser Luftaustausch angenommen. Da diese Nutzungsbedingungen, aber auch andere Eingangsgrößen der Bilanzierung (z.B. Annahmen für die Baustoffe) in der Praxis sehr stark variieren und kaum empirische Daten vorliegen, ist davon auszugehen, dass der berechnete Energiebedarf den durchschnittlichen Energieverbrauch von Wohngebäuden nicht genau abbildet. Aus diesem Grund wird im Verfahren eine Kalibirierung auf das typische Verbrauchsniveau der Gebäude vorgenommen: Alle berechneten Energieströme werden mit einem empirisch ermittelten Faktor angepasst, der das Verhältnis von Verbrauch zu Bedarf für unterschiedliche Energiestandards wiedergibt. Auf Grund der genannten Ungewissheiten bei den Eingangsdaten ist es nicht möglich, den Energieverbrauch eines einzelnen Gebäudes exakt vorherzuberechnen. In den Diagrammen 'Erwartungsbereiche' wird versucht, mit Hilfe einfacher Abschätzungen die Unsicherheit der Berechnung darzustellen. Es kann davon ausgegangen werden, dass der gemessene Verbrauchswert eines realen Gebäudes typischerweise innherhalb dieser Spanne liegt.  


### Vorgehen bei der Energiebilanzierung mit der Energieprofil-Shiny-App


#### (1) Auswahl Beispielgebäude

Dashboard, Menüpunkt 'Typologie': Durch Anklicken eines Bildes wird der Datensatz eines Beispielgebäudes in die Berechnung geladen und der berechnete Energiebedarf in den drei Diagrammen dargesellt (Heizwärmebedarf, Endenergiebedarf, Erwartungsbereiche).


#### (2) Im Stack speichern

Um den Datensatz eines Beispielgebäudes zu modifizieren, muss er im 'Stack'  (Berechnungsstapel) gespeichert werden. Bei Bedarf können auch alle Datensätze der Typologie-Beispielgebäude gespeichert werden (Schalter 'Alle im Stack speichern'). Sind mehrere Gebäudedatensätze im Stack vorhanden, so werden die Energiebedarfswerte im Hauptmenüpunkt 'Vergleich' gegenübergestellt. 


#### (3) Modifikation der Eingabegrößen 

In der horizontalen Kopfleiste des Dashboards kann ganz links aus den im Stack vorhandenen Datensätzen einer ausgewählt und in die Berechnung geladen werden. Dann können in den Tabs 'Gebäude' und 'Wärmeversorgung' die Merkmale des Gebäudes und der Anlagentechnik beliebig modifiziert werden. Die Ergebnisse der Berechnung werden dann jeweils in den Diagrammen rechts dargestellt. Sollen die Änderungen herhalten bleiben, muss man auf 'Speichern' klicken. Dann werden Eingangsdaten und Ergebnisse in den im Stack zugeordneten Datensatz gespeichert (vorhandene Daten werden überschrieben). Durch Editieren der ID des gerade in die Berechnung geladenen Datensatzes und anschließendes Klicken auf 'Speichern' kann ein neuer Datensatz angelegt werden. 


#### (4) Export

Im Hauptmenü 'Daten' können die Eingangs- und Ausgangsdaten des Stacks und der aktuellen Berechnung gesichtet werden. Weiterhin können alle Tabellen auch als CSV oder Excel exportiert werden.  


#### (5) Re-Import

Es ist möglich, eine Excel-Tabelle mit Eingabedaten in den Stack zu importieren (Menü 'Daten-Import' im Hauptmenü 'Daten', Hinweise zur erforderlichen Struktur der Tabelle stehen unten im Abschnitt zur Funktionalität.) Um (z.B. für Parameterstudien) Variablen systematisch zu variieren, bietet es sich an, einen Datensatz im Stack als Basisvariante anzulegen und mit den Eingabefeldern im Tab 'Gebäude' und 'Wärmeversorgung' auf die gewünschten Eigenschaften anzupassen. Nach dem Export kann dieser Datensatz in Excel vervielfältigt werden, um dann systematisch einzelne Eingabegrößen zu variieren. Nach dem Re-Import wird für alle Datensätze die Energiebilanz berechnet. 



### Fachlicher Hintergrund 

Diese Shiny-App dient der Berechnung des Energiebedarfs für Heizung und Warmwasser auf der Basis von Energieprofil-Indikatoren. 

Details zum fachlichen Hintergrund finden sich auf der MOBASY-Projektseite: https://www.iwu.de/forschung/energie/mobasy/ (Beschreibung des Gesamtverfahrens: https://www.iwu.de/fileadmin/publikationen/energie/mobasy/2021_IWU_LogaEtAl_MOBASY-Realbilanzierung-Verbrauch-Bedarf-Vergleich.pdf). 

Die Shiny-App erweitert die Funktionalität des MOBASY-Energieprofil-Webtools https://www.iwu.de/publikationen/tools/energieprofil/webtool/ um die Möglichkeit, berechnete Ein- und Ausgabedaten in einem Stack abzulegen und nach Durchführung der Berechnung als Excel-Tabelle herunterzuladen. Umgekehrt kann eine in Excel präparierte Eingabetabelle in den Stack geladen und berechnet werden.

Die Shiny-App besteht aus folgenden Bausteinen:

- 'Energieprofil-Indikatoren' für die Erfassung der wesentlichen energetischen Merkmale von Gebäudehülle und Wärmeversorgung (2 Eingabe-Formulare)
- Schätzverfahren für die Gebäudehüllfläche auf der Basis der Wohnfläche und der geometrischen Energieprofil-Indikatoren
- Schätzverfahren für Wärmedurchgangskoeffizienten (U-Werte) auf Basis von Informationen zu Baualter und nachträglicher Dämmung der Komponenten der thermischen Hülle
- Konfigurationsalgorithmus für die Komponenten der Wärmeversorgung auf Basis der wesentlichen Merkmale (Vorhandensein und ggf. Art und Lokalisation von Anlagenkomponenten)
- Pauschalwerte für die Effizienz der Komponenten der Wärmeversorgung (Wärmeverteilung, -speicherung und -erzeugung)
- Energiebilanz-Berechnung (TABULA-Verfahren) zur Ermittlung des Heizwärmebedarfs sowie des nach Energieträger differenzierten Endenergiebedarfs für Heizung und Warmwasser (Beschreibung der Methodik: https://episcope.eu/fileadmin/tabula/public/docs/report/TABULA_CommonCalculationMethod.pdf)  

Die in R programmierten Berechnungsformeln finden sich im R-Paket MobasyModel https://github.com/TobiasLoga/MobasyModel .
Die Algorithmen sind weitgehend identisch mit denen des Excel-Tools 'EnergyProfile.xlsm' https://www.iwu.de/fileadmin/tools/energyprofile/EnergyProfile-XL-Package.zip .

Wir stellen das Werkzeug gerne anderen Experten zur Nutzung Verfügung, können jedoch keinerlei Support übernehmen. Wir übernehmen keine Gewähr für die Vollständigkeit, Richtigkeit und Genauigkeit der Berechnungen und der Daten. Fehler können gemeldet werden an: Tobias Loga t.loga@iwu.de


### Hinweise zur Funktionalität und zur Datenstruktur der vorliegenden Version  

- Die Energieprofil-Indikatoren können je Einzelgebäude erfasst und eingegeben werden. Sind keine Informationen vorhanden, werden für die Berechnung Mittelwerte aus dem Wohngebäudebestand als Input angesetzt. Damit vergrößert sich jeweils die Unsicherheit des Berechnungsergebenisses. 

- Die Ergebnisse können im Menüpunkt 'Daten' gesichtet und dort auch als Tabelle heruntergeladen werden. 

- Weiterhin kann im Menüpunkt 'Daten' / 'Daten-Import' eine Tabelle mit Eingabedaten in den Stack geladen und berechnet werden. Wird eine heruntergeladene Eingabedatentabelle (Download unter 'Daten' / 'Stack_Input') als Ausgangbasis für den Upload verwendet (z.B. in dem ein Datensatz mehrfach kopiert und für eine Parameterstudie bei bestimmten Variablen systematisch variiert wird), so muss vor dem Upload die erste (über alle Spalten verbundene) Zeile gelöscht werden (Die Download-Funktion schreibt dort das Wort 'Energieprofil' hinein - es ist derzeit nicht klar, wie dies abgeschaltet werden kann.) 

- Weitere im oben genannten Excel-Tool gegebene Möglichkeiten der Eingabe sind derzeit in der Shiny-App (noch) nicht implementiert. Für die gebäudeweise Eingabe und Analyse von Verbrauchsdaten und für den Verbrauch-Bedarf-Vergleich muss also weiterhin das Excel-Tool verwendet werden.  

- Allerdings bietet die Energieprofil-Shiny-App die Möglichkeit, den Verbrauch-Bedarf-Vergleich für importierte Datensätze (vorbereitet in Excel) als Stack-Berechnung durchzuführen. Hierfür dient die Schaltfläche 'Gesamten Stack inkl. V/B-Vergleich berechnen'. Man beachte hier allerdings die lange Rechenzeit (ca. 20 Sekunden je im Stack enthaltenen Datensatz).  

		

-----

Logbuch der Änderungen						
						
  		    
						
-----


Institut Wohnen und Umwelt GmbH

Tobias Loga 									

www.iwu.de 
        
        
        
        
        
        
          

          
")
        
        
        #includeMarkdown ("info/info.Rmd")
        # this is working locally, but is not found after deployment 
        # --> shinyapps.io fails to run. 
        
        
      ), # End tabItem "Tab_Info"

      
      
      #######################################################################X
      ## tabItem "Tab_Dashboard"  -----
      
      shinydashboard::tabItem (
        
        tabName = "Tab_Dashboard",
        
        shinyjs::useShinyjs(),  # Set up shinyjs
        # Package used to simulate click on button
        
        shinyjs::extendShinyjs (text = jsCode, functions = "backgroundCol"),
        
        
        
        
      #fillPage (  # 2025-05-09 abgeschaltet, da man im Datenbereich sonst nicht nach unten scrollen kann.
                   # Die Verwendung von fillPage ()in einem Tab bewirkt offensichtlich, dass die ganze Seite fixiert bleibt.
                   # Die Kopfleiste blieb damit immer sichtbar (was eigentlich gut aussah)

      column (
        12,
        
        ###########################################################################
        ## Ribbon with buttons -----
      
        fluidRow (
          
          style =   "height: 52px; border: 7px solid lightblue; background-color: lightblue",
          
          #style =   "height: 47px; border: 7px solid lightblue; background-color: lightblue",
          #style =   "height: 5vH !important; border: 7px solid lightblue; background-color: lightblue",
          #style =   "height: 47px; border: 7px solid orange; background-color: orange"
          #style =   "height: 40px; border: 1px dotted lightgrey; background-color: orange"
          
          
          
          # column (
          #   4,
          #   h2 ("IWU - Energieprofil - Shiny App")
          # ),
          
          ## Left section
          column (
            5,
            
            fluidRow (
              
              # column (
              #   1,
              #   h5 ("Datensatz")
              #   #style =   "height: 40px"
              #   #align = 'right'
              # ), # End column
              
              # column (
              #   1,
              #   "Laden",
              #   style = "text-align: 'right'" # geht nicht
              #   #align = 'right'
              # ), # End column
              
              column (
                1,
                div ("DS Nr.", style = "font-size:10px; line-height:0.8;"),
                textInput (
                  inputId = "TextInput_Index_Stack", 
                  label = NULL,
                  value = "-",
                  width = NULL #'100%'
                ),
                style = "padding:0 !important;", 
                #style = "padding-right:0;"
                #style = "padding:0 !important; text-align:'right';", # align right doesn't work
                #align = 'right'
              ), # End column
              
              
              column (
                7,
                div ("Auswahl eines Datensatzes aus dem Stack", style = "font-size:10px; line-height:0.8;"),
                
                selectInput (
                  inputId = "SelectInput_ID_Dataset_Stack",
                  label = NULL,
                  choices = SelectionList_ID_Stack_Initialise, 
                  selected = ID_Stack_Initialise, # ID_Dataset_Initialise_Stack,  # "Example.01",
                  width = '100%'
                ), 
                style = "padding:0 !important"
              ), # End column
              
              column (
                1,
                div ("Entfernen", style = "font-size:10px; line-height:0.8;"),
                actionButton (
                  "Button_Delete_Dataset_Stack",
                  label = div ("x", style = "text-align: center;"),
                  #label = "X",
                  width = '100%',
                ),
                style = "padding:0 !important"
              ), # End column
              
              column (
                3,
                div ("Änd. verwerfen", style = "font-size:10px; line-height:0.8;"),
                actionButton (
                  "Button_LoadFromStackToCalculation",
                  label = "Neu laden",
                  width = '100%'
                )
              ), # End column left section
              
              
              
            ), # End fluid row
          ), # End column left section

          ## Center section
          column (
              5,              
          
              fluidRow (    
              
                column (
                  3,
                  div ("im Stack speichern", style = "font-size:10px; line-height:0.8;"),
                  actionButton (
                    "Button_SaveCalculationToStack",
                    label = "Speichern",
                    # label = div (HTML ("Speichern", .noWS = 'outside'),
                    #              style = "font-size:14px; line-height:0.8;"),
                    width = '100%',
                    #style =   "height: 30px"
                  ),
                  style = "padding: 0 !important" 
                ), # End column
                
                column (
                  3,
                  div ("Speichern als", style = "font-size:10px; line-height:0.8;"),
                  textInput (
                    inputId = "TextInput_SaveAs", 
                    label = NULL,
                    value = "-",
                    #width = '100%'
                  ),
                  style = "padding: 0 !important" 
                  

                ), # End column
                
                
                
                column (
                  6,
                  div ("ID des geladenen Datensatzes / editierbar", style = "font-size:10px; line-height:0.8;"),
                  textInput (
                    inputId = "TextInput_ID_Calc",
                    label = NULL,
                    value = NA
                  )
                ), # End column
                
                
                  
              # column (
              #   3,
              #   actionButton (
              #     "Button_RenameDatasetInStack",
              #     label = div (HTML ("Umbe-<br>nennen", .noWS = 'outside'), 
              #                  style = "font-size:14px; line-height:0.8;"),
              #     width = '100%'
              #   )
              # ), # End column
              
              # column (
              #   3,
              #   actionButton (
              #     "Button_SaveCalculationToStackOverwrite",
              #     label = "Speichern",
              #     width = '100%',
              #     #style =   "height: 30px"
              #   ),
              # ), # End column
              # column (
              #   3,
              #   actionButton (
              #     "Button_SaveCalculationToStackAsNew",
              #     label = div (HTML ("Als neu<br> speichern", .noWS = 'outside'), 
              #                  style = "font-size:14px; line-height:0.8;"),
              #     width = '100%'
              #   ),
              # ), # End column
             
              #style =   "height: 15px"
              #style =   "height: 30px; border: 1px dotted lightgrey; background-color: grey"
              
            ) # End fluidRow
            
          ), # End column central section
          
          
          ## Right section
          column (
            2,
            #align = 'center',
            div ("Berechn. automatisch oder manuell", style = "font-size:10px; line-height:0.8;"),
            
            fluidRow (
              
              conditionalPanel (
                condition = "input.Checkbox_AutomaticCalculation == 0",
                
                column (
                  6,
                  actionButton (
                    "Button_Calculate",
                    label = "Berechnen",
                    width = '120%'
                  ),
                  #align = 'right'
                ),
                
                
              ), # End conditional panel 
              
              column (
                6,
                checkboxInput (
                  "Checkbox_AutomaticCalculation",
                  label = "Automatisch",
                  value = TRUE
                ),
                align = 'left'
              ),
              
            ), # End fluidRow
            
            #style = "background-color: white",
            #height = '10px',  
            #style="text-align: center;",
            #align = 'right'
            
          ), # End column
          
        ), # End fluidRow
        
      ), # End column
        
      
      
      
      
        fluidPage (
          
          # titlePanel (
          #   title = strong ("IWU - Gradtagzahlen Deutschland - Shiny App"),
          #   windowTitle = "IWU - Gradtagzahlen Deutschland - Shiny App"
          # ),
          
          
          ## sidebarLayout START -----
          
          sidebarLayout ( 
          
            
            ### sidebar START (left area of sidebarLayout) -----
            
              
            sidebarPanel (
              width = 8,
              
              fluidRow (
                
  
              
              #        mainPanel (
                
                
                column (
                  12, 
                  #style = "height:600px", 
                  # # geht im Prinzip, aber optimale Höhe hängt von Fenstergröße ab
                  #style = "height:800px;background-color: yellow",
                  
                  
                  tabsetPanel (
                    type = "tabs",

                    #######################################################################X
                    #### tabPanel "Typologie" - Selection from building type matrix  -----
                    
                    tabPanel (
                      
                      strong ("Typologie"), 
                      
                      fluidRow (
                        
                        #br (),
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Ausgangsdatensätze - deutsche Wohngebäudetypologie - Beispielgebäude"),
                          style = "background-color: white; color: black; text-align: center;"
                          #style = "background-color: grey; color: white;",
                          
                        ), # End header column
                        
                        
                      ), # End fluidRow

                      fluidRow (
                        
                        style = "
                              color: grey;
                              line-height: 2.0; 
                              text-align: left;
                              #text-align: center;
                        ",
                        
                        column (
                          8,
                          
                          #"Deutsche Wohngebäudetypologie - Beispielgebäude - ",
                          "Hüllflächen auf Basis geometrischer Merkmale geschätzt - ",
                          "Zustand: nicht modernisiert"
                          
                        ), # End column

                        
                        column (
                          1,
                          
                          # Dieser Hilfsknopf ist notwendig, da der direkte Aufruf nicht funktioniert hat. 
                          # Loads the currently selected pool datasets to the stack
                          actionButton (
                            "Button_AddAllTypologyExamplesToStack_Step2",
                            label = "",
                            width = '0px',
                            style = "padding: 0 !important"
                          ),
                          #align = 'right'
                          
                        ),
                        
                                                
                        column (
                          3, 
                          
                          
                          actionButton (
                            "Button_AddAllTypologyExamplesToStack",
                            label = strong (" Alle im Stack speichern ",),
                            #width = '120%'
                            style = "padding: 0 !important"
                          ),
                          align = 'right'
                          
                          #style = "background-color:white"

                          
                        )
                        
                        
                      ), # End fluidRow
                      
                      fluidRow (
                        
                        style = Style_Height_Dashboard_MainPanel,  
                        
                        column (
                          12,
                          

                          
                          fluidRow (
                            column (
                              1,
                              style = Style_TypologyMatrix_HeaderElement_Left,
                              ""
                            ), # End column
                            column (
                              3,
                              style = Style_TypologyMatrix_HeaderElement_Left,
                              strong ("Baualter")
                              ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("EFH")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("RH")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("MFH")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("GMH")
                            ), # End column
                            
                            
                          ), # End fluidRow
                          
                          fluidRow (
                            column (
                              1,
                              style = Style_TypologyMatrix_HeaderElement_Left,
                              ""
                            ), # End column
                            column (
                              1,
                              style = Style_TypologyMatrix_HeaderElement_Left,
                              strong ("Klasse")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Left,
                              strong ("von ... bis")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("Enfamilienhaus freistehend")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("Reihenhaus")
                            ), # End column
                            column (
                              2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("Mehrfamilienhaus")
                            ), # End column
                            column (2,
                              style = Style_TypologyMatrix_HeaderElement_Middle,
                              strong ("großes Mehrfamilienhaus")
                                    # style = 
                                    # "vertical-align: center; # doesn't work
                                    # text-align: center; 
                                    # border: 1px dotted grey;
                                    # height: 50px"
                            ), # End column
                            
                            

                            
                          ), # End fluidRow
                          
                          # Test: Just displays the image
                          #img (src="DE.N.SFH.01.Gen.ReEx.001.jpg", height="100%", width="100%", align = "center"),

                          
                          
                          
                          
                          
                          
                                                    
                          
                          # i_Row_BuildingType <- 8,
                          # i_Col_BuildingType <- 1,
                          # 
                          # for (i_Row_BuildingType in (1:4)) {
                          #   
                          #   
                          #   MatrixPicName (
                          #     i_Row_BuildingType = i_Row_BuildingType,
                          #     i_Col_BuildingType = i_Col_BuildingType
                          #   )
                          #   
                          #   BuildingTypeInfo (
                          #     i_Row_BuildingType = i_Row_BuildingType,
                          #     i_Col_BuildingType = i_Col_BuildingType,
                          #     ColumnName_FixedPart = "Code_BuildingType_National_Column"
                          #   )
                          #   
                          # },
                          # 
                          # 
                          # MatrixPicName (
                          #   i_Row_BuildingType = i_Row_BuildingType,
                          #   i_Col_BuildingType = i_Col_BuildingType
                          # ),
                          # 
                          # BuildingTypeInfo (
                          #   i_Row_BuildingType = i_Row_BuildingType,
                          #   i_Col_BuildingType = i_Col_BuildingType,
                          #   ColumnName_FixedPart = "Code_BuildingType_National_Column"
                          # ),




                          #######################################################################X
                          ##### Matrix row 1 -----
                          
                          # This row is created manually to facilitate experimental changes
                          

                          fluidRow (
                            
                            column (
                              1,
                              style = Style_TypologyMatrix_BodyElement_Left,
                              ""
                            ), # End column
                            
                            column (
                              1,
                              style = Style_TypologyMatrix_BodyElement_Left,
                              strong ("A")
                            ), # End column
                            
                            column (
                              2,
                              style = Style_TypologyMatrix_BodyElement_Left,
                              strong ("     ... 1859")
                            ), # End column
                            ## Keep this for testing a single button
                            #
                            # column (
                            #   2,
                            #   style = Style_TypologyMatrix_BodyElement_Middle,
                            #   
                            #   actionButton (
                            #     inputId = paste0 ("Button_Load_Example_Type_", 1, 1),
                            #     #label = "EFH_A",
                            #     label = strong (BuildingTypeInfo (
                            #       ColumnName_FixedPart = "Code_BuildingType_National_Column",
                            #       i_Row_BuildingType = 1,
                            #       i_Col_BuildingType = 1
                            #     )),
                            #     style = NULL,
                            #     style = Style_TypologyMatrix_Button,
                            #     #style = "border: 0px; background-color: transparent;",
                            #     icon = icon (
                            #       name = NULL,
                            #       style =
                            #         paste0 (
                            #           "background: url('",
                            #           MatrixPicName (
                            #             i_Row_BuildingType = 1,
                            #             i_Col_BuildingType = 1
                            #           ),
                            #           #"DE.N.SFH.01.Gen.ReEx.001.jpg",
                            #           "');",
                            #           Style_TypologyMatrix_Picture
                            #         ) # End paste0
                            #     ), # End icon
                            #     width = NULL,
                            #     disabled = FALSE,
                            #     
                            #     #onclick = "document.getElementById('Button_Load_Example_Type_11').style.backgroundColor = 'orange';",
                            #     #onclick = "document.getElementById('Button_Load_Example_Type_21').style.backgroundColor = 'blue';",
                            #     # zweimal hintereinander funktioniert
                            #     #onclick = "document.getElementById('Button_Load_Example_Type_11').style.color = 'red';"
                            #     # das funktioniert für Hintergrund und Schriftfarbe!
                            #     # Tipp aus https://github.com/rstudio/shiny/issues/3793
                            #     
                            #   ), # End actionButton
                            #   
                            # ), # End column
                            

                            
                            
                            
                            # column (
                            #   2,
                            #   style = Style_TypologyMatrix_BodyElement_Middle,
                            #   actionButton (
                            #     inputId = "Button_Load_Example_Type_11",
                            #     label = strong ("EFH_A"),
                            #     style = "border: 0px; background-color:transparent",
                            #     icon = icon (
                            #       name = NULL,
                            #       style = 
                            #         paste0 (
                            #           "background: url('DE.N.SFH.01.Gen.ReEx.001.jpg');",
                            #           Style_TypologyMatrix_Picture
                            #         ) # End paste0
                            #     ), # End icon
                            #     width = NULL,
                            #     disabled = FALSE
                            #   ), # End actionButton
                            # ), # End column
                            
                            column (
                              2,
                              style = Style_TypologyMatrix_BodyElement_Middle,
                              
                              Construct_UI_MatrixActionButton (
                                i_Row_Matrix = 1,
                                i_Col_Matrix = 1
                              )
                              
                            ), # End column
                            
                            column (
                              2,
                              style = Style_TypologyMatrix_BodyElement_Middle,
                              
                              Construct_UI_MatrixActionButton (
                                i_Row_Matrix = 1,
                                i_Col_Matrix = 2
                              )
                              
                            ), # End column
                            
                            
                            column (
                              2,
                              style = Style_TypologyMatrix_BodyElement_Middle,
                              
                              Construct_UI_MatrixActionButton (
                                i_Row_Matrix = 1,
                                i_Col_Matrix = 3
                              )
                              
                            ), # End column
                            
                            
                            column (
                              2,
                              style = Style_TypologyMatrix_BodyElement_Middle,
                              
                              Construct_UI_MatrixActionButton (
                                i_Row_Matrix = 1,
                                i_Col_Matrix = 4
                              )
                              
                            ) # End column
                            
                            
                            
                            # column (
                            #   2,
                            #   style = Style_TypologyMatrix_BodyElement_Middle,
                            #   actionButton (
                            #     inputId = "Button_Load_Example_Type_12",
                            #     label = strong ("RH_A"),
                            #     style = "border: 0px; background-color:white",
                            #     icon = icon (
                            #       name = NULL,
                            #       style = 
                            #         paste0 (
                            #           "background: url('DE.N.TH.01.Gen.ReEx.001.jpg');",
                            #           Style_TypologyMatrix_Picture
                            #         ) # End paste0
                            #     ), # End icon
                            #     width = NULL,
                            #     disabled = FALSE
                            #   ), # End actionButton
                            # ), # End column
                            # 
                            # column (
                            #   2,
                            #   style = Style_TypologyMatrix_BodyElement_Middle,
                            #   actionButton (
                            #     inputId = "Button_Load_Example_Type_13",
                            #     label = strong ("MFH_B"),
                            #     style = "border: 0px; background-color:white",
                            #     icon = icon (
                            #       name = NULL,
                            #       style = "
                            #           background: url('DE.N.MFH.01.Gen.ReEx.001.jpg');
                            #           background-size: contain;
                            #           background-position: center;
                            #           background-repeat: no-repeat;
                            #           height: 100px;
                            #           width:  100px;
                            #           display: block;
                            #         "),
                            #     width = NULL,
                            #     disabled = FALSE
                            #   ), # End actionButton
                            # ), # End column
                            # 
                            # column (
                            #   2,
                            #   style = Style_TypologyMatrix_BodyElement_Middle,
                            #   actionButton (
                            #     inputId = "Button_Load_Example_Type_14",
                            #     label = strong ("GMH_B"),
                            #     style = "border: 0px",
                            #     icon = icon (
                            #       name = NULL,
                            #       style = paste0 (
                            #         "background: url('DE.N.AB.01.Gen.ReEx.001.jpg');",
                            #         "background-size: contain;
                            #           background-position: center;
                            #           background-repeat: no-repeat;
                            #           height: 100px;
                            #           width:  100px;
                            #           display: block;"
                            #       ),
                            #     ),
                            #     width = NULL,
                            #     disabled = FALSE
                            #   ), # End actionButton
                            # ), # End column
                            
                            
                          ), # End fluidRow
                          
                          
                          
                          
                          
                          
                          # 
                          # 
                          # ## Matrix row 2
                          # 
                          # fluidRow (
                          # 
                          #   column (
                          #     1,
                          #     style = Style_TypologyMatrix_BodyElement_Left,
                          #     ""
                          #   ), # End column
                          #   
                          #   column (
                          #     1,
                          #     style = Style_TypologyMatrix_BodyElement_Left,
                          #     "B"
                          #   ), # End column
                          #   
                          #   column (
                          #     2,
                          #     style = Style_TypologyMatrix_BodyElement_Left,
                          #     "1860 ... 1918"
                          #   ), # End column
                          #   
                          #   column (
                          #     2,
                          #     style = Style_TypologyMatrix_BodyElement_Middle,
                          #     actionButton (
                          #       inputId = "Button_Load_Example_Type_21",
                          #       label = "EFH_B",
                          #       style = "border: 0px",
                          #       icon = icon (
                          #         name = NULL,
                          #         style = 
                          #           paste0 (
                          #             "background: url('DE.N.SFH.02.Gen.ReEx.001.jpg');",
                          #             Style_TypologyMatrix_Picture
                          #           ) # End paste0
                          #         ), # End icon
                          #       width = NULL,
                          #       disabled = FALSE
                          #     ), # End actionButton
                          #   ), # End column
                          #   
                          #   column (
                          #     2,
                          #     style = Style_TypologyMatrix_BodyElement_Middle,
                          #     actionButton (
                          #       inputId = "Button_Load_Example_Type_22",
                          #       label = "RH_B",
                          #       style = "border: 0px",
                          #       icon = icon (
                          #         name = NULL,
                          #         style = 
                          #           paste0 (
                          #             "background: url('DE.N.TH.02.Gen.ReEx.001.jpg');",
                          #             Style_TypologyMatrix_Picture
                          #           ) # End paste0
                          #       ), # End icon
                          #       width = NULL,
                          #       disabled = FALSE
                          #     ), # End actionButton
                          #   ), # End column
                          #   
                          #   column (
                          #     2,
                          #     style = Style_TypologyMatrix_BodyElement_Middle,
                          #     actionButton (
                          #       inputId = "Button_Load_Example_Type_23",
                          #       label = "MFH_B",
                          #       style = "border: 0px",
                          #       icon = icon (
                          #         name = NULL,
                          #         style = "
                          #             background: url('DE.N.MFH.02.Gen.ReEx.001.jpg');
                          #             background-size: contain;
                          #             background-position: center;
                          #             background-repeat: no-repeat;
                          #             height: 100px;
                          #             width:  100px;
                          #             display: block;
                          #           "),
                          #       width = NULL,
                          #       disabled = FALSE
                          #     ), # End actionButton
                          #   ), # End column
                          #   
                          #   column (
                          #     2,
                          #     style = Style_TypologyMatrix_BodyElement_Middle,
                          #     actionButton (
                          #       inputId = "Button_Load_Example_Type_24",
                          #       label = "GMH_B",
                          #       style = "border: 0px",
                          #       icon = icon (
                          #         name = NULL,
                          #         style = paste0 (
                          #             "background: url('DE.N.AB.02.Gen.ReEx.001.jpg');",
                          #             "background-size: contain;
                          #             background-position: center;
                          #             background-repeat: no-repeat;
                          #             height: 100px;
                          #             width:  100px;
                          #             display: block;"
                          #             ),
                          #       ),
                          #       width = NULL,
                          #       disabled = FALSE
                          #     ), # End actionButton
                          #   ), # End column
                          #   
                          #   
                          # ), # End fluidRow
                          # 
                          
                          

                          #######################################################################X
                          ##### Matrix row 2 ... n  -----
                          
                          ## Matrix rows by use of function
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 2
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 3
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 4
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 5
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 6
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 7
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 8
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 9
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 10
                          ),
                          
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 11
                          ),
                          
                          # Construct_UI_BuildingTypeMatrix (
                          #   i_Row_Matrix = 12
                          # ),
                           
                          # Construct_UI_BuildingTypeMatrix (
                          #   i_Row_Matrix = 13
                          # ),
                          #
                          # Construct_UI_BuildingTypeMatrix (
                          #   i_Row_Matrix = 14
                          # ),
                          # 
                          # Construct_UI_BuildingTypeMatrix (
                          #   i_Row_Matrix = 15
                          # ),
                          # 
                          # Construct_UI_BuildingTypeMatrix (
                          #   i_Row_Matrix = 16
                          # ),
                          # 
                          
                          
                          
                          # The last row is empty / used for resetting the selection 
                          Construct_UI_BuildingTypeMatrix (
                            i_Row_Matrix = 24
                          ),
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          br (),
                        ) # End column
                      ) # End fluidRow
                      
                    ), # End tabPanel typology
                    
                    
                    #######################################################################X
                    #### tabPanel "Gebäude" - Input building data -----
                    
                    tabPanel (
                      
                      strong ("Gebäude"), 
                      
                      #######################################################################X
                      #### § Energieprofil Gebäude  -----
                      
                      
                      fluidRow (
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Energieprofil Gebäude"),
                          style = "background-color: white; color: black; text-align: center;"
                          #style = "background-color: grey; color: white;"
                          #style = "background-color: orange",
                          
                        ), # End header column
                      
                        br (),
                        br (),
                        
                      ), # End fluidRow
                      
                      
                      fluidRow (
                        
                        style = Style_Height_Dashboard_MainPanel,  
                        
                        column (
                          12,
                      
                      
                      #br (),
                      
                      # 
                      # fluidRow (
                      #   column (4,
                      #           strong ("Eingaben Gebäude")
                      #   ), 
                      #   column (4,
                      #           textOutput("PixelHeight_MainPanel_New")
                      #           ),
                      #   column (4,
                      #     sliderInput (
                      #       inputId = "Slider_PixelHeight_MainPanel",
                      #       label = "",
                      #       # label = "Höhe Hauptpanel",
                      #       min = 300,
                      #       max = 2400,
                      #       value = PixelHeight_MainPanel,
                      #       step = 100)
                      #   )
                      #   
                      # ), # End fluidRow
                      
                      # PixelHeight_MainPanel <- as.numeric (
                      #   textOutput("PixelHeight_MainPanel_New")
                      # ),

                      

                      #######################################################################X
                      ##### > Grunddaten  -----
                      
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Grunddaten"),
                          style = "background-color: lightblue",
                          
                        ), # End header column

                        br (),
                        br (),
                        
                        column (
                          3,
                          
                          textInput(
                            inputId = "ID_Zone_LocationBuilding",
                            label = "Postleitzahl",
                            placeholder = "ID_Zone_LocationBuilding"
                          )
                          
                          
                        ), # End column
                        
                        column (
                          3,

                          
                          numericInput (
                            inputId = "Year_Building",
                            label = "Baujahr",
                            value = 2001,
                            min = 0,
                            max = 9999
                            #width = 50
                          ), # End numeric input
                          
                          
                          
                                
                        ), # End column

                        column (
                          3,

                          numericInput (
                            inputId = "n_Storey",
                            label = "Anzahl Vollgeschosse",
                            value = 1,
                            min = 1,
                            max = 100
                            #width = 50
                          ), # End numeric input
                          
                          numericInput (
                            inputId = "h_Ceiling",
                            label = "lichte Raumhöhe",
                            value = 1,
                            min = 1,
                            max = 100
                            # width = 75
                          ), # End numeric input
                          
                          
                          
                        ), # End column
                        
                        column (
                          3,
                          
                          numericInput (
                            inputId = "n_Dwelling",
                            label = "Anzahl Wohnungen",
                            value = 1,
                            min = 1,
                            max = 1000
                            #width = 50
                          ), # End numeric input
                          
                          numericInput (
                            inputId = "A_C_Floor_Intake",
                            label = "beheizte Wohnfläche",
                            value = 100,
                            min = 10,
                            max = 1000000
                            # width = 75
                          ), # End numeric input
                          
                          
                                
                                
                                
                        ), # End column
                        
                      ), # End fluidRow
                      
                      
                      
                      #######################################################################X
                      ##### > Gebäudeform  -----
                      
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Gebäudeform"),
                          style = "background-color: lightblue",
                          
                        ), # End header column
                        
                        br (),
                        br (),
                        
                        column (
                          3,
                          
                
                          radioButtons (
                            inputId = "Code_AttachedNeighbours",
                            label = "direkt angrenzende Nachbargebäude",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "keins (freistehend)",
                              "auf einer Seite",
                              "auf zwei Seiten",
                              "keine Angabe / unbekannt"
                            ),
                            choiceValues = c (
                              "N0",
                              "N1",
                              "N2",
                              "_NA_"
                            )
                          ), # End radioButtons    
                          
                          
                          

                        ), # End column

                        column (
                          3,
                          
                          radioButtons (
                            inputId = "Code_ComplexFootprint",
                            label = "Grundriss",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "kompakt",
                              "normal",
                              "komplex / langgestreckt",
                              "keine Angabe / unbekannt"
                            ),
                            choiceValues = c (
                              "Simple",
                              "Standard",
                              "Complex",
                              "_NA_"
                            )
                          ), # End radioButtons     
                          
                          
                          
                        ), # End column
                        
                        column (
                          3,
                          
                          radioButtons (
                            inputId = "Code_AtticCond",
                            label = "Dach",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "Flachdach oder flach geneigtes Dach",
                              "Dachgeschoss unbeheizt",
                              "Dachgeschoss teilweise beheizt",
                              "Dachgeschoss voll beheizt",
                              "keine Angabe / unbekannt"
                            ),
                            choiceValues = c (
                              "-",
                              "N",
                              "P",
                              "C",
                              "_NA_"
                            )
                          ), # End radioButtons      
                          
                          radioButtons (
                            inputId = "Code_ComplexRoof",
                            label = "Dachform",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "einfach",
                              "Gauben / komplex",
                              "unbekannt oder unauffällig"
                            ),
                            choiceValues = c (
                              "Simple",
                              "Complex",
                              "_NA_"
                            )
                          ), # End radioButtons                           
                          
                          
                        ), # End column
                        
                        column (
                          3,
                          
                          radioButtons (
                            inputId = "Code_CellarCond",
                            label = "Keller",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "nicht unterkellert",
                              "Kellergeschoss unbeheizt",
                              "Kellergeschoss teilweise beheizt",
                              "Kellergeschoss voll beheizt",
                              "keine Angabe / unbekannt"
                            ),
                            choiceValues = c (
                              "-",
                              "N",
                              "P",
                              "C",
                              "_NA_"
                            )
                          ), # End radioButtons                           
                          
                          
                          conditionalPanel (
                            condition = "
                            input.Code_CellarCond == 'N' | 
                            input.Code_CellarCond == 'P' | 
                            input.Code_CellarCond == '_NA_'  
                            ",
                            
                            checkboxInput (
                              inputId = "Indicator_Cellar_Insulated", 
                              label = "Keller liegt vollständig in der thermischen Hülle 
                                    (falls mehr Dämmung in der Ebene des Fußbodens zum Erdreich als in der der Kellerdecke liegt)",
                              #label = "Kellerboden und -wände gedämmt", 
                              value = FALSE, 
                              width = NULL
                            )
                            
                          ), # End conditional panel
                          
                          
                          
                          
                          
                          
                          
                        ), # End column
                        
                      ), # End fluidRow
                      

                      
                      
                      
                                                                  
                      
                      #######################################################################X
                      ##### > Dach  -----
                      
                      # 
                      # fluidRow (
                      # 
                      # ),  # End fluidRow heading roof


                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        
                        column (12,
                                strong ("Dach"),
                                
                                style = "background-color: lightblue",
                                #style = "border: 1px solid lightgrey"
                                
                                
                        ),
                        
                        
                        column (
                          2,
                          br (),
                          
                          
                          fluidRow (
                            column (
                              12,
                              strong ("Art der Konstruktion")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          checkboxInput (
                            inputId = "Indicator_Roof_Constr_Massive", 
                            label = "massiv", 
                            value = FALSE, 
                            width = NULL
                          ),
                          
                          checkboxInput (
                            inputId = "Indicator_Roof_Constr_Wood", 
                            label = "Holz", 
                            value = FALSE, 
                            width = NULL
                          ),
                          
                        ), # End column
                          
                          column (
                            4,
                            
                            br (),
                            
                            
                            fluidRow(
                              column (
                                12,
                                strong ("energetischer Zustand")
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),

                            
                            radioButtons(
                              inputId = "Code_InsulationType_Roof",
                              label = NULL,
                              # choices = c(
                              #     "keine Änderung",
                              #     "Original-Dämmung",
                              #     "Modernisierung",
                              #     "keine Angabe / unbekannt"
                              # ),                                ,
                              selected = NULL,
                              inline = FALSE,
                              width = NULL,
                              choiceNames = c (
                                "Original, keine Angaben zur Dämmung bei Errichtung",
                                "Original, Angaben zur Dämmung bei Errichtung",
                                "nachträgliche Dämmung / Modernisierung",
                                "keine Angabe / unbekannter Zustand"
                              ),
                              # choiceNames = c (
                              #   "seit Errichtung keine Änderung, keine Angaben zur Dämmung",
                              #   "keine Änderung, Angaben beziehen sich auf Original-Dämmung",
                              #   "Modernisierung / nachträgliche Dämmung",
                              #   "keine Angabe / unbekannter Zustand"
                              # ),
                              choiceValues = c(
                                "None",
                                "Original",
                                "Refurbish",
                                "_NA_"
                              )
                            ) # End radioButtons                           
                            
                        ), # End column 
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow (
                            column (
                              12,
                              strong ("Jahr der Modernisierung")  
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),

                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                (input.Checkbox_Year_Refurbishment_Roof_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Roof == 'Refurbish')",
                            
                            sliderInput (
                              inputId = "Year_Refurbishment_Roof_Slider",
                              label = NULL,
                              value = 1970,
                              min = 1970,
                              max = 2030,
                              step = 1,
                              sep = ""
                              #width = 500
                            ), # End slider input
                            
                          ), # End conditional panel
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                (input.Checkbox_Year_Refurbishment_Roof_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Roof == 'Refurbish')",
                            
                            numericInput (
                              inputId = "Year_Refurbishment_Roof",
                              label = NULL,
                              value = NA,
                              min = 1970,
                              max = 2030,
                              width = 75
                            ) # End numeric input
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof == 'Refurbish')",
                            
                            checkboxInput (
                              inputId = "Checkbox_Year_Refurbishment_Roof_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof != 'Refurbish')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          
                        ), # End column
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow(
                            column (
                              12,
                              strong ("Dämmstärke [cm]")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                         (input.Checkbox_d_Insulation_Roof_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Roof == 'Original') | 
                                         ( input.Code_InsulationType_Roof == 'Refurbish'))",
                            
                            sliderInput (
                              # numericInput (
                              inputId = "d_Insulation_Roof_Slider",
                              label = NULL,
                              #label = "Dämmstärke [cm]",
                              value = 0,
                              min = 1,
                              max = 40,
                              step = 1
                              #width = 500
                            ),
                            
                          ), # End conditional panel
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_d_Insulation_Roof_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Roof == 'Original') | 
                                         ( input.Code_InsulationType_Roof == 'Refurbish'))",
                            
                            # fluidRow (
                            #   
                            #   column (
                            #     8,
                                
                                numericInput (
                                  inputId = "d_Insulation_Roof",
                                  label = NULL,
                                  #label = "[cm]",
                                  value = NA,
                                  min = 1,
                                  max = 40,
                                  width = 75
                                ) # End numeric input
                                
                            #   ), # End column
                            #   
                            #   column (
                            #     4,
                            #     "cm"
                            #   ) # End column
                            #   
                            # ) # End fluid row
                            
                          ), # End conditional panel
                          
                        
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof == 'Refurbish') | 
                                         (input.Code_InsulationType_Roof == 'Original')",
                            
                            checkboxInput (
                              inputId = "Checkbox_d_Insulation_Roof_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof != 'Refurbish') & 
                                         (input.Code_InsulationType_Roof != 'Original')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          
                          
                          
                          
                          #style = "height:35px"
                        ), # End column
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow (
                            column (
                              12,
                              strong ("Anteil an der Bauteilfläche [%]")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          

                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric')  &
                                         (input.Checkbox_f_Insulation_Roof_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Roof == 'Original') | 
                                         ( input.Code_InsulationType_Roof == 'Refurbish'))",

                            sliderInput (
                              inputId = "f_Insulation_Roof_Slider",
                              label = NULL,
                              value = 0,
                              min = 10,
                              max = 100,
                              step = 10
                              #width = 200
                            ),

                          ), # End conditional panel

                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_f_Insulation_Roof_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Roof == 'Original') | 
                                         ( input.Code_InsulationType_Roof == 'Refurbish'))",

                            numericInput (
                              inputId = "f_Insulation_Roof",
                              label = NULL,
                              value = 0,
                              min = 10,
                              max = 100,
                              step = 10,
                              width = 75
                            ) # End numericInput

                          ), # End conditional panel

                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof == 'Refurbish') | 
                                         (input.Code_InsulationType_Roof == 'Original')",
                            
                            checkboxInput (
                              inputId = "Checkbox_f_Insulation_Roof_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbos input 
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Roof != 'Refurbish') & 
                                         (input.Code_InsulationType_Roof != 'Original')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          

                          
                          
                          #style = "height:35px"
                        ), # End column
                        
                        style = "border: 1px solid lightgrey"
                        #style = "border: 1px dotted lightgrey"
                        
                      ),  # End fluidRow input roof
                      

                    #  br (),


                      
                      
                      
                      #######################################################################X
                      ##### > oberste Geschossdecke  -----
                      
                      # 
                      # fluidRow (
                      # 
                      # ),  # End fluidRow heading roof
                      
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        column (12,
                                strong ("oberste Geschossdecke"),
                                
                                style = "background-color: lightblue",
                                #style = "border: 1px solid lightgrey"
                                
                                
                        ),
                        
                        conditionalPanel (
                          condition = "
                            (input.Code_AtticCond != '-') &
                            (input.Code_AtticCond != 'C') 
                          ",
                          
                          column (
                            2,
                            br (),
                            
                            
                            fluidRow (
                              column (
                                12,
                                strong ("Art der Konstruktion")
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),
                            
                            checkboxInput (
                              inputId = "Indicator_Ceiling_Constr_Massive", 
                              label = "massiv", 
                              value = FALSE, 
                              width = NULL
                            ),
                            
                            checkboxInput (
                              inputId = "Indicator_Ceiling_Constr_Wood", 
                              label = "Holz", 
                              value = FALSE, 
                              width = NULL
                            ),
                            
                          ), # End column
                          
                          column (
                            4,
                            
                            br (),
                            
                            
                            fluidRow(
                              column (
                                12,
                                strong ("energetischer Zustand")
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),
                            
                            
                            radioButtons(
                              inputId = "Code_InsulationType_Ceiling",
                              label = NULL,
                              # choices = c(
                              #     "keine Änderung",
                              #     "Original-Dämmung",
                              #     "Modernisierung",
                              #     "keine Angabe / unbekannt"
                              # ),                                ,
                              selected = NULL,
                              inline = FALSE,
                              width = NULL,
                              choiceNames = c (
                                "Original, keine Angaben zur Dämmung bei Errichtung",
                                "Original, Angaben zur Dämmung bei Errichtung",
                                "nachträgliche Dämmung / Modernisierung",
                                "keine Angabe / unbekannter Zustand"
                              ),
                              # choiceNames = c (
                              #   "seit Errichtung keine Änderung, keine Angaben zur Dämmung",
                              #   "keine Änderung, Angaben beziehen sich auf Original-Dämmung",
                              #   "Modernisierung / nachträgliche Dämmung",
                              #   "keine Angabe / unbekannter Zustand"
                              # ),
                              choiceValues = c(
                                "None",
                                "Original",
                                "Refurbish",
                                "_NA_"
                              )
                            ) # End radioButtons                           
                            
                          ), # End column 
                          
                          column (
                            2,
                            
                            br (),
                            
                            fluidRow (
                              column (
                                12,
                                strong ("Jahr der Modernisierung")  
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                (input.Checkbox_Year_Refurbishment_Ceiling_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Ceiling == 'Refurbish')",
                              
                              sliderInput (
                                inputId = "Year_Refurbishment_Ceiling_Slider",
                                label = NULL,
                                value = 1970,
                                min = 1970,
                                max = 2030,
                                step = 1,
                                sep = ""
                                #width = 500
                              ), # End slider input
                              
                            ), # End conditional panel
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                (input.Checkbox_Year_Refurbishment_Ceiling_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Ceiling == 'Refurbish')",
                              
                              numericInput (
                                inputId = "Year_Refurbishment_Ceiling",
                                label = NULL,
                                value = NA,
                                min = 1970,
                                max = 2030,
                                width = 75
                              ) # End numeric input
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling == 'Refurbish')",
                              
                              checkboxInput (
                                inputId = "Checkbox_Year_Refurbishment_Ceiling_InputNotAvailable",
                                label = "keine Angabe / unbekannt",
                                value = FALSE,
                                width = NULL
                              ), # End checkbox input 
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling != 'Refurbish')",
                              
                              "- entfällt -" 
                              
                            ), # End conditional panel
                            
                            
                          ), # End column
                          
                          column (
                            2,
                            
                            br (),
                            
                            fluidRow(
                              column (
                                12,
                                strong ("Dämmstärke [cm]")
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                         (input.Checkbox_d_Insulation_Ceiling_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Ceiling == 'Original') | 
                                         ( input.Code_InsulationType_Ceiling == 'Refurbish'))",
                              
                              sliderInput (
                                # numericInput (
                                inputId = "d_Insulation_Ceiling_Slider",
                                label = NULL,
                                #label = "Dämmstärke [cm]",
                                value = 0,
                                min = 1,
                                max = 40,
                                step = 1
                                #width = 500
                              ),
                              
                            ), # End conditional panel
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_d_Insulation_Ceiling_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Ceiling == 'Original') | 
                                         ( input.Code_InsulationType_Ceiling == 'Refurbish'))",
                              
                              # fluidRow (
                              #   
                              #   column (
                              #     8,
                              
                              numericInput (
                                inputId = "d_Insulation_Ceiling",
                                label = NULL,
                                #label = "[cm]",
                                value = NA,
                                min = 1,
                                max = 40,
                                width = 75
                              ) # End numeric input
                              
                              #   ), # End column
                              #   
                              #   column (
                              #     4,
                              #     "cm"
                              #   ) # End column
                              #   
                              # ) # End fluid row
                              
                            ), # End conditional panel
                            
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling == 'Refurbish') | 
                                         (input.Code_InsulationType_Ceiling == 'Original')",
                              
                              checkboxInput (
                                inputId = "Checkbox_d_Insulation_Ceiling_InputNotAvailable",
                                label = "keine Angabe / unbekannt",
                                value = FALSE,
                                width = NULL
                              ), # End checkbox input
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling != 'Refurbish') & 
                                         (input.Code_InsulationType_Ceiling != 'Original')",
                              
                              "- entfällt -" 
                              
                            ), # End conditional panel
                            
                            
                            
                            
                            
                            #style = "height:35px"
                          ), # End column
                          
                          column (
                            2,
                            
                            br (),
                            
                            fluidRow (
                              column (
                                12,
                                strong ("Anteil an der Bauteilfläche [%]")
                              ),
                              style = ColumnStyle_Label_2Lines 
                            ),
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Numeric')  &
                                         (input.Checkbox_f_Insulation_Ceiling_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Ceiling == 'Original') | 
                                         ( input.Code_InsulationType_Ceiling == 'Refurbish'))",
                              
                              sliderInput (
                                inputId = "f_Insulation_Ceiling_Slider",
                                label = NULL,
                                value = 0,
                                min = 10,
                                max = 100,
                                step = 10
                                #width = 200
                              ),
                              
                            ), # End conditional panel
                            
                            conditionalPanel (
                              condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_f_Insulation_Ceiling_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Ceiling == 'Original') | 
                                         ( input.Code_InsulationType_Ceiling == 'Refurbish'))",
                              
                              numericInput (
                                inputId = "f_Insulation_Ceiling",
                                label = NULL,
                                value = 0,
                                min = 10,
                                max = 100,
                                step = 10,
                                width = 75
                              ) # End numericInput
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling == 'Refurbish') | 
                                         (input.Code_InsulationType_Ceiling == 'Original')",
                              
                              checkboxInput (
                                inputId = "Checkbox_f_Insulation_Ceiling_InputNotAvailable",
                                label = "keine Angabe / unbekannt",
                                value = FALSE,
                                width = NULL
                              ), # End checkbos input 
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Code_InsulationType_Ceiling != 'Refurbish') & 
                                         (input.Code_InsulationType_Ceiling != 'Original')",
                              
                              "- entfällt -" 
                              
                            ), # End conditional panel
                            
                            
                            
                            
                            
                            #style = "height:35px"
                          ), # End column
                          
                          style = "border: 1px solid lightgrey"
                          #style = "border: 1px dotted lightgrey"
                          
                          
                          
                        ), # End conditional panel "Show input for top ceiling"
                        
                        
                        conditionalPanel (
                          condition = "
                            (input.Code_AtticCond == '-') |
                            (input.Code_AtticCond == 'C')
                          ",
                          column (
                            12,
                            br (),
                            "- keine Eingabe bei der gewählten Dach-Situation -",
                            br (),
                            br ()
                          )
                        ), # End conditional panel "Don't show input for top ceiling"
                        
                        
                        
                        
                        
                      ),  # End fluidRow input Ceiling
                      
                      
                      # br (),
                      # 
                      # br (),
                      
                      
                      
                                           
                      #######################################################################X
                      ##### > Außenwand  -----
                      
                      
                      

                      # fluidRow (
                      #   # strong ("Außenwand"),
                      #   
                      # ),  # End fluidRow heading wall
                      
                      fluidRow (

                        style = "background-color:white;",
                        
                        column (12,
                                strong ("Außenwand"),
                                style = "background-color: lightblue"
                                #style = "border: 1px solid lightgrey"
                        ),
                        # box (title = "Außenwand", 
                        #      solidHeader = TRUE,
                        #      width = 12),
                        
                                                
                        br (),
                        
                        column (
                          2,
                          
                          br (),
                          
                          column (12,
                            
                            # fluidRow (
                            #   column (
                            #     12,
                            strong ("Art der Konstruktion"),
                            #   ),
                            #   style = ColumnStyle_Label_2Lines 
                            # ),
                            
                            checkboxInput (
                              inputId = "Indicator_Wall_Constr_Massive", 
                              label = "massiv", 
                              value = FALSE, 
                              width = NULL
                            ),
                            
                            checkboxInput (
                              inputId = "Indicator_Wall_Constr_Wood", 
                              label = "Holz", 
                              value = FALSE, 
                              width = NULL
                            ),
                            
                          ) # End Column
                          
                          
                        ), # End column
                        
                        column (
                          4,
                          
                          br (),
                          
                          fluidRow(
                            column (
                              12,
                              strong ("energetischer Zustand")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          
                          radioButtons(
                            inputId = "Code_InsulationType_Wall",
                            label = NULL,
                            # choices = c(
                            #     "keine Änderung",
                            #     "Original-Dämmung",
                            #     "Modernisierung",
                            #     "keine Angabe / unbekannt"
                            # ),                                ,
                            selected = NULL,
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "Original, keine Angaben zur Dämmung bei Errichtung",
                              "Original, Angaben zur Dämmung bei Errichtung",
                              "nachträgliche Dämmung / Modernisierung",
                              "keine Angabe / unbekannter Zustand"
                            ),
                            # choiceNames = c (
                            #   "seit Errichtung keine Änderung, keine Angaben zur Dämmung",
                            #   "keine Änderung, Angaben beziehen sich auf Original-Dämmung",
                            #   "Modernisierung / nachträgliche Dämmung",
                            #   "keine Angabe / unbekannter Zustand"
                            # ),
                            choiceValues = c(
                              "None",
                              "Original",
                              "Refurbish",
                              "_NA_"
                            )
                          ) # End radioButtons                           
                          
                        ), # End column 
                        
                        column (
                          6,
                          fluidRow (
                            
                            column (
                              4,
                              
                              br (),
                              
                              fluidRow (
                                column (
                                  12,
                                  strong ("Jahr der Modernisierung")  
                                ),
                                style = ColumnStyle_Label_2Lines 
                              ),
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                (input.Checkbox_Year_Refurbishment_Wall_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Wall == 'Refurbish')",
                                
                                sliderInput (
                                  inputId = "Year_Refurbishment_Wall_Slider",
                                  label = NULL,
                                  value = 1970,
                                  min = 1970,
                                  max = 2030,
                                  step = 1,
                                  sep = ""
                                  #width = 500
                                ), # End slider input
                                
                              ), # End conditional panel
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                (input.Checkbox_Year_Refurbishment_Wall_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Wall == 'Refurbish')",
                                
                                numericInput (
                                  inputId = "Year_Refurbishment_Wall",
                                  label = NULL,
                                  value = NA,
                                  min = 1970,
                                  max = 2030,
                                  width = 75
                                ) # End numeric input
                                
                              ), # End conditional panel
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall == 'Refurbish')",
                                
                                checkboxInput (
                                  inputId = "Checkbox_Year_Refurbishment_Wall_InputNotAvailable",
                                  label = "keine Angabe / unbekannt",
                                  value = FALSE,
                                  width = NULL
                                ), # End checkbox input 
                                
                              ), # End conditional panel
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall != 'Refurbish')",
                                
                                "- entfällt -" 
                                
                              ), # End conditional panel
                              
                              
                            ), # End column
                            
                            column (
                              4,
                              
                              br (),
                              
                              fluidRow(
                                column (
                                  12,
                                  strong ("Dämmstärke [cm]")
                                ),
                                style = ColumnStyle_Label_2Lines 
                              ),
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                         (input.Checkbox_d_Insulation_Wall_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Wall == 'Original') | 
                                         ( input.Code_InsulationType_Wall == 'Refurbish'))",
                                
                                sliderInput (
                                  # numericInput (
                                  inputId = "d_Insulation_Wall_Slider",
                                  label = NULL,
                                  #label = "Dämmstärke [cm]",
                                  value = 0,
                                  min = 1,
                                  max = 40,
                                  step = 1
                                  #width = 500
                                ),
                                
                              ), # End conditional panel
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_d_Insulation_Wall_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Wall == 'Original') | 
                                         ( input.Code_InsulationType_Wall == 'Refurbish'))",
                                
                                # fluidRow (
                                #   
                                #   column (
                                #     8,
                                
                                numericInput (
                                  inputId = "d_Insulation_Wall",
                                  label = NULL,
                                  #label = "[cm]",
                                  value = NA,
                                  min = 1,
                                  max = 40,
                                  width = 75
                                ) # End numeric input
                                
                                #   ), # End column
                                #   
                                #   column (
                                #     4,
                                #     "cm"
                                #   ) # End column
                                #   
                                # ) # End fluid row
                                
                              ), # End conditional panel
                              
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall == 'Refurbish') | 
                                         (input.Code_InsulationType_Wall == 'Original')",
                                
                                checkboxInput (
                                  inputId = "Checkbox_d_Insulation_Wall_InputNotAvailable",
                                  label = "keine Angabe / unbekannt",
                                  value = FALSE,
                                  width = NULL
                                ), # End checkbox input
                                
                              ), # End conditional panel
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall != 'Refurbish') & 
                                         (input.Code_InsulationType_Wall != 'Original')",
                                
                                "- entfällt -" 
                                
                              ), # End conditional panel
                              
                              
                              
                              
                              
                              #style = "height:35px"
                            ), # End column
                            
                            
                            column (
                              4,
                              
                              br (),
                              
                              fluidRow (
                                column (
                                  12,
                                  strong ("Anteil an der Bauteilfläche [%]")
                                ),
                                style = ColumnStyle_Label_2Lines 
                              ),
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Numeric')  &
                                         (input.Checkbox_f_Insulation_Wall_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Wall == 'Original') | 
                                         ( input.Code_InsulationType_Wall == 'Refurbish'))",
                                
                                sliderInput (
                                  inputId = "f_Insulation_Wall_Slider",
                                  label = NULL,
                                  value = 0,
                                  min = 10,
                                  max = 100,
                                  step = 10
                                  #width = 200
                                ),
                                
                              ), # End conditional panel
                              
                              conditionalPanel (
                                condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_f_Insulation_Wall_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Wall == 'Original') | 
                                         ( input.Code_InsulationType_Wall == 'Refurbish'))",
                                
                                numericInput (
                                  inputId = "f_Insulation_Wall",
                                  label = NULL,
                                  value = 0,
                                  min = 10,
                                  max = 100,
                                  step = 10,
                                  width = 75
                                ) # End numericInput
                                
                              ), # End conditional panel
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall == 'Refurbish') | 
                                         (input.Code_InsulationType_Wall == 'Original')",
                                
                                checkboxInput (
                                  inputId = "Checkbox_f_Insulation_Wall_InputNotAvailable",
                                  label = "keine Angabe / unbekannt",
                                  value = FALSE,
                                  width = NULL
                                ), # End checkbos input 
                                
                              ), # End conditional panel
                              
                              
                              conditionalPanel (
                                condition = "(input.Code_InsulationType_Wall != 'Refurbish') & 
                                         (input.Code_InsulationType_Wall != 'Original')",
                                
                                "- entfällt -" 
                                
                              ), # End conditional panel
                              
                              
                              #style = "height:35px"
                            ), # End column
                            
                            
                          ), # End fluidRow
                          
                          fluidRow (
                            
                            conditionalPanel (
                              condition = "
                                ((input.Code_InsulationType_Wall == 'Refurbish') | 
                                 (input.Code_InsulationType_Wall == 'Original')) &
                                 (input.Checkbox_d_Insulation_Wall_InputNotAvailable == 0)
                                ",

                              column (
                                4
                              ),
                              
                              column (
                                8,
                                checkboxInput (
                                  inputId = "Indicator_InternalWallInsulation",
                                  label = "überwiegend Innendämmung",
                                  value = FALSE,
                                  width = NULL
                                )
                                
                              
                            ), # End conditionalPanel
                              
                            ),
                            
                            
                          ), # End fluidRow
                          
                          fluidRow (
                            
                            br (),
                            
                            column (
                              12,
                              strong ("Dämmung von außen möglich?"),
                              radioButtons (
                                inputId = "Code_Potential_ExternalWallInsulation",
                                label = NULL,
                                selected = NULL,
                                inline = TRUE,
                                width = NULL,
                                choiceNames = c (
                                  "ja",
                                  "teilweise",
                                  "nein",
                                  "unbekannt"
                                ),
                                choiceValues = c(
                                  "Possible",
                                  "PartlyPossible",
                                  "NotPossible",
                                  "_NA_"
                                )
                              ) # End radioButtons                           
                              
                            ),
                          ) # End fluidRow
                          
                        
                          
                          ), # End column
                        
                        # column (
                        #   2,
                        #   
                        #   br (),
                        #   
                        #   fluidRow (
                        #     column (
                        #       12,
                        #       strong ("Jahr der Modernisierung")  
                        #     ),
                        #     style = ColumnStyle_Label_2Lines 
                        #   ),
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                        #         (input.Checkbox_Year_Refurbishment_Wall_InputNotAvailable == 0) &
                        #         (input.Code_InsulationType_Wall == 'Refurbish')",
                        #     
                        #     sliderInput (
                        #       inputId = "Year_Refurbishment_Wall_Slider",
                        #       label = NULL,
                        #       value = 1970,
                        #       min = 1970,
                        #       max = 2030,
                        #       step = 1,
                        #       sep = ""
                        #       #width = 500
                        #     ), # End slider input
                        #     
                        #   ), # End conditional panel
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Slider') &
                        #         (input.Checkbox_Year_Refurbishment_Wall_InputNotAvailable == 0) &
                        #         (input.Code_InsulationType_Wall == 'Refurbish')",
                        #     
                        #     numericInput (
                        #       inputId = "Year_Refurbishment_Wall",
                        #       label = NULL,
                        #       value = NA,
                        #       min = 1970,
                        #       max = 2030,
                        #       width = 75
                        #     ) # End numeric input
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall == 'Refurbish')",
                        #     
                        #     checkboxInput (
                        #       inputId = "Checkbox_Year_Refurbishment_Wall_InputNotAvailable",
                        #       label = "keine Angabe / unbekannt",
                        #       value = FALSE,
                        #       width = NULL
                        #     ), # End checkbox input 
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall != 'Refurbish')",
                        #     
                        #     "- entfällt -" 
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        # ), # End column
                        # 
                        # column (
                        #   2,
                        #   
                        #   br (),
                        #   
                        #   fluidRow(
                        #     column (
                        #       12,
                        #       strong ("Dämmstärke [cm]")
                        #     ),
                        #     style = ColumnStyle_Label_2Lines 
                        #   ),
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                        #                  (input.Checkbox_d_Insulation_Wall_InputNotAvailable == 0) &
                        #                  ((input.Code_InsulationType_Wall == 'Original') | 
                        #                  ( input.Code_InsulationType_Wall == 'Refurbish'))",
                        #     
                        #     sliderInput (
                        #       # numericInput (
                        #       inputId = "d_Insulation_Wall_Slider",
                        #       label = NULL,
                        #       #label = "Dämmstärke [cm]",
                        #       value = 0,
                        #       min = 1,
                        #       max = 40,
                        #       step = 1
                        #       #width = 500
                        #     ),
                        #     
                        #   ), # End conditional panel
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Slider') &
                        #                  (input.Checkbox_d_Insulation_Wall_InputNotAvailable == 0) &
                        #                  ((input.Code_InsulationType_Wall == 'Original') | 
                        #                  ( input.Code_InsulationType_Wall == 'Refurbish'))",
                        #     
                        #     # fluidRow (
                        #     #   
                        #     #   column (
                        #     #     8,
                        #         
                        #         numericInput (
                        #           inputId = "d_Insulation_Wall",
                        #           label = NULL,
                        #           #label = "[cm]",
                        #           value = NA,
                        #           min = 1,
                        #           max = 40,
                        #           width = 75
                        #         ) # End numeric input
                        #         
                        #     #   ), # End column
                        #     #   
                        #     #   column (
                        #     #     4,
                        #     #     "cm"
                        #     #   ) # End column
                        #     #   
                        #     # ) # End fluid row
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall == 'Refurbish') | 
                        #                  (input.Code_InsulationType_Wall == 'Original')",
                        #     
                        #     checkboxInput (
                        #       inputId = "Checkbox_d_Insulation_Wall_InputNotAvailable",
                        #       label = "keine Angabe / unbekannt",
                        #       value = FALSE,
                        #       width = NULL
                        #     ), # End checkbox input
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall != 'Refurbish') & 
                        #                  (input.Code_InsulationType_Wall != 'Original')",
                        #     
                        #     "- entfällt -" 
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   
                        #   
                        #   
                        #   #style = "height:35px"
                        # ), # End column
                        # 
                        # 
                        # column (
                        #   2,
                        #   
                        #   br (),
                        #   
                        #   fluidRow (
                        #     column (
                        #       12,
                        #       strong ("Anteil an der Bauteilfläche [%]")
                        #     ),
                        #     style = ColumnStyle_Label_2Lines 
                        #   ),
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Numeric')  &
                        #                  (input.Checkbox_f_Insulation_Wall_InputNotAvailable == 0)  &
                        #                  ((input.Code_InsulationType_Wall == 'Original') | 
                        #                  ( input.Code_InsulationType_Wall == 'Refurbish'))",
                        #     
                        #     sliderInput (
                        #       inputId = "f_Insulation_Wall_Slider",
                        #       label = NULL,
                        #       value = 0,
                        #       min = 10,
                        #       max = 100,
                        #       step = 10
                        #       #width = 200
                        #     ),
                        #     
                        #   ), # End conditional panel
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_Type_NumericQueries != 'Slider') &
                        #                  (input.Checkbox_f_Insulation_Wall_InputNotAvailable == 0)  &
                        #                  ((input.Code_InsulationType_Wall == 'Original') | 
                        #                  ( input.Code_InsulationType_Wall == 'Refurbish'))",
                        #     
                        #     numericInput (
                        #       inputId = "f_Insulation_Wall",
                        #       label = NULL,
                        #       value = 0,
                        #       min = 10,
                        #       max = 100,
                        #       step = 10,
                        #       width = 75
                        #     ) # End numericInput
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall == 'Refurbish') | 
                        #                  (input.Code_InsulationType_Wall == 'Original')",
                        #     
                        #     checkboxInput (
                        #       inputId = "Checkbox_f_Insulation_Wall_InputNotAvailable",
                        #       label = "keine Angabe / unbekannt",
                        #       value = FALSE,
                        #       width = NULL
                        #     ), # End checkbos input 
                        #     
                        #   ), # End conditional panel
                        #   
                        #   
                        #   conditionalPanel (
                        #     condition = "(input.Code_InsulationType_Wall != 'Refurbish') & 
                        #                  (input.Code_InsulationType_Wall != 'Original')",
                        #     
                        #     "- entfällt -" 
                        #     
                        #   ), # End conditional panel
                        # 
                        #   
                        #   #style = "height:35px"
                        # ), # End column
                        
                        style = "border: 1px solid lightgrey"
                        #style = "border: 1px dotted lightgrey"
                        
                      ),  # End fluidRow input Wall
                      
                      

                      
                      # br (),
                      # 
                      # br (),
                      
                      
                      
                      
                      
                      #######################################################################X
                      ##### > Fußboden  -----
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        column (12,
                                strong ("Fußboden"),
                                style = "background-color: lightblue"
                                #style = "border: 1px solid lightgrey"
                        ),

                        br (),
                        
                        column (
                          2,
                          
                          br (),
                          
                          column (12,
                                  
                                  # fluidRow (
                                  #   column (
                                  #     12,
                                  strong ("Art der Konstruktion"),
                                  #   ),
                                  #   style = ColumnStyle_Label_2Lines 
                                  # ),
                                  
                                  checkboxInput (
                                    inputId = "Indicator_Floor_Constr_Massive", 
                                    label = "massiv", 
                                    value = FALSE, 
                                    width = NULL
                                  ),
                                  
                                  checkboxInput (
                                    inputId = "Indicator_Floor_Constr_Wood", 
                                    label = "Holz", 
                                    value = FALSE, 
                                    width = NULL
                                  ),
                                  
                          ) # End Column
                          
                          
                        ), # End column
                        
                        column (
                          4,
                          
                          br (),
                          
                          fluidRow(
                            column (
                              12,
                              strong ("energetischer Zustand")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          
                          radioButtons(
                            inputId = "Code_InsulationType_Floor",
                            label = NULL,
                            # choices = c(
                            #     "keine Änderung",
                            #     "Original-Dämmung",
                            #     "Modernisierung",
                            #     "keine Angabe / unbekannt"
                            # ),                                ,
                            selected = NULL,
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "Original, keine Angaben zur Dämmung bei Errichtung",
                              "Original, Angaben zur Dämmung bei Errichtung",
                              "nachträgliche Dämmung / Modernisierung",
                              "keine Angabe / unbekannter Zustand"
                            ),
                            choiceValues = c(
                              "None",
                              "Original",
                              "Refurbish",
                              "_NA_"
                            )
                          ) # End radioButtons                           
                          
                        ), # End column 
                        
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow (
                            column (
                              12,
                              strong ("Jahr der Modernisierung")  
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                (input.Checkbox_Year_Refurbishment_Floor_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Floor == 'Refurbish')",
                            
                            sliderInput (
                              inputId = "Year_Refurbishment_Floor_Slider",
                              label = NULL,
                              value = 1970,
                              min = 1970,
                              max = 2030,
                              step = 1,
                              sep = ""
                              #width = 500
                            ), # End slider input
                            
                          ), # End conditional panel
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                (input.Checkbox_Year_Refurbishment_Floor_InputNotAvailable == 0) &
                                (input.Code_InsulationType_Floor == 'Refurbish')",
                            
                            numericInput (
                              inputId = "Year_Refurbishment_Floor",
                              label = NULL,
                              value = NA,
                              min = 1970,
                              max = 2030,
                              width = 75
                            ) # End numeric input
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor == 'Refurbish')",
                            
                            checkboxInput (
                              inputId = "Checkbox_Year_Refurbishment_Floor_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor != 'Refurbish')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          
                        ), # End column
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow(
                            column (
                              12,
                              strong ("Dämmstärke [cm]")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric') &
                                         (input.Checkbox_d_Insulation_Floor_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Floor == 'Original') | 
                                         ( input.Code_InsulationType_Floor == 'Refurbish'))",
                            
                            sliderInput (
                              # numericInput (
                              inputId = "d_Insulation_Floor_Slider",
                              label = NULL,
                              #label = "Dämmstärke [cm]",
                              value = 0,
                              min = 1,
                              max = 40,
                              step = 1
                              #width = 500
                            ),
                            
                          ), # End conditional panel
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_d_Insulation_Floor_InputNotAvailable == 0) &
                                         ((input.Code_InsulationType_Floor == 'Original') | 
                                         ( input.Code_InsulationType_Floor == 'Refurbish'))",
                            
                            # fluidRow (
                            #   
                            #   column (
                            #     8,
                                
                                numericInput (
                                  inputId = "d_Insulation_Floor",
                                  label = NULL,
                                  #label = "[cm]",
                                  value = NA,
                                  min = 1,
                                  max = 40,
                                  width = 75
                                ) # End numeric input
                                
                            #   ), # End column
                            #   
                            #   column (
                            #     4,
                            #     "cm"
                            #   ) # End column
                            #   
                            # ) # End fluid row
                            
                          ), # End conditional panel
                          
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor == 'Refurbish') | 
                                         (input.Code_InsulationType_Floor == 'Original')",
                            
                            checkboxInput (
                              inputId = "Checkbox_d_Insulation_Floor_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor != 'Refurbish') & 
                                         (input.Code_InsulationType_Floor != 'Original')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          
                          
                          
                          
                          #style = "height:35px"
                        ), # End column
                        
                        
                        column (
                          2,
                          
                          br (),
                          
                          fluidRow (
                            column (
                              12,
                              strong ("Anteil an der Bauteilfläche [%]")
                            ),
                            style = ColumnStyle_Label_2Lines 
                          ),
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Numeric')  &
                                         (input.Checkbox_f_Insulation_Floor_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Floor == 'Original') | 
                                         ( input.Code_InsulationType_Floor == 'Refurbish'))",
                            
                            sliderInput (
                              inputId = "f_Insulation_Floor_Slider",
                              label = NULL,
                              value = 0,
                              min = 10,
                              max = 100,
                              step = 10
                              #width = 200
                            ),
                            
                          ), # End conditional panel
                          
                          conditionalPanel (
                            condition = "(input.Code_Type_NumericQueries != 'Slider') &
                                         (input.Checkbox_f_Insulation_Floor_InputNotAvailable == 0)  &
                                         ((input.Code_InsulationType_Floor == 'Original') | 
                                         ( input.Code_InsulationType_Floor == 'Refurbish'))",
                            
                            numericInput (
                              inputId = "f_Insulation_Floor",
                              label = NULL,
                              value = 0,
                              min = 10,
                              max = 100,
                              step = 10,
                              width = 75
                            ) # End numericInput
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor == 'Refurbish') | 
                                         (input.Code_InsulationType_Floor == 'Original')",
                            
                            checkboxInput (
                              inputId = "Checkbox_f_Insulation_Floor_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                          ), # End conditional panel
                          
                          
                          conditionalPanel (
                            condition = "(input.Code_InsulationType_Floor != 'Refurbish') & 
                                         (input.Code_InsulationType_Floor != 'Original')",
                            
                            "- entfällt -" 
                            
                          ), # End conditional panel
                          
                          
                          #style = "height:35px"
                        ), # End column
                        
                        style = "border: 1px solid lightgrey"
                        #style = "border: 1px dotted lightgrey"
                        
                      ),  # End fluidRow input Floor
                      
                      
                      
                      
                      # br (),
                      # 
                      # br (),
                      
                      
                      
                      #######################################################################X
                      ##### > Fenster  -----

                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        
                        column (12,
                                strong ("Fenster"),
                                style = "background-color: lightblue"
                                #style = "border: 1px solid lightgrey"
                        ),
                        
                      ),
                      

                    

                      
                      ### Main window type 
                   
                      fluidRow (

                        style = "background-color:white;",
                        
                        br (),

                        
                        column (
                          3,
                          strong ("Überwiegender Fenstertyp"),
                          
                          br (),
                          br (),
                          br (),
                          br (),
                          br (),
                          br (),
                          br (),
                          br (),
                          br (),
                          
                          checkboxInput (
                            inputId = "Show_WindowType2",
                            label = "Eingabe weiterer Fenstertyp",
                            value = FALSE
                          )

                                                    
                          
                        ), # End column
                        
                        
                        column (
                          3,
                          
                          strong ("Jahr des Fenstereinbaus (ca.)"),
                          numericInput (
                            inputId = "Year_Installation_WindowType1",
                            label = NULL, # "Jahr des Fenstereinbaus (ca.)",
                            value = NA,
                            min = 0,
                            max = 9999,
                            width = 100
                          ), # End numeric input
                          
                          
                          
                        ), # End column
                        
                        column (
                          3,
                          
                          radioButtons (
                            inputId = "Code_NumberPanes_WindowType1",
                            label = "Verglasung",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "1 Scheibe",
                              "2 Scheiben",
                              "3 Scheiben",
                              "keine Angaben / unbekannt"
                            ),
                            choiceValues = c (
                              "1p",
                              "2p",
                              "3p",
                              "_NA_"
                            )
                          ), # End radioButtons    
                          
                          br (),
                          
                          checkboxInput (
                            inputId = "Indicator_LowE_WindowType1",
                            label = "Wärmeschutz-Verglasung",
                            value = FALSE,
                            width = NULL
                          ), # End checkbox input 
                          
                          
                          
                        ), # End column
                        
                        column (
                          3,
                          
                          radioButtons (
                            inputId = "Code_Frame_WindowType1",
                            label = "Rahmen",
                            selected = "_NA_",
                            inline = FALSE,
                            width = NULL,
                            choiceNames = c (
                              "Holz",
                              "Kunststoff",
                              "Alu- oder Stahl",
                              "andere",
                              "unbekannt"
                            ),
                            choiceValues = c (
                              "Wood",
                              "Plastic",
                              "Metal",
                              "-",
                              "_NA_"
                            )
                          ), # End radioButtons    
                          
                          checkboxInput (
                            inputId = "Indicator_PassiveHouseWindow_WindowType1",
                            label = "Passivhaus-Fenster (3-Scheiben + gedämmter Rahmen)",
                            value = FALSE,
                            width = NULL
                          ), # End checkbox input 
                          
                        ), # End column
                        
                        
                        
                        
                      ), # End fluidRow
                      
                      

                      ### Further window type 

                      conditionalPanel (
                        condition = "input.Show_WindowType2",
                        
                        div (".", style = "line-height:0.2;"),
                        
                        fluidRow (
                          
                          style = "background-color:white;",
                          
                          br (),
                          
                          column (
                            3,

                            strong ("Weiterer Fenstertyp"),
                            
                            br (),
                            br (),
                            
                            "Anteil an der Fensterfläche [%]",
                            
                            conditionalPanel (
                              condition = "(input.Checkbox_f_Area_WindowType2_InputNotAvailable == 0) &
                                           (input.Code_Type_NumericQueries != 'Numeric')",
                              
                              sliderInput (
                                inputId = "f_Area_WindowType2_Slider",
                                label = NULL,
                                value = 0,
                                min = 0,
                                max = 100,
                                step = 10
                                #width = 50
                              ), # End numeric input
                              
                            ), # End conditional panel
                            
                            
                            conditionalPanel (
                              condition = "(input.Checkbox_f_Area_WindowType2_InputNotAvailable == 0) &
                                           (input.Code_Type_NumericQueries != 'Slider')",


                              numericInput (
                                inputId = "f_Area_WindowType2",
                                label = NULL,
                                value = 0,
                                min = 0,
                                max = 100,
                                step = 10,
                                width = 100
                              ) # End numeric input
                              
                              
                              # splitLayout (
                              # 
                              #   cellWidths = NULL,
                              # 
                              #   numericInput (
                              #     inputId = "f_Area_WindowType2",
                              #     label = NULL,
                              #     value = 0,
                              #     min = 0,
                              #     max = 100,
                              #     step = 10,
                              #     width = NULL
                              #   ), # End numeric input
                              # 
                              #   "%"
                              # 
                              # )

                              # p (
                              #   
                              #   numericInput (
                              #     inputId = "f_Area_WindowType2",
                              #     label = NULL,
                              #     value = 0,
                              #     min = 0,
                              #     max = 100,
                              #     step = 10,
                              #     width = 50
                              #   ), # End numeric input
                              #  
                              #   "%"
                              # )
                              
                        
                              # tagList (
                              #   tags$p (
                              #     
                              #     numericInput (
                              #       inputId = "f_Area_WindowType2",
                              #       label = NULL,
                              #       value = 0,
                              #       min = 0,
                              #       max = 100,
                              #       step = 10,
                              #       width = 80
                              #     ) # End numeric input
                              #     
                              #   ),
                              #   
                              #   tags$p (
                              #     "%"
                              #   )
                              # ) # End tagList
                              

                                                            
                              # column (
                              #   8,
                              #   numericInput (
                              #     inputId = "f_Area_WindowType2",
                              #     label = NULL,
                              #     value = 0,
                              #     min = 0,
                              #     max = 100,
                              #     step = 10,
                              #     width = 120
                              #   ), # End numeric input
                              #   
                              # ),
                              # 
                              # column (
                              #   4,
                              #   "%"
                              # )
                              
                              
                            ), # End conditional panel
                            
                            
                            checkboxInput (
                              inputId = "Checkbox_f_Area_WindowType2_InputNotAvailable",
                              label = "keine Angabe / unbekannt",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                          ), # End column
                          
                          
                          column (
                            3,
                            
                            strong ("Jahr des Fenstereinbaus (ca.)"),
                            numericInput (
                              inputId = "Year_Installation_WindowType2",
                              label = NULL, #"Jahr des Fenstereinbaus (ca.)",
                              value = NA,
                              min = 0,
                              max = 9999,
                              width = 100
                            ), # End numeric input
                            
                            
                            
                          ), # End column
                          
                          column (
                            3,
                            
                            radioButtons (
                              inputId = "Code_NumberPanes_WindowType2",
                              label = "Verglasung",
                              selected = "_NA_",
                              inline = FALSE,
                              width = NULL,
                              choiceNames = c (
                                "1 Scheibe",
                                "2 Scheiben",
                                "3 Scheiben",
                                "keine Angaben / unbekannt"
                              ),
                              choiceValues = c (
                                "1p",
                                "2p",
                                "3p",
                                "_NA_"
                              )
                            ), # End radioButtons    
                          
                            br (),
                            
                            checkboxInput (
                              inputId = "Indicator_LowE_WindowType2",
                              label = "Wärmeschutz-Verglasung",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                            
                            
                          ), # End column
                          
                          column (
                            3,
                            
                            radioButtons (
                              inputId = "Code_Frame_WindowType2",
                              label = "Rahmen",
                              selected = "_NA_",
                              inline = FALSE,
                              width = NULL,
                              choiceNames = c (
                                "Holz",
                                "Kunststoff",
                                "Alu- oder Stahl",
                                "andere",
                                "unbekannt"
                              ),
                              choiceValues = c (
                                "Wood",
                                "Plastic",
                                "Metal",
                                "-",
                                "_NA_"
                              )
                            ), # End radioButtons    
                            
                            checkboxInput (
                              inputId = "Indicator_PassiveHouseWindow_WindowType2",
                              label = "Passivhaus-Fenster (3-Scheiben + gedämmter Rahmen)",
                              value = FALSE,
                              width = NULL
                            ), # End checkbox input 
                            
                          ), # End column
                          
                          
                          
                          
                        ), # End fluidRow
                        
                        
                      ), # End conditionalPanel
                      
                      
                      
                      
                      br (),
                      
                      
                      
                      #######################################################################X
                      #### § Experten-Bereich Gebäude  -----
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Gebäudehülle - zusätzliche Eingaben durch Experten"),
                          style = "background-color: grey; color: white;"
                          #style = "background-color: orange",
                          
                        ), # End header column
                        
                        br (),
                        br (),
                        
                      ), # End fluidRow
                      
                      
                      #######################################################################X
                      ##### > Wärmebrücken  -----
                      
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        ## Header thermal bridging
                        
                          column (
                            11,
                            strong ("Wärmebrücken"),
                            style = "background-color: lightblue",
                          ), # End column

                          column (
                            1,
                            checkboxInput(
                              inputId = "Show_Categories_ThermalBridging",
                              label = "≡",   #"Ξ",   #"Θ",
                              value = FALSE
                            ),
                            style = "background-color: lightblue; text-align: center; height: 35px"
                          ), # End column
                          
                          
                          
                          conditionalPanel (
                            condition = "input.Show_Categories_ThermalBridging",
                          
                            br (),
                            br (),
                            
                            column (
                              3,
                              
                              radioButtons (
                                inputId = "Code_ThermalBridging",
                                label = "Wirkung von Wärmebrücken",
                                selected = "_NA_",
                                inline = FALSE,
                                width = NULL,
                                choiceNames = c (
                                  "minimal",
                                  "sehr gering",
                                  "gering",
                                  "mittel",
                                  "hoch",
                                  "keine Angabe / unbekannt"
                                ),
                                choiceValues = c (
                                  "Minimal",
                                  "VeryLow",
                                  "Low",
                                  "Medium",
                                  "High",
                                  "_NA_"
                                )
                              ), # End radioButtons    
                              
                              # checkboxInput(
                              #   inputId = "Show_Explanation_ThermalBridging",
                              #   label = "Erläuterung",
                              #   value = FALSE
                              # ),
                              
                              
                            ), # End column
                            
                            
                            
                            
                            ## Column with explanations
                            
                            column (
                              8,
                              
                              # checkboxInput(
                              #   inputId = "Show_Explanation_ThermalBridging",
                              #   label = "Erläuterung",
                              #   value = FALSE
                              # ),
                              
                              
                              conditionalPanel (
                                condition = "input.Show_Explanation_ThermalBridging",
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    strong ("Kategorie")
                                  ), # End column
                                  
                                  column (
                                    7,
                                    strong ("Erläuterung")
                                  ), # End column
                                  
                                  column (
                                    3,
                                    strong ("Anhaltspunkt für Einordnung *")
                                  ), # End column
                                  
                                ), # End fluidRow
                                
                                
                                br (),
                                
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "minimal"
                                    
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "keine Durchdringungen der Hüllfläche mit Elementen deutlich höherer Wärmeleitfähigkeit; z.B.: 
                                 (1) unsanierte Altbauten ohne Stahl- oder Beton-Elemente; 
                                 (2) Best-Practice-Neubauten mit minimierten Wärmebrücken"
                                  ), # End column
                                  
                                  column (
                                    3,
                                    "≤ 0,01"
                                  )                            
                                  
                                  
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "sehr gering"
                                    
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "keine relevanten Durchdringungen der Hüllfläche mit Elementen deutlich höherer Wärmeleitfähigkeit; z.B.: 
                               (1) unsanierte Altbauten mit nur wenig Stahl- oder Beton-Elementen; 
                               (2) Best-Practice-Modernisierungen mit minimierten Wärmebrücken"
                                  ), # End column
                                  
                                  column (
                                    3,
                                    "> 0,01 & ≤ 0,03"
                                  )                           
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "gering"
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "nur geringfügige Durchdringungen von Dämmschichten"
                                  ), # End column
                                  
                                  column (
                                    3,
                                    "> 0,03 & ≤ 0,07"
                                  ), # End column
                                  
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "mittel"
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "relevante konstruktive Wärmebrücken; z.B. Innendämmung in Gebäuden mit Holzbalkendecken"
                                  ), # End column
                                  
                                  column (
                                    3,
                                    "> 0,07 & ≤ 0,12"
                                  ), # End column
                                  
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "hoch"
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "sehr relevante konstruktive Wärmebrücken; z.B. Beton durchdringt Dämmebene"
                                  ), # End column
                                  
                                  column (
                                    3,
                                    "> 0,12"
                                  ), # End column
                                  
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  column (
                                    2,
                                    "keine Angaben / unbekannt"
                                  ), # End column
                                  
                                  column (
                                    7,
                                    "Es wird eine für Baualter und Modernisierungsmaßnahmen typische Kategorie gewählt"
                                  ), # End column
                                  
                                  column (
                                    3,
                                  ), # End column
                                  
                                ), # End fluid row 
                                
                                br (),
                                
                                
                                fluidRow (
                                  
                                  # column (
                                  #   2,
                                  # ), # End column
                                  # 
                                  # column (
                                  #   7,
                                  # ), # End column
                                  
                                  column (
                                    12,
                                    "*) zusätzliche Transmissionswärmeverluste in W/(m²K), 
                                    bezogen auf gesamte Hüllfläche, sofern bekannt"
                                  ), # End column
                                  
                                ), # End fluid row 
                                
                                
                              ), # end conditionalPanel
                              
                            ), # End Column with explanations
                            
                            
                            ## Right sidebar with checkbox for explanation
                            
                            column (
                              1,
                              checkboxInput(
                                inputId = "Show_Explanation_ThermalBridging",
                                label = "🛈",
                                value = FALSE
                              ),
                              style = "background-color: lightblue; text-align: center; height: 35px",
                              
                            ), # End column


                          ), # End conditionalPanel show thermal bridging input

                        
                      ), # End fluidRow
                      
                      
                      br (),
                      
                      
                      #######################################################################X
                      ##### > Undichtigkeiten  -----
                      
                      
                      fluidRow (
                        
                        style = "background-color:white;",
                        
                        # Header 
                        column ( 
                          11,
                          strong ("Dichtheit der Gebäudehülle"),
                          style = "background-color: lightblue",
                          
                        ), # End header column
                        
                        
                        column (
                          1,
                          checkboxInput(
                            inputId = "Show_Categories_AirTightness",
                            label = "≡",   #"Ξ",   #"Θ",
                            value = FALSE
                          ),
                          style = "background-color: lightblue; text-align: center; height: 35px"
                        ), # End column
                        
                        
                        
                        conditionalPanel (
                          condition = "input.Show_Categories_AirTightness",
                          
                          br (),
                          br (),
                          
                          column (
                            3,
                            
                            radioButtons (
                              inputId = "Code_Infiltration",
                              label = "Wirkung von Undichtigkeiten",
                              selected = "_NA_",
                              inline = FALSE,
                              width = NULL,
                              choiceNames = c (
                                "minimal",
                                "gering",
                                "mittel",
                                "hoch",
                                "k.A."
                              ),
                              choiceValues = c (
                                "Minimal",
                                "Low",
                                "Medium",
                                "High",
                                "_NA_"
                              )
                            ), # End radioButtons    
                            
                            
                          ), # End column
                          
                          
                          
                          ## Column with explanations 
                          
                          
                          
                          column (
                            8,

                            conditionalPanel (
                              condition = "input.Show_Explanation_AirTightness",
                              
                              
                              fluidRow (
                                
                                column (
                                  2,
                                  strong ("Kategorie")
                                ), # End column
                                
                                column (
                                  7,
                                  strong ("Erläuterung")
                                ), # End column
                                
                                column (
                                  3,
                                  strong ("Anhaltspunkt für Einordnung *")
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              

                              fluidRow (
                                
                                column (
                                  2,
                                  "minimal"
                                ), # End column
                                
                                column (
                                  7,
                                  "sehr luftdicht; z.B. Massivbauten mit massiven Decken 
                                  und sehr dichten Fenstern / Holzbauten mit Dichtheitskonzept 
                                  und messtechnischer Überprüfung (Blower-Door-Messung)"
                                ), # End column
                                
                                column (
                                  3,
                                  "≤ 0,6 [1/h]"
                                ), # End column
                                
                              ), # End fluidRow

                              br (),
                              
                              
                              fluidRow (
                                
                                column (
                                  2,
                                  "gering"
                                ), # End column
                                
                                column (
                                  7,
                                  "luftdicht; z.B. Massivbauten mit massiven Decken 
                                  und dichten Fenstern / Holzbauten mit Dichtheitskonzept 
                                  und messtechnischer Überprüfung (Blower-Door-Messung)"
                                ), # End column
                                
                                column (
                                  3,
                                  "> 0,6 &  ≤ 1,0 [1/h]"
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              
                              fluidRow (
                                
                                column (
                                  2,
                                  "mittel"
                                ), # End column
                                
                                column (
                                  7,
                                  "Massivbauten ohne besondere Maßnahmen bzw. Bestand"
                                ), # End column
                                
                                column (
                                  3,
                                  "> 1,0 &  ≤ 3,0 [1/h]"
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              
                              fluidRow (
                                
                                column (
                                  2,
                                  "hoch"
                                ), # End column
                                
                                column (
                                  7,
                                  "offensichtliche Undichtigkeiten (z.B. bei Fenstern ohne funktionstüchtige Lippendichtungen, 
                                  bei beheizten Dachgeschossen mit Dachflächen ohne luftdichte Ebene)"
                                ), # End column
                                
                                column (
                                  3,
                                  "> 3,0 [1/h]"
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              
                              fluidRow (
                                
                                column (
                                  2,
                                  "keine Angabe / unbekannt"
                                ), # End column
                                
                                column (
                                  7,
                                  "Es wird eine für Baualter und Modernisierungsmaßnahmen typische Kategorie gewählt" 
                                ), # End column
                                
                                column (
                                  3,
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              
                              fluidRow (
                                
                                column (
                                  12,
                                  "*) Ergebnis eines Luftdichtheitstest, sofern durchgeführt:
                                  stündlicher Luftwechsel bei 50 Pa Druckdifferenz"
                                ), # End column
                                
                                column (
                                  7,
                                ), # End column
                                
                                column (
                                  3,
                                ), # End column
                                
                              ), # End fluidRow
                              
                              br (),
                              
                              
                              
                              
                              
                              
                            ),
                            
                            
                            
                            
                            
                            # fluidRow (
                            #   
                            #   column (
                            #     2
                            #   ), # End column
                            #   
                            #   
                            # ), # End fluidRow
                            
                            
                          ), # End column with explanations 
                          
                          
                          ## Right sidebar with checkbox for explanation
                          
                          column (
                            1,
                            checkboxInput(
                              inputId = "Show_Explanation_AirTightness",
                              label = "🛈",
                              value = FALSE
                            ),
                            style = "background-color: lightblue; text-align: center; height: 35px",
                            
                          ), # End column
                          
                          
                          
                          
                        ), # end conditionalPanel show categories air tightness 
                        
                        
                        br (),
                        br (),
                        
                        
                        
                        
                      ),
                      
                      
                      
                      
                      
                      
                      
                      # DAS GEHT !!!!!
                        # style = Style_Height_Dashboard_MainPanel
                        #"height:75vh !important; overflow-y: scroll",
                      
                      #style = "height:100vh !important; overflow-y: scroll",
                        # paste0 (
                        #   "height:", 
                        #   #textOutput("PixelHeight_MainPanel_New"), geht nicht
                        #   PixelHeight_MainPanel,
                        #   "px; overflow-y: scroll"
                        # ),
                      #style = "height: 600px; overflow-y: scroll"
                      #style = "height: 1200px; overflow-y: scroll; overflow-x: scroll;",
                      #style = "overflow-y: scroll"
                      
                    
                      
                      ) # End column    
                    ), # End fluidRow  
                      
                        
                      
                    ), # End tabPanel
                    
  
                    #######################################################################X
                    #### tabPanel "Wärmeversorgung" - Input building data -----
                    
                    tabPanel (
                      
                      strong ("Wärmeversorgung"), 
                      
                      #######################################################################X
                      #### § Energieprofil Wärmeversorgung  -----
                      
                      
                      fluidRow (
                        
                        #br (),
                        
                        # Header 
                        column ( 
                          12,
                          strong ("Energieprofil Wärmeversorgung"),
                          style = "background-color: white; color: black; text-align: center;"
                          #style = "background-color: grey; color: white;",
                          #style = "background-color: orange",
                          
                        ), # End header column
                        
                        br (),
                        br (),
                        
                      ), # End fluidRow
                      
                      
                      
                      
                      fluidRow (

                        style = Style_Height_Dashboard_MainPanel,  
                        
                        # style = "background-color: 'lightgrey'",
                        # #style = "background-color: rgb(240, 240, 240)"
                        
                        #br (),

                        
                        #######################################################################X
                        ##### § Centralisation of heat generation  -----
                        
                        
                        
                        box (
                          
                          status = "info",
                          solidHeader = TRUE, 
                          width = 12,
                          background = NULL,
                          

                          # fluidRow (
                          #   
                          #   box (
                          #     title =  strong ("Zentralisierungsgrad"),
                          #     status = "primary",
                          #     solidHeader = TRUE, 
                          #     width = 12,
                          #     height = 40,
                          #     collapsible = FALSE, 
                          #     collapsed = FALSE
                          #   ), # End box
                          # 
                          # ), # End fluid row 

                          fluidRow (
                            
                            # style = "
                            #   #margin-top: -20px; 
                            #   #margin-left: 8px; 
                            #   margin-bottom: -20px; 
                            #   padding:0 !important;
                            # ",
                            
                            
                            box (
                              
                              div (
                                strong ("Zentralisierungsgrad"),
                                style = "margin-top: -8px; margin-left: 0px;"
                                      ),
                              
                              title =  NULL,
                              footer = NULL,
                              status = NULL,
                              solidHeader = TRUE, 
                              background = "light-blue", 
                              width = 12,
                              height = 24,
                              collapsible = FALSE, 
                              collapsed = FALSE,
                              
                            ), # End box
                            
                          ), # End fluid row 
                          
                          
                          # fluidRow (
                          #   
                          #   box (
                          #     
                          #     #strong ("Zentralisierungsgrad"),
                          #     
                          #     title =  strong ("Zentralisierungsgrad", style = "font-size:14px; line-height:0.5"),
                          #     footer = NULL,
                          #     status = NULL,
                          #     solidHeader = TRUE, 
                          #     background = "light-blue", 
                          #     width = 12,
                          #     height = 35,
                          #     collapsible = FALSE, 
                          #     collapsed = FALSE,
                          #     
                          # 
                          #                                   
                          #   ), # End box
                          #   
                          # ), # End fluid row 
                          

                          fluidRow (
                            
                            style = "
                              margin-top: -50px; 
                              margin-left: 8px; 
                              margin-bottom: -15px; 
                              padding:0 !important;
                            ",
                            
                            # box (
                            #   
                            #   status = "primary",
                            #   footer = NULL, 
                            #   solidHeader = FALSE, 
                            #   background = NULL, 
                            #   width = 12, 
                            #   height = 50,
                            #   collapsible = FALSE, 
                            #   collapsed = FALSE,
                              
                              radioButtons (
                                inputId = "Code_CentralisationType_SysHG",
                                label = "Standort Wärmeerzeugung überwiegend", 
                                choiceNames = c (
                                  "Quartier/Stadt",
                                  "Block",
                                  "Gebäude",
                                  "Wohnung",
                                  "Raum",
                                  "k.A."
                                ),
                                choiceValues =  c (
                                  "District",
                                  "Block",
                                  "Building",
                                  "Dwelling",
                                  "Room",
                                  "_NA_"
                                ),
                                selected = "_NA_",
                                width = NULL,
                                inline = TRUE
                              ) # End radioButtons
                              
                            # ), # End box
                            
                          ), # End fluidRow
                          
                        ), # End box 
                        
                        
                        
                        
                        #######################################################################X
                        ##### § Central heating heat generators "Wärmeerzeugung Zentralheizung"  -----
                        
                        
                        
                        
                                                
                        box (
                          
                          ## 
                          
                          status = "info",
                          solidHeader = TRUE, 
                          width = 12,
                          background = NULL,
                          
                          #style = "padding: 0 !important;",
                          
                          fluidRow (
                            
                            
                            box (
                              
                              div (
                                strong ("Wärmeerzeugung Zentralheizung - Gebäude oder Wohnung"),
                                style = "margin-top: -8px; margin-left: 0px;"
                              ),
                              
                              title =  NULL,
                              footer = NULL,
                              status = NULL,
                              solidHeader = TRUE, 
                              background = "light-blue", 
                              width = 10,
                              height = 24,
                              collapsible = FALSE, 
                              collapsed = FALSE,
                              
                            ), # End box
                            
                            box (
                              
                              div (
                                strong ("Hzg"),
                                style = "margin-top: -8px; margin-left: 0px;"
                              ),
                              
                              title =  NULL,
                              footer = NULL,
                              status = NULL,
                              solidHeader = TRUE, 
                              background = "light-blue", 
                              width = 1,
                              height = 24,
                              collapsible = FALSE, 
                              collapsed = FALSE,
                              
                            ), # End box
                            
                            box (
                              
                              div (
                                strong ("WW"),
                                style = "margin-top: -8px; margin-left: 0px;"
                              ),
                              
                              title =  NULL,
                              footer = NULL,
                              status = NULL,
                              solidHeader = TRUE, 
                              background = "light-blue", 
                              width = 1,
                              height = 24,
                              collapsible = FALSE, 
                              collapsed = FALSE,
                              
                            ), # End box
                            
                            
                          ), # End fluidRow
                          
                          
                          
                          # fluidRow (
                          #   
                          #   box (
                          #     title =  strong ("Wärmeerzeugung Zentralheizung - Gebäude oder Wohnung"),
                          #     status = "primary",
                          #     solidHeader = TRUE, 
                          #     width = 10,
                          #     height = 40,
                          #     collapsible = FALSE, 
                          #     collapsed = FALSE
                          #   ),
                          #   
                          #   box (
                          #     
                          #     title =  strong ("Hzg", style = "font-size:12px;"),
                          #     status = "primary",
                          #     solidHeader = TRUE, 
                          #     width = 1,
                          #     height = 40,
                          #     collapsible = FALSE, 
                          #     collapsed = TRUE
                          #   ),
                          #   
                          #   box (
                          #     
                          #     title =  strong ("WW", style = "font-size:12px;"),
                          #     status = "primary",
                          #     solidHeader = TRUE, 
                          #     width = 1,
                          #     height = 40,
                          #     collapsible = FALSE, 
                          #     collapsed = TRUE
                          #   ),
                          #   
                          # ),
                          
                          
                          #######################################################################X
                          ###### > Kessel (Gas oder Öl)  -----
                          
                          fluidRow (
                            
                            box (
                              
                              #title = strong ("Kessel (Gas oder Öl)", style = 'font-size:14px;'),
                              #title = strong ("Kessel (Gas oder Öl)"),
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_OilGas",
                                label = strong ("Kessel (Gas oder Öl)", style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 4, 
                              height = 150,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              #title = strong ("Brennstoff", style = 'font-size:14px;'),
                              #title = "Brennstoff",
                              
                              radioButtons (
                                inputId = "Code_Type_EC_Boiler_OilGas",
                                label = "Brennstoff", 
                                choiceNames = c (
                                  "Erdgas",
                                  "Flüssiggas",
                                  "Heizöl",
                                  "weiß nicht / k. A."
                                ),
                                choiceValues =  c (
                                  "Gas",
                                  "Gas_Fluid",
                                  "Oil",
                                  "_NA_"
                                ),
                                selected = "_NA_",
                                width = NULL,
                                inline = FALSE
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 3, 
                              height = 150,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            
                            box (
                              
                              #title = strong ("Kesseltyp", style = 'font-size:14px; line-height:0.5;'),
                              #title = strong ("Kesseltyp", style = 'color:blue; line-height:1'),
                              
                              radioButtons (
                                inputId = "Code_BoilerType_OilGas",
                                label = "Kesseltyp", 
                                choiceNames = c (
                                  "Konstanttemperatur",
                                  "Niedertemperatur",
                                  "Brennwert",
                                  "weiß nicht / k. A."
                                ),
                                choiceValues =  c (
                                  "B_NC_CT",
                                  "B_NC_LT",
                                  "B_C",
                                  "_NA_"
                                ),
                                selected = NULL,
                                width = NULL,
                                inline = FALSE
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 3, 
                              height = 150,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              #title = "Hzg",
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_OilGas_SysH",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 150,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_OilGas_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 150,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            
                            
                          ), # End fluidRow "Kessel (Gas oder Öl)"
                          
                          
                          #######################################################################X
                          ###### > Holzkessel / Feststoffkessel  -----
                          
                          fluidRow (
                            
                            box (
                              
                              #title = strong ("Holzkessel / Feststoffkessel"),
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_Solid",
                                label = strong ("Holzkessel / Feststoffkessel", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 4, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              #title = "Brennstoff",
                              
                              radioButtons (
                                inputId = "Code_Type_EC_Boiler_Solid",
                                label = "Brennstoff", 
                                
                                choices = c (  
                                  "Scheitholz"	      =	"Bio_FW",
                                  "Holzpellets"	      =	"Bio_WP",
                                  "Holzhackschnitzel"	=	"Bio_WC",
                                  "Kohle"	            =	"Coal",
                                  "andere"	          =	"Other",
                                  "weiß nicht / k.A."	=	"_NA_"
                                ),
                                
                                selected = "_NA_",
                                width = NULL,
                                inline = TRUE
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 6, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            
                            # box (
                            #   
                            #   title = "",
                            # 
                            #   status = "primary",
                            #   footer = NULL, 
                            #   solidHeader = FALSE, 
                            #   background = NULL, 
                            #   width = 3, 
                            #   height = NULL,
                            #   collapsible = FALSE, 
                            #   collapsed = FALSE
                            #   
                            # ), # End box
                            
                            
                            box (
                              
                              #title = "Hzg",
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_Solid_SysH",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_Boiler_Solid_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                          ), # End fluidRow "Holzkessel / Feststoffkessel"
                          
                          
                          #######################################################################X
                          ###### > Elektro-Wärmepumpe  -----
                          
                          fluidRow (
                            
                            box (
                              
                              title = NULL, #strong ("Elektro-Wärmepumpe"),
                              
                              # column (
                              #   12,
                              checkboxInput (
                                inputId = "Indicator_Heatpump",
                                label = strong ("Elektro-Wärmepumpe", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              #   style = "height: 15px"
                              #   #style = ColumnStyle_Checkbox
                              # ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 4, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              title = NULL, #"Wärmequelle",
                              
                              radioButtons (
                                inputId = "Code_HeatpumpType",
                                label = "Wärmequelle", 
                                
                                choices = c (
                                  "Außenluft"	            =	"HP_Air",
                                  "Erdreich/Grundwasser"	=	"HP_Ground",
                                  "Abluft"	              =	"HP_ExhAir",
                                  "Kellerluft"	          =	"HP_Cellar",
                                  "weiß nicht / k.A."     =	"_NA_"
                                ),
                                
                                selected = "_NA_",
                                width = NULL,
                                inline = TRUE
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 6, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            # 
                            # box (
                            #   
                            #   title = "",
                            # 
                            #   status = "primary",
                            #   footer = NULL, 
                            #   solidHeader = FALSE, 
                            #   background = NULL, 
                            #   width = 4, 
                            #   height = NULL,
                            #   collapsible = FALSE, 
                            #   collapsed = FALSE
                            #   
                            # ), # End box
                            
                            
                            box (
                              
                              span (
                                
                                # title = strong ("Hzg", style = "font-size:14px;"),
                                
                                checkboxInput (
                                  inputId = "Indicator_Heatpump_SysH",
                                  label = NULL, 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = strong ("WW", style = "font-size:14px;"),
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_Heatpump_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                            
                            
                            
                          ), # End fluidRow "Wärmepumpe"
                          
                          
                          
                          #######################################################################X
                          ###### > Direkt-elektrisch zentral  -----
                          
                          fluidRow (
                            
                            box (
                              
                              title = NULL,
                              
                              # column (
                              #   12,
                              checkboxInput (
                                inputId = "Indicator_ElectricCentral",
                                label = strong ("direkt-elektrisch zentral (ein System für mehrere Räume)", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 10, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              span (
                                
                                # title = strong ("Hzg", style = "font-size:14px;"),
                                
                                checkboxInput (
                                  inputId = "Indicator_ElectricCentral_SysH",
                                  label = NULL, 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = strong ("WW", style = "font-size:14px;"),
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_ElectricCentral_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                            
                          ), # End fluidRow "Direkt-elektrisch zentral"
                          
                          
                          
                          #######################################################################X
                          ###### > Thermische Solaranlage  -----
                          
                          fluidRow (
                            
                            box (
                              
                              title = NULL,
                              
                              # column (
                              #   12,
                              checkboxInput (
                                inputId = "Indicator_ThermalSolar",
                                label = strong ("thermische Solaranlage", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 10, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              span (
                                
                                # title = strong ("Hzg", style = "font-size:14px;"),
                                
                                checkboxInput (
                                  inputId = "Indicator_ThermalSolar_SysH",
                                  label = NULL, 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = strong ("WW", style = "font-size:14px;"),
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_ThermalSolar_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 50,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                            
                          ), # End fluidRow "thermische Solaranlage"
                          
                          
                          
                          #######################################################################X
                          ###### > Kraft-Wärme-Kopplung  -----
                          
                          fluidRow (
                            
                            box (
                              
                              title = NULL, 
                              
                              # column (
                              #   12,
                              checkboxInput (
                                inputId = "Indicator_CHP",
                                label = strong ("Kraft-Wärme-Kopplung", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 4, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              title = NULL, 
                              
                              radioButtons (
                                inputId = "Code_Type_EC_CHP",
                                label = "Brennstoff", 
                                
                                choices = c (
                                  "Erdgas"	             =	"Gas",
                                  "Heizöl"	             =	"HP_Ground",
                                  "Bio"	                 =	"Oil",
                                  "andere"	             =	"Bio",
                                  "weiß nicht / k.A."    =	"_NA_"
                                ),
                                
                                selected = "_NA_",
                                width = NULL,
                                inline = TRUE
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 6, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              span (
                                
                                # title = strong ("Hzg", style = "font-size:14px;"),
                                
                                checkboxInput (
                                  inputId = "Indicator_CHP_SysH",
                                  label = NULL, 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = strong ("WW", style = "font-size:14px;"),
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_CHP_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                            
                            
                            
                          ), # End fluidRow "Kraft-Wärme-Kopplung"
                          
                          
                          
                          #######################################################################X
                          ###### > Fern-/Nahwärme  -----
                          
                          fluidRow (
                            
                            box (
                              
                              title = NULL,
                              
                              # column (
                              #   12,
                              checkboxInput (
                                inputId = "Indicator_DistrictHeating",
                                label = strong ("Fern-/Nahwärme", 
                                                style = 'font-size:18px; line-height:1.1;'), 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 4, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              title = NULL,
                              
                              strong ("Brennstoff"),
                              
                              checkboxInput (
                                inputId = "Indicator_EC_DHStation_Fossil",
                                label = "fossil", 
                                value = FALSE, 
                                width = NULL
                              ),
                              

                              checkboxInput (
                                inputId = "Indicator_EC_DHStation_Bio",
                                label = "Biomasse", 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 3, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              title = NULL,
                              #style = "line-height:0.8;",
                              
                              #fluidRow (
                              # style = "height:3;",
                                strong ("Wärmeerzeugung"),
                              #),
                              
                              #fluidRow (
                              # style = "height:3;",
                                checkboxInput (
                                  inputId = "Indicator_DHStation_Boiler",
                                  label = "Heizwerk (Kessel)", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              #),
                              
                              #fluidRow (
                              # style = "height:3;",
                                checkboxInput (
                                  inputId = "Indicator_DHStation_CHP",
                                  label = "Heizkraftwerk / BHKW", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              #),
                                                            
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 3, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            
                            box (
                              
                              span (
                                
                                # title = strong ("Hzg", style = "font-size:14px;"),
                                
                                checkboxInput (
                                  inputId = "Indicator_DistrictHeating_SysH",
                                  label = NULL, 
                                  value = FALSE, 
                                  width = NULL
                                ),
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ), # End box
                            
                            box (
                              
                              #title = strong ("WW", style = "font-size:14px;"),
                              #title = "WW",
                              
                              checkboxInput (
                                inputId = "Indicator_DistrictHeating_SysW",
                                label = NULL, 
                                value = FALSE, 
                                width = NULL
                              ),
                              
                              status = "primary",
                              footer = NULL, 
                              solidHeader = FALSE, 
                              background = NULL, 
                              width = 1, 
                              height = 100,
                              collapsible = FALSE, 
                              collapsed = FALSE
                              
                            ) # End box
                            
                            
                          ) # End fluidRow "Fern-/Nahwärme"
                          
                          
                          
                          
                          
                        ), # End box central heating heat generators
                        
                        
                        
                        
                        column (
                          width = 12,
                          
                          
                          fluidRow (
                            
                            
                            
                            #######################################################################X
                            ##### § heat storage heating system  -----
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 6,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_Storage_SysH",
                                      label = strong ("Pufferspeicher für Heizung"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    #style = "margin-top: -15px; margin-left: 0px;"
                                    
                                  ), # End div
                                  
                                  #strong ("Pufferspeicher für Heizung"),
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                margin-top: 0px;
                                #margin-bottom: -10px;
                                margin-left: 0px;
                                padding: 0 !important;
                                "
                                  
                                  #style = "margin-top: 2px;margin-left: 0px; margin-right: 0px; margin-bottom:2px;padding:-10px;",
                                  #style = "margin-top: -5px; margin-left: 10px; padding: 0 !important;"
                                  
                                  
                                ), # End box
                                
                                
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                                
                                checkboxInput (
                                  inputId = "Indicator_Storage_SysH_Immersion",
                                  label = "inklusive elektrischem Heizstab", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Storage_SysH_InsideEnvelope",
                                  label = "Heizungspufferspeicher innerhalb der thermischen Hülle", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                
                                # div (
                                #   
                                #   checkboxInput (
                                #     inputId = "Indicator_Storage_SysH_Immersion",
                                #     label = "inklusive elektrischem Heizstab", 
                                #     value = FALSE, 
                                #     width = NULL
                                #   ),
                                #   
                                #   #style = "margin-top: -20px; margin-left: 25px;"
                                #   #style = "margin-top: -50px; margin-left: 30px; padding:0 !important;"
                                #   
                                # ), # End div
                                
                                
                                
                                
                                # box (
                                #   
                                #   
                                #   checkboxInput (
                                #     inputId = "Indicator_Storage_SysH_Immersion",
                                #     label = "inklusive elektrischem Heizstab", 
                                #     value = FALSE, 
                                #     width = NULL
                                #   ),
                                #   
                                #   status = NULL, # "primary",
                                #   footer = NULL, 
                                #   solidHeader = FALSE, 
                                #   background = NULL, 
                                #   width = 12, 
                                #   height = 50,
                                #   collapsible = FALSE, 
                                #   collapsed = FALSE,
                                # 
                                #   style = "
                                #     margin-left: 10px; 
                                #     padding: 0 !important;
                                #   "
                                #   
                                # ), # End box
                                
                              ), # End fluidRow
                              
                              #style = "padding: 0 !important;"
                              
                              
                            ), # End box 
                            
                            
                            #######################################################################X
                            ##### § heat storage DHW system  -----
                            
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 6,
                              background = NULL,
                              
                              fluidRow (
                                
                                
                                
                                
                                box (
                                  
                                  div (
                                    checkboxInput (
                                      inputId = "Indicator_Storage_SysW",
                                      label = strong ("Warmwasserspeicher"),
                                      value = FALSE,
                                      width = NULL
                                    ),
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = FALSE,
                                  background = "light-blue",
                                  width = 12,
                                  height = 24,
                                  collapsible = FALSE,
                                  collapsed = FALSE,
                                  
                                  style = "margin-top: 0px; margin-left: 0px; padding: 0 !important;"
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px;",
                                
                                checkboxInput (
                                  inputId = "Indicator_Storage_SysW_Immersion",
                                  label = "inklusive elektrischem Heizstab", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Storage_SysW_InsideEnvelope",
                                  label = "Warmwasserspeicher innerhalb der thermischen Hülle", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                
                                
                                # box (
                                #   
                                #   checkboxInput (
                                #     inputId = "Indicator_Storage_SysW_Immersion",
                                #     label = "inklusive elektrischem Heizstab", 
                                #     value = FALSE, 
                                #     width = NULL
                                #   ),
                                # 
                                #   status = "primary",
                                #   footer = NULL, 
                                #   solidHeader = FALSE, 
                                #   background = NULL, 
                                #   width = 12, 
                                #   height = 50,
                                #   collapsible = FALSE, 
                                #   collapsed = FALSE,
                                # 
                                #   style = "
                                #     margin-left: 10px; 
                                #     padding: 0 !important;
                                #   "
                                #   
                                #   #style = "margin-top: -10px; margin-left: 10px;"
                                #   #style = "margin-top: -20px; margin-left: 10px; padding: 0 !important;"
                                #   
                                #   
                                # ), # End box
                                
                              ), # End fluidRow
                              
                            ), # End box 
                            

                          ), # End fluidRow

                        ), # End Column
                        
                        
                        column (
                          width = 12,
                          
                          
                          fluidRow (
                        
                            
                            #######################################################################X
                            ##### § heat distribution heating system  -----
                            
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 6,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_Distribution_SysH",
                                      label = strong ("Heizwärmeverteilung"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                margin-top: 0px;
                                #margin-bottom: -10px;
                                margin-left: 0px;
                                padding: 0 !important;
                              "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysH_OutsideEnvelope",
                                  label = "teilweise außerhalb der thermischen Hülle (in unbeheiztem Keller oder Dachgeschoss)", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysH_PoorlyInsulated",
                                  label = "Nur mäßige oder unvollständige Leitungsdämmung", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysH_LowTemperature",
                                  label = "Fußbodenheizung / niedrige Verteilnetztemperatur", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                            
                            #######################################################################X
                            ##### § heat distribution DHW system  -----
                            
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 6,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_Distribution_SysW",
                                      label = strong ("Warmwasserverteilung"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                margin-top: 0px;
                                #margin-bottom: -10px;
                                margin-left: 0px;
                                padding: 0 !important;
                              "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysW_CirculationLoop",
                                  label = "mit Zirkulationsleitung", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysW_OutsideEnvelope",
                                  label = "teilweise außerhalb der thermischen Hülle (in unbeheiztem Keller oder Dachgeschoss)", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_Distribution_SysW_PoorlyInsulated",
                                  label = "Nur mäßige oder unvollständige Leitungsdämmung", 
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                                
                          ), # End fluidRow
                          
                        ), # End Column
                        
                        
  
                        
                        
                        
                        
                        column (
                          width = 6,
                          
                          
                          fluidRow (
                            
                            
                            #######################################################################X
                            ##### § Decentral or room-by-room heating / stoves  -----
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 12,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_SysH_G_Decentral",
                                      label = strong ("Dezentrale / raumweise Heizung"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                margin-top: 0px;
                                #margin-bottom: -10px;
                                margin-left: 0px;
                                padding: 0 !important;
                              "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                                
                                fluidRow (
                                  
                                  column (
                                    3,
                                    
                                    checkboxInput (
                                      inputId = "Indicator_SysH_G_Stove",
                                      label = "Einzelöfen", 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -10px; margin-left: 0px;"
                                    
                                    
                                  ), # End column
                                  
                                  column (
                                    3, 
                                    "Brennstoff:",
                                    
                                  ), # End column
                                  
                                  
                                  column (
                                    6,

                                    radioButtons (
                                      inputId = "Code_Type_EC_Stove",
                                      label = NULL,
                                      #label = "Brennstoff", 
                                      
                                      choices = c (
                                        "Holz"       = "Bio_Wood",
                                        "Heizöl"     = "Oil",
                                        "Gas"        = "Gas",
                                        "Kohle"      = "Coal",
                                        "k.A."       = "_NA_"
                                      ),
                                      
                                      selected = "_NA_",
                                      width = NULL,
                                      inline = TRUE
                                    ),
                                    
                                  ) # End column
                                  
                                ), # End fluidRow
                                
                                
                                
                                
                                
                                checkboxInput (
                                  inputId = "Indicator_SysH_G_Dec_DirectElectric",
                                  label = "Elektro-Heizgeräte / Elektro-Öfen",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_SysH_G_Dec_ElectricNightStorage",
                                  label = "elektrische Nachtspeicherheizung",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_SysH_G_Dec_Heatpump",
                                  label = "elektrische Wärmepumpen (raumweise)",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                
                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                            
                            
                            
                            
                            #######################################################################X
                            ##### § Extra thick insulation of system components  -----
                            
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 12,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_SysHW_D_S_ExtraThickInsulation",
                                      label = strong ("Extra dicke Dämmung von Komponenten"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                    margin-top: 0px;
                                    #margin-bottom: -10px;
                                    margin-left: 0px;
                                    padding: 0 !important;
                                  "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                  
                              fluidRow (
                                
                                style = "margin-top: -40px; margin-left: 8px; padding:0 !important;",
                                
                                "Dämmstärke von Leitungen (doppelter Leitungsdurchmesser) 
                                 und Speicher entsprechend Passivhaus-Empfehlungen",

                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                            
                            
                          ), # End fluidRow
                          
                        ), # End Column
                        
                        
                        
                        column (
                          width = 6,
                          
                          
                          fluidRow (
                            
                            
                            #######################################################################X
                            ##### § Decentral DHW devices  -----
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 12,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (
                                    
                                    checkboxInput (
                                      inputId = "Indicator_SysH_W_Decentral",
                                      label = strong ("Dezentrale Warmwasserbereitung"), 
                                      value = FALSE, 
                                      width = NULL
                                    ),
                                    
                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  style = "
                                margin-top: 0px;
                                #margin-bottom: -10px;
                                margin-left: 0px;
                                padding: 0 !important;
                              "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (
                                
                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                                
                                checkboxInput (
                                  inputId = "Indicator_SysW_G_Dec_ElectricStorage",
                                  label = "dezentrale elektrische Speicher",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_SysW_G_Dec_ElectricTankless",
                                  label =  "Elektro-Durchlauferhitzer",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                checkboxInput (
                                  inputId = "Indicator_SysW_G_Dec_GasTankless",
                                  label = "Gas-Durchlauferhitzer",
                                  value = FALSE, 
                                  width = NULL
                                ),
                                
                                
                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                            
                            
                            
                            
                            #######################################################################X
                            ##### § Further systems  -----
                            
                            
                            box (
                              
                              status = "info",
                              solidHeader = TRUE, 
                              width = 12,
                              background = NULL,
                              
                              
                              fluidRow (
                                
                                box (
                                  
                                  div (

                                    strong ("Weitere Systeme"), 

                                    style = "margin-top: -8px; margin-left: 10px;"
                                    
                                  ), # End div
                                  
                                  title =  NULL,
                                  footer = NULL,
                                  status = NULL,
                                  solidHeader = TRUE, 
                                  background = "light-blue", 
                                  width = 12,
                                  height = 25,
                                  collapsible = FALSE, 
                                  collapsed = FALSE,
                                  
                                  
                                  # style = "
                                  #   margin-top: 0px;
                                  #   #margin-bottom: -10px;
                                  #   margin-left: 0px;
                                  #   padding: 0 !important;
                                  # "
                                  
                                ), # End box
                                
                              ), # End fluid row 
                              
                              
                              fluidRow (

                                style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",

                                checkboxInput (
                                  inputId = "Indicator_SysVent_Mechanical",
                                  label = "Lüftungsanlage",
                                  value = FALSE,
                                  width = NULL
                                ),

                                div (
                                  
                                  checkboxInput (
                                    inputId = "Indicator_SysVent_HeatRec",
                                    label = "mit Wärmerückgewinnung",
                                    value = FALSE,
                                    width = NULL
                                  ),
                                  
                                  style = "margin-top: -15px; margin-left: 20px;"
                                  
                                ), # End div

                                checkboxInput (
                                  inputId = "Indicator_SysPV",
                                  label = "Photovoltaik-Anlage (Solarstrom)",
                                  value = FALSE,
                                  width = NULL
                                ),

                                div (
                                  checkboxInput (
                                    inputId = "Indicator_SysPV_ElectricStorage",
                                    label = "mit Batterie-Speicher",
                                    value = FALSE,
                                    width = NULL
                                  ),
  
                                  style = "margin-top: -15px; margin-left: 20px;"
                                  
                                ), # End div

                                
                              ), # End fluidRow
                              
                            ), # End box 
                            
                            
                            
                            
                          ), # End fluidRow
                          
                        ), # End Column
                        
                        
                        
                                              
                        
                                                
                      ), # End fluidRow including all heating system input elements
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                    ), # End tabPanel

                    
                    

  
  #######################################################################X
  #### tabPanel "Further Information" - further administration related input -----
  
  
  tabPanel (
    
    strong ("Zusatz-Infos"),
    
    br (),
    
    
    
    
    
    
    
    #### > Administrative data -----
    
    box (
      
      status = "info",
      solidHeader = TRUE, 
      width = 6,
      background = NULL,
      
      style = "
        #margin-top: -20px;
        #margin-bottom: -10px;
        #margin-left: -20px;
        padding: 0 !important;
      ",
      
      fluidRow (
        
        box (
          
          div (
            
            strong ("Zusätzliche Informationen zum Gebäude"), 
            
            style = "margin-top: -8px; margin-left: 10px;"
            
          ), # End div
          
          title =  NULL,
          footer = NULL,
          status = NULL,
          solidHeader = TRUE, 
          background = "light-blue", 
          width = 12,
          height = 25,
          collapsible = FALSE, 
          collapsed = FALSE,
          
          
        ), # End box
        
      ), # End fluid row 
      
      
      fluidRow (
        
        style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
        
        column (
          12,
          
          
          textInput(
            inputId = "TextInput_ID_Dataset",
            label = "Datensatz-ID",
            placeholder = "ID_Dataset",
            width = '95%'
          ),
          
          
          textInput(
            inputId = "Name_Variant",
            label = "Variante",
            placeholder = "Name_Variant",
            width = '95%'
          ),
          
          
          numericInput (
            inputId = "Year_State",
            label = "Jahr der Erfassung",
            value = 2001,
            min = 0,
            max = 9999,
            width = '95%'
          ), # End numeric input
          
          numericInput (
            inputId = "Year_State_First",
            label = "Zeitraum Zustand erstes Jahr",
            value = 2001,
            min = 0,
            max = 9999,
            width = '95%'
          ), # End numeric input
          
          numericInput (
            inputId = "Year_State_Last",
            label = "Zeitraum Zustand letztes Jahr",
            value = 2001,
            min = 0,
            max = 9999,
            width = '95%'
          ), # End numeric input
          
          numericInput (
            inputId = "n_Block",
            label = "Anzahl Blöcke",
            value = 1,
            min = 1,
            max = 100,
            width = '95%'
          ), # End numeric input
          
          numericInput (
            inputId = "n_House",
            label = "Anzahl Häuser",
            value = 1,
            min = 1,
            max = 100,
            width = '95%'
          ), # End numeric input
    
        ), # End column
        
        
        # column (
        #   12,
        #   "Leere Spalte",
        #   
        #   
        #   br (),
        #   br (),
        #   
        # ), # End column
        
      ) # End fluidRow
      
    ), # End box 
    
    
    
    
    
    
    
    
    
    
#     fluidRow(
#       
#       style = Style_Height_Dashboard_MainPanel,
#       
#       #"height:75vh !important; overflow-y: scroll",
#       #style = "height: 600px; overflow-y: scroll;",
#       #style = "overflow-y: scroll"
#       
#       
#       column (
#         4,
# 
# # 
# #         textInput(
# #           inputId = "TextInput_ID_Dataset",
# #           label = "Datensatz-ID",
# #           placeholder = "ID_Dataset"
# #         ),
# #         
# #         
# #         textInput(
# #           inputId = "Name_Variant",
# #           label = "Variante",
# #           placeholder = "Name_Variant"
# #         ),
# #         
# # 
# #         numericInput (
# #           inputId = "Year_State",
# #           label = "Jahr der Erfassung",
# #           value = 2001,
# #           min = 0,
# #           max = 9999
# #           #width = 50
# #         ), # End numeric input
# #         
# #         numericInput (
# #           inputId = "Year_State_First",
# #           label = "Zeitraum Zustand erstes Jahr",
# #           value = 2001,
# #           min = 0,
# #           max = 9999
# #           #width = 50
# #         ), # End numeric input
# #         
# #         numericInput (
# #           inputId = "Year_State_Last",
# #           label = "Zeitraum Zustand letztes Jahr",
# #           value = 2001,
# #           min = 0,
# #           max = 9999
# #           #width = 50
# #         ), # End numeric input
# #         
# #         numericInput (
# #           inputId = "n_Block",
# #           label = "Anzahl Blöcke",
# #           value = 1,
# #           min = 1,
# #           max = 100
# #           #width = 50
# #         ), # End numeric input
# #         
# #         numericInput (
# #           inputId = "n_House",
# #           label = "Anzahl Häuser",
# #           value = 1,
# #           min = 1,
# #           max = 100
# #           #width = 50
# #         ), # End numeric input
# #         
# #         
#         
#         br (),
#         
#         
#         
#       ), # End Column
#       
#       
#       column (
#         4,
#         
#         
#       ), # End column
#       
#       
#     ), # End fluidRow
    
    
    
  ), # End tabPanel
  
  
#######################################################################X
#### tabPanel "Einstellungen" -----


tabPanel (
  
  strong ("Einstellungen"),
  
  style = Style_Height_Dashboard_MainPanel,  
  
  br (),
  
  ##### > Randbedingungen  -----
  
  box (
    
    status = "info",
    solidHeader = TRUE, 
    width = 6,
    background = NULL,
    
    
    style = "
                              #margin-top: -20px;
                              #margin-bottom: -10px;
                              #margin-left: -20px;
                              padding: 0 !important;
                            ",
    
    
    
    fluidRow (
      
      box (
        
        div (
          
          strong ("Randbedingungen"), 
          
          style = "margin-top: -8px; margin-left: 10px;"
          
        ), # End div
        
        title =  NULL,
        footer = NULL,
        status = NULL,
        solidHeader = TRUE, 
        background = "light-blue", 
        width = 12,
        height = 25,
        collapsible = FALSE, 
        collapsed = FALSE,
        
        
        # style = "
        #   margin-top: 0px;
        #   #margin-bottom: -10px;
        #   margin-left: 0px;
        #   padding: 0 !important;
        # "
        
      ), # End box
      
    ), # End fluid row 
    
    
    fluidRow (
      
      style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
      
      column (
        12,
        
        selectInput (
          inputId = "Code_BoundaryCond",
          label = "Nutzungsdaten",
          
          choices = c (
            "TABULA-Standard EFH (EU.SUH)"  = "EU.SUH",
            "TABULA-Standard MFH (EU.MUH)"  = "EU.MUH",
            "MOBASY-Standard EFH"  = "DE.MOBASY.Development.SUH",
            "MOBASY-Standard MFH"  = "DE.MOBASY.Development.MUH"
            # "MOBASY-Standard EFH 'DE.MOBASY.Development.SUH'"  = "DE.MOBASY.Development.SUH",
            # "MOBASY-Standard MFH 'DE.MOBASY.Development.MUH'"  = "DE.MOBASY.Development.MUH"
          ),
          
          selected = "EU.SUH",
          width = '95%'
        ),
        
        
        # textInput (
        #   inputId = "Code_BoundaryCond",
        #   label = "Nutzungsdaten",
        #   placeholder =  "Code_BoundaryCond",
        #   value = "EU.SUH",
        #   width = '95%'
        # ),
        
        #"Standardwerte (TABULA) = 'EU.SUH' für Einfamilienhäuser und 'EU.MUH' für Mehrfamilienhäuser)",
        "Berechnungen mit TABULA-Randbedingungen sollten auf typisches Verbrauchsnviveau kalibriert werden.",
        "Für Berechnungen mit MOBASY-Randbedingungen gibt es derzeit keine Parameter für die Kalibrierung.",
        br (),
        br (),
        
        
        ## In der Serverfunktion noch das hier integrieren
        #                        
        # "Code_BoundaryCond" = "EU.SUH" 
        # observe event: wenn Wohnfläche>=200 m² oder 
        # Anzahl WE>=3 
        # dann die letzten 4 Buchstaben des Codes der Selektion ändern: ".SUH" --> ".MUH"
        
      ), # End column
      
      
      column (
        12,
        
        
        selectInput (
          inputId = "Code_Climate",
          label = "Klima-Datensatz",
          
          choices = c (
            "National (Potsdam, EnEV 2014)" = "DE.N",
            "National (EnEV 2009)" = "DE.N-DIN4108-6",
            "CR01 Bremerhaven" = "DE.KR01-Bremerhaven",
            "CR02 Rostock" = "DE.KR02-Rostock",
            "CR03 Hamburg" = "DE.KR03-Hamburg",
            "CR04 Potsdam" = "DE.KR04-Potsdam",
            "CR05 Essen" = "DE.KR05-Essen",
            "CR06 Bad Marienberg" = "DE.KR06-BadMarienberg",
            "CR07 Kassel" = "DE.KR07-Kassel",
            "CR08 Braunlage" = "DE.KR08-Braunlage",
            "CR09 Chemnitz" = "DE.KR09-Chemnitz",
            "CR10 Hof" = "DE.KR10-Hof",
            "CR11 Fichtelberg" = "DE.KR11-Fichtelberg",
            "CR12 Mannheim" = "DE.KR12-Mannheim",
            "CR13 Passau" = "DE.KR13-Passau",
            "CR14 Stötten" = "DE.KR14-Stötten",
            "CR15 Garmisch" = "DE.KR15-Garmisch"
          ),
          
          selected = "DE.N",
          width = '95%'
        ),
        
        # textInput (
        #   inputId = "Code_Climate",
        #   label = "Klima-Datensatz",
        #   placeholder = "Code_Climate",
        #   value = "DE.N",
        #   width = '95%' 
        # ),
        
        "Standardwert = 'DE.N' (Standardklima Deutschland)",
        
        br (),
        br (),
        
      ),
      
      
      
    ), # End fluidRow
    
  ), # End box 
  
  
  
  
  
  
  ##### > Darstellung der Eingabefelder  -----
  
  
  box (
    
    status = "info",
    solidHeader = TRUE, 
    width = 6,
    background = NULL,
    
    style = "
                        #margin-top: -20px;
                        #margin-bottom: -10px;
                        #margin-left: -20px;
                        padding: 0 !important;
                      ",
    
    fluidRow (
      
      box (
        
        div (
          
          strong ("Darstellung Eingabefelder"), 
          
          style = "margin-top: -8px; margin-left: 10px;"
          
        ), # End div
        
        title =  NULL,
        footer = NULL,
        status = NULL,
        solidHeader = TRUE, 
        background = "light-blue", 
        width = 12,
        height = 25,
        collapsible = FALSE, 
        collapsed = FALSE,
        
      ), # End box
      
    ), # End fluid row 
    
    
    fluidRow (
      
      style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
      
      column (
        12,
        
        radioButtons(
          inputId = "Code_Type_NumericQueries",
          label = "Art der Eingabe numerischer Werte",
          choices = NULL,
          selected = "Slider",
          inline = FALSE,
          width = NULL,
          choiceNames = c (
            "numerische Eingaben",
            "Skala (Standard)",
            "beides"
          ),
          choiceValues = c (
            "Numeric",
            "Slider",
            "Both"
          )
        )
        
      ), # End column
      
      
      # column (
      #   12,
      #   "Leere Spalte",
      #   
      #   
      #   br (),
      #   br (),
      #   
      # ), # End column
      
    ) # End fluidRow
    
  ), # End box 
  
  
  
  ##### > Typ Energiebezugsfläche -----
  
  box (
    
    status = "info",
    solidHeader = TRUE, 
    width = 6,
    background = NULL,
    
    style = "
                        #margin-top: -20px;
                        #margin-bottom: -10px;
                        #margin-left: -20px;
                        padding: 0 !important;
                      ",
    
    fluidRow (
      
      box (
        
        div (
          
          strong ("Flächentyp für die Skalierung der Gebäudegröße"),
          
          style = "margin-top: -8px; margin-left: 10px;"
          
        ), # End div
        
        title =  NULL,
        footer = NULL,
        status = NULL,
        solidHeader = TRUE, 
        background = "light-blue", 
        width = 12,
        height = 25,
        collapsible = FALSE, 
        collapsed = FALSE,
        
        
      ), # End box
      
    ), # End fluid row 
    
    
    fluidRow (
      
      style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
      
      column (
        12,
        
        radioButtons (
          inputId = "Code_TypeFloorArea_A_C_Floor_Intake",
          label = "Flächentyp",
          selected = "A_C_Living",
          inline = FALSE,
          width = NULL,
          choiceNames = c (
            "beheizte Bruttogrundfläche",
            "beheizte Nettogrundfläche",
            "beheizte Nutzfläche",
            "beheizte Wohnfläche",
            "TABULA Referenzfläche",
            "nicht definiert"
          ),
          choiceValues = c (
            "A_C_ExtDim",
            "A_C_IntDim",
            "A_C_Use",
            "A_C_Living",
            "A_C_Ref",
            "_NA_"
          )
        ), # End radioButtons                           
        
        radioButtons (
          inputId = "Code_BuildingPart_A_C_Floor_Intake",
          label = "erfasste Fläche",
          selected = "Building",
          inline = FALSE,
          width = NULL,
          choiceNames = c (
            "gesamtes Gebäude",
            "Erdgeschoss",
            "nicht definiert"
          ),
          choiceValues = c (
            "Building",
            "Storey",
            "_NA_"
          )
        ), # End radioButtons                           
        
      ), # End column
      
      
      # column (
      #   12,
      #   "Leere Spalte",
      #   
      #   
      #   br (),
      #   br (),
      #   
      # ), # End column
      
    ) # End fluidRow
    
  ), # End box 
  
  
  
  
  ##### > Library dataset selection -----
  
  box (
    
    status = "info",
    solidHeader = TRUE, 
    width = 6,
    background = NULL,
    
    style = "
                        #margin-top: -20px;
                        #margin-bottom: -10px;
                        #margin-left: -20px;
                        padding: 0 !important;
                      ",
    
    fluidRow (
      
      box (
        
        div (
          
          strong ("Auswahl Datensätze Bibliothek"), 
          
          style = "margin-top: -8px; margin-left: 10px;"
          
        ), # End div
        
        title =  NULL,
        footer = NULL,
        status = NULL,
        solidHeader = TRUE, 
        background = "light-blue", 
        width = 12,
        height = 25,
        collapsible = FALSE, 
        collapsed = FALSE,
        
        
      ), # End box
      
    ), # End fluid row 
    

    
    fluidRow (
      
      style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
      
      column (
        12,
        
        selectInput (
          inputId = "Code_U_Class_National",
          label = "Tabellenwerte für Bauteile",
          
          choices = c (
            "Generische Werte ('Gen', verwendet im TABULA WebTool)" = "Gen",
            "MOBASY-Werte (derzeit Default-Einstellung)"            = "MOBASY",
            "REWOTY-Werte (derzeit noch Baustelle)"                 = "REWOTY"
          ),
          
          selected = "MOBASY",
          width = '95%'
        ),

        "Spezifikation der Tabellenwerte für die Schätzung der Wärmedurchgangskoeffizienten von Bauteilen.",   
        br (),
        "Der Code bestimmt, welche Datensatz-Version verwendet wird.", 
        br (),
        "Dies betrifft die Tabellen 
        'Tab.U.Class.Constr', 'Tab.Insulation.Default', 'Tab.Measure.f.Default', 'Tab.U.WindowType.Periods'
        in der Datei 'tabula-values.xlsx', die im Shiny-Tool als Quelle für Defaultwerte dient.",
        
        br (),
        br (),

      ), # End column

    ) # End fluidRow
    
  ), # End box 
  
  
  
  
  
  
  
  
  #### >>> TEMPLATE FOR BOX -----
  
  box (
    
    status = "info",
    solidHeader = TRUE, 
    width = 6,
    background = NULL,
    
    style = "
                        #margin-top: -20px;
                        #margin-bottom: -10px;
                        #margin-left: -20px;
                        padding: 0 !important;
                      ",
    
    fluidRow (
      
      box (
        
        div (
          
          strong ("Neue Box"), 
          
          style = "margin-top: -8px; margin-left: 10px;"
          
        ), # End div
        
        title =  NULL,
        footer = NULL,
        status = NULL,
        solidHeader = TRUE, 
        background = "light-blue", 
        width = 12,
        height = 25,
        collapsible = FALSE, 
        collapsed = FALSE,
        
        
      ), # End box
      
    ), # End fluid row 
    
    
    fluidRow (
      
      style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
      
      column (
        12,
        
        "Leere Spalte",
        br (),
        br (),
        
      ), # End column
      
      
      column (
        12,
        "Leere Spalte",
        
        
        br (),
        br (),
        
      ), # End column
      
    ) # End fluidRow
    
  ), # End box 
  
  
  
  
  
  
  
  
  
  
),  # End tabPanel "Einstellungen"           

                    

                    #######################################################################X
                    #### tabPanel "Testfeld" -----
                    
                    
                    # tabPanel (
                    #   
                    #   "Testfeld",
                    # 
                    #     fluidRow (
                    #       
                    #       style = Style_Height_Dashboard_MainPanel,
                    #       
                    #       #"height:75vh !important; overflow-y: scroll",
                    #       #style = "height: 600px; overflow-y: scroll;",
                    #       #style = "overflow-y: scroll"
                    #       
                    #       
                    #       column (
                    #         12,
                    #         
                    #         "erstes",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "Test",
                    #         br (),
                    #         "letztes",
                    #         br (),
                    #         
                    #         
                    #         
                    #       ), # End Column
                    #       
                    #       
                    #       
                    #     ), # End fluidRow
                    #       
                    # 
                    #   
                    # ), # End tabPanel
                    
                    
                    

                    #######################################################################X
                    #### tabPanel "Reste"  -----
                    
                    
                    

                    # tabPanel (
                    #   "Reste",
                    #   
                    #   
                    #   #### >>> TEMPLATE FOR BOX -----
                    #   
                    #   
                    #   box (
                    #     
                    #     status = "info",
                    #     solidHeader = TRUE, 
                    #     width = 12,
                    #     background = NULL,
                    #     
                    #     
                    #     style = "
                    #                                             #margin-top: -20px;
                    #                                             #margin-bottom: -10px;
                    #                                             #margin-left: -20px;
                    #                                             padding: 0 !important;
                    #                                           ",
                    #     
                    #     
                    #     
                    #     fluidRow (
                    #       
                    #       box (
                    #         
                    #         div (
                    #           
                    #           strong ("Neue Box"), 
                    #           
                    #           style = "margin-top: -8px; margin-left: 10px;"
                    #           
                    #         ), # End div
                    #         
                    #         title =  NULL,
                    #         footer = NULL,
                    #         status = NULL,
                    #         solidHeader = TRUE, 
                    #         background = "light-blue", 
                    #         width = 12,
                    #         height = 25,
                    #         collapsible = FALSE, 
                    #         collapsed = FALSE,
                    #         
                    #         
                    #       ), # End box
                    #       
                    #     ), # End fluid row 
                    #     
                    #     
                    #     fluidRow (
                    #       
                    #       style = "margin-top: -20px; margin-left: 8px; padding:0 !important;",
                    #       
                    #       column (
                    #         12,
                    #         
                    #         "Leere Spalte",
                    #         br (),
                    #         br (),
                    #         
                    #       ), # End column
                    #       
                    #       
                    #       column (
                    #         12,
                    #         "Leere Spalte",
                    #         
                    #         
                    #         br (),
                    #         br (),
                    #         
                    #       ),
                    #     ) # End fluidRow
                    #     
                    #   ), # End box 
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   ## Version 2 Anfang                      
                    #   
                    #   
                    #   
                    #   
                    #   #######################################################################X
                    #   ##### Version 2: Input Opaque construction elements ----- 
                    #   
                    #   
                    #   ###### Header row -----
                    #   
                    #   fluidRow (
                    #     
                    #     column (
                    #       4,
                    #       strong ("Thermische Hülle / nicht-transparente Elemente"),
                    #       style = ColumnStyle_OpaqueElements_HeaderRow
                    #     ), 
                    #     
                    #     column (
                    #       2,
                    #       strong ("Dach"),
                    #       style = ColumnStyle_OpaqueElements_HeaderRow
                    #     ), 
                    #     
                    #     column (
                    #       2,
                    #       strong ("oberste Geschossdecke"),
                    #       style = ColumnStyle_OpaqueElements_HeaderRow
                    #     ), 
                    #     
                    #     column (
                    #       2,
                    #       strong ("Außenwände"),
                    #       style = ColumnStyle_OpaqueElements_HeaderRow
                    #     ), 
                    #     
                    #     column (
                    #       2,
                    #       strong ("Kellerdecke / Fußboden gegen Erdreich"),
                    #       style = ColumnStyle_OpaqueElements_HeaderRow
                    #     ), 
                    #     
                    #   ), # End fluidRow
                    #   
                    #   
                    #   
                    #   ###### Construction type -----
                    #   
                    #   
                    #   fluidRow (
                    #     
                    #     column (
                    #       4,
                    #       strong ("Art der Konstruktion"),
                    #       style = ColumnStyle_OpaqueElements_ConstructionType,
                    #       #   helpText (
                    #       #     "hat bei einigen Baualtersklassen 
                    #       #     Einfluss auf den typischen Wärmedurchgangskoeffzienten (U-Wer)"
                    #       #     )
                    #     ), 
                    #     
                    #     
                    #     column ( # Checkboxes construction type roof
                    #       2,
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Roof_Constr_Massive", 
                    #             label = "massiv", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Roof_Constr_Wood", 
                    #             label = "Holz", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       style = ColumnStyle_OpaqueElements_ConstructionType
                    #     ), # End column 
                    #     
                    #     
                    #     column ( # Checkboxes construction type top ceiling
                    #       2,
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Ceiling_Constr_Massive", 
                    #             label = "massiv", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Ceiling_Constr_Wood", 
                    #             label = "Holz", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       style = ColumnStyle_OpaqueElements_ConstructionType
                    #     ), 
                    #     
                    #     
                    #     column ( # Checkboxes construction type walls
                    #       2,
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Wall_Constr_Massive", 
                    #             label = "massiv", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Wall_Constr_Wood", 
                    #             label = "Holz", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       style = ColumnStyle_OpaqueElements_ConstructionType
                    #     ), 
                    #     
                    #     
                    #     column ( # Checkboxes construction type floor
                    #       2,
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Floor_Constr_Massive", 
                    #             label = "massiv", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       fluidRow ( # fluidRow necessary to aline checkbox with header
                    #         column ( # Single checkbox column used to reduce the height
                    #           12,
                    #           checkboxInput (
                    #             inputId = "Indicator_Floor_Constr_Wood", 
                    #             label = "Holz", 
                    #             value = FALSE, 
                    #             width = NULL
                    #           ),
                    #           style = ColumnStyle_Checkbox
                    #         ), # End single checkbox column 
                    #       ), # End fluidRow
                    #       
                    #       style = ColumnStyle_OpaqueElements_ConstructionType
                    #     ), 
                    #     
                    #   ), # End fluidRow
                    #   
                    #   br (),
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   ## Version 2 Ende                      
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   ## Version 3 Anfang                      
                    #   
                    #   
                    #   br (),
                    #   br (),
                    #   
                    #   fluidRow (
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Bauteil",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("massiv",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Holz",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Original-Dämmung",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Hülle nicht geändert",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Original-Dämmung",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Dämm-Maßnahmen",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Stand Moderni-sierung unbekannt",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Jahr der Modernisierung",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                border: 1px dotted red;"
                    #            
                    #            # It tried to center the double lined text 
                    #            # This did not work:
                    #            #writing-mode: vertical-lr;
                    #            #transform: translate(-50px,-75px) rotate(-90deg);
                    #            #vertical-align:top; #keine Auswirkung
                    #            #text-align:center;  #keine Auswirkung
                    #            #margin:0; # keine Auswirkung
                    #            #padding:5px; # keine Auswirkung
                    #            
                    #       )
                    #     ), 
                    #     column (
                    #       2,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("Dämmstärke in cm",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-50px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #     column (
                    #       1,
                    #       style = "height: 150px; border: 1px solid grey;",
                    #       box ("% der Fläche",
                    #            style = "width:150px; height:50px;
                    #                                line-height:15px;
                    #                                transform: rotate(-90deg) translate(-50px,-75px);
                    #                                vertical-align:bottom; 
                    #                                border: 1px dotted red;"
                    #       )
                    #     ), 
                    #   ),
                    #   
                    #   
                    #   
                    #   
                    #   
                    #   br (),
                    #   
                    #   
                    #   ## kann gelöscht werden
                    #   ##   
                    #   #     fluidRow (
                    #   #       column (
                    #   #         1,
                    #   #         "Bauteil",
                    #   #         #offset = 1,
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #         # "font-size: 12pt !important; transform: rotate(-90deg) translate(-30px);"
                    #   #         #style = "height:300px;transform: rotate(-90deg);text-align: middle;"
                    #   #         # style = "transform: rotate(-90deg);vertical-align:bottom;",
                    #   #         #height = '100'
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "massiv",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "Holz",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #         # style = "height:300px;transform: rotate(-90deg);
                    #   #         # vertical-align:bottom;text-align: middle;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "Hülle nicht geändert",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "Original-Dämmung",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "Dämm-Maßnahmen",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "Stand Modernisierung unbekannt                         ",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align:middle;border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   # # box (
                    #   # #   "Jahr der Modernisierung",
                    #   # #   style = "height:40px; width:350px;transform: rotate(-90deg); 
                    #   # #   vertical-align:bottom;
                    #   # #   text-align: middle;border: 1px dotted grey;"
                    #   # # ),        
                    #   # #         style = "height: 300px; border: 1px solid grey;"
                    #   #       ), 
                    #   # # column (
                    #   # #   1,
                    #   # #   "Jahr der Modernisierung",
                    #   # #   style = "height:300px;transform: rotate(-90deg);
                    #   # #         vertical-align:bottom;text-align: middle;border: 1px solid grey;"
                    #   # # ), 
                    #   # column (
                    #   #         1,
                    #   #         "Dämmstärke in cm",
                    #   #         style = "width:100px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align: middle; border: 1px solid grey;"
                    #   #       ), 
                    #   #       column (
                    #   #         1,
                    #   #         "% der Fläche",
                    #   #         style = "height:300px;transform: rotate(-90deg);
                    #   #         vertical-align:bottom;text-align: middle;"
                    #   #       ), 
                    #   #       
                    #   #       style = "border: 1px dotted lightgrey"
                    #   #       
                    #   #     ), # End fluidRow
                    #   
                    #   # fluidRow (
                    #   #   column(
                    #   #     12,
                    #   #     "Thermische Hülle (nicht-transparente Elemente)"
                    #   #   )
                    #   # ),
                    #   
                    #   fluidRow (
                    #     
                    #     column (
                    #       1,
                    #       "ob. Geschossd.",
                    #       #style = "height:35px"
                    #     ), # End column
                    #     
                    #     column (
                    #       1,
                    #       numericInput (
                    #         inputId = "Year_Refurbishment_Ceiling",
                    #         label = NULL,
                    #         value = NA,
                    #         min = 1970,
                    #         max = 2030,
                    #         #width = 500
                    #       ),
                    #     ),
                    #     
                    #     column (
                    #       2,
                    #       sliderInput (
                    #         # numericInput (
                    #         inputId = "d_Insulation_Ceiling",
                    #         label = NULL,
                    #         #label = "Dämmstärke Geschossdecke [cm]",
                    #         value = 0,
                    #         min = 0,
                    #         max = 40,
                    #         step = 1
                    #         #width = 500
                    #       ),
                    #       #style = "height:35px"
                    #     ), # End column
                    #     
                    #     column (
                    #       1,
                    #       sliderInput (
                    #         inputId = "f_Insulation_Roof",
                    #         label = NULL,
                    #         value = 0,
                    #         min = 0,
                    #         max = 1,
                    #         step = 0.2
                    #         #width = 200
                    #       ),
                    #       #style = "height:35px"
                    #     ), # End column
                    #     
                    #     style = "border: 1px dotted lightgrey"
                    #     
                    #   ), # End fluidRow
                    #   
                    #   ## Version 3 Ende                      
                    #   
                    #   
                    #   
                    #   
                    #   
                    # )             



                  )
                  
                  
                  
                ), # End Column       
                
                
              ), # End fluidRow
              
              br(),
              
              
              #### Bottom area "Selected Results" = not yet implemented -----
  
              # This bottom area can later be used to display selected calculation results.
              # The idea is to use dropdown fields to select variables.
              # Selection directly in this area or in the settings.
              # Before doing this, the height management must be improved 
              # in order to always see this area and have a similar height.
              # Introducing percentage heights for the ribbon and 
              # the sidePanel and mainpanel elements
              # does not bring the solution, the reference of the percentage seems to be the 
              # full screen height. 
              # A solution could be to include the perdentage height of the main panels 
              # in the settings or to include a buttons at the top of the bottom area to 
              # increase or reduce its height (actually reducing or increasing 
              # the height of the main panel elements)
            
  
              # fluidRow (
              #   
              #   br (),
              #   
              #   strong ("Ergebnisse"),
              #   
              #   br (),
              #   
              #   
              #   style = "background-color: white"
              #   
              # ), # End fluidRow "Ergebnisse"
              # 
              # 
              # fluidRow (
              #   column (
              #     4,
              #     br (),
              #     strong ("Jahreswerte"),
              #     #tableOutput ("Table_Result_Year"),
              #     #style = "height:800px;background-color: yellow",
              #     
              #   ),
              #   style = "background-color: white"
              # )
              
            ), # sidebarPanel
            

            #### END sidebarPanel -----
  


            #######################################################################X
            #### mainPanel START - Panel for displaying results -----
            
            
            mainPanel (
              width = 4,
              
              
              
              tabsetPanel (
                type = "tabs",
                
                #######################################################################X
                ##### tabPanel "Diagrams" START -----
                
                tabPanel (
                  "Diagramme", 

                  # Header 
                  fluidRow ( 

                    style = "background-color: white; color: black;",
                    #style = "background-color: white; color: black; text-align: center;",
                    #style = "background-color: grey; color: white; height:10px",
                    
                    column (
                      12,
                      style = "text-align: center",
                      "Energiekennwerte | aktueller Datensatz"
                    ), # End column

                  ), # End fluidRow
                  
                  # # Header 
                  # column ( 
                  #   12,
                  #   strong ("Energiebilanz"),
                  #   
                  #   style = "background-color: white; color: black; text-align: center;"
                  #   #style = "background-color: grey; color: white;",
                  #   
                  # ), # End header column
                  
                  
                  fluidRow (
                    style = "margin-top: -5px",
                    #style = "margin-top: -5px; height:25px",
                    

                    column (
                      6,
                      
                     # style = "margin-top: -0px; height:35px",
                      #style = "margin-top: -10px; padding:0",
                      
                      checkboxInput (
                        inputId = "Checkbox_ApplyCalibrationFactor",
                        label = "auf typisches Verbrauchsniveau kalibrieren",
                        value = DefaultValue_ApplyCalibrationFactor,
                        width = NULL
                      )
                    ), # End column
                    
                    # column (
                    #   6,
                    # ),
                    
                    column (
                      6,
                      
                      #style = "margin-top: -0px; height:35px",
                      #style = "margin-top: -10px; height:10px",
                      
                      checkboxInput (
                        inputId = "Checkbox_ReferToLivingSpace",
                        label = "auf Wohnflächenbezug umrechnen",
                        value = DefaultValue_ReferToLivingSpace,
                        width = NULL
                      )
                    ), # End column
                    
                    
                  ), # End fluidRow
                  
                  
                  
                                    
                  fluidRow (
                    
                    style = Style_Height_Dashboard_MainPanel,
                    #"height:75vh !important; overflow-y: scroll",
                    
                    column (
                      12,

                    
                    #br (),
                    
                    #######################################################################X
                    ###### "Diagram heat need"  -----
                    
                    fluidRow (
                      style = "height:30px;",
                      #style = "height:30px; padding:0",
                      #style = "height:30px; padding:0; width:120%", # I didn't find out the reason, why the width extension is necessary
                      
                      column (
                        4,
                        strong ("Heizwärme")
                      ), # End column
                      
                      column (
                        2,
                        style = "text-align:right",
                        "Skalierung:"
                      ),
                      
                      column (
                        6,
                        
                        
                        column (
                          2,
                          
                          fluidRow (
                            style = "margin-top: -10px",
                            #style = "height:10px; padding:0",
                            
                            checkboxInput (
                              inputId = "Checkbox_AutoScaling_ChartHeatNeed",
                              label = "auto",
                              value = Set_MaxY_Auto_ChartHeatNeed,
                              width = NULL
                            )
                          ) # End fluidRow                       
                          
                        ), # End column
                        
                        column (
                          10,
                          # style = "text-align:middle; margin-top:-5px;",
                          
                          conditionalPanel (
                            condition = "!input.Checkbox_AutoScaling_ChartHeatNeed",
                            
                            column (
                              3,
                              style = "text-align:right;",
                              "max:"
                            ),
                             
                            column (
                               9,
                               style = "margin-top:-7px;",
                               #style = "text-align:middle; margin-top:-7px;",
                               
                               numericInput (
                                 inputId = "NumericInput_MaxValue_Scale_ChartHeatNeed",
                                 label = NULL,
                                 value = y_Max_ManualInput_ChartHeatNeed,
                                 min = 0,
                                 max = 1000,
                                 step = 50,
                                 width = "70px"
                               )
                             )
                            
                          ), # end condidtional panel
                          
                          # 
                          # fluidRow (
                          #   style = "text-align:middle; margin-top: -10px; height:10px",
                          #   
                          # ), # End fluidRow
                          
                          
                          
                          
                          # actionButton (
                          #   inputId = "Do_UpsizeScale_ChartHeatNeed",
                          #   label = "+",
                          #   icon = NULL,
                          #   width = NULL,
                          #   disabled = FALSE,
                          #   style = "height:20px; width:20px; padding:0"
                          # ),
                          # 
                          # actionButton (
                          #   inputId = "Do_DownsizeScale_ChartHeatNeed",
                          #   label = "-",
                          #   icon = NULL,
                          #   width = NULL,
                          #   disabled = FALSE,
                          #   style = "height:20px; width:20px; padding:0" 
                          # ),  
                          # 
                          # textInput (
                          #   inputId = "TextInput_MaxValue_Scale_ChartHeatNeed",
                          #   label = NULL,
                          #   value = y_Max_ManualInput_ChartHeatNeed,
                          #   width = NULL
                          # ),
                          # 
                        ), # End column
                        
                        
                      ), # End column
                      
                    ), # End fluidRow
                    

                    fluidRow (
                      
                      style =   "border: 1px dotted grey; background-color: white;",                    
                      
                      echarts4rOutput (
                        outputId = "Chart_HeatNeed", 
                        height = "400px"
                      ),
                      
                      ),

                    
                    br (),
                    
                    
                    
                    
                    #######################################################################X
                    ###### "Diagram final energy"  -----
                    
                    fluidRow (
                      #style = "height:30px; padding:0; width:120%", # I didn't find out the reason, why the width extension is necessary
                      style = "height:30px;",
                      #style = "height:30px; padding:0",
                      
                      column (
                        4,
                        strong ("Endenergie")
                      ), # End column
                      
                      column (
                        2,
                        style = "text-align:right",
                        "Skalierung:"
                      ),
                      
                      column (
                        6,
                        
                        
                        column (
                          2,
                          
                          fluidRow (
                            style = "margin-top: -10px",
                            #style = "height:10px; padding:0",
                            
                            checkboxInput (
                              inputId = "Checkbox_AutoScaling_ChartFinalEnergy",
                              label = "auto",
                              value = Set_MaxY_Auto_ChartFinalEnergy,
                              width = NULL
                            )
                          ) # End fluidRow                       
                          
                        ), # End column
                        
                        column (
                          10,
                          #style = "text-align:middle; margin-top:-10px;",
                          
                          conditionalPanel (
                            condition = "!input.Checkbox_AutoScaling_ChartFinalEnergy",
                            
                            column (
                              3,
                              style = "text-align:right;",
                              "max:"
                            ),
                            
                            column(
                              9,
                              style = "margin-top:-7px;",
                              #style = "text-align:middle; margin-top:-7px;",
                              numericInput (
                                inputId = "NumericInput_MaxValue_Scale_ChartFinalEnergy",
                                label = NULL,
                                value = y_Max_ManualInput_ChartFinalEnergy,
                                min = 0,
                                max = 1000,
                                step = 50,
                                width = "70px"
                              )
                            )
                            
                            
                          ), # end condidtional panel
                          
                        ), # End column
                        
                        
                      ), # End column
                      
                    ), # End fluidRow
                    
                    
                    fluidRow (
                      
                      style =   "border: 1px dotted grey; background-color: white;",                    
                      
                      echarts4rOutput (
                        outputId = "Chart_FinalEnergy", 
                        height = "400px"
                      ),
                      
                    ),
                    
                    
                    br (),
                    
                    
                    
                    
                    #######################################################################X
                    ###### "Diagram expectation ranges"  -----
                    
                    fluidRow (
                      #style = "height:30px; padding:0; width:120%", # I didn't find out the reason, why the width extension is necessary
                      style = "height:30px;",
                      #style = "height:30px; padding:0",
                      
                      column (
                        4,
                        strong ("Erwartungsbereiche")
                      ), # End column
                      
                      column (
                        2,
                        style = "text-align:right",
                        "Skalierung:"
                      ),
                      
                      column (
                        6,
                        
                        
                        column (
                          2,
                          
                          fluidRow (
                            style = "margin-top: -10px",
                            #style = "height:10px; padding:0",
                            
                            checkboxInput (
                              inputId = "Checkbox_AutoScaling_ChartExpectationRanges",
                              label = "auto",
                              value = Set_MaxY_Auto_ChartExpectationRanges,
                              width = NULL
                            )
                          ) # End fluidRow                       
                          
                        ), # End column
                        
                        column (
                          10,
                          #style = "text-align:middle; margin-top:-10px;",
                          
                          conditionalPanel (
                            condition = "!input.Checkbox_AutoScaling_ChartExpectationRanges",
                            
                            
                            column (
                              3,
                              style = "text-align:right;",
                              "max:"
                            ),
                            
                            column (
                              9,
                              style = "margin-top:-7px;",
                              #style = "text-align:middle; margin-top:-7px;",
                              
                              numericInput (
                                inputId = "NumericInput_MaxValue_Scale_ChartExpectationRanges",
                                label = NULL,
                                value = y_Max_ManualInput_ChartExpectationRanges,
                                min = 0,
                                max = 1000,
                                step = 50,
                                width = "70px"
                              )
                              
                            )
                            
                          ), # end condidtional panel
                          
                        ), # End column
                        
                        
                      ), # End column
                      
                    ), # End fluidRow
                    
                    
                    fluidRow (
                      
                      style =   "border: 1px dotted grey; background-color: white;",                    
                      
                      echarts4rOutput (
                        outputId = "Chart_ExpectationRanges", 
                        height = "400px"
                      ),
                      
                    ),
                    
                    
                    br (),
                    
                    
                    ) # End Column
                    
                  ), # End Row
                  
                  
                ), # End TabPanel "Diagrams"
                
                
                #######################################################################X
                #####  tabPanel "Datasets input" START -----
                
                tabPanel (
                  "Eingaben", 
                  
                  # Header 
                  fluidRow ( 
                    
                    style = "background-color: white; color: black;",
                    #style = "background-color: white; color: black; text-align: center;",
                    #style = "background-color: grey; color: white; height:10px",
                    
                    column (
                      12,
                      style = "text-align: center",
                      "Daten-Tabelle 'Calc_Input' | aktueller Datensatz"
                    ), # End column
                    
                  ), # End fluidRow
                  
                  
                  fluidRow (
                    
                    style = Style_Height_Dashboard_MainPanel,
                    #"height:75vh !important; overflow-y: scroll",
                    #style = "height: 1200px; overflow-y: scroll; overflow-x: scroll;",
                    
                    column (
                      12,
                      tableOutput (
                        "Calc_Input"
                        ),
                    ),
                    # column (
                    #   12,
                    #   style = "height: 1200px;",
                    # ),
                    
                  ) # End fluidRow

                ), # End TabPanel "Datasets input"	
                
                
                
                #######################################################################X
                ##### tabPanel "Datasets output" START -----
                
                tabPanel (
                  "Ergebnisse", 
                  
                  # Header 
                  fluidRow ( 
                    
                    style = "background-color: white; color: black;",
                    #style = "background-color: white; color: black; text-align: center;",
                    #style = "background-color: grey; color: white; height:10px",
                    
                    column (
                      12,
                      style = "text-align: center",
                      "Daten-Tabelle 'Calc_Output' | aktueller Datensatz"
                    ), # End column
                    
                  ), # End fluidRow
                  
                  
                  fluidRow (
                    
                    style = Style_Height_Dashboard_MainPanel,
                    #"height:75vh !important; overflow-y: scroll",
                    #style = "height: 1200px; overflow-y: scroll;",
                    
                    column (
                      12,
                      tableOutput (
                        "Calc_Output"
                      ),
                    ),
                    # column (
                    #   12,
                    #   style = "height: 1200px;",
                    # ),
                    
                    
                  ),
                  

                  # column (
                  #   12,
                  #   tableOutput ("Calc_Output")
                  # )
                  
                ), # End TabPanel "Datasets output"	
                
                
                
                #######################################################################X
                ##### tabPanel "Interim calculation results" START -----
                
                tabPanel (
                  "Details", 
                  
                  # Header 
                  fluidRow ( 
                    
                    style = "background-color: white; color: black;",
                    #style = "background-color: white; color: black; text-align: center;",
                    #style = "background-color: grey; color: white; height:10px",
                    
                    column (
                      12,
                      style = "text-align: center",
                      "Daten-Tabelle 'Calc_InterimResults' | aktueller Datensatz"
                    ), # End column
                    
                  ), # End fluidRow
                  

                  fluidRow (
                    column (
                      12,
                      tableOutput (
                        "Calc_InterimResults"
                      ),
                    ),
                    # column (
                    #   12,
                    #   style = "height: 1200px;",
                    # ),
                    
                    
                    style = Style_Height_Dashboard_MainPanel,
                      #"height:75vh !important; overflow-y: scroll",
                    
                    #style = "overflow-y: scroll;",
                    #style = "height: 600px; overflow-y: scroll;",
                    
                  )

                  
                ), # End TabPanel "Interim calculation results"	
                
                
                
                
                #######################################################################X
                ##### tabPanel "Data for energy charts" START -----
                
                tabPanel (
                  "Energie", 
                  
                  # Header 
                  fluidRow ( 
                    
                    style = "background-color: white; color: black;",
                    #style = "background-color: white; color: black; text-align: center;",
                    #style = "background-color: grey; color: white; height:10px",
                    
                    column (
                      12,
                      style = "text-align: center",
                      "Daten-Tabelle 'Calc_ChartEnergy' | aktueller Datensatz"
                    ), # End column
                    
                  ), # End fluidRow

                  
                  fluidRow (
                    
                    style = Style_Height_Dashboard_MainPanel,
                    #"height:75vh !important; overflow-y: scroll",
                    #style = "height: 1200px; overflow-y: scroll;",
                    
                    br(),
                    br(),
                    column (
                      12,
                      strong ("Korrekturfaktor"),
                      "(nicht angewendet auf die Kennwerte unten)",
                      tableOutput (
                        "Calc_ChartEnergy_CorrectionFactors"
                      ),
                    ),
                    
                    br(),
                    
                    column (
                      12,
                      strong ("Energiemengen in kWh/(m²a)"),
                      "(Bezugsfläche: A_C_Ref)",
                      tableOutput (
                        "Calc_ChartEnergy"
                      ),
                    ),
                    # column (
                    #   12,
                    #   style = "height: 1200px;",
                    # ),
                    
                  )
                  
                  # 
                  # column (
                  #   12,
                  #   tableOutput ("Calc_ChartEnergy")
                  # )
                  
                  
                  
                ) # End TabPanel "Data for energy charts"	
                
                
                
                
                
                
              ), # End tabsetPanel
              
              
              
              
              
              # strong ("Diagramme"),
          
              
              br (),
                  
              
              # conditionalPanel (
              # 
              #   "input.ShowPlot_Temperature_1",
              # 
              
              
              # "Energiebilanz Raumheizung",
              # echarts4rOutput (
              #   outputId = "Chart_HeatNeed", 
              #   height = "400px"
              #   ),
               
               
              # plotOutput (outputId = "Chart_EnergyBalanceBuilding"  #, height = "200px"
              #             ),
                
              # 
              # ),
              # 
              # conditionalPanel (
              # 
              #   "input.ShowPlot_Temperature_1",
              # 
              

              # "Endenergie",
              # echarts4rOutput (
              #   outputId = "Chart_FinalEnergy", 
              #   height = "400px"
              # ),
              
              
              # plotOutput (outputId = "Chart_EnergyBalanceBuilding"  #, height = "200px"
              #             ),
              
              # 
              # ),
              # 
              # conditionalPanel (
              # 
              #   "input.ShowPlot_Temperature_1",
              # 

              
              # "Erwartungsbereiche",
              # echarts4rOutput (
              #   outputId = "Chart_ExpectationRanges", 
              #   height = "400px"
              # ),
              
              
              # plotOutput (outputId = "Chart_EnergyBalanceBuilding"  #, height = "200px"
              #             ),
              
              # 
              # ),
              # 
              
              
              
              
              
            ) #### END mainPanel ----
            
          ), ### END sidebarLayout ----
          
          
          # br (),
          # strong ("Klima 1 (oben) und Klima 2 (unten) / Mittel über Zeitraum"),
          # tableOutput ("Table_ClimCalc_Both"),
          # 
          # 
          # br (),
          # 
          # strong ("Klima 1"),
          # #tableOutput ("Table_HDD_Compact_1"),
          # tableOutput ("Table_ClimCalc_1"),
          # tableOutput ("Table_Evaluation_1"),
          # tableOutput ("Table_StationInfo_1"),
          # tableOutput ("Table_FunctionArguments_1"),
          # #tableOutput ("Table_OutputStructure_1"),
          # 
          # 
          # br (),
          # 
          # strong ("Klima 2"),
          # #tableOutput ("Table_HDD_Compact_2"),
          # tableOutput ("Table_ClimCalc_2"),
          # tableOutput ("Table_Evaluation_2"),
          # tableOutput ("Table_StationInfo_2"),
          # tableOutput ("Table_FunctionArguments_2"),
          # #tableOutput ("Table_OutputStructure_2"),
          # 
          # textOutput ("Text_SelectedInput"),
          # #verbatimTextOutput ("Text_SelectedInput")
          
          
        ) # End fluid page
      
     # ) # End fillPage  # 2025-05-09 versuchsweise abgeschaltet
        
      ), # End tabItem "Tab_Dashboard"
      


#######################################################################X
## tabItem "Tab_Comparison"  -----

shinydashboard::tabItem (
  
  tabName = "Tab_Comparison",
  
  
  
  # fluidRow (
  #   
  #   column (
  #     6,
  #     
  #     style =   "border: 1px dotted grey; background-color: white;",                    
  #     
  #     echarts4rOutput (
  #       outputId = "Chart_CompareHeatNeed", 
  #       height = "800px"
  #     )
  #     
  #   ), # End column
  #   
  # 
  #   column (
  #     6,
  #     
  #     style =   "border: 1px dotted grey; background-color: white;",                    
  #     
  #     echarts4rOutput (
  #       outputId = "Chart_CompareFinalEnergy", 
  #       height = "800px"
  #     )
  #     
  #   ) # End column
  #   
  #   
  #   
  #   
  # ), # end fluidRow
  
  

  sidebarLayout (


    ### Sidebar (left area of sidebarLayout) -----


    mainPanel (
    #sidebarPanel (
      width = 6,


      tabsetPanel (
        type = "tabs",


        #######################################################################X
        ## tabItem "Floor area related heat need"

        tabPanel (

          strong ("Heizwärme"),

          fluidRow (

            #style = Style_Height_Dashboard_MainPanel,

            column (
              12,


              #######################################################################X
              ###### "Diagram compare heat need"  -----

              fluidRow (
                style = "background-color: white; color: black; text-align: center;",

                column (
                  12,
                  strong ("flächenbezogener Heizwärmebedarf"),
                ),


              ), # End fluidRow

              #br (),

              
              
              fluidRow (
                style = "margin-top: -5px; height:25px",
                
                column (
                  6,
                  
                  checkboxInput (
                    inputId = "Checkbox_ApplyCalibrationFactor_ChartCompareLeft",
                    label = "auf typisches Verbrauchsniveau kalibrieren",
                    value = FALSE,
                    width = NULL
                  )
                ), # End column

                                
                column (
                  6,
                  
                  #style = "margin-top: -0px; height:35px",
                  #style = "margin-top: -10px; height:10px",
                  
                  checkboxInput (
                    inputId = "Checkbox_ReferToLivingSpace_ChartCompareLeft",
                    label = "auf Wohnflächenbezug umrechnen",
                    value = FALSE,
                    width = NULL
                  )
                ), # End column
                
                
              ), # End fluidRow
              
              
              
              fluidRow (

                column (
                  12,

                  style =   "border: 1px dotted grey; background-color: white;",

                  echarts4rOutput (
                    outputId = "Chart_CompareHeatNeed",
                    height = paste0 (Height_ChartCompareLeft, "px") #"600px"
                  )

                ) # End column

              ), # end fluidRow

              
              br (),
              
              
              fluidRow (
                style = "height:30px;",

                ## I did not find a method to apply this
                #                  
                # column (
                #   2,
                #   style = "text-align:right",
                #   "Diagrammhöhe:"
                # ),
                # 
                # column (
                #   2,
                #   style = "margin-top:-7px;",
                # 
                #   numericInput (
                #     inputId = "NumericInput_Height_ChartCompareLeft",
                #     label = NULL,
                #     value = Height_ChartCompare_Default,
                #     min = 0,
                #     max = 1000,
                #     step = 50,
                #     width = "70px"
                #   )
                #   
                # ), # End column
                
                column (
                  2,
                  style = "text-align:right",
                  "Skalierung:"
                ),
                
                
                column (
                  6,
                  
                  
                  column (
                    2,
                    
                    fluidRow (
                      style = "margin-top: -10px",
                      #style = "height:10px; padding:0",
                      
                      checkboxInput (
                        inputId = "Checkbox_AutoScaling_ChartCompareLeft",
                        label = "auto",
                        value = Set_MaxY_Auto_ChartCompareLeft,
                        width = NULL
                      )
                      
                    ) # End fluidRow                       
                    
                  ), # End column
                  
                  column (
                    10,
                    # style = "text-align:middle; margin-top:-5px;",
                    
                    conditionalPanel (
                      condition = "!input.Checkbox_AutoScaling_ChartCompareLeft",
                      
                      column (
                        3,
                        style = "text-align:right;",
                        "max:"
                      ),
                      
                      column (
                        9,
                        style = "margin-top:-7px;",
                        #style = "text-align:middle; margin-top:-7px;",
                        
                        numericInput (
                          inputId = "NumericInput_MaxValue_Scale_ChartCompareLeft",
                          label = NULL,
                          value = y_Max_ManualInput_ChartCompareLeft,
                          min = 0,
                          max = 1000,
                          step = 50,
                          width = "70px"
                        )
                      )
                      
                    ), # end condidtional panel
                    
                    
                  ), # End column
                  
                  
                ), # End column
                
                column (
                  6,
                  
                )
                
                
              ), # End fluidRow
              
              

            ) # End column

          ), # End fluidRow


        ) # End tabPanel


      ) # End tabSetPanel



      # tabsetPanel (
      #   type = "tabs",
      #
      #
      #   #######################################################################X
      #   ## tabItem "Energy need for heating"
      #
      #   tabPanel (
      #
      #     strong ("Heizwärmebedarf"),
      #
      #     fluidRow (
      #
      #       style = Style_Height_Dashboard_MainPanel,
      #
      #       column (
      #         12,
      #
      #
      #         br (),
      #       ) # End column
      #
      #     ) # End fluidRow
      #
      #   ) # End tabPanel
      #
      #
      #
      # ) # End tabSetPanel





    ), # End left mainPanel

    
    
    mainPanel (
      width = 6,

      
      tabsetPanel (
        type = "tabs",
        
        
        #######################################################################X
        ## tabItem "Floor area related final energy demand"
        
        tabPanel (
          
          strong ("Endenergie"),
          
          fluidRow (
            
            #style = Style_Height_Dashboard_MainPanel,
            
            column (
              12,
              
              
              #######################################################################X
              ###### "Diagram compare final energy"  -----
              
              fluidRow (
                style = "background-color: white; color: black; text-align: center;",
                
                column (
                  12,
                  strong ("flächenbezogener Endenergiebedarf"),
                ),
                
                
              ), # End fluidRow
              
              #br (),
              
              fluidRow (
                style = "margin-top: -5px; height:25px",
                
                column (
                  6,
                  
                  checkboxInput (
                    inputId = "Checkbox_ApplyCalibrationFactor_ChartCompareRight",
                    label = "auf typisches Verbrauchsniveau kalibrieren",
                    value = FALSE,
                    width = NULL
                  )
                ), # End column
                
                
                column (
                  6,
                  
                  #style = "margin-top: -0px; height:35px",
                  #style = "margin-top: -10px; height:10px",
                  
                  checkboxInput (
                    inputId = "Checkbox_ReferToLivingSpace_ChartCompareRight",
                    label = "auf Wohnflächenbezug umrechnen",
                    value = FALSE,
                    width = NULL
                  )
                ), # End column
                
                
              ), # End fluidRow
              
              
              
              fluidRow (
                
                column (
                  12,
                  
                  style =   "border: 1px dotted grey; background-color: white;",
                  
                  echarts4rOutput (
                    outputId = "Chart_CompareFinalEnergy",
                    height = Height_ChartCompare_Default #"600px"
                  )
                  
                ) # End column
                
              ), # end fluidRow
              
              br (),
              
              
              fluidRow (
                style = "height:30px;",
                

                column (
                  2,
                  style = "text-align:right",
                  "Skalierung:"
                ),
                
                
                column (
                  6,
                  
                  
                  column (
                    2,
                    
                    fluidRow (
                      style = "margin-top: -10px",
                      #style = "height:10px; padding:0",
                      
                      checkboxInput (
                        inputId = "Checkbox_AutoScaling_ChartCompareRight",
                        label = "auto",
                        value = Set_MaxY_Auto_ChartCompareRight,
                        width = NULL
                      )
                      
                    ) # End fluidRow                       
                    
                  ), # End column
                  
                  column (
                    10,
                    # style = "text-align:middle; margin-top:-5px;",
                    
                    conditionalPanel (
                      condition = "!input.Checkbox_AutoScaling_ChartCompareRight",
                      
                      column (
                        3,
                        style = "text-align:right;",
                        "max:"
                      ),
                      
                      column (
                        9,
                        style = "margin-top:-7px;",
                        #style = "text-align:middle; margin-top:-7px;",
                        
                        numericInput (
                          inputId = "NumericInput_MaxValue_Scale_ChartCompareRight",
                          label = NULL,
                          value = y_Max_ManualInput_ChartCompareRight,
                          min = 0,
                          max = 1000,
                          step = 50,
                          width = "70px"
                        )
                      )
                      
                    ), # end condidtional panel
                    
                    
                  ), # End column
                  
                  
                ), # End column
                
                column (
                  6,
                  
                )
                
                
              ), # End fluidRow
              

              
              
              
            ) # End column
            
          ), # End fluidRow

        ) # End tabPanel

        
      ) # End tabSetPanel

      
    ), # End main panel
  ) # End sideBarLayout
  
  
  
), # End tabItem


      
      #######################################################################X
      ## tabItem "Tab_Data"  -----
      
      shinydashboard::tabItem (
        
        tabName = "Tab_Data",
        
        #h2("Daten-Interface"),
        
        
        fluidPage (
          
          #titlePanel ("Daten-Tabellen"),
          
          tabsetPanel (
            selected = 2, 
            type = "tabs",


            
            #######################################################################X
            #### > tabPanel 1 Stack_Input ----
            
            tabPanel (
              
              strong ("'Stack_Input'"), 
              value = 1,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Stack_Input' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"

                ), # End header column
                
                # br (),
                # br (),
                
              ), # End fluidRow

              # fluidRow (
              #   
              #   column (
              #     3,
              # 
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              # 
              # ), # End fluidRow
              # 
              # br (),
              
              column (
                12,

                fluidRow (

                  checkboxInput(
                    inputId =  "TransposeOutputTable_Stack_Input",
                    label = "Zeilen und Spalten vertauschen",
                    value = FALSE,
                    width = NULL
                  ),
                  
                  DT::DTOutput (
                    "myOutputTable_Stack_Input",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ) # End column

            ), # End tabPanel "Stack_Input"
            
            
            
            #######################################################################X
            #### > tabPanel 2 Stack_Output ----
            
            tabPanel (
              
              strong ("'Stack_Output'"), 
              value = 2,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Stack_Output' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                br (),
                br (),
                
              ), # End fluidRow
              
              fluidRow (
                

                #br (),
                
                column (
                  2,

                  actionButton (
                    inputId = "Button_CalculateStack",
                    label = "Gesamten Stack neu berechnen"
                  )

                ), # End column
                
                column (
                  4,
                  
                  actionButton (
                    inputId = "Button_CalculateStack_IncludeTargetActualComparison",
                    label = "Gesamten Stack inkl. V/B-Vergleich berechnen (lange Rechenzeit!)"
                  )
                  
                ), # End column
                
                column (
                  6,
                  
                  "Hinweis: Der Verbrauch/Bedarf-Vergleich ist in der Einzelberechnung derzeit nicht enhalten (geht nur im Stack).",
                  br (),
                  "Datensätze mit Verbrauchsdaten müssen über den Daten-Import in den Stack geladen werden.",
                  

                ), # End column
                
                
                style =   "border: 7px solid lightblue; background-color: lightblue"
                
              ), # End fluidRow
              
              br (),
              
              column (
                12,
                
                fluidRow (
                  
                  checkboxInput(
                    inputId =  "TransposeOutputTable_Stack_Output",
                    label = "Zeilen und Spalten vertauschen",
                    value = FALSE,
                    width = NULL
                  ),
                  
                  DT::DTOutput (
                    "myOutputTable_Stack_Output",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ) # End column
              
            ), # End tabPanel "Stack_Output"
            
            
            
            
            #######################################################################X
            #### > tabPanel 3 Stack_ChartEnergyData ----
            
            tabPanel (
              
              strong ("'Stack_ChartEnergyData'"), 
              value = 3,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Stack_ChartEnergyData' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                # br (),
                # br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              column (
                12,
                
                fluidRow (
                  
                  checkboxInput(
                    inputId =  "TransposeOutputTable_Stack_ChartEnergyData",
                    label = "Zeilen und Spalten vertauschen",
                    value = FALSE,
                    width = NULL
                  ),
                  
                  DT::DTOutput (
                    "myOutputTable_Stack_ChartEnergyData",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ) # End column
              
            ), # End tabPanel "Stack_ChartEnergyData"
            
            
            
            
            #######################################################################X
            #### > tabPanel 4 Stack_InterimResults ----
            
            tabPanel (
              
              strong ("'Stack_InterimResults'"), 
              value = 4,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Stack_InterimResults' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                #br (),
                #br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              column (
                12,
                
                fluidRow (
                  
                  checkboxInput(
                    inputId =  "TransposeOutputTable_Stack_InterimResults",
                    label = "Zeilen und Spalten in der Ansicht vertauschen",
                    value = FALSE,
                    width = NULL
                  ),
                  
                  DT::DTOutput (
                    "myOutputTable_Stack_InterimResults",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ) # End column
              
            ), # End tabPanel "Stack_InterimResults"
            
            
            
            
            
            
            
            #######################################################################X
            #### > tabPanel 5 Calc_Input ----
            
            tabPanel (
              
              strong ("'Calc_Input'"), 
              value = 5,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Calc_Input' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                # br (),
                # br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              column (
                3,
              ),
              
              
              column (
                6,
                
                fluidRow (
                  
                  # checkboxInput(
                  #   inputId =  "TransposeOutputTable_Calc_Input",
                  #   label = "Zeilen und Spalten vertauschen",
                  #   value = TRUE,
                  #   width = NULL
                  # ),
                  
                  DT::DTOutput (
                    "myOutputTable_Calc_Input",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ), # End column
              
              column (
                3,
              )
              
              
            ), # End tabPanel "Calc_Input"
            
            
            
            #######################################################################X
            #### > tabPanel 6 Calc_Output ----
            
            tabPanel (
              
              strong ("'Calc_Output'"), 
              value = 6,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Calc_Output' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                # br (),
                # br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              
              column (
                3,
              ),
              
              column (
                6,
                
                fluidRow (
                  
                  # checkboxInput(
                  #   inputId =  "TransposeOutputTable_Calc_Output",
                  #   label = "Zeilen und Spalten vertauschen",
                  #   value = TRUE,
                  #   width = NULL
                  # ),
                  
                  DT::DTOutput (
                    "myOutputTable_Calc_Output",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ), # End column
              
              column (
                3,
              )
              
              
            ), # End tabPanel "Calc_Output"
            
            
            
            
            
            
            #######################################################################X
            #### > tabPanel 7 Calc_ChartEnergyData ----
            
            tabPanel (
              
              strong ("'Calc_ChartEnergyData'"), 
              value = 7,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Calc_ChartEnergyData' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                # br (),
                # br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              column (
                3,
              ),
              
              column (
                6,
                
                fluidRow (
                  
                  # checkboxInput(
                  #   inputId =  "TransposeOutputTable_Calc_ChartEnergyData",
                  #   label = "Zeilen und Spalten vertauschen",
                  #   value = TRUE,
                  #   width = NULL
                  # ),
                  
                  DT::DTOutput (
                    "myOutputTable_Calc_ChartEnergyData",
                    #width = "40%",
                    #height = 600,
                    fill = FALSE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ), # End column
              
              column (
                3,
              )
              
              
            ), # End tabPanel "Calc_ChartEnergyData"
            
            
            
            
            #######################################################################X
            #### > tabPanel 8 Calc_InterimResults ----
            
            tabPanel (
              
              strong ("'Calc_InterimResults'"), 
              value = 8,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Datentabelle 'Calc_InterimResults' - Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  
                ), # End header column
                
                #br (),
                #br (),
                
              ), # End fluidRow
              
              # fluidRow (
              #   
              #   column (
              #     3,
              #     
              #     
              #   ), # End column
              #   
              #   style =   "border: 7px solid lightblue; background-color: lightblue"
              #   
              # ), # End fluidRow
              
              #br (),
              
              column (
                3,
              ),
              
              
              column (
                6,
                
                fluidRow (
                  
                  # checkboxInput(
                  #   inputId =  "TransposeOutputTable_Calc_InterimResults",
                  #   label = "Zeilen und Spalten in der Ansicht vertauschen",
                  #   value = TRUE,
                  #   width = NULL
                  # ),
                  
                  DT::DTOutput (
                    "myOutputTable_Calc_InterimResults",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                ) # End fluidRow
                
              ), # End column
              
              column (
                3,
              )
              
              
            ), # End tabPanel "Calc_InterimResults"
            
            
            
            
            
                        
            #######################################################################X
            #### > tabPanel 9 Selectable ----

            tabPanel (
              
              strong ("Auswahl"), 
              value = 9,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Daten-Ansicht und -Export"),
                  style = "background-color: white; color: black; text-align: center;"
                  #style = "background-color: grey; color: white;",
                  #style = "background-color: orange",
                  
                ), # End header column
                
                br (),
                br (),
                
              ), # End fluidRow
              
              
              fluidRow (
                
                column (
                  3,
                  
                  
                  selectInput (
                    inputId = "myOutputSelection",
                    label = "Wähle eine Input- oder Output-Tabelle:",
                    choices = c(
                      
                      "Calc_Input",
                      "Calc_Output",
                      "Calc_ChartEnergy",
                      "Calc_InterimResults",
                      "Stack_Input",
                      "Stack_Output"
                      
                      # "ResultTable_Year",
                      # "DF_ClimCalc_1",
                      # "DF_ClimCalc_2",
                      # "DF_ClimCalc_Both",
                      # "DF_Evaluation_1",
                      # "DF_Evaluation_2",
                      # "DF_EvaluationByYear_1",
                      # "DF_EvaluationByYear_2"
                      # # "Data.TA.HD"
                    ),
                    
                    selected = "Stack_Output"

                  ),
                  
                  # # Button
                  # downloadButton (
                  #   outputId = "downloadData",
                  #   class = "Download",
                  #   icon = shiny::icon("download")
                  # )
                  
                  
                ), # End column
                
                # column (
                #   3,
                #   
                #   actionButton (
                #     inputId = "Button_CalculateStack",
                #     label = strong ("Gesamten Stack neu berechnen")
                #   )
                #   
                # ), # End column
                
                
                style =   "border: 7px solid lightblue; background-color: lightblue"
                
                
              ), # End fluidRow
              
              #br (),
              
              column (
                12,
                
                
                fluidRow (
                  
                  
                  # ## 2025-05-09 ausprobiert und wieder abgeschaltet 
                  #           
                  # ## CSS doubleScroll (2025-05-09)
                  # 
                  # # The following lines provide a scrollbar at the top and at the bottom of a large table 
                  # # The CSS is defined above
                  # # Source: https://stackoverflow.com/questions/62703411/r-shiny-table-with-horizontal-scrollbar-both-at-the-top-and-at-the-bottom
                  # 
                  # tags$head(
                  #   tags$script(src = "jquery.doubleScroll.js"),
                  #   tags$script(HTML(js)),
                  #   tags$style(HTML(CSS))
                  # ),
                  # br(),

                                    
                  checkboxInput(
                    inputId =  "TransposeOutputTable_Selectable",
                    label = "Zeilen und Spalten in der Ansicht vertauschen",
                    value = FALSE,
                    width = NULL
                  ),

                  
                  DT::DTOutput (
                    "myOutputTable_Selectable",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                  
                  # box (
                  #   width = 12,
                  #   collapsible = TRUE,
                  # 
                  #   title = "Ausgabe-Box",
                  # 
                  #   div (
                  #     style = 'overflow-x: scroll; overflow-y: scroll',
                  #     DT::DTOutput ("myOutputTable_Selectable")
                  #     ),
                  # 
                  #   #style = "overflow-x: scroll"
                  # 
                  # )
                  
                  
                  # tableOutput (
                  #   "myOutputTable_Selectable"
                  # )
                  
                ) # End fluidRow
                
              ) # End column

            ), # End tabPanel Selectable
            
            
            
            #######################################################################X
            #### > tabPanel 10 Data import ----
            
            
            tabPanel (
              
              strong ("Daten-Import"), 
              value = 10,
              
              fluidRow (
                
                #br (),
                
                # Header 
                column ( 
                  12,
                  strong ("Hochladen von Eingangsdatensätzen in den Stack"),
                  style = "background-color: white; color: black; text-align: center;"
                  #style = "background-color: grey; color: white;",
                  #style = "background-color: orange",
                  
                ), # End header column
                
                br (),
                br (),
                
              ), # End fluidRow
              
              fluidRow (
                
                br (),
                
                column (
                  4,
                  
                  fileInput (
                    'ImportFile', 
                    'Excel-Import: Bitte xlsx-Datei-Auswählen',
                    accept = c(".xlsx")
                  ),
                  
                ), # End column
                
                column (
                  4,
                  strong ("Importierte Input-Daten in den Stack übertragen"),
                  actionButton (
                    inputId = "Button_TransferImportToStack",
                    label = "In die Tabelle 'Stack_Input' Übertragen"
                  ),
                  
                  checkboxInput(
                    inputId =  "Checkbox_KeepExistingDatasets",
                    label = "vorhandene Datensätze bleiben erhalten",
                    value = TRUE,
                    width = NULL
                  ),
                  
                  

                ), # End column

                style =   "border: 7px solid lightblue; background-color: lightblue",
                
                #style = "background-color: white;"
                
              ), # End fluidRow
              
              
              fluidRow (
                
                column (
                  12,
                  
                  
                  checkboxInput(
                    inputId =  "TransposeImportTable",
                    label = "Zeilen und Spalten in der Ansicht vertauschen",
                    value = TRUE,
                    width = NULL
                    
                  ),
                  
                  
                  DT::DTOutput (
                    "myImportTable",
                    #height = 600,
                    fill = TRUE # FALSE doesn't change the appearance
                  ),
                  
                  style = "overflow-x: scroll;"
                  
                  
                  
                  
                ) # End column
                
                
                
              ) # End fluidRow
              
            ) # End tabPanel
            
          ), # End tabsetPanel
          
          
          
          

          
          
        ) # End fluid page
        
        
        
        
      ), # End tabItem "Tab_Data" 
      




      #######################################################################X
      ## tabItem "Tab_Expert"  -----
      



      shinydashboard::tabItem (

        tabName = "Tab_Expert",

        h2 ("Expertenbereich"),


        fluidPage (
          # p("The time is ", textOutput("current_time", inline=TRUE)),
          # hr(),





          ## Selection of building datasets from pool for calculation stack  -----

          fluidRow (


            column (
              4,
              "Datensatz aus der MOBASY-Gebäudedatenbank"
            ),

            column (
              4,
              selectizeInput (
                inputId = "ID_Dataset_Pool",
                label = NULL,
                # label   = "Jahr",
                choices = SelectionList_ID_Pool_Initialise, # MobasyBuildingData::Data_Output$ID_Dataset ,
                selected = ID_Pool_Initialise, # "Example.01",
                multiple = TRUE,
                width = 500
              ),
              #style = "height:35px"
            ),

            column (
              4,
              actionButton ("Button_Pool_AddToStack", "Add selected dataset to calculation stack")
            ),



            style = "border: 1px dotted lightgrey"


          ),


          ## Selection of building datasets from calculation stack for energy performance calculation -----

          fluidRow (

            column (
              4,
              "Datensatz vom Calculation stack"
            ),

            column (
              4,
              selectInput (
                inputId = "SelectInput_ID_Dataset_Stack_2",
                label = NULL,
                # label   = "Jahr",
                choices = SelectionList_ID_Stack_Initialise,
                                   # MobasyBuildingData::Data_Output$ID_Dataset ,
                #choices = c (1995:2023),
                selected = ID_Stack_Initialise, # ID_Dataset_Initialise_Stack,  # "Example.01",
                width = 500
              ),
              style = "height:35px"
            ),

            column (
              4,
              actionButton ("Button_Calculate", "Calculate selected dataset")
            ),

            #input_task_button("Do_PushToStack", "Push to calculation stack"),
            #input_task_button("Do_AddToStack",  "Add to calculation stack"),


            # column (
            #   7,
            #   "Energiebezugsfläche"
            # ),
            #
            # column (
            #   5,
            #   textOutput("A_C_Ref"),
            #   style = "height:35px"
            # ),

            style = "border: 1px dotted lightgrey"

          ), # End fluidRow

          fluidRow (



            # column (
            #   4,
            #   actionButton ("Button_AddToStack", "Add current dataset to calculation stack / step 1")
            # ),
            # column (
            #   4,
            #   actionButton ("Button_FlexibleAction", "Add current dataset to calculation stack / step 2")
            # ),
            # column (
            #   4,
            #   actionButton ("Button_SaveToStack", "Save current dataset to calculation stack")
            # )

          ), # End fluidRow


          fluidRow(

            column (
              8,
              "Test"
            ),

            column (
              4,
              actionButton ("Button_Edit_CalcStack", "Edit values of calculation stack")
            ),

          ),


          fluidRow (
            "Data Editor",
            column (
              12,
              DT::dataTableOutput ('MyDataTable'),
              style = "overflow-x: scroll;"
              #style = "overflow-y: scroll;overflow-x: scroll;"

            )
          ),

          fluidRow (
            column (
              12,
              "Data Viewer",



              # ## 2025-05-09 ausprobiert und wieder abgeschaltet
              #
              # ## CSS doubleScroll (2025-05-09)
              #
              # # The following lines provide a scrollbar at the top and at the bottom of a large table
              # # The CSS is defined above
              # # Source: https://stackoverflow.com/questions/62703411/r-shiny-table-with-horizontal-scrollbar-both-at-the-top-and-at-the-bottom
              #
              # tags$head(
              #   tags$script(src = "jquery.doubleScroll.js"),
              #   tags$script(HTML(js)),
              #   tags$style(HTML(CSS))
              # ),
              # br(),




              tableOutput ("Stack_Input"),

              tableOutput ("Stack_Output"),

              tableOutput ("Stack_ChartEnergy"),

              style = "overflow-x: scroll;"
              #style = "overflow-x: scroll; overflow-y: scroll;" doesn't work
            ),

            style = "overflow-y: scroll;"
          ),




# Das musste ich hier abschalten, weil es nur einmal ausgegeben werden kann, jetzt im Dashboard

          # fluidRow (
          #   column (
          #     4,
          #     tableOutput ("Calc_Input")
          #   ),
          #   column (
          #     4,
          #     tableOutput ("Calc_Output")
          #   ),
          #   column (
          #     4,
          #     tableOutput ("Calc_ChartEnergy")
          #   )
          # ) # End fluidRow







          # tableOutput ("Stack_Input"),
          # tableOutput ("Stack_Output")

          #tableOutput ("ResultTable_1")





          # numericInput("x", "x", value = 1),
          # numericInput("y", "y", value = 2),
          # input_task_button("btn", "Add numbers"),
          # textOutput("sum")


        ) # End fluid page




      ) # End tabItem "Tab_Expert"
      
      
    ) # End tabItems
    
  ) # End dashboardBody
  
) # End dashboardPage
























# bis 30.08.2024 13:11
#
# ui <- page_fluid (
#   # p("The time is ", textOutput("current_time", inline=TRUE)),
#   # hr(),
#   
#   
#   
# 
#   ## Selection of building datasets from pool for calculation stack  -----
#   
#   fluidRow (
#     
#     
#     column (
#       4,
#       "Datensatz aus der MOBASY-Gebäudedatenbank"
#     ),
#     
#     column (
#       4,
#       selectInput (
#         inputId = "ID_Dataset_Pool",
#         label = NULL,
#         # label   = "Jahr",
#         choices = SelectionList_ID_Pool_Initialise, # MobasyBuildingData::Data_Output$ID_Dataset ,
#         selected = ID_Pool_Initialise, # "Example.01",
#         width = 500
#       ),
#       style = "height:35px"
#     ),
#     
#     column (
#       4,
#       actionButton ("Button_Pool_AddToStack", "Add selected dataset to calculation stack")
#     ),
#     
# 
# 
#     style = "border: 1px dotted lightgrey"
#     
#     
#   ),
#   
#   
#   ## Selection of building datasets from calculation stack for energy performance calculation -----
#   
#   fluidRow (
# 
#     column (
#       4,
#       "Datensatz vom Calculation stack"
#     ),
#     
#     column (
#       4,
#       selectInput (
#         inputId = "SelectInput_ID_Dataset_Stack",
#         label = NULL,
#         # label   = "Jahr",
#         choices = SelectionList_ID_Stack_Initialise, # MobasyBuildingData::Data_Output$ID_Dataset ,
#         #choices = c (1995:2023),
#         selected = ID_Stack_Initialise, # ID_Dataset_Initialise_Stack,  # "Example.01",
#         width = 500
#       ),
#       style = "height:35px"
#     ),
#     
#     column (
#       4,
#       actionButton ("Button_Calculate", "Calculate selected dataset")
#     ),
#     
#     #input_task_button("Do_PushToStack", "Push to calculation stack"),
#     #input_task_button("Do_AddToStack",  "Add to calculation stack"),
#     
#     
#     # column (
#     #   7,
#     #   "Energiebezugsfläche"
#     # ),
#     # 
#     # column (
#     #   5,
#     #   textOutput("A_C_Ref"),
#     #   style = "height:35px"
#     # ),
#     
#     style = "border: 1px dotted lightgrey"
#     
#   ), # End fluidRow
#   
#   fluidRow (
# 
#     
#         
#     # column (
#     #   4,
#     #   actionButton ("Button_AddToStack", "Add current dataset to calculation stack / step 1")
#     # ),
#     # column (
#     #   4,
#     #   actionButton ("Button_FlexibleAction", "Add current dataset to calculation stack / step 2")
#     # ),
#     # column (
#     #   4,
#     #   actionButton ("Button_SaveToStack", "Save current dataset to calculation stack")
#     # )
#     
#   ), # End fluidRow
#   
# 
#   fluidRow(
# 
#     column (
#       8,
#       "Test"
#     ),
# 
#     column (
#       4,
#       actionButton ("Button_Edit_CalcStack", "Edit values of calculation stack")
#     ),
#     
#     "Data Editor",
#     DT::dataTableOutput ('MyDataTable')
#     
#   ),
#   
#   
#   
#   tableOutput ("Stack_Input"),
#   tableOutput ("Stack_Output"),
#   
#   
#   
#   
#   
#   
# fluidRow (
#   column (
#     6,
#     tableOutput ("Calc_Input")
#   ),
#   column (
#     6,
#     tableOutput ("Calc_Output")
#   )
# ) # End fluidRow
#   
#   
#     
#   # tableOutput ("Stack_Input"),
#   # tableOutput ("Stack_Output")
#   
#   #tableOutput ("ResultTable_1")
#   
#   
#   
#   
#   
#   # numericInput("x", "x", value = 1),
#   # numericInput("y", "y", value = 2),
#   # input_task_button("btn", "Add numbers"),
#   # textOutput("sum")
#   
#   
# )


#_ -----


#####################################################################################X
## SERVER FUNCTION -----
#####################################################################################X

server <- function (input, output, session) {
  
  
  #####################################################################################X
  ## Initialisation -----
  
  session$allowReconnect (TRUE) 

  #js$backgroundCol ("TextInput_Index_Stack","ivory") # Currently not an input field.
  js$backgroundCol ("TextInput_ID_Calc","ivory") 

  js$backgroundCol (List_UI_InputFields_Text [1],"ivory") 
  js$backgroundCol (List_UI_InputFields_Text [2],"ivory") 
  js$backgroundCol (List_UI_InputFields_Text [3],"ivory") 
  js$backgroundCol (List_UI_InputFields_Text [4],"ivory") 
  
  js$backgroundCol (List_UI_InputFields_Numeric [1],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [2],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [3],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [4],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [5],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [6],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [7],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [8],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [9],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [10],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [11],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [12],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [13],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [14],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [15],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [16],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [17],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [18],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [19],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric [20],"ivory") 
  
  
  js$backgroundCol (List_UI_InputFields_Numeric_Percent [1],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric_Percent [2],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric_Percent [3],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric_Percent [4],"ivory") 
  js$backgroundCol (List_UI_InputFields_Numeric_Percent [5],"ivory") 

  js$backgroundCol ("NumericInput_MaxValue_Scale_ChartHeatNeed","transparent")
  js$backgroundCol ("NumericInput_MaxValue_Scale_ChartFinalEnergy","transparent")
  js$backgroundCol ("NumericInput_MaxValue_Scale_ChartExpectationRanges","transparent")
  
  # js$backgroundCol ("NumericInput_MaxValue_Scale_ChartHeatNeed","ivory")
  # js$backgroundCol ("NumericInput_MaxValue_Scale_ChartFinalEnergy","ivory")
  # js$backgroundCol ("NumericInput_MaxValue_Scale_ChartExpectationRanges","ivory")
  
  
  
  
  #myImportDataframe  <- reactive ({ c(c(NA,NA),c(NA,NA)) })
  
  
  #####################################################################################X
  ## Prepare the building data pool -----

  # Preparation of the building data pool that is used as template and as source for the calculation stack  
  # The resulting dataframes are DF_Pool_Input and DF_Pool_Output.
    
  TabulaTables <- reactive ({
    MobasyModel::GetParameterTables_RDataPackage ()
  })

  MobasyBuildingDataTables <- reactive ({
      MobasyModel::GetBuildingData_RDataPackage (
        myFilterName = "All"
        #myFilterName = "EnergyProfileShinyApp"
        #myFilterName = "Typology-DE_Example-Buildings"
        #myFilterName = "Examples"
        #      myFilterName = "WebTool"
      )
  })
  # [input$SelectInput_ID_Dataset_Stack]

#   # 2025-03-21
#   # vorübergehende Änderung, da bei derzeitigem MobasyModel-Skript 
#   # die gleichen Code-Teile "MOBASY" und "Gen" bei Fenstern und bei opaken Elementen 
#   # vorhanden sein müssen. In EnergyProfile.xlsm habe ich die Fenster auf "Mobasy.Gen" 
#   # fixiert (kein Eingabefeld für Fenster-Datensatz-Gruppe). Um keine Änderung an der 
#   # Datenstruktur (zusätzliche Eingabe) vornehmen zu müssen, wäre es aber besser, 
#   # doch bei der identischen Bezeichnung zu bleiben und einfach die Fenster-Datensätze 
#   # zu kopieren.   
#   # 
#   # nächste Schritte:
#   # (1) Änderung vom 20.03.2025 in EnergyProfile.xlsm rückgängig machen 
#   # (für Fenster wird wieder Code_U_Class_National benutzt, Fixierung auf "MOBASY" wird aufgehoben)
#   # (2) in tabula-values.xlsx Fenster kopieren und mit "Gen" bezeichnen
#   # (3) außerdem bei der Gelegenheit: REWOTY-Datensätze anlegen
# 
#   data.frame (MobasyBuildingDataTables () ["Data_Input"]) () ["Code_U_Class_National"] <- reactive({
#   "MOBASY"
# })
#   
  
  DF_Pool_Input_Prep1 <- reactive ({
    RemoveStringFromDFColNames (
      myDataFrame = data.frame (MobasyBuildingDataTables () ["Data_Input"]),
      myStringToRemove = "Data_Input.")
  })
  
  DF_Pool_Input_Prep2 <- reactive ({
    as.data.frame (
      cbind (
        data.frame (DF_Pool_Input_Prep1 () [ , 1]),
        data.frame (DF_Pool_Input_Prep1 ())
      )
    )
  })
  
  DF_Pool_Input <- reactive ({
    SetDFColNames (
      myDataFrame = DF_Pool_Input_Prep2 (), 
      myColNames = c (
        "ID_Stack", 
        colnames (
          as.data.frame (
            DF_Pool_Input_Prep1 ()
          )
        )
      )
    )
  })
      

  DF_Pool_Output_Prep1 <- reactive ({
    RemoveStringFromDFColNames (
      myDataFrame = data.frame (MobasyBuildingDataTables () ["Data_Output"]),
      myStringToRemove = "Data_Output.")
  })
  
  DF_Pool_Output_Prep2 <- reactive ({
    as.data.frame (
      cbind (
        data.frame (DF_Pool_Output_Prep1 () [ , 1]),
        data.frame (DF_Pool_Output_Prep1 ())
      )
    )
  })
  
  DF_Pool_Output_Prep3 <- reactive ({
    SetDFColNames (
      myDataFrame = DF_Pool_Output_Prep2 (), 
      myColNames = c (
        "ID_Stack", 
        colnames (
          as.data.frame (
            DF_Pool_Output_Prep1 ()
          )
        )
      )
    )
  })

  DF_Pool_Output <- reactive ({
    cbind (
      DF_Pool_Output_Prep3 () [ , (1:2)],
      DF_Pool_Input () [ , c("Date_Entry", "Date_Change")],
      DF_Pool_Output_Prep3 () [ , (3:ncol (DF_Pool_Output_Prep3 ()))]
    )
    
  })
  
  
  
  
  
  
  #####################################################################################X
  ## Create, initialise and update the calculation stack -----

# Version 2 vom 20.7.2024 OHNE REACTIVE - STATTDESSEN MIT OBSERVEEVENT 
# das heißt beim calculation stack handelt sich nicht um eine Funktion sondern um einen normalen Dataframe    

  # Global variables usable within all observeEvent and reactive functions 
  
  
  
  
  
  # Version vom 20.07.2024
  rv <- reactiveValues (
    DF_Stack_Input  = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Stack_Output = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Stack_InterimResults = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Stack_ChartEnergyData  = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Calc_Input   = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Calc_Output  = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Calc_InterimResults = data.frame (matrix (nrow = 1, ncol = 2)),
    DF_Calc_ChartEnergyData  = data.frame (matrix (nrow = 1, ncol = 2))
  )

  # rv$DF_Stack_Input <- reactive ({
  #   data.frame (
  #     rbind (
  #       rv$DF_Stack_Input,
  #       DF_Pool_Input ()  [input$ID_Dataset_Pool, ]
  #     )
  #   )
  # })
  
  # rv$DF_Stack_Input <- reactive ({
  #   data.frame (
  #     SetDFColNames (
  #       myDataFrame = DF_Pool_Input () [ID_Stack_Initialise, ], 
  #       myColNames = colnames (DF_Pool_Input () )
  #     )
  #   )
  # })
  
  
  
  # rv$DF_Stack_Input <- reactive ({
  #     data.frame (DF_Pool_Input () ["DE.MOBASY.Template.0001.01", ] )
  # })
  
  # DF_Stack_Output = data.frame (DF_Pool_Output () ["DE.MOBASY.Template.0001.01", ] ), 
  # DF_Calc_Input   = (DF_Pool_Input () ["DE.MOBASY.Template.0001.01", ] ), 
  # DF_Calc_Output  = (DF_Pool_Output () ["DE.MOBASY.Template.0001.01", ] ), 

  
  
    
  # #####################################################################################X
  # ## Last part of initialisation: Calsulate and save the initialisation dataset to the stack  -----
  # 
  # # rownames (rv$DF_Stack_Input[1,]) <- reactive ({
  # #   rownames (rv$DF_Calc_Input[1,])
  # #   })  
  # shinyjs::click("Button_Calculate")
  # shinyjs::click("Button_SaveCalculationToStack")
  # 
  # 
  
  
  #####################################################################################X
  ## Observe "Button_Pool_AddToStack"  -----
  

  observeEvent (
    input$Button_Pool_AddToStack,{
      
       if (is.na (rv$DF_Stack_Input [1,1])) {

        # Case: Initialisation
        
        rv$DF_Stack_Input <- 
          data.frame (
            DF_Pool_Input ()  [input$ID_Dataset_Pool, ],
            row.names = DF_Pool_Input ()  [input$ID_Dataset_Pool, 1]
          )
        
        rv$DF_Stack_Output <- 
          data.frame(
            DF_Pool_Output ()  [input$ID_Dataset_Pool, ],
            row.names = DF_Pool_Input ()  [input$ID_Dataset_Pool, 1]
          )
        
      } else {

        # Case: Standard procedure 
         
        rv$DF_Stack_Input <-
          data.frame (
            rbind (
              rv$DF_Stack_Input,
              DF_Pool_Input ()  [input$ID_Dataset_Pool, ]
            )
          )
        
        rv$DF_Stack_Input [ , 1] <-
          rownames (rv$DF_Stack_Input)
        
        rv$DF_Stack_Output <-
          data.frame (
            rbind (
              rv$DF_Stack_Output,
              DF_Pool_Output ()  [input$ID_Dataset_Pool, ]
            )
          ) 
        } # End if else
      
      rv$DF_Stack_Output [ , 1] <-
          rownames (rv$DF_Stack_Output)
      
        
      updateSelectInput (
        session, 
        "SelectInput_ID_Dataset_Stack",
        choices = rownames (rv$DF_Stack_Input)
        #choices = rv$DF_Stack_Input [ , 1]
          #selected =  rv$DF_Stack_Input [1 , 1]
      )
  
      updateSelectInput (
        session,
        "SelectInput_ID_Dataset_Stack_2",
        choices = rownames (rv$DF_Stack_Input)
        #choices = rv$DF_Stack_Input [ , 1],
        #selected = input$SelectInput_ID_Dataset_Stack
      )
      
      # 2024-09-27 abgeschaltet 
      #UpdateInputFieldsFromStack (session, input, rv)    

      
      updateSelectizeInput(
        session = session,
        inputId = "ID_Dataset_Pool",
        selected = ID_Pool_Initialise,
      )
      
      shinyjs::click ("Button_CalculateStack")

            
      
    }, ignoreInit = TRUE
  ) # End observeEvent input$Button_Pool_AddToStack
  
  
  
  #####################################################################################X
  ## Observe "Button_AddAllTypologyExamplesToStack"  -----
  
  
  observeEvent (
    input$Button_AddAllTypologyExamplesToStack,{
      
      
      
      updateSelectizeInput (
        session = session,
        inputId = "ID_Dataset_Pool",
        selected = SelectionList_ID_TypologyExampleBuildings, #[2:4], # "DE.N.SFH.02.Gen.ReEx.001.001",  
        server = FALSE
      )
      
      # Das hat nicht funktioniert, nur mit einem zusätzlichen Knopf, völlig unklar warum!
      #shinyjs::click ("Button_Pool_AddToStack")

      shinyjs::click ("Button_AddAllTypologyExamplesToStack_Step2")
      
      
    }, ignoreInit = TRUE
    
  ) # End observeEvent input$Button_AddAllTypologyExamplesToStack


  
  observeEvent (
    input$Button_AddAllTypologyExamplesToStack_Step2,{
      

      shinyjs::click ("Button_Pool_AddToStack")
      
      
    }, ignoreInit = TRUE
    
  ) # End observeEvent input$Button_AddAllTypologyExamplesToStack
  
  
  
  
  #####################################################################################X
  ## Edit values of calculation stack  -----

  
  # data
  # MyDataTable
  
  df1 <- 
    data.frame (
      matrix (c(1, 2, 3, 4), ncol = 2)
    )
  
  
  # df1 <- reactive ({
  #   rv$DF_Calc_Input
  # })
  
  rv1 <- reactiveVal (df1)
  
  observeEvent (
    input$Button_Edit_CalcStack, {
      
      # rv1 <- 
      #   data.frame (
      #     rv$DF_Calc_Input  
      #   )
            
      # rv1 <- 
      #   rv$DF_Calc_Input [1:2, 1:2]   
      # rv1 <- 
      #   rv$DF_Stack_Input   

      
      output$MyDataTable <- 
        DT::renderDataTable ({
          DT::datatable (
            rv$DF_Stack_Input, 
            editable = TRUE,
            style = "default")
        }, 
        #server = FALSE,
      plugins = c (
        "ellipsis", 
        "scrollResize"
        )   # Info verfügbare Plugins: DT:::available_plugins()

      )
      
      
      
      # output$MyDataTable <- 
      #   DT::renderDataTable ({
      #     DT::datatable (rv$DF_Stack_Input, editable = TRUE)
      #   })
      
      observeEvent (input$MyDataTable_cell_edit, {
        info <- input$MyDataTable_cell_edit
        newdf <- rv$DF_Stack_Input
        newdf [info$row, info$col] <- info$value
        rv1 (newdf)
        rv$DF_Stack_Input <<- rv1()
      })
      
      
      # output$MyDataTable <- 
      #   DT::renderDataTable ({
      #     DT::datatable (rv1(), editable = TRUE)
      #   })
      # 
      # observeEvent (input$MyDataTable_cell_edit, {
      #   info <- input$MyDataTable_cell_edit
      #   newdf <- rv1 ()
      #   newdf [info$row, info$col] <- info$value
      #   rv1 (newdf)
      #   df1 <<- rv1()
      # })
      
      # output$data <- DT::renderDataTable ({
      #   DT::datatable(rv(), editable = TRUE)
      # })
      # 
      # observeEvent(input$data_cell_edit, {
      #   info <- input$data_cell_edit
      #   newdf <- rv()
      #   newdf[info$row, info$col] <- info$value
      #   rv(newdf)
      #   df <<- rv()
      # })

      
      
    } #, ignoreInit = FALSE
  ) # End observe event Button_Edit_CalcStack
  

  
  #####################################################################################X
  ## Manage window size  -----

  
  
  
  # 2025-02-21 geht beides nicht
  # 
  # output$PixelHeight_MainPanel_New <-
  #   renderText (
  #     input$Slider_PixelHeight_MainPanel
  #   )
  # 
  #   
  # observeEvent(
  #   input$Slider_PixelHeight_MainPanel, {
  # 
  #     #output$PixelHeight_MainPanel_New <- input$Slider_PixelHeight_MainPanel
  #     
  #     PixelHeight_MainPanel <- input$Slider_PixelHeight_MainPanel
  #     
  #   }
  # )
  # 
    
  
  #####################################################################################X
  ## Observe numeric input fields --> update the assigned slider input fields -----
   
  # This is necessary since all slider input fields are defined as an alternative 
  # to the numeric input fields, so both can be used if needed    

  ## List_UI_InputFields_Slider
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [1], 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [2], 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [3], 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [4],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [5],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [6],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  

  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [7], 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider [8], 
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  # ObserveNumericInputField_UpdateSliderInputField (
  #   session = session,
  #   Name_TargetInputField = List_UI_InputFields_Slider [9], 
  #   Suffix_TargetInputField_ToBeRemoved = "_Slider",
  #   Name_SourceInputField = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveNumericInputField_UpdateSliderInputField (
  #   session = session,
  #   Name_TargetInputField = List_UI_InputFields_Slider [10],
  #   Suffix_TargetInputField_ToBeRemoved = "_Slider",
  #   Name_SourceInputField = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveNumericInputField_UpdateSliderInputField (
  #   session = session,
  #   Name_TargetInputField = List_UI_InputFields_Slider [11],
  #   Suffix_TargetInputField_ToBeRemoved = "_Slider",
  #   Name_SourceInputField = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveNumericInputField_UpdateSliderInputField (
  #   session = session,
  #   Name_TargetInputField = List_UI_InputFields_Slider [12],
  #   Suffix_TargetInputField_ToBeRemoved = "_Slider",
  #   Name_SourceInputField = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )

  
  #####################################################################################X
  ## Observe percentage input fields --> update the assigned percentatge slider input fields -----

  ## List_UI_InputFields_Slider_Percent
    
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider_Percent [1],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )

  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider_Percent [2],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider_Percent [3],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider_Percent [4],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveNumericInputField_UpdateSliderInputField (
    session = session,
    Name_TargetInputField = List_UI_InputFields_Slider_Percent [5],
    Suffix_TargetInputField_ToBeRemoved = "_Slider",
    Name_SourceInputField = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  
  
  #####################################################################################X
  ## Observe slider input fields --> update the assigned numeric input fields -----

  ## List_UI_InputFields_Slider
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [1], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
    )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [2], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [3], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [4], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [5], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [6], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [7], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider [8], 
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  # ObserveInputField_UpdateNumericInputField (
  #   session = session,
  #   Name_InputField1 = List_UI_InputFields_Slider [9], 
  #   SuffixInputField1ToBeRemoved = "_Slider",
  #   Name_InputField2 = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveInputField_UpdateNumericInputField (
  #   session = session,
  #   Name_InputField1 = List_UI_InputFields_Slider [10], 
  #   SuffixInputField1ToBeRemoved = "_Slider",
  #   Name_InputField2 = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveInputField_UpdateNumericInputField (
  #   session = session,
  #   Name_InputField1 = List_UI_InputFields_Slider [11], 
  #   SuffixInputField1ToBeRemoved = "_Slider",
  #   Name_InputField2 = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  # ObserveInputField_UpdateNumericInputField (
  #   session = session,
  #   Name_InputField1 = List_UI_InputFields_Slider [12], 
  #   SuffixInputField1ToBeRemoved = "_Slider",
  #   Name_InputField2 = "", # is determined automatically by removing the suffix
  #   input = input, rv = rv
  # )
  # 
  
  
  #####################################################################################X
  ## Observe slider percent input fields --> update the assigned numeric percent input fields -----
  
  ## List_UI_InputFields_Slider_Percent
  
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider_Percent [1],
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )


  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider_Percent [2],
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider_Percent [3],
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider_Percent [4],
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  ObserveInputField_UpdateNumericInputField (
    session = session,
    Name_InputField1 = List_UI_InputFields_Slider_Percent [5],
    SuffixInputField1ToBeRemoved = "_Slider",
    Name_InputField2 = "", # is determined automatically by removing the suffix
    input = input, rv = rv
  )
  
  
  
  
  # ObserveInputField_UpdateStackVariable (
  #   Name_InputField = List_UI_InputFields_Slider [1],
  #   SuffixInputField = "_Slider",
  #   input = input, rv = rv)
  # 
  # ObserveInputField_UpdateStackVariable (
  #   Name_InputField = List_UI_InputFields_Slider [2],
  #   SuffixInputField = "_Slider",
  #   input = input, rv = rv)
  # 
  # ObserveInputField_UpdateStackVariable (
  #   Name_InputField = List_UI_InputFields_Slider [3],
  #   SuffixInputField = "_Slider",
  #   input = input, rv = rv)
  
  
  
  #####################################################################################X
  ## Observe input fields --> Copy values to calculation dataframe -----

  
  ## Text
  ## List_UI_InputFields_Text  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Text [1],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Text [2],
    SuffixInputField = "",
    input = input, rv = rv)

  # ObserveInputField_UpdateDFCalcVariable (
  #   Name_InputField = List_UI_InputFields_Text [3],
  #   SuffixInputField = "",
  #   input = input, rv = rv)
  # 
  # ObserveInputField_UpdateDFCalcVariable (
  #   Name_InputField = List_UI_InputFields_Text [4],
  #   SuffixInputField = "",
  #   input = input, rv = rv)
  
  
    
  ## Numeric
  ## List_UI_InputFields_Numeric  
    
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [1],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [2],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [3],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [4],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [5],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [6],
    SuffixInputField = "",
    input = input, rv = rv)
  
    
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [7],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [8],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [9],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [10],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [11],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [12],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [13],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [14],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [15],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [16],
    SuffixInputField = "",
    input = input, rv = rv)
  

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [17],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [18],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [19],
    SuffixInputField = "",
    input = input, rv = rv)

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric [20],
    SuffixInputField = "",
    input = input, rv = rv)
# 
#   ObserveInputField_UpdateDFCalcVariable (
#     Name_InputField = List_UI_InputFields_Numeric [21],
#     SuffixInputField = "",
#     input = input, rv = rv)
# 
#   ObserveInputField_UpdateDFCalcVariable (
#     Name_InputField = List_UI_InputFields_Numeric [22],
#     SuffixInputField = "",
#     input = input, rv = rv)
# 
#   ObserveInputField_UpdateDFCalcVariable (
#     Name_InputField = List_UI_InputFields_Numeric [23],
#     SuffixInputField = "",
#     input = input, rv = rv)
# 
#   ObserveInputField_UpdateDFCalcVariable (
#     Name_InputField = List_UI_InputFields_Numeric [24],
#     SuffixInputField = "",
#     input = input, rv = rv)

  
  ## Numeric percent
  ## List_UI_InputFields_Numeric_Percent
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric_Percent [1],
    SuffixInputField = "",
    input = input, rv = rv)


  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric_Percent [2],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric_Percent [3],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric_Percent [4],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_Numeric_Percent [5],
    SuffixInputField = "",
    input = input, rv = rv)
  
  

  
  
  
  
  
  ## CheckBox
  ## List_UI_InputFields_CheckBox
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [1],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [2],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [3],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [4],
    SuffixInputField = "",
    input = input, rv = rv)
  

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [5],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [6],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [7],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [8],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [9],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [10],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [11],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [12],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [13],
    SuffixInputField = "",
    input = input, rv = rv)
  
  

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [14],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [15],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [16],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [17],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [18],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [19],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [20],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [21],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [22],
    SuffixInputField = "",
    input = input, rv = rv)
  

  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [23],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [24],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [25],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [26],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [27],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [28],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [29],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [30],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [31],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [32],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [33],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [34],
    SuffixInputField = "",
    input = input, rv = rv)
  

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [35],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [36],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [37],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [38],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [39],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [40],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [41],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [42],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [43],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [44],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [45],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [46],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [47],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [48],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [49],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [50],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [51],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [52],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [53],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [54],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [55],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [56],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [57],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [58],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [59],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [60],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [61],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [62],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_CheckBox [63],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  
  
  
  ## RadioButton
  ## List_UI_InputFields_RadioButton
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [1],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [2],
    SuffixInputField = "",
    input = input, rv = rv)
  

  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [3],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [4],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [5],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [6],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [7],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [8],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [9],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [10],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [11],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [12],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [13],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [14],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [15],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [16],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [17],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [18],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [19],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [20],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [21],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [22],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [23],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [24],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [25],
    SuffixInputField = "",
    input = input, rv = rv)

    
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [26],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [27],
    SuffixInputField = "",
    input = input, rv = rv)
  
  ObserveInputField_UpdateDFCalcVariable (
    Name_InputField = List_UI_InputFields_RadioButton [28],
    SuffixInputField = "",
    input = input, rv = rv)
  
  
    
  
  ## List_UI_Checkbox_InputNotAvailable ----
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [1],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [2],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [3],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [4],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [5],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [6],
    input = input, 
    rv = rv
  )
  

  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [7],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [8],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [9],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [10],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [11],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [12],
    input = input, 
    rv = rv
  )
  
  ObserveNotAvailableCheckbox_UpdateDFCalcVariable (
    Name_NACheckbox = List_UI_Checkbox_InputNotAvailable [13],
    input = input, 
    rv = rv
  )
  
  
  
  #####################################################################################X
  ## ObserveEvent Code_InsulationType_... -----
  
  # If no information about insulation or refurbishment of the construction type is available,
  # the Checkboxes ..."_InputNotAvailable" need to be set to 1 
  # That will cause the value NA in the respective numeric input variable.

  
  
  observeEvent (
    input$Code_InsulationType_Roof, {
      
      if (input$Code_InsulationType_Roof == "_NA_") {
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_Year_Refurbishment_Roof_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_d_Insulation_Roof_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_f_Insulation_Roof_InputNotAvailable",
          value = 1   
        )  
        
      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Code_InsulationType_Roof
  
  
  
  
  observeEvent (
    input$Code_InsulationType_Ceiling, {
      
      if (input$Code_InsulationType_Ceiling == "_NA_") {
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_Year_Refurbishment_Ceiling_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_d_Insulation_Ceiling_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_f_Insulation_Ceiling_InputNotAvailable",
          value = 1   
        )  
        
      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Code_InsulationType_Ceiling
  
  
  
    
  observeEvent (
    input$Code_InsulationType_Wall, {
    
      if (input$Code_InsulationType_Wall == "_NA_") {
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_Year_Refurbishment_Wall_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_d_Insulation_Wall_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_f_Insulation_Wall_InputNotAvailable",
          value = 1   
        )  
        
      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Code_InsulationType_Wall
  
  
  
  
  
  observeEvent (
    input$Code_InsulationType_Floor, {
      
      if (input$Code_InsulationType_Floor == "_NA_") {
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_Year_Refurbishment_Floor_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_d_Insulation_Floor_InputNotAvailable",
          value = 1   
        )  
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_f_Insulation_Floor_InputNotAvailable",
          value = 1   
        )  
        
      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Code_InsulationType_Floor
  
  
  
  
  
  #####################################################################################X
  ## ObserveEvent Show_WindowType2  -----
  
  # If the checkbox Show_WindowType2 is set to FALSE the input for window type 2 will not be visible.
  # Then the variable f_Area_WindowType2 must be set to 0.
  # If the checkbox is set to TRUE then the input value in the calculation dataframe DF_Calc_Input is reassigned

  observeEvent (
    input$Show_WindowType2, {
      
      if (input$Show_WindowType2 == FALSE) {

        
        rv$DF_Calc_Input [1, "f_Area_WindowType2"] <- 0
                
        # updateNumericInput (
        #   session = session,
        #   inputId = "f_Area_WindowType2",
        #   value = 0   
        # )  
        
      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Show_WindowType2

    
  observeEvent (
    input$Show_WindowType2, {
      
      if (input$Show_WindowType2 == TRUE) {
        

        rv$DF_Calc_Input [1, "f_Area_WindowType2"] <- 
          0.01 * 
          input$f_Area_WindowType2
        
        
        # updateNumericInput (
        #   session = session,
        #   inputId = "f_Area_WindowType2",
        #   value = rv$DF_Calc_Input [1, "f_Area_WindowType2"]  
        # )  

      } # End if
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Show_WindowType2
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # Das funktioniert nicht, es wird nur das letzte Event in der Liste aufgerufen
  # ObserveInputField_UpdateStackVariable (
  #   Name_InputField = List_UI_InputFields_Numeric,
  #   input, rv)
  
  
  # Das funktioniert nicht, es wird nur das letzte Event in der Liste aufgerufen
  # 
  # for (i in (1:3)) {
  #   ObserveInputField_UpdateStackVariable (
  #     Name_InputField = List_UI_InputFields_Numeric [i], 
  #     input, rv)
  # }
  
  # Das funktioniert nicht, es wird nur das letzte Event in der Liste aufgerufen
  # 
  # for (Name_InputField in List_UI_InputFields_Numeric) {
  # 
  #   observeEvent (
  #     AuxFunctions::Parse_StringAsCommand (
  #       paste0 ("DF$", Name_InputField), 
  #       DF = input
  #       ), 
  #     {
  #       rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, Name_InputField] <-
  #         AuxFunctions::Parse_StringAsCommand (
  #           paste0 ("DF$", Name_InputField), 
  #           DF = input
  #         )
  #     })
  #   
  # } # End loop

  
  # Das funktioniert:
  # observeEvent (
  #   AuxFunctions::Parse_StringAsCommand ("DF$d_Insulation_Roof", DF = input), {
  #   rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, 'd_Insulation_Roof'] <-
  #     AuxFunctions::Parse_StringAsCommand ("DF$d_Insulation_Roof", DF = input)
  # })
  
  # observeEvent (input$d_Insulation_Roof, {
  #   rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, 'd_Insulation_Roof'] <-
  #     AuxFunctions::Parse_StringAsCommand ("DF$d_Insulation_Roof", DF = input)
  # })
  
  # observeEvent (input$d_Insulation_Roof, {
  #   rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, 'd_Insulation_Roof'] <- 
  #     input$d_Insulation_Roof
  # })
  
  
  
  
  
  
  # observeEvent (input$d_Insulation_Ceiling, {
  #   rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"] <- 
  #     input$d_Insulation_Ceiling
  # })
  # 
  
  
  
  
  
    
  
  
  ## Variables
  # Indicator_Roof_Constr_Massive
  # Indicator_Roof_Constr_Wood
  # Indicator_Ceiling_Constr_Massive
  # Indicator_Ceiling_Constr_Wood
  # Indicator_Wall_Constr_Massive
  # Indicator_Wall_Constr_Wood
  # Indicator_Floor_Constr_Massive
  # Indicator_Floor_Constr_Wood
  # 
  # 
  # Code_InsulationType_Roof
  # Code_InsulationType_Ceiling
  # Code_InsulationType_Wall
  # Code_InsulationType_Floor
  # 
  # 
  # 
  # Year_Refurbishment_Roof
  # Year_Refurbishment_Ceiling
  # Year_Refurbishment_Wall
  # Year_Refurbishment_Floor
  # 
  # 
  # d_Insulation_Roof
  # d_Insulation_Ceiling
  # d_Insulation_Wall
  # d_Insulation_Floor
  # 
  # f_Insulation_Roof
  # f_Insulation_Ceiling
  # f_Insulation_Wall
  # f_Insulation_Floor
  # 
  # 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #   rv$DF_Calc_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"] <- reactive ({
  #     input$d_Insulation_Ceiling
  #   })
  #   Error in `*tmp*`$DF_Calc_Input : 
  #     Can't access reactive value 'DF_Calc_Input' outside of reactive consumer.
  # ℹ Do you need to wrap inside reactive() or observe()?
  
  
  
  
  
  
  #####################################################################################X
  ## Observe selection "SelectInput_ID_Dataset_Stack" --> Load from stack to calculation -----
  
  # Input field "SelectInput_ID_Dataset_Stack" is the ID of the calculation stack 
  
  
  observeEvent (input$SelectInput_ID_Dataset_Stack, {
    
    Name_CurrentDataset_Stack <- input$SelectInput_ID_Dataset_Stack
    Name_CurrentDataset_Calc  <- input$TextInput_ID_Calc
    #Name_CurrentDataset_Calc  <- rowname (rv$DF_Calc_Input [1,])
    
    if (is.na (Name_CurrentDataset_Stack)) {
      Name_CurrentDataset_Stack <- "-"
    } 
    
    if (is.na (Name_CurrentDataset_Calc) ) {
      Name_CurrentDataset_Calc <- "-"
    }
    
    if (Name_CurrentDataset_Stack != Name_CurrentDataset_Calc) {
      
      updateSelectInput (
        session = session,
        inputId = "SelectInput_ID_Dataset_Stack_2",
        #choices = rv$DF_Stack_Input [ , 1],  # 2025-04-25 versuchsweise wieder eingeschaltet
        selected = input$SelectInput_ID_Dataset_Stack
      )
      
      
      shinyjs::click ("Button_LoadFromStackToCalculation")
      
      
      
    }
    
    
    
    
    
    # 2024-09-27 abgeschaltet
    #UpdateInputFieldsFromStack (session, input, rv)        
    
    
    
    # updateSliderInput (
    #   session,
    #   "d_Insulation_Ceiling",
    #   value = rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, "d_Insulation_Ceiling"]
    # )  
    
    },
    
    ignoreInit = TRUE
    
  
  ) # End: observe event selection "SelectInput_ID_Dataset_Stack"
  
  
    
  observeEvent (input$SelectInput_ID_Dataset_Stack_2, {
    
    updateSelectInput (
      session,
      "SelectInput_ID_Dataset_Stack",
      #choices = rv$DF_Stack_Input [ , 1],   # 2025-04-25 versuchsweise wieder eingeschaltet
      selected = input$SelectInput_ID_Dataset_Stack_2
    )
    
    
    #shinyjs::click ("Button_LoadFromStackToCalculation")
    
    # 2024-09-27 abgeschaltet
    #UpdateInputFieldsFromStack (session, input, rv)    
    

  },
  
  ignoreInit = TRUE
  
  
  ) # End: observe event selection "SelectInput_ID_Dataset_Stack"
  
  
  
  
  
  #####################################################################################X
  ## Observe "TextInput_ID_Calc" --> Change name of calculation dataset -----

  observeEvent (input$TextInput_ID_Calc, {
    
    rv$DF_Calc_Input  [1,1] <- input$TextInput_ID_Calc
    rv$DF_Calc_Output [1,1] <- input$TextInput_ID_Calc
    
    rownames (rv$DF_Calc_Input)  <- rv$DF_Calc_Input  [ ,1]
    rownames (rv$DF_Calc_Output) <- rv$DF_Calc_Output [ ,1]
    
    Index_Dataset <- which (rownames (rv$DF_Calc_Input) == rownames (rv$DF_Stack_Input))
    #Index_Dataset <- which (rv$DF_Calc_Input [1,1] == rv$DF_Stack_Input  [ ,1])

    if (length (Index_Dataset) > 0) {
      updateTextInput (
        inputId = "TextInput_Index_Stack",
        value = Index_Dataset
      )
    } else {
      updateTextInput (
        inputId = "TextInput_Index_Stack",
        value = "-"
      )
    }

    #rv$DF_Calc_Output <- rv$DF_Calc_Input [ ,1]
    #rownames (rv$DF_Calc_Output) <- rv$DF_Calc_Output [ ,1]
    
    # rownames (rv$DF_Calc_Output)           <- rownames (rv$DF_Calc_Input)
    # rownames (rv$DF_Calc_ChartEnergyData)  <- rownames (rv$DF_Calc_Input)
    # rownames (rv$DF_Calc_InterimResult)    <- rownames (rv$DF_Calc_Input)

  },

  ignoreInit = TRUE
  
  ) # End: observe event selection "TextInput_ID_Calc"
  
  
  
  #####################################################################################X
  ## Observe "TextInput_Index_Stack" --> Change name of calculation dataset -----
  
  observeEvent (input$TextInput_Index_Stack, {

    if (!is.na ( as.numeric (input$TextInput_Index_Stack) )) {
      
      NewText <-  
        paste0 (
          "DS ",
          input$TextInput_Index_Stack, 
          " (überschreiben)" 
        )
        # paste0 (
        #   "Speichern <br> (Datensatz ",
        #   input$TextInput_Index_Stack, 
        #   " überschreiben)" 
        #   )
      
    } else {
      
      NewText <-  
        paste0 (
          "DS ",
          nrow (rv$DF_Stack_Input) + 1,
          " (neu)"
        )
        # paste0 (
        #   "Speichern <br> (als Datensatz ",
        #   nrow (rv$DF_Stack_Input) + 1, 
        #   " hinzufügen)" 
        # )
    } # End else

    updateTextInput (
      session,
      inputId = "TextInput_SaveAs",
      value = NewText
    )
    
    # updateActionButton (
    #   session,
    #   inputId = "Button_SaveCalculationToStack",
    #   label = NewText
    #   # Das folgende funktioniert nicht
    #   #label = strong (NewText, style = "font-size:14px; line-height:0.8;")
    #   #label =  div (as.character (NewText), style = "font-size:14px; line-height:0.8;")
    #   # label = div (HTML (as.character (NewText) , .noWS = 'outside'),
    #   #              style = "font-size:14px; line-height:0.8;")
    #   # label = div (HTML ("Umbe-<br>nennen", .noWS = 'outside'),
    #   #              style = "font-size:14px; line-height:0.8;")
    # )
    
    
    updateSelectInput (
      session, 
      "SelectInput_ID_Dataset_Stack",
      choices = rownames (rv$DF_Stack_Input),
      selected =  rownames (rv$DF_Calc_Input [1 , ])
    )
    
    updateSelectInput (
      session,
      "SelectInput_ID_Dataset_Stack_2",
      choices = rownames (rv$DF_Stack_Input),
      selected = input$SelectInput_ID_Dataset_Stack
    )
    
    
    

  },
  
  ignoreInit = TRUE
  
  ) # End: observe event selection "TextInput_ID_Calc"
  
  
  
  #####################################################################################X
  ## Button_Delete_Dataset_Stack -----
  
  observeEvent (
    input$Button_Delete_Dataset_Stack, {
      
      if (nrow (rv$DF_Stack_Input) > 1) {
        
        Index_Dataset <- which (input$SelectInput_ID_Dataset_Stack == rownames (rv$DF_Stack_Input))
        
        rv$DF_Stack_Input  <-
          rv$DF_Stack_Input  [-Index_Dataset, ]
        
        rv$DF_Stack_Output  <-
          rv$DF_Stack_Output  [-Index_Dataset, ]
    

        updateSelectInput (
          session = session,
          inputId = "SelectInput_ID_Dataset_Stack",
          choices = rv$DF_Stack_Input [ , 1],  
          selected = rv$DF_Stack_Input [1, 1]
        )
        
        
        shinyjs::click ("Button_LoadFromStackToCalculation")
        
      } # End if  
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Button_Delete_Dataset_Stack
  
  
  
  
  
  
  
    
  #####################################################################################X
  ## Button_LoadFromStackToCalculation -----
  
  observeEvent (
    input$Button_LoadFromStackToCalculation, {
      
      if (is.na (rv$DF_Stack_Input [1,1])) {
        
        shinyjs::click ("Button_Pool_AddToStack")
        
      } 
        
      rv$DF_Calc_Input <- 
        data.frame (
          rv$DF_Stack_Input  [input$SelectInput_ID_Dataset_Stack, ]
          #row.names = rv$DF_Stack_Input  [input$SelectInput_ID_Dataset_Stack, 1]
        )  
      
      rv$DF_Calc_Output <- 
        data.frame (
          rv$DF_Stack_Output  [input$SelectInput_ID_Dataset_Stack, ]
          #row.names = rv$DF_Stack_Input  [input$SelectInput_ID_Dataset_Stack, 1]
        )  
      
      # rownames (rv$DF_Stack_Input)  <- rv$DF_Stack_Input [ , 1]
      # rownames (rv$DF_Stack_Output)  <- rv$DF_Stack_Output [ , 1]
      # provides an error when starting
      
      
      UpdateInputFieldsFromDataFrame (
        session = session, 
        input = input, 
        DF_Input = rv$DF_Calc_Input
      ) 
      
      updateTextInput (
        inputId = "TextInput_ID_Calc",
        value = rv$DF_Calc_Input [1,1]
      )
      
      updateTextInput (
        inputId = "TextInput_Index_Stack",
        value = which (rownames (rv$DF_Calc_Input [1, ]) == rownames (rv$DF_Stack_Input))
        #value = which (rv$DF_Calc_Input [1,1] == rownames (rv$DF_Stack_Input))
      )
      
      # 2025-04-11 jetzt universellere Funktion
      #UpdateInputFieldsFromDFCalc (session, input, rv)    
      
      
      shinyjs::click ("Button_Load_Example_Type_241")
      # Element of the last matrix row, no dataset assigned
      
      
      
        

    }, 
    ignoreInit = TRUE
  ) # End observe event Button_LoadFromStackToCalculation
  
  
  
  
  #####################################################################################X
  ## Button_SaveCalculationToStack -----
  
  observeEvent (
    input$Button_SaveCalculationToStack, {
      
      
      ## Initialisation: At the first call create empty dataframes with the necessary structure 
      
      if (is.na (rv$DF_Stack_ChartEnergyData [1,1])) {
        # Only Structure and rowname of first dataset is established
        rv$DF_Stack_ChartEnergyData  <-
          data.frame (
            rv$DF_Calc_ChartEnergyData,
            row.names = rownames (rv$DF_Calc_Input)
          )
        
        #colnames(rv$DF_Stack_ChartEnergyData [ ,1]) <- "ID_Dataset" 
        
        rv$DF_Stack_ChartEnergyData [ , ] <- NA 
      }
      
      if (is.na (rv$DF_Stack_InterimResults [1,1])) {
        # Only Structure and rowname of first dataset is established
        rv$DF_Stack_InterimResults  <-
          data.frame (
            rv$DF_Calc_InterimResults,
            row.names =  rownames (rv$DF_Calc_Input)
          )
        rv$DF_Stack_InterimResults [ , ]  <- NA
      }
      
      
      

      # In case of an empty stack do nothing
      if (!is.na (rv$DF_Stack_Input [1,1])) {
        
        Index_Dataset <- 
          which (rownames (rv$DF_Calc_Input [1, ]) == rownames (rv$DF_Stack_Input))
          #which (rv$DF_Calc_Input [1,1] == rv$DF_Stack_Input  [ ,1])

        if (length (Index_Dataset) > 0) {  
            
          ## Case: Calculation dataset rowname matches one of the rownames of the stack dataframe

          SelectedDataset <- input$SelectInput_ID_Dataset_Stack 
          
          rv$DF_Stack_Input [SelectedDataset, ] <- 
            data.frame (
              rv$DF_Calc_Input [1, ]
            )  
          
          #rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
          
          rv$DF_Stack_Output [SelectedDataset, ] <- 
            data.frame (
              rv$DF_Calc_Output [1, ]
            )  
          
          
          
          rv$DF_Stack_ChartEnergyData [SelectedDataset, ] <-
            data.frame (
              rv$DF_Calc_ChartEnergyData
            )

          
          rv$DF_Stack_InterimResults [SelectedDataset, ] <-
            data.frame (
              rv$DF_Calc_InterimResults
            )
          
          
          
          #rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
          
          
          
          updateSelectInput (
            session,
            "SelectInput_ID_Dataset_Stack",
            choices = rownames (rv$DF_Stack_Input),
            #choices = rv$DF_Stack_Input [ , 1],
            selected = rv$DF_Calc_Input [1, 1]
          )
          
          # updateSelectInput (
          #   session,
          #   "SelectInput_ID_Dataset_Stack",
          #   #choices = rv$DF_Stack_Input [ , 1]
          #   selected = rv$DF_Calc_Input [1, 1]
          # )
          
          
          updateSelectInput (
            session,
            "SelectInput_ID_Dataset_Stack_2",
            choices = rownames (rv$DF_Stack_Input),
            #choices = rv$DF_Stack_Input [ , 1],
            selected = rv$DF_Calc_Input [1, 1]
          )
          
          #shinyjs::click ("Button_LoadFromStackToCalculation")
          
                  
          } else {
            
            ## Case: Calculation dataset rowname cannot be found in the rownames of the stack dataframe
            
            
            Index_NewDataset <- nrow (rv$DF_Stack_Input) + 1
            
            rv$DF_Stack_Input  <- 
              data.frame (
                rbind (
                  rv$DF_Stack_Input [ , ],
                  rv$DF_Calc_Input  [1, ]
                )
              )
            
            rv$DF_Stack_Output  <- 
              data.frame (
                rbind (
                  rv$DF_Stack_Output [ , ],
                  rv$DF_Calc_Output  [1, ]
                )
              )
            
            
            rv$DF_Stack_ChartEnergyData [Index_NewDataset, ] <-
                rv$DF_Calc_ChartEnergyData

            rv$DF_Stack_InterimResults [Index_NewDataset, ] <-
                rv$DF_Calc_InterimResults


                        
            rv$DF_Stack_ChartEnergyData [ ,1] <- 
              rownames (rv$DF_Stack_Output)
            
            rv$DF_Stack_InterimResults [ ,1] <- 
              rownames (rv$DF_Stack_Output)
          

            
            rownames (rv$DF_Stack_ChartEnergyData) <- 
              rownames (rv$DF_Stack_Output)
            
            rownames (rv$DF_Stack_InterimResults) <- 
              rownames (rv$DF_Stack_Output)
            
            
            
            
            
            # führt zu doppelten Rownames und damit zum Abbruch:
            # rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
            # rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
            
            
            # n_Row_Stack <- nrow (rv$DF_Stack_Input [ , ])
            # 
            # rv$DF_Stack_Input [n_Row_Stack+1, ] <- 
            #   data.frame (
            #     rv$DF_Calc_Input [1, ],
            #     row.names = 1
            #   )  
            # 
            # rv$DF_Stack_Output [n_Row_Stack+1, ]<- 
            #   data.frame (
            #     rv$DF_Calc_Output [1, ],
            #     row.names = 1
            #   )  
            
            Index_Dataset <- nrow (rv$DF_Stack_Input)
            
            updateSelectInput (
              session,
              "SelectInput_ID_Dataset_Stack",
              choices = rownames (rv$DF_Stack_Input),
              selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
              # choices = rv$DF_Stack_Input [ , 1],
              # selected = rv$DF_Calc_Input [1, 1]
            )
            
            
            updateSelectInput (
              session,
              "SelectInput_ID_Dataset_Stack_2",
              choices = rownames (rv$DF_Stack_Input),
              selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
              # choices = rv$DF_Stack_Input [ , 1],
              # selected = rv$DF_Calc_Input [1, 1]
            )
            
            
            updateTextInput (
              inputId = "TextInput_Index_Stack",
              value = Index_Dataset
            )
            
            
            # 2025-06-20
            rv$DF_Stack_Input [Index_Dataset,1] <-
              rownames (rv$DF_Stack_Input [Index_Dataset, ])
            rv$DF_Calc_Input [1,1] <-
              rownames (rv$DF_Stack_Input [Index_Dataset, ])
            rv$DF_Stack_Output [Index_Dataset,1] <-
              rownames (rv$DF_Stack_Output [Index_Dataset, ])
            rv$DF_Calc_Output [1,1] <-
              rownames (rv$DF_Stack_Output [Index_Dataset, ])
            

                    
            } # End else
        

      } # End if stack is not empty
      
      
    }, 
    ignoreInit = TRUE
  ) # End observe event Button_SaveCalculationToStack
  

  ## 2025-05-23 Now overwrite and new are included in one single button (see above)
  #    
  # #####################################################################################X
  # ## Button_SaveCalculationToStackOverwrite 
  # 
  # observeEvent (
  #   input$Button_SaveCalculationToStackOverwrite, {
  #     
  #     if (is.na (rv$DF_Stack_Input [1,1])) {
  #       
  #       shinyjs::click ("Button_Pool_AddToStack")
  #       
  #     } 
  #       
  #     SelectedDataset <- input$SelectInput_ID_Dataset_Stack 
  #     
  #     rv$DF_Stack_Input [SelectedDataset, ] <- 
  #       data.frame (
  #         rv$DF_Calc_Input [1, ]
  #       )  
  #     
  #     #rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
  #     
  #     rv$DF_Stack_Output [SelectedDataset, ] <- 
  #       data.frame (
  #         rv$DF_Calc_Output [1, ]
  #       )  
  # 
  #     #rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
  #     
  #     
  #             
  #     updateSelectInput (
  #       session,
  #       "SelectInput_ID_Dataset_Stack",
  #       choices = rownames (rv$DF_Stack_Input),
  #       #choices = rv$DF_Stack_Input [ , 1],
  #       selected = rv$DF_Calc_Input [1, 1]
  #     )
  #     
  #     # updateSelectInput (
  #     #   session,
  #     #   "SelectInput_ID_Dataset_Stack",
  #     #   #choices = rv$DF_Stack_Input [ , 1]
  #     #   selected = rv$DF_Calc_Input [1, 1]
  #     # )
  #     
  # 
  #     updateSelectInput (
  #       session,
  #       "SelectInput_ID_Dataset_Stack_2",
  #       choices = rownames (rv$DF_Stack_Input),
  #       #choices = rv$DF_Stack_Input [ , 1],
  #       selected = rv$DF_Calc_Input [1, 1]
  #     )
  #     
  #     #shinyjs::click ("Button_LoadFromStackToCalculation")
  #     
  # 
  #   }, 
  #   
  #   ignoreInit = TRUE
  #   
  # ) # End observe event Button_SaveCalculationToStackOverwrite
  # 
  # 
  # #####################################################################################X
  # ## Button_SaveCalculationToStackAsNew 
  # 
  # observeEvent (
  #   input$Button_SaveCalculationToStackAsNew, {
  #     
  #     if (is.na (rv$DF_Stack_Input [1,1])) {
  #       
  #       shinyjs::click ("Button_Pool_AddToStack")
  #       
  #     } 
  # 
  #     
  #     rv$DF_Stack_Input  <- 
  #       data.frame (
  #         rbind (
  #           rv$DF_Stack_Input [ , ],
  #           rv$DF_Calc_Input  [1, ]
  #         )
  #       )
  # 
  #     rv$DF_Stack_Output  <- 
  #       data.frame (
  #         rbind (
  #           rv$DF_Stack_Output [ , ],
  #           rv$DF_Calc_Output  [1, ]
  #         )
  #       )
  #     
  #     # führt zu doppelten Rownames und damit zum Abbruch
  #     # rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
  #     # rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
  #     
  #     
  #     # n_Row_Stack <- nrow (rv$DF_Stack_Input [ , ])
  #     # 
  #     # rv$DF_Stack_Input [n_Row_Stack+1, ] <- 
  #     #   data.frame (
  #     #     rv$DF_Calc_Input [1, ],
  #     #     row.names = 1
  #     #   )  
  #     # 
  #     # rv$DF_Stack_Output [n_Row_Stack+1, ]<- 
  #     #   data.frame (
  #     #     rv$DF_Calc_Output [1, ],
  #     #     row.names = 1
  #     #   )  
  #     
  #     updateSelectInput (
  #       session,
  #       "SelectInput_ID_Dataset_Stack",
  #       choices = rownames (rv$DF_Stack_Input),
  #       selected = rownames (rv$DF_Stack_Input [nrow (rv$DF_Stack_Input), ])
  #       # choices = rv$DF_Stack_Input [ , 1],
  #       # selected = rv$DF_Calc_Input [1, 1]
  #     )
  # 
  #     
  #     updateSelectInput (
  #       session,
  #       "SelectInput_ID_Dataset_Stack_2",
  #       choices = rownames (rv$DF_Stack_Input),
  #       selected = rownames (rv$DF_Stack_Input [nrow (rv$DF_Stack_Input), ])
  #       # choices = rv$DF_Stack_Input [ , 1],
  #       # selected = rv$DF_Calc_Input [1, 1]
  #     )
  #     
  #     
  #     updateTextInput (
  #       inputId = "TextInput_Index_Stack",
  #       value = nrow (rv$DF_Stack_Input)
  #     )
  #     
  #     
  #     #shinyjs::click ("Button_SaveCalculationToStackAsNew")
  #     
  #     
  #   }, 
  #   ignoreInit = TRUE
  # ) # End observe event Button_SaveCalculationToStackAsNew
  
  
  
  
  #####################################################################################X
  ## Button_Load_Example_Type_11 -----


  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 1,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )

  ## Possibility to assign manually for testing
  #  
  # observeEvent (
  #   input$Button_Load_Example_Type_11, {
  #     
  #     
  #     rv$DF_Calc_Input <- 
  #       data.frame (
  #         DF_Pool_Input () ["DE.N.SFH.01.Gen.ReEx.001.001", ]
  #       )  
  #     
  #     rv$DF_Calc_Output <- 
  #       data.frame (
  #         DF_Pool_Output () ["DE.N.SFH.01.Gen.ReEx.001.001", ]
  #       )  
  #     
  #   }, 
  #   ignoreInit = TRUE
  # ) # End observe event Button_Load_Example_Type_11
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 1 / Col 2:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 1,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 1,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 1,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  

  #####################################################################################X
  ## Button_Load_Example_Type Row 2 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 2,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 2,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 2,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 2,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 3 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 3,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 3,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 3,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 3,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 4 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 4,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 4,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 4,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 4,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 5 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 5,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 5,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 5,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 5,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  

  
  #####################################################################################X
  ## Button_Load_Example_Type Row 6 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 6,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 6,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 6,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 6,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  

  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 7 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 7,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 7,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 7,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 7,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 8 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 8,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 8,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 8,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 8,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 9 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 9,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 9,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 9,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 9,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 10 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 10,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 10,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 10,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 10,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  #####################################################################################X
  ## Button_Load_Example_Type Row 11 / Col 1:4 -----
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 11,
    i_Col = 1,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 11,
    i_Col = 2,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 11,
    i_Col = 3,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
    i_Row = 11,
    i_Col = 4,
    input = input,
    rv = rv,
    session = session,
    DF_PoolData_Input = DF_Pool_Input (),
    DF_PoolData_Output = DF_Pool_Output ()
  )
  
  
  # #####################################################################################X
  # ## Button_Load_Example_Type Row 12 / Col 1:4 -----
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 12,
  #   i_Col = 1,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 12,
  #   i_Col = 2,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 12,
  #   i_Col = 3,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 12,
  #   i_Col = 4,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  
  
  
  # 
  # #####################################################################################X
  # ## Button_Load_Example_Type Row 13 / Col 1:4 -----
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 13,
  #   i_Col = 1,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 13,
  #   i_Col = 2,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 13,
  #   i_Col = 3,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 13,
  #   i_Col = 4,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # 
  # #####################################################################################X
  # ## Button_Load_Example_Type Row 14 / Col 1:4 -----
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 14,
  #   i_Col = 1,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 14,
  #   i_Col = 2,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 14,
  #   i_Col = 3,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 14,
  #   i_Col = 4,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # 
  # #####################################################################################X
  # ## Button_Load_Example_Type Row 15 / Col 1:4 -----
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 15,
  #   i_Col = 1,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 15,
  #   i_Col = 2,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 15,
  #   i_Col = 3,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 15,
  #   i_Col = 4,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # 
  # #####################################################################################X
  # ## Button_Load_Example_Type Row 16 / Col 1:4 -----
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 16,
  #   i_Col = 1,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 16,
  #   i_Col = 2,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 16,
  #   i_Col = 3,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # ObserveMatrixButton_LoadDatasetFromPoolToCalculation (
  #   i_Row = 16,
  #   i_Col = 4,
  #   input = input,
  #   rv = rv,
  #   session = session,
  #   DF_PoolData_Input = DF_Pool_Input (),
  #   DF_PoolData_Output = DF_Pool_Output ()
  # )
  # 
  # 
  
  
  
  
    
  #####################################################################################X
  ## Automatic calculation -----
  


  # Das funktioniert, man muss nur alle Eingabevariablen einzeln auflisten 
  # observeEvent (
  #   input$d_Insulation_Ceiling, {
  #     if (input$Checkbox_AutomaticCalculation == TRUE) {
  #       shinyjs::click("Button_Calculate")
  #     }
  #     #invalidateLater(3000)
  #     ignoreInit = TRUE
  #   }) # "The button will be pressed automatically every 3 seconds"
  # 
  
  
  observe ( {
      
    if (input$Checkbox_AutomaticCalculation == TRUE) {
        
        shinyjs::click("Button_Calculate")
        
    }
    invalidateLater (3000)
  }) # "The button will be pressed automatically every 3 seconds"

  
  
  
    
  
  
  #####################################################################################X
  ## Button_Calculate -----
  
  ## Calculates the "Calc" datasets, Input: rv$DF_Calc_Input Result: rv$DF_Calc_Output
  
  observeEvent (
    input$Button_Calculate, {
      
      if (is.na (rv$DF_Calc_Input [1,1])) {
        
        if (is.na (rv$DF_Stack_Input [1,1])) {
          
          shinyjs::click ("Button_Pool_AddToStack")
          
        }
        
        shinyjs::click ("Button_LoadFromStackToCalculation")
        
      } else {
        
        
        ResultList <- 
          Calculate_EnergyDemand  (
            myDF_BuildingData_Input  = rv$DF_Calc_Input   [1, ] ,
            myDF_BuildingData_Output = rv$DF_Calc_Output  [1, ] ,
            TabulaTables = TabulaTables (),
            ID_Calculate = 1
          )
        
        rv$DF_Calc_Output <-
          data.frame (
            ResultList$DF_Stack_Output [1, ]
          )
        
        
        
        rv$DF_Calc_Output [ ,"Date_Change"] <- 
          format (
            x = Sys.time (),
            format = "%Y-%m-%d %H:%M"
          )    
        
        #  as.character (Sys.time ())    
        # !!! Aufgabe: Format verbessern, außerdem beim Einlesen von Excel schon in Tag/Zeit-Format verwandeln, 
        # dabei as.POSIXct() verwenden (diesbezüglich GTZ-Skript anschauen)     
        
        
        F_CalcAdapt <- 
          as.numeric (
            rv$DF_Calc_Output [1 ,"F_CalcAdapt_M_Model1"]
          )
        
        F_ReferenceAreaToLivingSpace <-  1.1
        
        # A_Model1_C_Living is currently not being calculated
        # as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Ref"]) /
        #   as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Living"])

                
        rv$DF_Calc_ChartEnergyData <-
          
          as.data.frame (
            
            as.list (
                
              cbind (
                ResultList$DF_Calc_ChartEnergyData [1, 1],
                F_CalcAdapt,
                F_ReferenceAreaToLivingSpace,
                ResultList$DF_Calc_ChartEnergyData [1, 2:ncol(ResultList$DF_Calc_ChartEnergyData)]
              )
              
            ),
            
            col.names =  c (
              "ID_Dataset", 
              "F_CalcAdapt",
              "F_ReferenceAreaToLivingSpace",
              colnames (ResultList$DF_Calc_ChartEnergyData [ ,-1]))
            
          )
        
      

        
        
        ## 2025-10-24 changed
        #
        # F_Calc_Correction_EnergyDemandIndicators <- 
        #   if (input$Checkbox_ApplyCalibrationFactor == TRUE) {
        #     as.numeric (
        #       rv$DF_Calc_Output [1 ,"F_CalcAdapt_M_Model1"]
        #     )
        #   } else {
        #     1
        #   } 
        # 
        # F_Calc_Correction_EnergyDemandIndicators <- 
        #   F_Calc_Correction_EnergyDemandIndicators *
        #   if (input$Checkbox_ReferToLivingSpace == TRUE) {
        #     1.1
        #     # A_Model1_C_Living is currently not being calculated
        #     # as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Ref"]) /
        #     #   as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Living"])
        #   } else {
        #     1
        #   } 
        # 	
        # 
        # rv$DF_Calc_ChartEnergyData <-
        #   
        #   as.data.frame (
        #     
        #     as.list (
        #       cbind (
        #         ResultList$DF_Calc_ChartEnergyData [1, 1],
        #         F_Calc_Correction_EnergyDemandIndicators * 
        #           ResultList$DF_Calc_ChartEnergyData [1, 2:ncol(ResultList$DF_Calc_ChartEnergyData)]
        #       )
        #     ),
        #     
        #     col.names =  c ("ID_Dataset", colnames (ResultList$DF_Calc_ChartEnergyData [ ,-1]))
        #     
        #     
        #   )
        
          # data.frame (
          #   
          #   cbind (
          #     ResultList$DF_Calc_ChartEnergyData [1, 1],
          #     F_Calc_Correction_EnergyDemandIndicators * 
          #     ResultList$DF_Calc_ChartEnergyData [1, 2:ncol(ResultList$DF_Calc_ChartEnergyData)]
          #     )
          #   
          #   )
        
        # 2025-10-24 abgeschaltet, da dies zu einer ständigen Neuberechnung führt, 
        # stattdessen oben in as.data.frame () direkt die col.names angelegt, col.names funktioniert aber nur, 
        # wenn man aus dem Dataframe vorher eine Liste macht  
        # colnames (rv$DF_Calc_ChartEnergyData) <- c ("ID_Dataset", colnames (rv$DF_Calc_ChartEnergyData [ ,-1]))
        #colnames (rv$DF_Calc_ChartEnergyData) <- c ("ID_Stack", colnames (rv$DF_Calc_ChartEnergyData [ ,-1]))
        
        
        rv$DF_Calc_InterimResults <- as.data.frame (
          
          as.list (
            
            cbind (
              rv$DF_Calc_Input   [1,1],
              ResultList$DF_Calc_InterimResults [1, -9] # "Date_Change" removed, caused contious update of screen in output table ("Daten")
            )
            
          ),
          
          col.names =  c (
            "ID_Stack", 
            colnames (ResultList$DF_Calc_InterimResults [ , -9]))
          # "Date_Change" removed, caused contious update of screen in output table ("Daten")
          
        )
        
        
        
        
        
                
        # rv$DF_Calc_InterimResults <- # all interim results from the original dataframe "Data_Calc"
        #   data.frame (
        #     cbind (
        #       rv$DF_Calc_Input   [1,1],
        #       ResultList$DF_Calc_InterimResults [1, ]
        #       )
        #     #ResultList$DF_Calc_InterimResults
        #   )
        # 
        # colnames (rv$DF_Calc_InterimResults) <- c ("ID_Stack", colnames (rv$DF_Calc_InterimResults [ ,-1]))
        # 
        # 
        # rv$DF_Calc_InterimResults [ ,"Date_Change"] <- 
        #   format (
        #     x = Sys.time (),
        #     format = "%Y-%m-%d %H:%M"
        #   )    
        
                
        # Update the specific rows in the calculation stack
        # As a condition an "Automatic update" option should be included in the settings 
        if (TRUE == FALSE){   # not used
          
          rv$DF_Stack_Output  [input$SelectInput_ID_Dataset_Stack, ] <-
            rv$DF_Calc_Output
          
          rv$DF_Stack_ChartEnergyData [input$SelectInput_ID_Dataset_Stack, ] <-
              ResultList$DF_Calc_ChartEnergyData
          
          #colnames(rv$DF_Stack_ChartEnergyData [ ,1]) <- "ID_Dataset" 
          
          
          rv$DF_Stack_InterimResults [input$SelectInput_ID_Dataset_Stack, ] <- 
              ResultList$DF_Calc_InterimResults
          
        } # End if
        
        
      } # End else
      
      
      
    } #, ignoreInit = TRUE
  ) # End observe event Button_Calculate
  
  
  
  
  
  
  
  #####################################################################################X
  ## Button_CalculateStack -----
  
  ## Calculates all stack datasets, input: rv$DF_Stack_Input / result:  rv$DF_Stack_Output
  ## Additionally the result of the currently selected Calc dataset will be updated: rv$DF_Calc_Output 
  
  observeEvent (
    input$Button_CalculateStack, {

        
        ResultList <- 
          Calculate_EnergyDemand  (
            myDF_BuildingData_Input  = rv$DF_Stack_Input   [,] ,
            myDF_BuildingData_Output = rv$DF_Stack_Output  [,] ,
            TabulaTables = TabulaTables (),
            ID_Calculate = NA # NA = all datasets are being calculated
          )
        
        rv$DF_Stack_Output <-
          data.frame (
            ResultList$DF_Stack_Output [ , ]
          )

        rv$DF_Stack_Output [ ,"Date_Change"] <- 
          format (
            x = Sys.time (),
            format = "%Y-%m-%d %H:%M"
          )    
        
 
                
        # rv$DF_Calc_Input <-
        #   data.frame (
        #     ResultList$DF_Stack_Input [1, ]
        #   )
        
        
        ## 2025-09-05 abgeschaltet, der Calc-Datensatz bleibt von der Stack-Berechnung unberührt 
        # rv$DF_Calc_Output <-
        #   data.frame (
        #     ResultList$DF_Stack_Output [input$SelectInput_ID_Dataset_Stack, ]
        #   )
        # 
        # rv$DF_Calc_Output [1 ,"Date_Change"] <- 
        #   as.character (Sys.time ())    
        # !!! Aufgabe: Format verbessern, außerdem beim Einlesen von Excel schon in Tag/Zeit-Format verwandeln, 
        # dabei as.POSIXct() verwenden (diesbezüglich GTZ-Skript anschauen)     
        
        
        
        
        F_CalcAdapt <- 
          as.data.frame(
            as.numeric (
              rv$DF_Stack_Output [ ,"F_CalcAdapt_M_Model1"]
            )
          )
        
        F_ReferenceAreaToLivingSpace <-  1.1
        
        # A_Model1_C_Living is currently not being calculated
        # as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Ref"]) /
        #   as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Living"])
        
        
        
        rv$DF_Stack_ChartEnergyData <-
          
          as.data.frame (
            
            as.list (
              
              cbind (
                ResultList$DF_Calc_ChartEnergyData [ , 1],
                F_CalcAdapt [ , ],
                F_ReferenceAreaToLivingSpace,
                ResultList$DF_Calc_ChartEnergyData [ , 2:ncol(ResultList$DF_Calc_ChartEnergyData)]
              )
              
            ),
            
            col.names =  c (
              "ID_Dataset", 
              "F_CalcAdapt",
              "F_ReferenceAreaToLivingSpace",
              colnames (ResultList$DF_Calc_ChartEnergyData [ ,-1]))
            
          )
        
        ## 2025-10-24 changed
        # 
        # rv$DF_Stack_ChartEnergyData <-
        #   data.frame(
        #     ResultList$DF_Calc_ChartEnergyData
        #     # cbind (
        #     #   rv$DF_Calc_Input [ ,1],
        #     #   ResultList$DF_Calc_ChartEnergyData
        #     # )
        #   )
        
        
        # colnames(rv$DF_Stack_ChartEnergyData [ ,1]) <- "ID_Dataset" 
        
        
        rv$DF_Stack_InterimResults <- 
          data.frame (
            cbind (
              rv$DF_Calc_Input [ ,1],
              ResultList$DF_Calc_InterimResults
            )
          )
        
        

      
      
    } #, ignoreInit = TRUE
  ) # End observe event Button_CalculateStack
  
  
  
  
  
  
  
  #####################################################################################X
  ## Button_CalculateStack_IncludeTargetActualComparison -----
  
  ## Calculates all stack datasets, input: rv$DF_Stack_Input / result:  rv$DF_Stack_Output
  ## Additionally the result of the currently selected Calc dataset will be updated: rv$DF_Calc_Output 
  
  observeEvent (
    input$Button_CalculateStack_IncludeTargetActualComparison, {

            
      if (input$Checkbox_AutomaticCalculation == TRUE) {
        Status_AutomaticCalculation <- TRUE 
      } else {
        Status_AutomaticCalculation <- FALSE 
      }
      
      updateCheckboxInput (
        session = session,
        inputId = "Checkbox_AutomaticCalculation",
        value = FALSE 
      )  

      ResultList <- 
        Calculate_EnergyDemand  (
          myDF_BuildingData_Input  = rv$DF_Stack_Input   [,] ,
          myDF_BuildingData_Output = rv$DF_Stack_Output  [,] ,
          TabulaTables = TabulaTables (),
          ID_Calculate = NA, # NA = all datasets are being calculated
          Include_TargetActualComparison = TRUE
        )
      
      rv$DF_Stack_Output <-
        data.frame (
          ResultList$DF_Stack_Output [ , ]
        )
      
      rv$DF_Stack_Output [ ,"Date_Change"] <- 
        format (
          x = Sys.time (),
          format = "%Y-%m-%d %H:%M"
        )    
      
      
      
      # rv$DF_Calc_Input <-
      #   data.frame (
      #     ResultList$DF_Stack_Input [1, ]
      #   )
      
      
      ## 2025-09-05 abgeschaltet, der Calc-Datensatz bleibt von der Stack-Berechnung unberührt 
      # rv$DF_Calc_Output <-
      #   data.frame (
      #     ResultList$DF_Stack_Output [input$SelectInput_ID_Dataset_Stack, ]
      #   )
      # 
      # rv$DF_Calc_Output [1 ,"Date_Change"] <- 
      #   as.character (Sys.time ())    
      # !!! Aufgabe: Format verbessern, außerdem beim Einlesen von Excel schon in Tag/Zeit-Format verwandeln, 
      # dabei as.POSIXct() verwenden (diesbezüglich GTZ-Skript anschauen)     
      
      
      
      
      F_CalcAdapt <- 
        as.data.frame(
          as.numeric (
            rv$DF_Stack_Output [ ,"F_CalcAdapt_M_Model1"]
          )
        )
      
      F_ReferenceAreaToLivingSpace <-  1.1
      
      # A_Model1_C_Living is currently not being calculated
      # as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Ref"]) /
      #   as.numeric (rv$DF_Calc_Output [1 ,"A_Model1_C_Living"])
      
      
      
      rv$DF_Stack_ChartEnergyData <-
        
        as.data.frame (
          
          as.list (
            
            cbind (
              ResultList$DF_Calc_ChartEnergyData [ , 1],
              F_CalcAdapt [ , ],
              F_ReferenceAreaToLivingSpace,
              ResultList$DF_Calc_ChartEnergyData [ , 2:ncol(ResultList$DF_Calc_ChartEnergyData)]
            )
            
          ),
          
          col.names =  c (
            "ID_Dataset", 
            "F_CalcAdapt",
            "F_ReferenceAreaToLivingSpace",
            colnames (ResultList$DF_Calc_ChartEnergyData [ ,-1]))
          
        )
      
      ## 2025-10-24 changed
      # 
      # rv$DF_Stack_ChartEnergyData <-
      #   data.frame(
      #     ResultList$DF_Calc_ChartEnergyData
      #     # cbind (
      #     #   rv$DF_Calc_Input [ ,1],
      #     #   ResultList$DF_Calc_ChartEnergyData
      #     # )
      #   )
      
      
      # colnames(rv$DF_Stack_ChartEnergyData [ ,1]) <- "ID_Dataset" 
      
      
      rv$DF_Stack_InterimResults <- 
        data.frame (
          cbind (
            rv$DF_Calc_Input [ ,1],
            ResultList$DF_Calc_InterimResults
          )
        )
      
      
      if (Status_AutomaticCalculation == TRUE) {
        
        updateCheckboxInput (
          session = session,
          inputId = "Checkbox_AutomaticCalculation",
          value = TRUE 
        )  
        
      } 
      
     
      
      
      
    } #, ignoreInit = TRUE
  ) # End observe event Button_CalculateStack_IncludeTargetActualComparison
  
  
  
  
  
  
  
  
  # observeEvent (
  #   input$Button_Calculate, {
  # 
  #     if (is.na (rv$DF_Stack_Input [1,1])) {
  #       
  #       shinyjs::click ("Button_Pool_AddToStack")
  #       
  #     } else {
  #       
  #       rv$DF_Calc_Input <- 
  #         data.frame (
  #           rv$DF_Stack_Input  [input$SelectInput_ID_Dataset_Stack, ]
  #         )  
  #       
  #       
  #       ResultList <- 
  #         Calculate_EnergyDemand  (
  #           myDF_Stack_Input  = rv$DF_Stack_Input   [input$SelectInput_ID_Dataset_Stack, ] ,
  #           myDF_Stack_Output = rv$DF_Stack_Output  [input$SelectInput_ID_Dataset_Stack, ] ,
  #           TabulaTables = TabulaTables (),
  #           ID_Calculate = input$SelectInput_ID_Dataset_Stack
  #         )
  #       
  #       rv$DF_Calc_Output <-
  #         data.frame (
  #           ResultList$DF_Stack_Output
  #         )
  #       
  #       
  #       
  #       rv$DF_Calc_Output [ ,"Date_Change"] <- 
  #         as.character (Sys.time ())    
  #       # !!! Aufgabe: Format verbessern, außerdem beim Einlesen von Excel schon in Tag/Zeit-Format verwandeln, 
  #       # dabei as.POSIXct() verwenden (diesbezüglich GTZ-Skript anschauen)     
  #       
  #       
  #       
  #       
  #       rv$DF_Calc_ChartEnergyData <-
  #         data.frame(
  #           ResultList$DF_Calc_ChartEnergyData
  #         )
  #       
  #       
  #       
  #       # Update the specific rows in the calculation stack
  #       # As a condition an "Automatic update" option should be included in the settings 
  #       if (TRUE == TRUE){
  #         
  #         rv$DF_Stack_Output  [input$SelectInput_ID_Dataset_Stack, ] <-
  #           rv$DF_Calc_Output
  #         
  #       } # End if
  #       
  #       
  #     } # End else
  #             
  #     
  # 
  #   } #, ignoreInit = TRUE
  # ) # End observe event Button_Calculate
  # 
  

  
  #####################################################################################X
  ## Old stack output tables -----
  #####################################################################################X

  

  output$Stack_Input <- renderTable ({
    rv$DF_Stack_Input [ , -c(5:16,11:20) ]
    },
    rownames = FALSE,
    align = "r",
    bordered = TRUE
  )
  
  output$Stack_Output <- renderTable ({
    rv$DF_Stack_Output [ ,  ]
    },
    rownames = FALSE,
    align = "r",
    bordered = TRUE
  )
  
  output$Stack_ChartEnergy <- renderTable ({
    
    rv$DF_Calc_ChartEnergyData [ , ]
    
    # geht nicht 
    #round (rv$DF_Calc_ChartEnergyData [1 , 2:4], 1)
    # # round (
    # #   rv$DF_Calc_ChartEnergyData [2 , 2:nrow(rv$DF_Calc_ChartEnergyData)],
    # #   2
    # # )
    # ifelse (
    #   is.numeric (rv$DF_Calc_ChartEnergyData [ , ]),
    #   round (
    #     rv$DF_Calc_ChartEnergyData [ , ],
    #     2
    #   ),
    #   rv$DF_Calc_ChartEnergyData [ , ]
    # )
    
  },
  rownames = FALSE,
  align = "r",
  bordered = TRUE,
  digits = 2
  )
  
  
  
  #####################################################################################X
  ## Dashboard: calc output tables -----
  #####################################################################################X
  
  
      
      output$Calc_Input <-
        renderTable ({
          t (rv$DF_Calc_Input)
          #t (rv$DF_Stack_Input [input$SelectInput_ID_Dataset_Stack, ])
        },
        rownames = TRUE,
        colnames = FALSE,
        striped = TRUE,
        hover = TRUE,
        spacing = "xs",
        width = "100%",
        align = "r",
        bordered = TRUE
        )
      
      output$Calc_Output <-
        renderTable ({
          t (rv$DF_Calc_Output)
          #t (rv$DF_Stack_Output [input$SelectInput_ID_Dataset_Stack, ])
        },
        rownames = TRUE,
        colnames = FALSE,
        striped = TRUE,
        hover = TRUE,
        spacing = "xs",
        width = "100%",
        align = "r",
        bordered = TRUE
        )
      
      output$Calc_InterimResults <-
        renderTable ({
          t (rv$DF_Calc_InterimResults)
        },
        rownames = TRUE,
        colnames = FALSE,
        striped = TRUE,
        hover = TRUE,
        spacing = "xs",
        width = "100%",
        align = "r",
        bordered = TRUE
        )
      
      
      output$Calc_ChartEnergy_CorrectionFactors <-
        renderTable ({
          t (
            cbind (
              rv$DF_Calc_ChartEnergyData [ ,c("F_CalcAdapt", "F_ReferenceAreaToLivingSpace")],
              F_CorrectionTotal = rv$DF_Calc_ChartEnergyData [ , "F_CalcAdapt"] *
                rv$DF_Calc_ChartEnergyData [ ,"F_ReferenceAreaToLivingSpace"]
                )
            )
        },
        rownames = TRUE,
        colnames = FALSE,
        striped = TRUE,
        hover = TRUE,
        spacing = "xs",
        width = "100%",
        align = "r",
        bordered = TRUE,
        digits = 3        
        )
      
            
      output$Calc_ChartEnergy <-
        renderTable ({
          t (rv$DF_Calc_ChartEnergyData [ ,-c(1,2,3)])
        },
        rownames = TRUE,
        colnames = FALSE,
        striped = TRUE,
        hover = TRUE,
        spacing = "xs",
        width = "100%",
        align = "r",
        bordered = TRUE,
        digits = 1        
        )
      
      
      #####################################################################################X
      ## Output charts -----
      #####################################################################################X
      
      
      
      
      #####################################################################################X
      ### Load settings 
      
      
      # Änderung erforderlich: die hier verwendeten Parameter sollten im Paket TabulaCharts 
      # als RDA zur Verfügung stehen.
      

      
      
      
      
      
            
      # ChartData_HeatNeed <- reactive ( {
      #   LoadChartSettings (
      #     mySourceType =    "Excel",
      #     myFileName =      "ChartSettings_HeatNeed",
      #     mySheetName =     "DF_ChartData"
      #   )
      # })
      # 
      # ChartSettings_HeatNeed <- reactive ({
      #   LoadChartSettings (
      #     mySourceType =    "Excel",
      #     myFileName =      "ChartSettings_HeatNeed",
      #     mySheetName =     "DF_Settings"
      #   )
      # })
      

      #####################################################################################X
      ### Create charts 
      
      
      output$Chart_HeatNeed <- renderEcharts4r ({
        ShowBarChart  (
          myChartSettings = ChartSettings_HeatNeed  [4, ],
          myChartData     = ChartData_HeatNeed ,
          DF_EnergyData   = if (is.na (rv$DF_Calc_ChartEnergyData [1,1])) {
            NULL
          } else {
            cbind (
              rv$DF_Calc_ChartEnergyData [1,1],
              rv$DF_Calc_ChartEnergyData [1,c(-1,-2,-3)] * 
                if (input$Checkbox_ApplyCalibrationFactor == TRUE) {
                  as.numeric (
                    rv$DF_Calc_ChartEnergyData [1 ,"F_CalcAdapt"]
                  )
                } else {
                  1
                } * 
                if (input$Checkbox_ReferToLivingSpace == TRUE) {
                  rv$DF_Calc_ChartEnergyData [1 ,"F_ReferenceAreaToLivingSpace"]
                } else {
                  1
                } 
            )
          },
#          DF_EnergyData   = rv$DF_Calc_ChartEnergyData [1, ],
          Index_Dataset   = 1,
          Code_Language   = "GER",
          #Code_Language  = "ENG",
          Type_LegendLabel = "Short", 
          Do_FlipChart    = FALSE,
          stackStrategy   = 'samesign',
          ScalingFactor_FontSize = 0.5,
          Set_MaxY_Auto          = input$Checkbox_AutoScaling_ChartHeatNeed, # Set_MaxY_Auto_ChartHeatNeed,
          y_Max_ManualInput      = input$NumericInput_MaxValue_Scale_ChartHeatNeed #y_Max_ManualInput_ChartHeatNeed #        
          )
      }) 
      
      
      
      output$Chart_FinalEnergy <- renderEcharts4r ({
        ShowBarChart  (
          myChartSettings = ChartSettings_FinalEnergy  [3, ],
          myChartData     = ChartData_FinalEnergy ,
          DF_EnergyData   = if (is.na (rv$DF_Calc_ChartEnergyData [1,1])) {
            NULL
          } else {
            cbind (
              rv$DF_Calc_ChartEnergyData [1,1],
              rv$DF_Calc_ChartEnergyData [1,c(-1,-2,-3)] * 
                if (input$Checkbox_ApplyCalibrationFactor == TRUE) {
                  as.numeric (
                    rv$DF_Calc_ChartEnergyData [1 ,"F_CalcAdapt"]
                  )
                } else {
                  1
                } * 
                if (input$Checkbox_ReferToLivingSpace == TRUE) {
                  rv$DF_Calc_ChartEnergyData [1 ,"F_ReferenceAreaToLivingSpace"]
                } else {
                  1
                } 
            )
          },
          #DF_EnergyData   = rv$DF_Calc_ChartEnergyData [1, ],
          Index_Dataset   = 1,
          Code_Language   = "GER",
          #Code_Language  = "ENG",
          Type_LegendLabel = "Standard", 
          Do_FlipChart    = FALSE,
          stackStrategy   = 'samesign',
          ScalingFactor_FontSize = 0.5,
          Set_MaxY_Auto          = input$Checkbox_AutoScaling_ChartFinalEnergy,
          y_Max_ManualInput      = input$NumericInput_MaxValue_Scale_ChartFinalEnergy         
        )
      }) 
      
      
      
      output$Chart_ExpectationRanges <- renderEcharts4r ({
        ShowBarChart  (
          myChartSettings = ChartSettings_ExpectationRanges  [4, ],
          myChartData     = ChartData_ExpectationRanges ,
          DF_EnergyData   = if (is.na (rv$DF_Calc_ChartEnergyData [1,1])) {
            NULL
          } else {
            cbind (
              rv$DF_Calc_ChartEnergyData [1,1],
              rv$DF_Calc_ChartEnergyData [1,c(-1,-2,-3)] * 
                if (input$Checkbox_ApplyCalibrationFactor == TRUE) {
                  as.numeric (
                    rv$DF_Calc_ChartEnergyData [1 ,"F_CalcAdapt"]
                  )
                } else {
                  1
                } * 
                if (input$Checkbox_ReferToLivingSpace == TRUE) {
                  rv$DF_Calc_ChartEnergyData [1 ,"F_ReferenceAreaToLivingSpace"]
                } else {
                  1
                } 
            )
          },
          #DF_EnergyData   = rv$DF_Calc_ChartEnergyData [1, ],
          Index_Dataset   = 1,
          Code_Language   = "GER",
          #Code_Language  = "ENG",
          Type_LegendLabel = "Short", 
          Do_FlipChart    = TRUE,
          stackStrategy   = 'all',
          ScalingFactor_FontSize = 0.5,
          Set_MaxY_Auto          = input$Checkbox_AutoScaling_ChartExpectationRanges,
          y_Max_ManualInput      = input$NumericInput_MaxValue_Scale_ChartExpectationRanges         
        )
      }) 
      
      
      
      output$Chart_CompareHeatNeed <- renderEcharts4r ({
        ShowBarChart_DataComparison  (
          myChartSettings        = ChartSettings_HeatNeed  [5, ],
          myChartData            = ChartData_HeatNeed ,
          DF_EnergyData   = if (is.na (rv$DF_Stack_ChartEnergyData [1,1])) {
            NULL
          } else {
            cbind (
              ID_Dataset = rv$DF_Stack_ChartEnergyData [ ,1],
              rv$DF_Stack_ChartEnergyData [ ,c(-1,-2,-3)] * 
                ifelse (input$Checkbox_ApplyCalibrationFactor_ChartCompareLeft == TRUE,
                        as.numeric (rv$DF_Stack_ChartEnergyData [ ,"F_CalcAdapt"]),
                        1) * 
                ifelse (input$Checkbox_ReferToLivingSpace_ChartCompareLeft == TRUE,
                        rv$DF_Stack_ChartEnergyData [ ,"F_ReferenceAreaToLivingSpace"],
                        1)
            )
          },
          #DF_EnergyData          = rv$DF_Stack_ChartEnergyData [ , ],
          Index_Dataset          = NA,
          Code_Language          = "GER",
          #Code_Language         = "ENG",
          Type_LegendLabel       = "Short", 
          Do_FlipChart           = TRUE,
          stackStrategy          = 'samesign',
          ScalingFactor_FontSize = 0.7,
          Set_MaxY_Auto          = input$Checkbox_AutoScaling_ChartCompareLeft, # Set_MaxY_Auto_ChartCompareLeft,
          y_Max_ManualInput      = input$NumericInput_MaxValue_Scale_ChartCompareLeft, #y_Max_ManualInput_ChartCompareLeft #        
          Filter_VarName         = "q_h_nd_net" # c("q_int", "q_sol")   # 
        )
      }) 
      
      output$Chart_CompareFinalEnergy <- renderEcharts4r ({
        ShowBarChart_DataComparison  (
          myChartSettings        = ChartSettings_FinalEnergy  [5, ],
          myChartData            = ChartData_FinalEnergy ,
          DF_EnergyData   = if (is.na (rv$DF_Stack_ChartEnergyData [1,1])) {
            NULL
          } else {
            cbind (
              ID_Dataset = rv$DF_Stack_ChartEnergyData [ ,1],
              rv$DF_Stack_ChartEnergyData [ ,c(-1,-2,-3)] * 
                ifelse (input$Checkbox_ApplyCalibrationFactor_ChartCompareRight == TRUE,
                        as.numeric (rv$DF_Stack_ChartEnergyData [ ,"F_CalcAdapt"]),
                        1) * 
                ifelse (input$Checkbox_ReferToLivingSpace_ChartCompareRight == TRUE,
                        rv$DF_Stack_ChartEnergyData [ ,"F_ReferenceAreaToLivingSpace"],
                        1)
            )
          },
          #DF_EnergyData          = rv$DF_Stack_ChartEnergyData [ , ],
          Index_Dataset          = NA,
          Code_Language          = "GER",
          #Code_Language         = "ENG",
          Type_LegendLabel       = "Standard", 
          Do_FlipChart           = TRUE,
          stackStrategy          = 'samesign',
          ScalingFactor_FontSize = 0.7,
          Set_MaxY_Auto          = input$Checkbox_AutoScaling_ChartCompareRight, # Set_MaxY_Auto_ChartCompareLeft,
          y_Max_ManualInput      = input$NumericInput_MaxValue_Scale_ChartCompareRight, #y_Max_ManualInput_ChartCompareLeft #        
          Filter_VarName         = c("q_del_sum_gas", 
                                     "q_del_sum_oil", 
                                     "q_del_sum_coal", 
                                     "q_del_sum_bio",
                                     "q_del_sum_el",
                                     "q_del_sum_dh",
                                     "q_del_sum_other"  
          )  
          
        )
      }) 
      

      
      observeEvent (
        input$NumericInput_Height_ChartCompareLeft, {
          Height_ChartCompareLeft <- input$NumericInput_Height_ChartCompareLeft
        },
        ignoreInit = TRUE
        
      )
      
      
            

      # observeEvent (
      #   input$Checkbox_AutoScaling_ChartHeatNeed, {
      #     Set_MaxY_Auto_ChartHeatNeed <- input$Checkbox_AutoScaling_ChartHeatNeed
      #   }
      # )
      
      
            
      #####################################################################################X
      ## Do_UpsizeScale_ChartHeatNeed -----
      
      # 
      # observeEvent (
      #   input$NumericInput_MaxValue_Scale_ChartHeatNeed, {
      #     y_Max_ManualInput_ChartHeatNeed <- input$TextInput_MaxValue_Scale_ChartHeatNeed
      #   } )
      # 
      
      # observeEvent (
      #   input$TextInput_MaxValue_Scale_ChartHeatNeed, {
      #     y_Max_ManualInput_ChartHeatNeed <- input$TextInput_MaxValue_Scale_ChartHeatNeed
      #   } )
      # 
      # 
      # updateTextInput (
      #   inputId = "TextInput_MaxValue_Scale_ChartHeatNeed",
      #   value   = y_Max_ManualInput_ChartHeatNeed
      # )
      # 
      # 
      # 
      # observeEvent (
      #   input$Do_UpsizeScale_ChartHeatNeed, {
      #     
      #     #Set_MaxY_Auto_ChartHeatNeed <- FALSE
      #     
      #     y_Max_ManualInput_ChartHeatNeed <- 
      #       as.integer (input$TextInput_MaxValue_Scale_ChartHeatNeed)  + 50 
      #     #y_Max_ManualInput_ChartHeatNeed <- y_Max_ManualInput_ChartHeatNeed + 50 
      #     
      #   }
      # )
      # 
      # observeEvent (
      #   input$Do_DownsizeScale_ChartHeatNeed, {
      #     
      #     #Set_MaxY_Auto_ChartHeatNeed <- FALSE
      # 
      #     y_Max_ManualInput_ChartHeatNeed <- 
      #       as.integer (input$TextInput_MaxValue_Scale_ChartHeatNeed) - 50 
      #     #y_Max_ManualInput_ChartHeatNeed <- y_Max_ManualInput_ChartHeatNeed - 50 
      #     
      #   }
      # )
      
      
      #######################################################################X
      ## Data: Display, download and import data tables  -----
      
      # Script section from CliDaMonDisplay ()
      
      
      # 2025-05-09 mit observeEvent ging's nicht
      #
      # observeEvent (
      #   input$myOutputSelection, {
      #     
      #     myOutputDataframe <- 
      #       
      #       switch (
      #         
      #         input$myOutputSelection,
      #         
      #         "Stack_Input"          = rv$DF_Stack_Input,
      #         
      #         "Stack_Output"         = rv$DF_Stack_Output,
      #         
      #         "CurrentCalculation_ChartEnergy"    = rv$DF_Calc_ChartEnergyData,
      #         
      #         "CurrentCalculation_InterimResults" = rv$DF_Calc_InterimResults
      #         
      #         
      #         # "ResultTable_Year" = ResultTable_Year (),
      #         # 
      #         # "DF_ClimCalc_1"    = DF_ClimCalc_1 (),
      #         # 
      #         # "DF_ClimCalc_2"    = DF_ClimCalc_2 (), 
      #         # 
      #         # "DF_ClimCalc_Both" = DF_ClimCalc_Both (),
      #         # 
      #         # "DF_Evaluation_1"  = DF_Evaluation_1 (),
      #         # 
      #         # "DF_Evaluation_2"  = DF_Evaluation_2 (),
      #         # 
      #         # "DF_EvaluationByYear_1"  = DF_EvaluationByYear_1 (),
      #         # 
      #         # "DF_EvaluationByYear_2"  = DF_EvaluationByYear_2 ()
      #         # 
      #         # # "Data.TA.HD"  = clidamonger::data.ta.hd
      #         # # Doesn't work, too large?
      #         
      #       ) # End switch
      #     
      #   }
      # 
      #                                   
      #               
      #  ) # End observeEvent

      
      
      
      
      myOutputDataframe_Stack_Input <- reactive ({
        rv$DF_Stack_Input
      })
      
      myOutputDataframe_Stack_Output <- reactive ({
        rv$DF_Stack_Output
      })
      
      myOutputDataframe_Stack_ChartEnergyData <- reactive ({
        rv$DF_Stack_ChartEnergyData
      })
      
      myOutputDataframe_Stack_InterimResults <- reactive ({
        rv$DF_Stack_InterimResults
      })
      
      myOutputDataframe_Calc_Input <- reactive ({
        rv$DF_Calc_Input
      })
      
      myOutputDataframe_Calc_Output <- reactive ({
        rv$DF_Calc_Output
      })
      
      myOutputDataframe_Calc_ChartEnergyData <- reactive ({
        round (
          rv$DF_Calc_ChartEnergyData [ ,-1],
          2
        )
          
      })
      
      myOutputDataframe_Calc_InterimResults <- reactive ({
        rv$DF_Calc_InterimResults
      })
      
      
      myOutputDataframe_Selectable <- reactive ({

        switch (

          input$myOutputSelection,

          "Calc_Input"          = rv$DF_Calc_Input,
          
          "Calc_Output"         = rv$DF_Calc_Output,
          
          "Calc_ChartEnergy"    = rv$DF_Calc_ChartEnergyData,
          
          "Calc_InterimResults" = rv$DF_Calc_InterimResults,
          
          "Stack_Input"          = rv$DF_Stack_Input,

          "Stack_Output"         = rv$DF_Stack_Output,

          "Stack_ChartEnergy"    = rv$DF_Stack_ChartEnergyData,
          
          "Stack_InterimResults" = rv$DF_Stack_InterimResults
          
        )
      })


      output$myOutputTable_Stack_Input <-
        DT::renderDataTable  ({
          if (input$TransposeOutputTable_Stack_Input == TRUE) {
            t (myOutputDataframe_Stack_Input ()  )
          } else {
            myOutputDataframe_Stack_Input () 
          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(10, 20, 50, 100, -1),
                              c('10',  '20',  '50', '100', 'All')),
            # lengthMenu = list(c(-1, 100, 50, 20, 10),
            #                   c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      
      
      output$myOutputTable_Stack_Output <-
        DT::renderDataTable  ({
          if (input$TransposeOutputTable_Stack_Output == TRUE) {
            t (myOutputDataframe_Stack_Output ()  )
          } else {
            myOutputDataframe_Stack_Output () 
          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(10, 20, 50, 100, -1),
                              c('10',  '20',  '50', '100', 'All')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      

      
      output$myOutputTable_Stack_ChartEnergyData <-
        DT::renderDataTable  ({
          if (input$TransposeOutputTable_Stack_ChartEnergyData == TRUE) {
            t (myOutputDataframe_Stack_ChartEnergyData ()  )
          } else {
            myOutputDataframe_Stack_ChartEnergyData () 
          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(10, 20, 50, 100, -1),
                              c('10',  '20',  '50', '100', 'All')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
            #columnDefs = list (list (digits = 2, targets = c(3:8))) doesn't work
            #columnDefs = list(list(width = '200px', targets = c(1, 3)))
          )
        )
      
      
      output$myOutputTable_Stack_InterimResults <-
        DT::renderDataTable  ({
          if (input$TransposeOutputTable_Stack_InterimResults == TRUE) {
            t (myOutputDataframe_Stack_InterimResults ()  )
          } else {
            myOutputDataframe_Stack_InterimResults () 
          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(10, 20, 50, 100, -1),
                              c('10',  '20',  '50', '100', 'All')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      
      
      
      
      output$myOutputTable_Calc_Input <-
        DT::renderDataTable  ({
#          if (input$TransposeOutputTable_Calc_Input == TRUE) {
            t (myOutputDataframe_Calc_Input ()  )
#          } else {
#            myOutputDataframe_Calc_Input () 
#          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(-1, 100, 50, 20, 10),
                              c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE
          )
        )
      
      
      output$myOutputTable_Calc_Output <-
        DT::renderDataTable  ({
#         if (input$TransposeOutputTable_Calc_Output == TRUE) {
            t (myOutputDataframe_Calc_Output ()  )
#          } else {
#            myOutputDataframe_Calc_Output () 
#          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(-1, 100, 50, 20, 10),
                              c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      
      
      
      
      output$myOutputTable_Calc_ChartEnergyData <-
        DT::renderDataTable  ({
#          if (input$TransposeOutputTable_Calc_ChartEnergyData == TRUE) {
            t (myOutputDataframe_Calc_ChartEnergyData () [,] )
#          } else {
#            myOutputDataframe_Calc_ChartEnergyData () [,]
#          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(-1, 100, 50, 20, 10),
                              c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE
          )
        )
      
      
      output$myOutputTable_Calc_InterimResults <-
        DT::renderDataTable  ({
          #if (input$TransposeOutputTable_Calc_InterimResults == TRUE) {
            t (myOutputDataframe_Calc_InterimResults ()  )
          #} else {
          #  myOutputDataframe_Calc_InterimResults () 
          #}
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(-1, 100, 50, 20, 10),
                              c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      
      

                  
      
      output$myOutputTable_Selectable <-
        DT::renderDataTable  ({
          if (input$TransposeOutputTable_Selectable == TRUE) {
            t (myOutputDataframe_Selectable ()  )
          } else {
            myOutputDataframe_Selectable () 
          }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(10, 20, 50, 100, -1),
                              c('10',  '20',  '50', '100', 'All')),
            # lengthMenu = list(c(-1, 100, 50, 20, 10),
            #                   c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = TRUE 
          )
        )
      
      
      
      
      
      
      # openxlsx::read.xlsx (
      #   paste0 ("Input/Excel/Parameters_", myChartType, ".xlsx"),
      #   sheet = "ChartData",
      #   colNames = TRUE
      # )
      
      
      # myImportDataframe <- 
      #   renderTable ({
      #     as.data.frame (
      #       input$ImportFile
      #       )
      #   })
      
      

      myImportDataframe <-
        reactive ({

          
          as.data.frame (
            readxl::read_excel (
              path = input$ImportFile$datapath,
              sheet = 1,
              col_names = TRUE,
              #na = NA 
            )
            
          )


          # as.data.frame (
          #   openxlsx::read.xlsx (
          #     input$ImportFile$datapath,
          #     sheet = 1,
          #     colNames = TRUE,
          #     rowNames = TRUE
          #   )
          # 
          # )

          
                    
        })
      
      
      
      
      # myImportDataframe <-
      #   renderTable ({
      # 
      #     inFile <- input$ImportFile
      # 
      #     # if(is.null(inFile))
      #     #   return(NULL)
      # 
      #     # file.rename (inFile$datapath,
      #     #              paste0 (inFile$datapath, ".xlsx"))
      # 
      #     # openxlsx::read.xlsx (
      #     #   paste0 (inFile$datapath, ".xlsx"),
      #     #   sheet = 1,
      #     #   colNames = TRUE
      #     # )
      # 
      #     openxlsx::read.xlsx (
      #       inFile$datapath,
      #       sheet = 1,
      #       colNames = TRUE
      #     )
      # 
      # 
      #     #read_excel (paste(inFile$datapath, ".xlsx", sep=""), 1)
      #   })
      

      
      

      # # For testing
      # myImportDataframe <- reactive ({
      #     rv$DF_Stack_Input
      # })
      
      
      
      output$myImportTable <-
        DT::renderDataTable  ({
          
          myImportDataframe () 
          
          # rbind (
          #   myImportDataframe () ,
          #   myImportDataframe () 
          # )
          
          # if (input$TransposeImportTable == TRUE) {
          #   t (myImportDataframe ()  )
          # } else {
          #   myImportDataframe () 
          # }
        },
        extensions = 'Buttons',
        options =
          list (
            dom = 'Blfrtip',
            lengthMenu = list(c(-1, 100, 50, 20, 10),
                              c('All', '100', '50', '20', '10')),
            buttons = c('copy', 'csv', 'excel', 'pdf'),
            paging = T
          )
        )
      
      
      
      
      
      
      
      #####################################################################################X
      ## Button_TransferImportToStack -----
      
      observeEvent (
        input$Button_TransferImportToStack, {
          
          # In case of an empty stack do nothing
          if (
            !is.na (rv$DF_Stack_Input [1,1]) & 
            !is.null (input$ImportFile$datapath)  # This is working
          #  !is.null (output$myImportTable)      # not working
          #  !is.null (nrow (myImportDataframe () ))   # not working
            ) {
            
            
            n_Row_Stack  <- nrow (rv$DF_Stack_Input)
            n_Row_Import <- nrow (myImportDataframe ())
            
            if (input$Checkbox_KeepExistingDatasets == TRUE) {
              
              i_StackRows_Import    <- (n_Row_Stack + 1) : (n_Row_Stack + n_Row_Import)

              rv$DF_Stack_Input [i_StackRows_Import, ] <- 
                myImportDataframe () [ , ]       
              

              rownames (rv$DF_Stack_Input) <-
                rownames (
                  data.frame (
                    rbind (
                      rv$DF_Stack_Input [1:n_Row_Stack, ],
                      myImportDataframe ()  [, ]
                    )
                  )
                )




              


              # rv$DF_Stack_Input [i_StackRows_Import, ] <- 
              #   myImportDataframe () [ , ]       
              
              # rownames (rv$DF_Stack_Input [i_StackRows_Import, ]) <- 
              #   rv$DF_Stack_Input [i_StackRows_Import , 1]
              
            } else {
              
              i_StackRows_Import <- 1 : n_Row_Import
              
              rv$DF_Stack_Input  <- rv$DF_Stack_Input [1, ] 
              rv$DF_Stack_Output  <- rv$DF_Stack_Output [1, ] 
              
              rv$DF_Stack_Input [i_StackRows_Import, ] <- 
                myImportDataframe () [ , ]       
              
              rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ , 1]
              
            } # End if else

            
            rv$DF_Stack_Output [i_StackRows_Import, ] <- NA
            
            rownames (rv$DF_Stack_Output) <- rownames (rv$DF_Stack_Input)
            rv$DF_Stack_Output [ ,(1:2)] <- rv$DF_Stack_Input [ ,(1:2)]
            
            Index_Dataset <- 1
            
            updateSelectInput (
              session,
              "SelectInput_ID_Dataset_Stack",
              choices = rownames (rv$DF_Stack_Input),
              selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
            )

            updateSelectInput (
              session,
              "SelectInput_ID_Dataset_Stack_2",
              choices = rownames (rv$DF_Stack_Input),
              selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
              # choices = rv$DF_Stack_Input [ , 1],
              # selected = rv$DF_Calc_Input [1, 1]
            )

            updateTextInput (
              inputId = "TextInput_Index_Stack",
              value = Index_Dataset
            )
            
            
            
            shinyjs::click ("Button_CalculateStack")    
            
            
            
            
#             
#             
#             
#             Index_Dataset <- 
#               which (rownames (myImportDataframe () [1, ]) == rownames (rv$DF_Stack_Input))
#               #which (rownames (rv$DF_Calc_Input [1, ]) == rownames (rv$DF_Stack_Input))
# 
#     if (1 == 2) {  
# # provisorisch            if (length (Index_Dataset) > 0) {  
#               ## Case: Calculation dataset rowname matches one of the rownames of the stack dataframe
#               
#               SelectedDataset <- input$SelectInput_ID_Dataset_Stack 
#               
#               rv$DF_Stack_Input [SelectedDataset, ] <- 
#                 data.frame (
#                   myImportDataframe () [1, ]
#                   #rv$DF_Calc_Input [1, ]
#                 )  
#               
#               #rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
#               
# # +++  Provisorische Lösung!!!              
#               
#               rv$DF_Stack_Output [SelectedDataset, ] <- 
#                 data.frame (
#                   rv$DF_Calc_Output [1, ]
#                 )  
#               
#               #rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
#               
#               
#               
#               updateSelectInput (
#                 session,
#                 "SelectInput_ID_Dataset_Stack",
#                 choices = rownames (rv$DF_Stack_Input),
#                 selected = myImportDataframe () [1, 1]
#                 #selected = rv$DF_Calc_Input [1, 1]
#               )
#               
#               # updateSelectInput (
#               #   session,
#               #   "SelectInput_ID_Dataset_Stack",
#               #   #choices = rv$DF_Stack_Input [ , 1]
#               #   selected = rv$DF_Calc_Input [1, 1]
#               # )
#               
#               
#               updateSelectInput (
#                 session,
#                 "SelectInput_ID_Dataset_Stack_2",
#                 choices = rownames (rv$DF_Stack_Input),
#                 selected = myImportDataframe () [1, 1]
#                 #selected = rv$DF_Calc_Input [1, 1]
#               )
#               
#               #shinyjs::click ("Button_LoadFromStackToCalculation")
#               
#               
#             } else {
#               ## Case: Calculation dataset rowname cannot be found in the rownames of the stack dataframe
#               
#               
#               
#               
#               
#               # 
#               # rv$DF_Stack_Input  <- 
#               #   data.frame (
#               #     rbind (
#               #       rv$DF_Stack_Input [ , ],
#               #       myImportDataframe ()  [, ]
#               #       #rv$DF_Calc_Input  [1, ]
#               #     )
#               #   )
#               # 
#               # n_Row_Stack  <- nrow (rv$DF_Stack_Output)
#               # n_Row_Import <- nrow (myImportDataframe ())
#               # i_NewRows    <- (n_Row_Stack + 1) : (n_Row_Stack + n_Row_Import)
#               # 
#               # rv$DF_Stack_Output [i_NewRows, ] <- NA
#               # rownames (rv$DF_Stack_Output) <- rownames (rv$DF_Stack_Input)
#               # rv$DF_Stack_Output [ ,(1:2)] <- rv$DF_Stack_Input [ ,(1:2)]
#               # 
#               # # führt zu doppelten Rownames und damit zum Abbruch
#               # # rownames (rv$DF_Stack_Input) <- rv$DF_Stack_Input [ ,1]
#               # # rownames (rv$DF_Stack_Output) <- rv$DF_Stack_Output [ ,1]
#               # 
#               # 
#               # # n_Row_Stack <- nrow (rv$DF_Stack_Input [ , ])
#               # # 
#               # # rv$DF_Stack_Input [n_Row_Stack+1, ] <- 
#               # #   data.frame (
#               # #     rv$DF_Calc_Input [1, ],
#               # #     row.names = 1
#               # #   )  
#               # # 
#               # # rv$DF_Stack_Output [n_Row_Stack+1, ]<- 
#               # #   data.frame (
#               # #     rv$DF_Calc_Output [1, ],
#               # #     row.names = 1
#               # #   )  
#               # 
#               # Index_Dataset <- 1
#               # 
#               # updateSelectInput (
#               #   session,
#               #   "SelectInput_ID_Dataset_Stack",
#               #   choices = rownames (rv$DF_Stack_Input),
#               #   selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
#               # )
#               # 
#               # 
#               # updateSelectInput (
#               #   session,
#               #   "SelectInput_ID_Dataset_Stack_2",
#               #   choices = rownames (rv$DF_Stack_Input),
#               #   selected = rownames (rv$DF_Stack_Input [Index_Dataset, ])
#               #   # choices = rv$DF_Stack_Input [ , 1],
#               #   # selected = rv$DF_Calc_Input [1, 1]
#               # )
#               # 
#               # 
#               # updateTextInput (
#               #   inputId = "TextInput_Index_Stack",
#               #   value = Index_Dataset
#               # )
#               
#               
#               # # 2025-06-20
#               # rv$DF_Stack_Input [Index_Dataset,1] <-
#               #   rownames (rv$DF_Stack_Input [Index_Dataset, ])
#               # rv$DF_Calc_Input [1,1] <-
#               #   rownames (rv$DF_Stack_Input [Index_Dataset, ])
#               # rv$DF_Stack_Output [Index_Dataset,1] <-
#               #   rownames (rv$DF_Stack_Output [Index_Dataset, ])
#               # rv$DF_Calc_Output [1,1] <-
#               #   rownames (rv$DF_Stack_Output [Index_Dataset, ])
#               
#               
#               
#             } # end if else
            
            
          } # End if stack is not empty
          
          
          
          
          
        }, 
        ignoreInit = TRUE
      ) # End observe event Button_SaveCalculationToStack
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

      # output$myOutputTable_Selectable <- 
      #   #renderDataTable(
      #     # DT::datatable({
      #     DT::renderDataTable ({
      #     if (input$TransposeOutputTable_Selectable == TRUE) {
      #         t (myOutputDataframe_Selectable ())
      #       } else {
      #         myOutputDataframe_Selectable ()
      #       }
      #     },
      #     extensions = c('Buttons', 'Scroller'),
      #     options = list (
      #       scroller = TRUE,
      #       deferRender = TRUE,
      #       scrollY = 100,
      #       dom = 'tb',
      #       buttons = c('copy', 'csv', 'excel', 'pdf'),
      #       lengthMenu = list(c(-1, 100, 50, 20),
      #                         c('All', '100', '50', '20')) ,
      #       paging = T
      #     ),
      #     #add the fillContainer=T before or after options.
      #     fillContainer = T,
      #     class = "display"
      #     )
      #   #)
      
      
      
      
      
      
      # 2025-05-16 funktioniert grundsätzlich, 
      # Quelle: https://github.com/rstudio/DT/issues/643
      # output$myOutputTable_Selectable <- 
      #   renderDataTable(
      #     DT::datatable({
      #       if (input$TransposeOutputTable_Selectable == TRUE) {
      #         t (myOutputDataframe_Selectable ())
      #       } else {
      #         myOutputDataframe_Selectable ()
      #       }
      #     },
      #     extensions = c('Buttons', 'Scroller'),
      #     options = list(
      #       scroller = TRUE,
      #       deferRender = TRUE,
      #       scrollY = 400,
      #       dom = 'tB',
      #       buttons = c('csv', 'pdf')
      #     ),
      #     #add the fillContainer=T before or after options.
      #     fillContainer = T,
      #     class = "display"
      #     )
      #   )
      # 
      # 
      # 
      # 
      
      # # 2025-05-16, funktionierte, aber Zeilenköpfe waren nicht fix, und Scrolleisten unpraktisch  
      # output$myOutputTable_Selectable <- 
      #   DT::renderDataTable  ({
          # if (input$TransposeOutputTable_Selectable == TRUE) {
          #   t (myOutputDataframe_Selectable ())
          # } else {
          #   myOutputDataframe_Selectable ()
          # }
      #   },
      #   extensions = 'Buttons', 
      #   options = 
      #     list (
      #       dom = 'Blfrtip',
            # buttons = c('copy', 'csv', 'excel', 'pdf'),
            # lengthMenu = list(c(-1, 100, 50, 20),
            #                   c('All', '100', '50', '20')),
            # paging = T
      #     )
      #   )
      
      
      
      
      # Downloadable csv of selected dataset ----
      # Not used any more, DT::renderDataTable works better. 
      output$downloadData <- 
        downloadHandler (
          filename = function () {
            paste0 (
              input$myOutputSelection, 
              ".csv"
            )
          },
          content = function (file) {
            write.csv (
              myOutputDataframe_Selectable ()
              , 
              file, 
              row.names = FALSE,
              dec = ",",
              sep = ";"
            )
          }
        )
      
  
  
} # End server function


shinyApp(ui, server)















