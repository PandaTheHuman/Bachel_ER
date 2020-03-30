#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(RMariaDB)
library(shinyWidgets)
library(dplyr)
library(DT)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("BACHEL_ER"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         radioButtons(inputId = "filter_seasons",
                      label = "filter shit",
                      choices = c("no filter", "filter by season"),
                      inline = FALSE),
         conditionalPanel(condition = "input.filter_seasons == 'filter by season'",

                          uiOutput('b_picker'),
                          uiOutput('bette_picker'),
                          uiOutput('bip_picker')
                        )
      ),
      
      mainPanel(
        tabsetPanel(
          tabPanel("testershit", tableOutput("t"), DTOutput("test"), 
                   verbatimTextOutput("selecter")
                   )
          )
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # establish server connection
  conn <- dbConnect(RMariaDB::MariaDB(), user='pilotPete', 
                         password='pilotPete', dbname='bachel_er', host='localhost')
  
  

  
  output$b_picker <- renderUI({
    
    b_seasons <- dbGetQuery(conn, 
                            "SELECT season FROM bachel_er.TVShow WHERE title = 'The Bachelor';")
    
    pickerInput(inputId = "b_picker",
                label = "The Bachelor",
                choices = b_seasons,
                multiple = TRUE,
                options = pickerOptions(actionsBox = TRUE,
                                        liveSearch = TRUE,
                                        size = 10,
                                        virtualScroll = TRUE,
                                        dropupAuto = FALSE))
  })
  

  output$bette_picker <- renderUI({
    
    bette_seasons <- dbGetQuery(conn, 
                                "SELECT season FROM bachel_er.TVShow WHERE title = 'The Bachelorette';")
    
    pickerInput(inputId = "bette_picker",
                label = "The Bachelorette",
                choices = bette_seasons,
                multiple = TRUE,
                options = pickerOptions(actionsBox = TRUE,
                                        liveSearch = TRUE,
                                        size = 10,
                                        virtualScroll = TRUE,
                                        dropupAuto = FALSE))
  })
  

  
  output$bip_picker <- renderUI({
    
    bip_seasons <- dbGetQuery(conn, 
                              "SELECT season FROM bachel_er.TVShow WHERE title = 'Bachelor in Paradise';")

    
    pickerInput(inputId = "bip_picker",
                label = "Bachelor in Paradise",
                choices = bip_seasons,
                multiple = TRUE,
                options = pickerOptions(actionsBox = TRUE,
                                        liveSearch = TRUE,
                                        size = 10,
                                        virtualScroll = TRUE,
                                        dropupAuto = FALSE))
  })
  
  b_seasons_query <- reactive({
    
    q <-  paste("SELECT BCM.cast_id FROM bachel_er.CastMember BCM,
          bachel_er.CastAppearsInShow S WHERE BCM.cast_id = S.cast_id AND S.title = 'The Bachelor' AND S.season IN (",
                   paste(input$b_picker, collapse = ","), ")")
    if (!is.null(input$b_picker)) {
      return(q)
    }
    
    return()
    
    
  })
  
  bette_seasons_query <- reactive({
    
    q <- paste("SELECT ECM.cast_id FROM bachel_er.CastMember ECM,
          bachel_er.CastAppearsInShow S WHERE ECM.cast_id = S.cast_id AND S.title = 'The Bachelorette' AND S.season IN (",
               paste(input$bette_picker, collapse = ","), ")")
    if (!is.null(input$bette_picker)) {
      return(q)
    }
    
    return()
    
    
  })
  
  bip_seasons_query <- reactive({
    
    q <- paste("SELECT PCM.cast_id FROM bachel_er.CastMember PCM,
          bachel_er.CastAppearsInShow S WHERE PCM.cast_id = S.cast_id AND S.title = 'Bachelor in Paradise' AND S.season IN (",
               paste(input$bip_picker, collapse = ","), ")")
    if (!is.null(input$bip_picker)) {
      return(q)
    }
    
    return()
    
    
  })
  

cast_table <- reactive({
    
    t <- c(b_seasons_query(), bette_seasons_query(), bip_seasons_query())
    if (input$filter_seasons == "no filter" || length(t) == 0) {
      
      query <- paste("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C, 
                     CastAppearsInShow S WHERE C.cast_id = S.cast_id;")
      return(dbGetQuery(conn, query ))
      
    } else if (input$filter_seasons == "filter by season") {
      
      
      all_seasons_query <- paste(t, collapse = " UNION ")
      query <- paste0("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C, 
                      CastAppearsInShow S WHERE C.cast_id = S.cast_id AND C.cast_id IN (", 
                      all_seasons_query, ")" )
      
     return( dbGetQuery(conn,  query) )  
    }
  })

DT_cast_table <- reactive(datatable(cast_table(), selection = 'single', rownames = FALSE))
output$test <- renderDT(DT_cast_table() )
output$selecter <- renderPrint(DT_cast_table()[1]$x$data[input$test_rows_selected,1])


output$t <- renderTable({
  if (!is.null(input$test_rows_selected )) {
        id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
    } else {
         id = -999
  }
  query <- paste("SELECT C.cast_id, C.name, 
                 C.occupation FROM CastMember C WHERE C.cast_id = ", id)
  dbGetQuery(conn, query)
})

}

# Run the application 
shinyApp(ui = ui, server = server)

