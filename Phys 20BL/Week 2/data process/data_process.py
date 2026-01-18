# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#definition needed
def format_e(n):
    a = '%E' % n
    return a.split('E')[0].rstrip('0').rstrip('.') + 'E' + a.split('E')[1]

#import data
filename = "Week 2 Data - data.csv"
data = pd.read_csv(filename)

#get list of data
R2B2 = data[data.columns[0]].tolist()
V2 = data[data.columns[1]].tolist()
delta_R2B2 = data[data.columns[2]].tolist()
delta_V2 = data[data.columns[3]].tolist()

#best fit line
z = np.polyfit(x=R2B2, y=V2, deg=1)
p = np.poly1d(z)

m = format_e(int(z[0]*1000)/1000.0) #slope
k = int(z[1]*1000)/1000.0 #y-intercept

trend_eq = "2V = "+ str(m)+ "* (R^2B^2) + " + str(k)

#plot data
plt.errorbar(x=R2B2, y=V2, yerr = delta_V2, xerr = delta_R2B2, fmt = "o")
plt.title("chi^2 = 0.995")
plt.ylabel("2V (unit: Volt)")
plt.xlabel("R^2B^2 (unit: m^2T^2)")

plt.plot(R2B2, p(R2B2), "r", label = trend_eq) #trendline
plt.legend(loc = "upper left")

plt.savefig("scatter_plot.png")
