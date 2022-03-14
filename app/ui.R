devtools::load_all()
library(shiny)
library(gridExtra)


######################
shinyUI(fluidPage(
  titlePanel("Sudoku"),
  sidebarPanel(
    #selectInput("select", label = h3("faites un choix de sudoku"), choices = list("sudoku incomplet", "sudoku complet")),
    selectInput("select", label = h3("choisir un niveau"), choices = list(" ","facile", "moyen", "difficile")),
    actionButton("Submit", icon("fas fa-magic"), label="Submit"),
    hr(),
    verbatimTextOutput("value"),
    #fluidRow(
      #actionButton("button", "1"),
      #actionButton("button", "2"),
      #actionButton("button", "3")
    #),

    #fluidRow(
     # actionButton("button", "4"),
      #actionButton("button", "5"),
      #actionButton("button", "6")
   # ),
   # fluidRow(
   #   actionButton("button", "7"),
    #  actionButton("button", "8"),
     # actionButton("button", "9")
    #),
    #submitButton(text = "submit", icon =  NULL, width = NULL),
   numericInput("numbers", "choisir un chiffre", 9,
                min = 1, max = 9),
    actionButton("Submit", icon("fas fa-magic"), label="Submit"),

    #submitButton(text = "resolution", icon = NULL, width = NULL),



  ),

  mainPanel((h1("affichage du jeu")),
            plotOutput("Grille"),
            actionButton("Sol", "Solution"),
            plotOutput("sol")


  )
)
)



