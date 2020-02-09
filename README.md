# friendly-guacamole
Hodrick-Prescott Filter or HP Filter function in R

I have always wondered what this HP filter was actually doing. I prefer the log-quadratic trend though because it is simpler.
I use the AirPassenger data inside R as an example to decompose it into "Trend" and "Cyclical" although it seems that the "cyclical" is  seasonal. 

![Sample Data from R](https://github.com/frogger21/friendly-guacamole/blob/master/Routput.PNG)

A better example with seasonally adjusted quarterly US Real GDP's cyclical component from HP Filter and Log Quadratic 
![US Real GDP from R](https://github.com/frogger21/friendly-guacamole/blob/master/Rgdp.jpg)

Problems with filters like HP: Using the total Australian residents data set in R (quarterly frequency), I show an example of how future values impact the historical HP trend and thus the cyclical component. 
![Australian Residents from R](https://github.com/frogger21/friendly-guacamole/blob/master/hpaussie.PNG)

Here we can visually see the dramatic changes in the cyclical component as more data is released. The historical HP filter is influenced by future data points. In conclusion: don't use this filter for real-time purposes as the processed data closer to the end will fluctuate wildly as new data is released and filtered. Use it as a static summary and don't put much weight on what it suggests is happening in the last cycle. 
![Problems with HP](https://github.com/frogger21/friendly-guacamole/blob/master/HPProblems.PNG)
