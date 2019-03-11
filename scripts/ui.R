library(shiny)
library(plotly)
library(dplyr)

ui <- fluidPage(
  navbarPage(
    "Kickstarter Success",
    tabPanel(
      "Overview",
      tags$h2("What Makes a Successful Kickstarter?"),
      tags$em("Ruthvik, Cynthia, & Talon"),
      p(),
      p(),
      tags$p("Crowdfunding: a relatively new concept, but progressively more
             popular, and powerful. GoFundMe is used for everything from
             plastic surgery to funeral arrangements, Patreon pays the bills of
             numerous
             online creators, and Facebook charity fundraisers are onmipresent.
             Perhaps most influential of all is Kickstarter, which -- with the
             success of
             electronics like the Pebble, and video games like Pillars of 
             Eternity --
             is an increasingly legitimate avenue for small businesses to reach
             large audiences."),
      p(),
      tags$p("But: what", tags$em("makes"), "a Kickstarter successful? 
              No doubt, this is an important question for startups &
              other small businesses whose dreams ride on an algorithm
              and the generosity of an anonymous audience. Is it possible 
              to ensure -- or at least increase -- the likelihood of
              success? Let's find out."),
      p(),
      tags$h3("Our Data"),
      tags$p("We are using a very large dataset -- more than 300,000 rows -- of
              Kickstarter data, published on Kaggle by Mikael Mouille, with
              assistance from Anton Savchenko. While the data is technically
              through 2018, it was collected early in the year, so the last
              complete year of data is 2017. Using this dataset, we hope to
              answer the following."),
      tags$h3("Questions:"),
      tags$li("What types -- categories -- of Kickstarter are most popular in
               each year? Does a category's popularity by number of projects
               effect its funding?"),
      tags$li("RUTHVIK PUT YOUR QUESTION HERE"),
      tags$li("TALON PUT YOUR QUESTION HERE")
    ), tabPanel (
      "Category",
      titlePanel(
        "Kickstarter by Category"
      ),
      sidebarLayout(
        sidebarPanel(
          # interactable goes here
          selectInput(
            inputId = "first_year",
            label = "First year:",
            choices = c("2012", "2013", "2014", "2015", "2016", "2017")
          ),
          
          selectInput(
            inputId = "second_year",
            label = "Second year:",
            choices = c("2012", "2013", "2014", "2015", "2016", "2017"),
            selected = "2017"
          ), 
          
          radioButtons("med_or_mean",
            "% Funded:",
            c("Mean", "Median"), selected = "Median"
          )
        ),
        mainPanel(
          # viz goes here
          plotlyOutput("popularity"),
          p(),
          p(),
          plotlyOutput("success"),
          p(),
          p(),
          p("Kickstarter projects are organized into 15 main categories --
            things like film, games, and food. We are interested in the 
            popularity of these categories, and their influence
            on funding status. We wonder: do projects which see high
            amounts of success influence the popularity of projects of that
            category on the platform? Do the most popular types of projects
            also see the most success, or the most reliable success?"),
          p(),
          p("To this end, we have designed two bar graphs. Both separate their
            data by year; we want to know if certain categories on the 
            Kickstarter
            platform have increased in popularity over time. The first shows 
            the total", 
            tags$em("count"), "of projects in that category in that year; 
            the second shows the mean
            or median funding % of projects in that category in that year."),
          p(),
          p("Our graphs show some interesting results! As anyone familiar with 
             Kickstarter
             knows, some projects are funded tens of thousands of times -- and
             these are
             typically the most well-known and publicized. They also", 
             tags$em("significantly"), "skew the mean, or average,
             of our calculations; for example, in 2017, Music-type projects 
             were funded
             an", tags$em("average"), "of 779%, but only 27% by median. It is
             very common to see extremely high averages
             like this; however, medians cap out at around 100%."),
          p(),
          p("Interestingly, more popular (by count) categories often have lower
             median funding percentages. This makes sense if we think about it:
             if there are more projects, it's likely that funding for these 
             projects is more competitive; however, this does suggest that 
             creators are not thinking about market saturation when they
             announce their products. Some of the", tags$em("least"),
             "popular categories -- Theater, Comics, and Dance -- have the
             highest median funding percentages, hovering between 50% and 
             100%; by comparison, Technology-type projects
             achieve under 5% median funding in the majority of years -- 
             and achieved a high of 30% in 2012,
             when Technology was much less popular on Kickstarter."),
          p(),
  
          p("There are many reasons more popular categories like Film and Technology
             see less success. Market saturation is a concern, but also, these types
             of projects are usually much more expensive
             than the typical Comic-type project 
             (", textOutput("technology", inline = T), "; ", 
             textOutput("comics", inline = T), "). Creators would be prudent to
             note this before launching an expensive,
             high-risk product in a saturated category.")
        )
      )
    ) # for talon & ruthvik's viz
    #, tabPanel (
    #  "Funding Period"
    #), tabPanel (
    #  "Country"
    #)
  )
)