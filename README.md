# Shiny_app_pitch
Peer graded assignment: shiny application and reproducible pitch

The shiny app for the assingment is to be found at https://pbarry.shinyapps.io/testmatrix/
Instructions for this app are available at https://pbarry.shinyapps.io/firstpres_doc/
The pitch for this app is to be found at http://rpubs.com/pbarry129/my_pitch

The shiny app is written in a single file with ui<-fluidPage(...) and server<-function(input, output){...}.
This is in the present github directory as app.R

The app randomly generates two n x n matrices where n (range 1:6) is input by the user.
The product of these two matrices is calculated (after pressing an action button named "Display..."
Depending on whether a checkbox is checked or not, either the product matrix is displayed or a plot of the normalised values of one matrix against the values of the other matrix is plotted. Here, the values are obtained by 'flattening' the matrices to be vectors. 

1. Input the size of the matrices
2. Press the "Display..." button to firstly display the product of the two random matrices (which are also displayed)
3. Check or uncheck the checkbox to either display the product or the plot of values of the matrices against each other
4. Press the "Display ..." button to get new matrices and product 
5. Input a different size to change the size of the matrices
