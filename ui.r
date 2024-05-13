library(shiny)
library(shinydashboard)
library(ggplot2)
source("weather1prac.R")
shinyUI(
  dashboardPage(
    dashboardHeader(title="Weather Forcasting",titleWidth =350,
                    tags$li(class = "dropdown",
                            tags$a(href = "#", class = "dropdown-toggle", 
                                   tags$img(src="cloudy.png",height=30,width=30),
                                   tags$span("Weather Analysis", class = "logo-lg")
                            )
                    )
    ),
    dashboardSidebar(
      sidebarMenu(
        id="sidebar",
        menuItem("Dataset",tabName="data",icon=icon("database")),
        menuItem(text="Visualization",tabName="viz",icon=icon("chart-line")),
        menuItem("Team Members", tabName = "team_members",icon=icon("user-friends")),
        menuSubItem("Ashwin S", tabName = "Ashwin"),
        menuSubItem("Susmitha C B", tabName = "Susmitha"),
        menuSubItem("Ganeshprasad A", tabName = "Ganeshprasad")
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName="data",
                tabBox(id="t1",width=12,
                       tabPanel("About",icon=icon("address-card"),fluidRow(
                         column(width=8,tags$img(src="weather.jpg",width=600,height=300),
                                tags$br(),
                                align="center"),
                         column(width=4,tags$br(),
                                tags$p("This dashboard give analysis of temperature over the period from
                                         2015 to 2020 of Asia continent. It uses various types of plots and gives the detailed anlaysis by plotting graph over year and Temperature⛅.")
                         )
                         )),
                       tabPanel(title="Data",icon=icon("address-card"),dataTableOutput("dataT")),
                       tabPanel(title="Structure",icon=icon("address-card"),verbatimTextOutput("structure"))),
                       tabPanel(title="Summary Stats",icon=icon("address-card"),verbatimTextOutput("summary"))),
        tabItem(tabName = "viz",
                tabBox(id="t2",width=8,
                       tabPanel("Barplot",icon=icon("bar-chart"),plotOutput("bar_chart_output")),
                       tabPanel("Histogram",icon=icon("line-chart"),plotOutput("histogram_output")),
                       tabPanel("Density Plot",icon=icon("area-chart"),plotOutput("density_plot_output")),
                       tabPanel("Scatter Plot",icon=icon("bar-chart"),plotOutput("scatter_plot_output")),
                       tabPanel("Lollipop plot",icon=icon("tint"),plotOutput("lollipop_output"))
                      )
                )
                )
              )
      )
)