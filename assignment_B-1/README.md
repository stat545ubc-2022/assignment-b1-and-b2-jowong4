# Assignment B-1

## What is this directory?

This repo contains assignments B-1 from STAT545B. Assignment B-1 involves defining our own function, demonstrating the functionality with some examples, and making tests.
Assignment B-2 packages this function into a R package and is hosted in the parent directory.

## How to run the code?

There are two ways to run the code in this repository. Please ensure that you have R and the packages used in this codebase installed before running

### Dependencies
 * R
 * tidyverse
 * knitr

Using RStudio:

1.  Press the green "Code"" button and then click the copy button

2.  Open Rstudio and create a new project by going to "File" and then click "New Project"

3.  Press Version Control then Git. Then paste the link into the url box.

4. The code will then be cloned to your PC via RStudio.

5. Navigate to the `assignment_B-1` folder

6. To knit your own version of the the Rmd, simply open the Rmd and click on the knit button

Using command line (linux/macOS, adjust accordinly if using windows file systems):

1.  `git clone https://github.com/stat545ubc-2022/assignment-b1-and-b2-jowong4.git`

2.  `cd assignment-b1-and-b2-jowong4/assignment_B-1`

3.  `Rscript -e "rmarkdown::render('assignment_B-1.Rmd')"`
