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
          uiOutput("add_cast_member"),
          br(),
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
          tabPanel("testershit", #tableOutput("t"), 
                   uiOutput("cast_box"), DTOutput("test")
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
  
output$add_cast_member <- renderUI({
  
  input$add_cast_profile
  
  
  dropdown(
    wellPanel(
      h5("Create cast profile:"),
      textInput(inputId = "add_name",
                label = "name",
                value = ""),
      numericInput(inputId = "add_age",
                   label = "age",
                   value = 30,
                   min = 19,
                   max = 120),
      textInput(inputId = "add_occupation",
                label = "occupation",
                value = "Professional Bachelor Person"),
      textInput(inputId = "add_hometown",
                label = "hometown",
                value = "BachNation, USA"),
      fluidRow(column(3, actionButton(inputId = "add_cast_profile",
                                      label = "Add Profile")), 
               column(9, uiOutput("add_cast_response")))
      
      
    ),
    style = "unite",
    status = "default",
    size = "md",
    icon = icon("user-plus"),
    label = "Add Cast Member",
    tooltip = FALSE,
    right = FALSE,
    up = FALSE,
    width = '500px',
    animate = animateOptions(
      enter = animations$fading_entrances$fadeInUpBig,
      exit = animations$fading_exits$fadeOutDownBig
    ),
    inputId = NULL
  )
  
  
})


observeEvent(input$add_cast_profile, {
  validate( need(nchar(input$add_name) <= 20, "name can not exceed 20 char"),
            need(nchar(input$add_name) > 0, "name can not be blank"),
            need(nchar(input$add_occupation) <= 50, "occupation can not exceed 50 char"),
            need(nchar(input$add_hometown) <= 20, "hometown can not exceed 20 char"))
  
  query <- paste0("INSERT INTO CastMember (name, age, hometown, occupation) VALUES ('", 
                  input$add_name, "', ", input$add_age,
                  ", '", input$add_hometown, "', '", input$add_occupation, "')")

  print(query)
  dbExecute(conn, query)
  
})

output$add_cast_response <- renderUI({
  validate( need(nchar(input$add_name) <= 20, "name can not exceed 20 char"),
            need(nchar(input$add_name) > 0, "name can not be blank"),
            need(nchar(input$add_occupation) <= 50, "occupation can not exceed 50 char"),
            need(nchar(input$add_hometown) <= 20, "hometown can not exceed 20 char"))
  text <- "entries are all valid"
  h6(text)
})
  

cast_table <- reactive({
  
  input$add_cast_profile
  input$delete_cast
      
    t <- c(b_seasons_query(), bette_seasons_query(), bip_seasons_query())
    if (input$filter_seasons == "no filter" || length(t) == 0) {
      
      # query <- paste("SELECT C.cast_id, C.name, C.occupation,
      #                 S.title, S.season, S.role FROM CastMember C, 
      #                CastAppearsInShow S WHERE C.cast_id = S.cast_id;")
      
      query <- paste("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C LEFT JOIN  
                     CastAppearsInShow S ON C.cast_id = S.cast_id;")
      
      return(dbGetQuery(conn, query ))
      
    } else if (input$filter_seasons == "filter by season") {
      
      
      all_seasons_query <- paste(t, collapse = " UNION ")
      # query <- paste0("SELECT C.cast_id, C.name, C.occupation,
      #                 S.title, S.season, S.role FROM CastMember C, 
      #                 CastAppearsInShow S WHERE C.cast_id = S.cast_id AND C.cast_id IN (", 
      #                 all_seasons_query, ")" )
      
      query <- paste0("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C LEFT JOIN  
                      CastAppearsInShow S ON C.cast_id = S.cast_id AND C.cast_id IN (", 
                      all_seasons_query, ")" )
      
     return( dbGetQuery(conn,  query) )  
    }
  })

DT_cast_table <- reactive(datatable(cast_table(), selection = 'single', rownames = FALSE))
output$test <- renderDT({
  

  DT_cast_table() 
  
  })



## cast box - appears when user clicks on table row
output$cast_box <- renderUI({
  
  
  conditionalPanel(condition = 'input.test_rows_selected  = 1',
  navlistPanel(tabPanel( "Profile",  uiOutput("cast_profile") ),
               tabPanel("Instagram",  uiOutput("cast_insta")  ),
          
          
          
          
          
          tabPanel("Shows", wellPanel()),
          tabPanel("Relationships", wellPanel())
  )
  )
  
})

output$cast_profile <- renderUI({
  
  if (!is.null(input$test_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  } else {
    id = -999
  }
  
  input$update_cast_profile 
  input$delete_cast
  
  # PROFILE DATA
  name <- dbGetQuery(conn, paste("SELECT name FROM CastMember WHERE cast_id =", id))
  age <- dbGetQuery(conn, paste("SELECT age FROM CastMember WHERE cast_id =", id))
  occupation <- dbGetQuery(conn, paste("SELECT occupation FROM CastMember WHERE cast_id =", id))
  hometown <- dbGetQuery(conn, paste("SELECT hometown FROM CastMember WHERE cast_id =", id))
  
  wellPanel(
    h3(strong("Name: "), name),
    h5("Age: ", age),
    h5("Occupation: ", occupation),
    h5("Hometown: ", hometown),
    dropdown(
      wellPanel(
        h5("Update cast profile:"),
        textInput(inputId = "new_name",
                  label = "name",
                  value = name),
        numericInput(inputId = "new_age",
                     label = "age",
                     value = age,
                     min = 19,
                     max = 120),
        textInput(inputId = "new_occupation",
                  label = "occupation",
                  value = occupation),
        textInput(inputId = "new_hometown",
                  label = "hometown",
                  value = hometown),
        fluidRow(column(3, actionButton(inputId = "update_cast_profile",
                                        label = "update")), 
                 column(9, uiOutput("update_cast_response"))),
        br(),
        actionButton(inputId = "delete_cast",
                     label = "remove profile")
        
        
      ),
      style = "unite",
      status = "default",
      size = "md",
      icon = icon("pen-square"),
      label = "edit",
      tooltip = FALSE,
      right = TRUE,
      up = FALSE,
      width = '500px',
      animate = animateOptions(
        enter = animations$fading_entrances$fadeInRightBig,
        exit = animations$fading_exits$fadeOutRightBig
      ),
      inputId = NULL
    )
  )
  
})

output$cast_insta <- renderUI({
  
  input$update_cast_insta
  input$add_cast_insta
  input$delete_insta
  
  if (!is.null(input$test_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  } else {
    id = -999
  }
  
  name <- dbGetQuery(conn, paste("SELECT name FROM CastMember WHERE cast_id =", id))
  
  insta_query <- paste("SELECT C.name, I.username, I.followers FROM CastMember C, CastHasInstaAccount CA,
                       Instagram I WHERE C.cast_id = CA.cast_id AND CA.username = I.username AND C.cast_id =", 
                       id)
  username <- dbGetQuery(conn, paste("SELECT I.username FROM CastMember C, CastHasInstaAccount CA,
                       Instagram I WHERE C.cast_id = CA.cast_id AND CA.username = I.username AND C.cast_id =", 
                                     id))
  followers <- dbGetQuery(conn, paste("SELECT I.followers FROM CastMember C, CastHasInstaAccount CA,
                       Instagram I WHERE C.cast_id = CA.cast_id AND CA.username = I.username AND C.cast_id =", 
                                     id))
 # insta <- data.frame(dbGetQuery(conn, insta_query))
  q <- dbSendQuery(conn, insta_query)
  res <- dbFetch(q, 1)
  
  res_length <- dbGetRowCount(q)
  
  ## RUNS IF NO INSTA ACCOUNT
    if (res_length == 0 & id < 0) {
      return(wellPanel(
        h3(strong("Name: ")),
        h5("Username: "),
        h5("Followers: ")
                  )
      )
    }
  
    if (res_length == 0) {
    return( 
      wellPanel(h3("No Profile found!"),
                dropdown(
                  wellPanel(
                    h5("Add Instagram account for ", name),
                    textInput(inputId = "add_username",
                              label = "username",
                              value = ""),
                    numericInput(inputId = "add_followers",
                                 label = "followers",
                                 value = 0,
                                 min = 0),
                    fluidRow(column(3, actionButton(inputId = "add_cast_insta",
                                                    label = "Create Profile!")), 
                             column(9, uiOutput("add_insta_response")))
                    
                    
                  ),
                  style = "unite",
                  status = "default",
                  size = "md",
                  icon = icon("user-plus"),
                  label = "add account",
                  tooltip = FALSE,
                  right = TRUE,
                  up = FALSE,
                  width = '500px',
                  animate = animateOptions(
                    enter = animations$fading_entrances$fadeInRightBig,
                    exit = animations$fading_exits$fadeOutRightBig
                  ),
                  inputId = NULL
                )
                ) 
       )
      } 
  
  ## OUTPUT IF INSTA ACCOUNT
  wellPanel(
    
    h3(strong("Name: "), name),
    h5("Username: ", username),
    h5("Followers: ", followers),
    ## edit insta dropdown
    dropdown(
      wellPanel(
        h5("Update instagram for ", name),
        textInput(inputId = "new_username",
                  label = "username",
                  value = username),
        numericInput(inputId = "new_followers",
                     label = "followers",
                     value = followers,
                     min = 0),
        fluidRow(column(3, actionButton(inputId = "update_cast_insta",
                                        label = "update")), 
                 column(9, uiOutput("update_insta_response"))),
        br(),
        actionButton(inputId = "delete_insta",
                     label = "remove account")
        
        
      ),
      style = "unite",
      status = "default",
      size = "md",
      icon = icon("pen-square"),
      label = "edit",
      tooltip = FALSE,
      right = TRUE,
      up = FALSE,
      width = '500px',
      animate = animateOptions(
        enter = animations$fading_entrances$fadeInRightBig,
        exit = animations$fading_exits$fadeOutRightBig
      ),
      inputId = NULL
    )
    ## !!! MARY - option to click on insta link?

  )
  
  
  
})




observeEvent(input$update_cast_profile, {
  
  if (!is.null(input$test_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  } else {
    id = -999
  }
  
  validate( need(nchar(input$new_name) <= 20, "name can not exceed 20 char"),
            need(nchar(input$new_occupation) <= 50, "occupation can not exceed 50 char"),
            need(nchar(input$new_hometown) <= 20, "hometown can not exceed 20 char"),
            need(id > 0, "no profile selected"))
  query <- paste0("UPDATE CastMember SET name = '", input$new_name, "', occupation = '",
                  input$new_occupation, "', hometown = '", input$new_hometown, "' WHERE (cast_id = ",
                  id, ")")
  print(query)
  dbExecute(conn, query)

})

output$update_cast_response <- renderUI({
  
  if (!is.null(input$test_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  } else {
    id = -999
  }
  
  validate( need(nchar(input$new_name) <= 20, "name can not exceed 20 char"),
            need(nchar(input$new_occupation) <= 50, "occupation can not exceed 50 char"),
            need(nchar(input$new_hometown) <= 20, "hometown can not exceed 20 char"),
            need(id > 0, "no profile selected"))
  text <- "entries are all valid"
  h6(text)
})

observeEvent(input$delete_cast, {
  
  if (!is.null(input$test_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  } else {
    id = -999
  }

  validate(need(id > 0, "no profile selected"))
  
  query <- paste0("DELETE FROM CastMember WHERE (cast_id = ",
                  id, ")")
  print(query)
  dbExecute(conn, query)
  
})

observeEvent(input$update_cast_insta, {
  
  id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  old_name <- dbGetQuery(conn, paste0("SELECT username FROM CastHasInstaAccount WHERE (cast_id =",
                                      id, ")"))
  
  validate( need(nchar(input$new_username) <= 20, "username can not exceed 20 char"),
            need(nchar(input$new_username) > 0, "username can not be blank"),
            need(is.numeric(input$new_followers), "followers must be number > 0"))

  query <- paste0("UPDATE Instagram SET username = '", input$new_username, "', followers = ",
                  input$new_followers, " WHERE (username = '",
                  old_name, "')")
  print(query)
  dbExecute(conn, query)
  
})

output$update_insta_response <- renderUI({
  validate( need(nchar(input$new_username) <= 20, "username can not exceed 20 char"),
            need(nchar(input$new_username) > 0, "username can not be blank"),
            need(is.numeric(input$new_followers), "followers must be number > 0"))
  text <- "entries are all valid"
  h6(text)
})

observeEvent(input$delete_insta, {
  
  id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  old_name <- dbGetQuery(conn, paste0("SELECT username FROM CastHasInstaAccount WHERE (cast_id =",
                                      id, ")"))

  
  query <- paste0("DELETE FROM Instagram WHERE (username = '",
                  old_name, "')")
  print(query)
  dbExecute(conn, query)
  
})


observeEvent(input$add_cast_insta, {
  
  id <- DT_cast_table()[1]$x$data[input$test_rows_selected,1]
  
  validate( need(nchar(input$add_username) <= 20, "username can not exceed 20 char"),
            need(nchar(input$add_username) > 0, "username can not be blank"),
            need(is.numeric(input$add_followers), "followers must be number > 0"))
  
  # query <- paste0("UPDATE Instagram SET username = '", input$new_username, "', followers = ",
  #                 input$new_followers, " WHERE (username = '",
  #                 old_name, "')")
  
  query_insta <- paste0("INSERT INTO Instagram VALUES ('", input$add_username, "', ", 
                        input$add_followers, ")")
  query_cast_insta <- paste0("INSERT INTO CastHasInstaAccount VALUES ( ", id,
                             " ,'", input$add_username, "')")
  print(query_insta)
  print(query_cast_insta)
  dbExecute(conn, query_insta)
  dbExecute(conn, query_cast_insta)
  #dbExecute(conn, query)
  
})

output$add_insta_response <- renderUI({
  validate( need(nchar(input$add_username) <= 20, "username can not exceed 20 char"),
            need(nchar(input$add_username) > 0, "username can not be blank"),
            need(is.numeric(input$add_followers), "followers must be number > 0"))
  text <- "entries are all valid"
  h6(text)
})


}

# Run the application 
shinyApp(ui = ui, server = server)

