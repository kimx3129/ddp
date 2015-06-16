shinyUI(pageWithSidebar(
  headerPanel("BMI(Body Mass Index) Calculator"),
  sidebarPanel(
    numericInput('weight', "Type your weight in lbs", 0, min=0, max=500, step=0.1),
    numericInput('height', "Type your height in inch", 0, min=0, max=500, step=0.1),
    submitButton("See my BMI"),
    h4('For more information about BMI,', 
       a("Click here", href="https://en.wikipedia.org/?title=Body_mass_index"))
  ),
  mainPanel(
    h4('Your weight is'),
    verbatimTextOutput("weightInput"),
    h4('Your height is'),
    verbatimTextOutput("heightInput"),
    h4('Here is your BMI result'),
    verbatimTextOutput("bmiResult"),
    textOutput('overweight')
  )
))
