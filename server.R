bmi <<- 0
bmiCalculation <- function(wt, ht){
  bmi <- (wt / ht^2) * 703
  return(bmi)
}

Overweight <- function(bmi){
  message = ""
  if(is.nan(bmi)){
    message = "The user did not get BMI yet"
    return(message)
  }

  if(bmi < 15)
    message = "Very seriously underweight"
  else if(bmi >= 15 & bmi < 16)
    message = "Severely underweight"
  else if(bmi >= 16 & bmi < 18.5)
    message = "Underweight"
  else if(bmi >= 18.5 & bmi < 25)
    message = "Normal(Healthy weight)"
  else if(bmi >= 25 & bmi < 30)
    message = "Overweight"
  else if(bmi >= 30 & bmi < 35)
    message = "Obese Class I(Moderately obese)"
  else if(bmi >= 35 & bmi < 40)
    message = "Obese Class II(Severely obese)"
  else if(bmi >= 40)
    message = "Obese Class III(Very severely obese!)"
  
  return(message)
}

library(shiny)
library(shinyjs)

shinyServer(
  function(input, output) {
    output$weightInput <- renderPrint({input$weight})
    output$heightInput <- renderPrint({input$height})
    output$bmiResult <- renderPrint({
      if(input$weight == 0| input$height == 0){
        print("Not available") 
      }else{
         bmiCalculation(input$weight, input$height)}
    })
    output$overweight <- renderText({
      Overweight(bmiCalculation(input$weight, input$height))
      }) 
  }
)
