library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
source("weather1prac.R")
shinyServer(function(input, output,session) {
  output$structure<- renderPrint(
    mydata %>%
      str()
  )
  output$summary<-renderPrint(
    mydata %>%
      summary()
  )
  output$dataT<- renderDataTable(mydata)
  output$bar_chart_output <- renderPlot({
    ggplot(data = avg_temp_by_country_year, aes(x = Year, y = AvgTemperature, fill = Country)) +
      geom_bar(stat = "identity", position = "dodge", width = 0.7) +
      scale_fill_manual(values = custom_palette) +  # Use custom color palette
      labs(x = "Year", y = "Average Temperature (°C)", title = "Average Temperature by Country Over Years") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  }
  )
  output$histogram_output <- renderPlot({
    ggplot(data = avg_temp_by_country_year, aes(x = AvgTemperature, fill = Country)) +
      geom_histogram(binwidth = 15, position = "dodge", alpha = 2.0) +
      labs(x = "Average Temperature", y = "Frequency", title = "Histogram of Average Temperature by Country")
  }
  )
  output$density_plot_output <- renderPlot({
    ggplot(data = avg_temp_by_country_year, aes(x = AvgTemperature, fill = Country)) +
      geom_density(alpha = 0.5, color = "black") +  # Adjust transparency and add border color
      labs(x = "Average Temperature (°C)", y = "Density", title = "Density Plot of Average Temperature by Country") +  # Improve axis labels
      theme_minimal() +  # Use a minimal theme
      theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14, face = "bold"))  # Adjust text sizes and styles
  }
  )
  output$scatter_plot_output <- renderPlot({
    ggplot(data = avg_temp_by_country_year, aes(x = Year, y = AvgTemperature, color = Country)) +
      geom_point(size = 3) +  # Adjust the size as needed
      labs(x = "Year", y = "Average Temperature", title = "Average Temperature by Country Over Years")
  }
)
  output$lollipop_output <- renderPlot({
    ggplot(data = avg_temp_by_country_year, aes(x = Year, y = AvgTemperature, color = Country)) +
      geom_segment(aes(xend = Year, yend = 0), size = 1) +  # Vertical lines
      geom_point(size = 4) +  # Points
      scale_color_manual(values = rainbow(length(unique(avg_temp_by_country_year$Country)))) +  # Assigning multiple colors
      labs(x = "Year", y = "Average Temperature", title = "Lollipop Plot of Average Temperature by Country Over Years")
    
  }
  )
  
}
)