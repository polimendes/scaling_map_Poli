##Created by Amanda Schwantes on Apr 4, 2023
##Example using plotly in R, maybe John can more easily adapt to 
##a javascript version?

library(plotly)

pathIn <- ""

df <- read.csv(paste0(pathIn,"salmonRiver.csv"), stringsAsFactors = F)

df$Date <- as.Date(paste0("01-01-",df$ANALYSIS_YR), format = "%m-%d-%Y")
df$logAbun <- log(as.numeric(df$MAX_ESTIMATE))

df$logAbun10 <- df$logAbun
df$logAbun10[df$ANALYSIS_YR < 2010] <- NA

df$logAbun20 <- df$logAbun
df$logAbun20[df$ANALYSIS_YR < 2000] <- NA

df <- df[order(df$Date),]

all_annotations <- list(
  x=as.Date("01-01-2000", format = "%m-%d-%Y"), 
  y=8,
  text=paste0('coef = -0.046 & p < 0.001'),
  showarrow = F,
  xref='x', yref='y'
)

med_annotations <- list(
  x=as.Date("01-01-2000", format = "%m-%d-%Y"), 
  y=8,
  text=paste0('non-significant'),
  showarrow = F,
  xref='x', yref='y'
)

low_annotations <- list(
  x=as.Date("01-01-2000", format = "%m-%d-%Y"), 
  y=8,
  text=paste0('non-significant'),
  showarrow = F,
  xref='x', yref='y'
)

# updatemenus component
updatemenus <- list(
  list(
    active = 0,
    type= 'buttons',
    buttons = list(
      list(
        label = "Since<br>1984",
        method = "update",
        args = list(list(visible = c(FALSE, TRUE ,FALSE)),
                    list(title = "",
                         annotations = list(c(), all_annotations, c())))),
      list(
        label = "Since<br>2000",
        method = "update",
        args = list(list(visible = c(FALSE, FALSE, TRUE)),
                    list(title = "",
                         annotations = list(c(), c(), med_annotations)))),
      list(
        label = "Since<br>2010",
        method = "update",
        args = list(list(visible = c(TRUE, FALSE, FALSE)),
                    list(title = "",
                         annotations = list(low_annotations, c(), c() )))))
  )
)

fig <- df %>% plot_ly(type = 'scatter', mode = 'lines') 
fig <- fig %>% add_lines(x=~Date, y=~logAbun,
                         line=list(color="#5C9474")) 
fig <- fig %>% add_lines(x=~Date, y=~logAbun20,
                         line=list(color="#5C9474")) 
fig <- fig %>% add_lines(x=~Date, y=~logAbun10,
                         line=list(color="#5C9474")) 
fig <- fig %>% layout(title = "", showlegend=FALSE,
                      xaxis=list(title="Date",
                                 range = list(as.Date("01-01-1984", format = "%m-%d-%Y"), as.Date("01-01-2020", format = "%m-%d-%Y"))),
                      yaxis=list(title="log(Chinook spawner abundance)",
                                 range = list(3, 8.5)),
                      updatemenus=updatemenus)


fig
