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
library(stringr)
library(purrr)

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
                      label = "Filtering options",
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
          tabPanel("Explore Cast Members", #tableOutput("t"), 
                   uiOutput("cast_box"), DTOutput("main_table")
                   ),
          tabPanel("Cast Summaries", uiOutput("summary_box") ),
          tabPanel("SQL Division", uiOutput("division"))
          )
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  # establish server connection
  # conn <- dbConnect(RMariaDB::MariaDB(), user='pilotPeteRemote',
  #                        password='pilotPeteRemote', dbname='bachel_er', host='pandas-MBP.hitronhub.home')
  
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
    
    query <- paste("SELECT ECM.cast_id FROM bachel_er.CastMember ECM,
          bachel_er.CastAppearsInShow S WHERE ECM.cast_id = S.cast_id AND S.title = 'The Bachelorette' AND S.season IN (",
               paste(input$bette_picker, collapse = ","), ")")
    if (!is.null(input$bette_picker)) {
      return(query)
    }
    
    return()
    
    
  })
  
  bip_seasons_query <- reactive({
    
    query <- paste("SELECT PCM.cast_id FROM bachel_er.CastMember PCM,
          bachel_er.CastAppearsInShow S WHERE PCM.cast_id = S.cast_id AND S.title = 'Bachelor in Paradise' AND S.season IN (",
               paste(input$bip_picker, collapse = ","), ")")
    if (!is.null(input$bip_picker)) {
      return(query)
    }
    
    return()
    
    
  })
  

  
output$division <- renderUI({
  
  wellPanel(h3("WHO HAS SEEN IT ALL?"),
            actionButton(inputId = "execute_divide", label = "SQL divide!"), uiOutput("div_tbl"))

})

output$div_tbl <- renderUI({
  
  validate(need(input$execute_divide, "Press button for results!"))
  input$execute_divide
  query <- ("SELECT C.name FROM CastMember C WHERE NOT EXISTS (SELECT DISTINCT S.title FROM TVShow S WHERE NOT EXISTS (SELECT CS.title FROM CastAppearsInShow CS WHERE C.cast_id=CS.cast_id AND S.title = CS.title ))")
  #h4(dbGetQuery(conn, query))
  tbl <- dbGetQuery(conn, query)
  wellPanel(
  tableOutput("div_table_ui") )
  
  
})

div_table <- reactive({
  input$execute_divide
  query <- ("SELECT C.name FROM CastMember C WHERE NOT EXISTS (SELECT DISTINCT S.title FROM TVShow S WHERE NOT EXISTS (SELECT CS.title FROM CastAppearsInShow CS WHERE C.cast_id=CS.cast_id AND S.title = CS.title ))")
  return( dbGetQuery(conn, query) )

})

output$div_table_ui <- renderTable({
  input$execute_divide
  div_table()
  
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
  session$reload()
  
})

output$add_cast_response <- renderUI({
  validate( need(nchar(input$add_name) <= 20, "name can not exceed 20 char"),
            need(nchar(input$add_name) > 0, "name can not be blank"),
            need(nchar(input$add_occupation) <= 50, "occupation can not exceed 50 char"),
            need(nchar(input$add_hometown) <= 20, "hometown can not exceed 20 char"))
  text <- "entries are all valid"
  h6(text)
})
  

cast_table_query <- reactive({
  
  input$add_cast_profile
  input$delete_cast
      
    t <- c(b_seasons_query(), bette_seasons_query(), bip_seasons_query())
    
    
    if (input$filter_seasons == "no filter" || length(t) == 0) {
      
      # query <- paste("SELECT C.cast_id, C.name, C.occupation,
      #                 S.title, S.season, S.role FROM CastMember C, 
      #                CastAppearsInShow S WHERE C.cast_id = S.cast_id;")
      
      query <- paste("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C LEFT JOIN  
                     CastAppearsInShow S ON C.cast_id = S.cast_id")
      return(query)
      
     # return(dbGetQuery(conn, query ))
      
    } else if (input$filter_seasons == "filter by season") {
      
      
      all_seasons_query <- paste(t, collapse = " UNION ")
      # query <- paste0("SELECT C.cast_id, C.name, C.occupation,
      #                 S.title, S.season, S.role FROM CastMember C, 
      #                 CastAppearsInShow S WHERE C.cast_id = S.cast_id AND C.cast_id IN (", 
      #                 all_seasons_query, ")" )
      
      query <- paste0("SELECT C.cast_id, C.name, C.occupation,
                      S.title, S.season, S.role FROM CastMember C INNER JOIN  
                      CastAppearsInShow S ON C.cast_id = S.cast_id AND C.cast_id IN (", 
                      all_seasons_query, ")" )
      return(query)
     #return( dbGetQuery(conn,  query) )  
    }
  })

cast_table <- reactive({
  print(cast_table_query())
  return(dbGetQuery(conn, cast_table_query() ))
})


DT_cast_table <- reactive(datatable(cast_table(), selection = 'single', rownames = FALSE))
output$main_table <- renderDT({
  
 # input$delete_show
  input$add_season_button
  
  DT_cast_table() 
  
  })



## cast box - appears when user clicks on table row
output$cast_box <- renderUI({
  
  
  conditionalPanel(condition = 'input.main_table_rows_selected  = 1',
  navlistPanel(tabPanel( "Profile",  uiOutput("cast_profile") ),
               tabPanel("Instagram",  uiOutput("cast_insta")  ),
          

          tabPanel("Shows", uiOutput("cast_shows_box")),
          tabPanel("Relationships", wellPanel())
  )
  )
  
})

output$summary_box <- renderUI({
  fluidRow(column(4, uiOutput("group_options"),
                     uiOutput("agg_options"),
                     actionButton(inputId = "run_summary",
                                  label = "Show my Results!")),
           column(8, uiOutput("summary_results") ) )
})


output$group_options <- renderUI({
  wellPanel( h4("GROUP BY:"),
            checkboxInput(inputId = "group_by_title",
                          label = "show title",
                          value = FALSE),
            checkboxInput(inputId = "group_by_season",
                          label = "season",
                          value = FALSE))
})

output$agg_options <- renderUI({
  wellPanel( h4("COLUMNS:"),
             checkboxInput(inputId = "agg_age",
                           label = "age",
                           value = FALSE),
             conditionalPanel(condition = "input.agg_age",
                              selectInput(inputId = "age_op",
                                          label = "aggregator?",
                                          choices = c("AVG", "MAX", "MIN"))
             ),
             checkboxInput(inputId = "agg_followers",
                           label = "followers",
                           value = FALSE),
             conditionalPanel(condition = "input.agg_followers",
                              selectInput(inputId = "followers_op",
                                          label = "aggregator?",
                                          choices = c("AVG", "MAX", "MIN", "SUM"))
             ))
})

agg_query <- reactive({

  req(!is.null(input$group_by_title), !is.null(input$group_by_season), 
      !is.null(input$agg_age), !is.null(input$agg_followers))
  
  title <- NULL
  season <- NULL
  age <- NULL
  followers <- NULL
  
  title_g <- NULL
  season_g <- NULL
  age_g <- NULL
  followers_g <- NULL
  
  ## join condition for table needed if age selected
  age_j <- "S.cast_id = C.cast_id"
  followers_j <- NULL
  
  if ({input$group_by_title == TRUE}) {
    title <- "S.title"
    title_g <- "S.title"
  }
  
  if ({input$group_by_season == TRUE}) {
    season <- "S.season"
    season_g <- "s.season"
  }
  
  if ({input$agg_age == TRUE}) {
    op <- input$age_op
    if (op == "NONE") {
      age <- "C.age"
      age_g <- "C.age"
    } else {
      age <- paste0(op, "(C.age)")
    }
  }
  
  if ({input$agg_followers == TRUE}) {
    op <- input$followers_op
    followers_j <- "S.cast_id = CI.cast_id AND C.cast_id = CI.cast_id AND I.username = CI.username"
    if (op == "NONE") {
      followers <- "I.followers"
      followers_g <- "I.followers"
    } else {
      followers <- paste0(op, "(I.followers)")
    }
  }
  
  # full_table <- cast_
  q <- paste(c(title, season, age, followers), collapse = ", ")
  g <- paste(c(title_g, season_g, age_g, followers_g), collapse = ", ")
  j <- paste(c(age_j, followers_j), collapse = " AND ")
  q2 <- cast_table_query()
  #q22 <- gsub("occup", "", q2)
  #q22 <- str_replace(q2, ", C.name, C.occupation, S.title, S.season, S.role ", "")
  
  
  query <- paste0("SELECT ", q, " FROM CastAppearsInShow S, CastHasInstaAccount CI, Instagram I,
                  CastMember C WHERE " , j,  " AND S.cast_id IN ( SELECT OLD.cast_id FROM (",
                  q2, ") AS OLD ) GROUP BY ", g)

  # query <- paste0("SELECT ", q, " FROM CastAppearsInShow S, CastHasInstaAccount CI, Instagram I,
  #                 CastMember C WHERE " , j,  " GROUP BY ", g)
  
})

output$summary_results <- renderUI({
  
  
  print(agg_query())
  #dbGetQuery(conn, agg_query())
  wellPanel(h5("Summary of BachelorNation"),
            tableOutput("summary_table"))
})

output$summary_table <- renderTable({
  
  validate(need((input$group_by_title == TRUE || input$group_by_season == TRUE), 
                "At least one column from 'GROUP BY' must be selected."),
           need(input$run_summary , "Press button to show results!"))
  
  dbGetQuery(conn, agg_query())
  })

cast_shows_query <- reactive({
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  } else {
    id = -999
  }
  
  query <- paste("SELECT title, season, role FROM CastAppearsInShow WHERE cast_id =", id)
  res <- dbGetQuery(conn, query)
  #res
  
  
})


DT_cast_shows <- reactive({
  
  #input$add_season_button
  # input$delete_show
  
  
  ##!!! TODO - strange bug. adding a show appearance on a contestant ONCE works. clicking "add cast appearance" after that causes the following error:
  #  Error in : Duplicate entry '101-The Bachelor-1' for key 'castappearsinshow.PRIMARY' [1062]
  # cast id is ALWAYS id of the last contestant selected
  datatable(cast_shows_query(), selection = 'single', rownames = FALSE,
            options = list(lengthChange = FALSE,
                           ordering = FALSE,
                           paging = FALSE,
                           searching = FALSE,
                           info = FALSE))

})

output$cast_shows_table <- renderDT(DT_cast_shows())

# print(DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,1])
# print(DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,2])


output$cast_shows_box <- renderUI({
  
  input$refresh
  
 # input$add_season_button
  #input$delete_show
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  } else {
    id = -999
  }
  
  print("cast_shows_box <")
  print(id)
  # nested add buttons
  lil <- renderUI(
    
    if (id > 0) {
      return(
      fluidRow(
        actionButton(inputId = "delete_cast_shows",
                     label = "Delete Cast Appearance"),
        actionButton(inputId = "add_cast_shows",
                     label = "Add Cast Appearance"))  )
    } else {
      return(wellPanel())
    }
    
    
  )

  
  wellPanel(DTOutput("cast_shows_table"), br(),
            conditionalPanel("id > 0 ", lil )
             )
  
})




observeEvent( input$add_cast_shows, {
  
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  } else {
    id = -999
  }
      
  
  
  name <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,2]
  
  if (length(cast_shows_query()) == 0) {
    b_query <- b_seasons_query()
    bette_query <- bette_seasons_query()
    bip_query <- bip_seasons_query()
  } else {
    ## get arrays of available seasons to add into
    b <- paste("SELECT S.season FROM TVShow S WHERE S.title = 'The Bachelor' AND S.season NOT IN (SELECT C.season FROM CastAppearsInShow C WHERE C.cast_id =",  id, " AND C.title = 'The Bachelor')" )
    b_query <- dbGetQuery(conn, b)
    
    bette <- paste("SELECT S.season FROM TVShow S WHERE S.title = 'The Bachelorette' AND S.season NOT IN (SELECT C.season FROM CastAppearsInShow C WHERE C.cast_id =", id," AND C.title = 'The Bachelorette')" )
    bette_query <- dbGetQuery(conn, bette)
    bip <- paste("SELECT S.season FROM TVShow S WHERE S.title = 'Bachelor In Paradise' AND S.season NOT IN (SELECT C.season FROM CastAppearsInShow C WHERE C.cast_id =", id, " AND C.title = 'Bachelor In Paradise')" )
    bip_query <- dbGetQuery(conn, bip)
  }
  
  

  showModal(modalDialog(title = "Add Show Data", 
                        h3(name),
                        radioGroupButtons(inputId = "add_title_picker",
                                          label = "Show Title",
                                          choices = c("The Bachelor", "The Bachelorette", "Bachelor In Paradise"),
                                          selected = "The Bachelor"),
                        selectInput(inputId = "season_picker", label = "select season",
                                    choices = b_query),
                        actionButton(inputId = "add_season_button",
                                     label = "Add Contestant Appearance"),
                        easyClose = TRUE))
  
  observeEvent(input$add_title_picker, {
    print("add_title_picker, {")
    print(id)
    
    new <- input$add_title_picker
    if (new == "The Bachelor") {
      choices <- b_query
    }
    if (new == "The Bachelorette") {
      choices <- bette_query
    }
    if (new == "Bachelor In Paradise") {
      choices <- bip_query
    }
    updateSelectInput(session = session, inputId = "season_picker", choices = choices )
    
  })
  
  observeEvent (input$add_season_button, {
      query <- paste0("INSERT INTO CastAppearsInShow VALUES (", id, ", '", 
                      input$add_title_picker, "', ", input$season_picker, ", 'contestant')")
      
      print("add_season_button, {")
      print(id)
      tryCatch({
        dbExecute(conn, query)
      }, error = function(err) {
        print(err)
      })
      #dbExecute(conn, query)
      
      removeModal()
      session$reload()
      
  })
  
  
})



observeEvent( input$delete_cast_shows, {
  
  if (!is.null(input$cast_shows_table_rows_selected )) {
    title <- DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,1]
    season <- DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,2]
  } else {
    title = ""
    season = 0
  }
  
  if (season == 0) {
    return()
  } else {
    showModal(modalDialog(title = "Are You Sure You Want To Delete That?", 
                          actionButton(inputId = "delete_show", label = "yes!"),
                          easyClose = TRUE))
  }
  
  print(DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,1])
  print(DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,2])

  
})

