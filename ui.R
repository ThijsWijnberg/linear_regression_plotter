library(shiny)

shinyUI(fluidPage(
  titlePanel("Linear regression plotter"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      checkboxInput('se', "show standard error", TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'),
      radioButtons('dec', 'Decimal sign',
                   c('Comma'=',',
                     'Point'="."),
                   '.')
    ),
    mainPanel(
      plotOutput('contents')
    )
  )
))