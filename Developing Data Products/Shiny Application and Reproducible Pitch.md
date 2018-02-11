Shiny Application Pitch
========================================================
author: PRAVEEN SINGH
date: 11-FEB-2018
autosize: true


What's is the shinny application?
========================================================
  
- Dataset used is "airquality"
- Variation of solar radiation with respect to temperature is depicted in graph
- Linear reggression is used for prediction
- Solar radiation is predicted for a given user input of month and temperature

Dataset
========================================================


```r
summary(airquality)
```

```
     Ozone           Solar.R           Wind             Temp      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
 NA's   :37       NA's   :7                                       
     Month            Day      
 Min.   :5.000   Min.   : 1.0  
 1st Qu.:6.000   1st Qu.: 8.0  
 Median :7.000   Median :16.0  
 Mean   :6.993   Mean   :15.8  
 3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :9.000   Max.   :31.0  
                               
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](Shiny Application and Reproducible Pitch-figure/unnamed-chunk-2-1.png)

External Links
=========================================================

The shinny application is hosted at
 <https://prvns.shinyapps.io/shinyapp/>.
 
 The github repository containing related files :
 <https://github.com/prvnsingh/datasciencecoursera/tree/master/Developing%20Data%20Products>
