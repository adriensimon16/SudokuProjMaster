

shinyServer(function(input, output){
  mygr <- eventReactive(input$Submit, {input$select})
  output$Grille <- renderPlot({
    
  if(input$select==" " & mygr()==" "){
    Grille = "choisissez un niveau"
  }
  #grid.table(Grille)  
    
  if(input$select=="facile" & mygr()=="facile"){
    Grille = facile(Grille_complete())
    Grille[is.na(Grille)] <-""
  }
  grid.table(Grille)
  
  if(input$select=="moyen" & mygr()=="moyen"){
    Grille = moyen(Grille_complete())
    Grille[is.na(Grille)] <-""
  }
  grid.table(Grille)
  
  if(input$select=="difficile" & mygr()=="difficile"){
    Grille = difficile(Grille_complete())
    Grille[is.na(Grille)] <-""
  }
  grid.table(Grille)
     
      
})
  
}
)