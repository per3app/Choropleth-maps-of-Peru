#
library(choroplethr)
library(choroplethrMaps)

?df_pop_state
df_state<-data(df_pop_state)
head(df_pop_state)

?state_choropleth
state_choropleth(df_pop_state)

state_choropleth(df_pop_state, title="2012 State Population Estimates",
                 legend = "Population")

file<-'d:/geomar/modulos/programacion/R/Choroplethr-with-R'
txt<-'df_state.txt'
csv<-'df_state.csv'

dir_file<-paste(file,txt,sep = '/')
csv_file<-paste(file,csv,sep = '/')

write.table(df_state,dir_file) #txt
write.csv(df_state,csv_file) #csv
