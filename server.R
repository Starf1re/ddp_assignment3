library(shiny)
data("airquality")

# Define server logic to predict Ozone levels
shinyServer(function(input, output) {
    
    
    #removing NA values from airquality data set
    airQ<-na.omit(airquality)
    
    #assigning values to variables to use in the prediction model
    ozone<-airQ$Ozone
    Temperature<-airQ$Temp
    
    #linear regression model for Ozone value prediction
    predictionModel<-lm(ozone~Temperature)
    
    
    #Predicting Ozone level using user entered temperature value
    
    modelP<-reactive({
        Temp<-input$sliderTemp
        predict(predictionModel, newdata=data.frame(Temperature=Temp))
    })
    
    #Rendering the Ozone Levels Graph
    output$plotResult<-renderPlot({
        
        #setting temperature from slider
        Temp<-input$sliderTemp
        
        #plotting the graph
        plot(airquality$Temp, airquality$Ozone, xlab = "Temperature", ylab = "Ozone", bty="n", pch=17, cex=1)
        
        #Marking the point on the graph based on user entered Temperature and Prediction Model
        points(Temp, modelP(), col="blue", pch=18, cex=3)
    })
    
    #Rendering the value of the Ozone level based on user temperature input
    
    output$result<-renderText({
        modelP()
    })
    
})