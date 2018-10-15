library(choroplethr)
library(choroplethrMaps)

?df_pop_state
data(df_pop_state)
head(df_pop_state)

?state_choropleth
state_choropleth(df_pop_state)

state_choropleth(df_pop_state, title="2012 State Population Estimates",
                 legend = "Population")
