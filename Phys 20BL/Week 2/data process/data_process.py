# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#define constant for needed line

#import data
filename = "Week 2 Data - data.csv"
data = pd.read_csv(filename)

#get list of data
R2B2 = data[data.columns[0]].tolist()
V2 = data[data.columns[1]].tolist()
#delta_R2B2 = data[data.columns[2]].tolist()
#delta_V2 = data[data.columns[3]].tolist()

#best fit line
z = np.polyfit(x=R2B2, y=V2, deg=1)
p = np.poly1d(z)

m = z[0] #slope
k = z[1] #y-intercept

#plot data
plt.scatter(R2B2, V2)
plt.ylabel("2V (unit: Volt)")
plt.xlabel("R^2B^2 (unit: m^2T^2)")

plt.plot(R2B2, p(R2B2), "r") #trendline


plt.savefig("scatter_plot.png")
