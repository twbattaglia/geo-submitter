
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# Load Shiny
library(shiny)
library(shinydashboard)


# Initiaze
dashboardPage(
  
  # Header
  dashboardHeader(title = "GEO-submitter-dev"),
  
  # Sidebar
  dashboardSidebar(sidebarMenu(
    menuItem(
      text = "Upload",
      tabName = "upload",
      icon = icon("dashboard")
    ),
    menuItem(
      text = "Sample Information",
      tabName = "sample",
      icon = icon("dashboard")
    ),
    menuItem(
      text = "Experiment Information",
      tabName = "series",
      icon = icon("dashboard")
    )
  )), 
  
  # Main body
  dashboardBody(
    tabItems(
      
      # Upload
      tabItem(tabName = "upload",
              h2("Dashboard tab content")
      ),
      
      # Sample Information
      tabItem(tabName = "sample",
              h2("Widgets tab content")
      ),
      
      # Experiment Information
      tabItem(tabName = "sample",
              h2("Widgets tab content")
      )
    )
  )
)
      