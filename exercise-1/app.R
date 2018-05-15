# Exercise 1: Building a user interface

# Load the `shiny` package (install it in the R terminal if you haven't already)
library(shiny)

# Define a new `ui` variable. This variable should be assigned a `fluidPage()` 
# layout, which should be passed the following:
ui <- fluidPage(
  # A top level header: "First Shiny Website"
  ## First Shiny Website
  titlePanel("First Shiny Website"),
  # A Paragraph, describing your excitement: include some `strong` text
  sidebarLayout(
    sidebarPanel(
      mainPanel(
        strong("I am so excited",align = "center")
      )
    )
  )
  
  # An image with this `src`
  # https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif
  img(src = "https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif",
      height = 72, width = 72)
  
  # Another paragraph about a slider: include some `em` text
  
  
  # A slider with an appropriate label, min of 10, max of 100, value of 50  
  column(sliderInput("slider1", h3("Sliders"),
                     min = 0, max = 100, value = 50),
         sliderInput("slider2", "",
                     min = 0, max = 100, value = c(25, 75))
  )
)

# Define a `server` function that accepts an input and an output
# At this point, don't do anything in the function
# This function should perform the following:
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'darkgray', border = 'white')
  })
})
# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = shinyServer)
  

