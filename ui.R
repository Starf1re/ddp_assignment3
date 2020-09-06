library(shiny)

# Define UI for application that predicts the Ozone levels based on temperature
shinyUI(fluidPage(
    
    # Application title
    titlePanel(h1("Predicting the Ozone level using Temperature (Data Set: airquality)", align="center")),
    
    
    # Sidebar with a slider input for user to select Temperature 
    sidebarLayout(
        sidebarPanel(
            
            #input
            sliderInput("sliderTemp","SELECT TEMPERATURE VALUE", min = 56, max = 97, value = 56 ),
            
            h5("Based on the 'airquality' data set the slider is between
               56 and 97 degrees Fahrenheit."),
            h5("Default Value: 56 F")
        ),
        
        
        #CSS for ozone level value
        tags$head(tags$style("#result{color: blue;
                             font-size: 20px;
                         font-style: bold;
                         }"))
    ),
    # Show a plot of the Ozone levels and value of predicted ozone level
    mainPanel(
        
        h2("Instructions:"),
        h4("Using the slider, select the Temperature value."),
        h4("As you select the temperature the predicted Ozone level
               and its location on the plot will be displayed automatically."),
        
        h3("Predicted Ozone Level (Seen on plot as a Blue Diamond):", align="left"),
        textOutput("result", inline=TRUE),
        
       
         plotOutput("plotResult")
        
        
    )
))
