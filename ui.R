
library(shiny)
library(shinythemes)
library(markdown)

fluidPage(theme = shinytheme("united"),
          navbarPage("Sampling Distribution Demo:",
                     
                     tabPanel("Home",
                              # Input values
                              sidebarPanel(
                                HTML("<h4>Input parameters</h4>"),
                                sliderInput("number_of_samples", 
                                            label = "Number of samples", 
                                            value = 1000, 
                                            min = 10, 
                                            max = 10000),
                                sliderInput("sample_size", 
                                            label = "Sample size", 
                                            value = 15, 
                                            min = 5, 
                                            max = 250),
                                
                                sliderInput("pop_mean", 
                                            label = "Population mean", 
                                            value = 50, 
                                            min = 0, 
                                            max = 100),

                                sliderInput("pop_sd", 
                                            label = "Population standard deviation", 
                                            value = 10, 
                                            min = 0, 
                                            max = 20),
                                
                                numericInput(inputId = "binsize",
                                             label = "bin size:",
                                             min = 1,
                                             max = 5,
                                             value = 2),
                                actionButton(
                                  inputId = "buttonSubmit",
                                  label = "Submit",
                                  
                                )
                                             
                              ),
                              
                              mainPanel(
                                #textOutput("thetext")
                                plotOutput("distPlot"),
                                tableOutput("stats")
                              ) # mainPanel()
                              
                     ), #tabPanel(), Home
                     
                     tabPanel("About", 
                              titlePanel("About"), 
                              div(includeMarkdown("about.md"), 
                                  align="justify")
                     ) #tabPanel(), About
                     
          ) # navbarPage()
) # fluidPage()