observeEvent(input$delete_show, {
  
  id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  title <- DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,1]
  season <- DT_cast_shows()[1]$x$data[input$cast_shows_table_rows_selected,2]
  
  query <- paste0("DELETE FROM CastAppearsInShow WHERE (cast_id = ",
                  id," AND title = '", title, "' AND season = ", season ,")")
  print(query)

  tryCatch({
    dbExecute(conn, query)
  }, error = function(err) {
    print(err)
  }, warning = function(w) {
    print(w)
  })
  
   
  id <- -99
  title <- "NO"
  season <- -10
  removeModal()
  session$reload()
    
})



output$cast_profile <- renderUI({
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  q <- dbSendQuery(conn, insta_query)
  res <- dbFetch(q, 1)
  
  res_length <- dbGetRowCount(q)
  

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
      wellPanel(
        h5(strong("Name: "), name),
        h3("No Profile found!"),
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
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  session$reload()

})

output$update_cast_response <- renderUI({
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  
  if (!is.null(input$main_table_rows_selected )) {
    id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  
  id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
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
  session$reload()
  
})

output$update_insta_response <- renderUI({
  validate( need(nchar(input$new_username) <= 20, "username can not exceed 20 char"),
            need(nchar(input$new_username) > 0, "username can not be blank"),
            need(is.numeric(input$new_followers), "followers must be number > 0"))
  text <- "entries are all valid"
  h6(text)
})

observeEvent(input$delete_insta, {
  
  id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  old_name <- dbGetQuery(conn, paste0("SELECT username FROM CastHasInstaAccount WHERE (cast_id =",
                                      id, ")"))

  
  query <- paste0("DELETE FROM Instagram WHERE (username = '",
                  old_name, "')")
  print(query)
  dbExecute(conn, query)
  
  session$reload()
  
})


# !!! BUG: insta username must be unique
observeEvent(input$add_cast_insta, {
  
  id <- DT_cast_table()[1]$x$data[input$main_table_rows_selected,1]
  
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

