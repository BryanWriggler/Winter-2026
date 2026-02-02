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
filename = "Data for lab3 phys20bL - data 1.csv"
data = pd.read_csv(filename)

#get list of data
D = data[data.columns[0]].tolist()
delta_D = data[data.columns[1]].tolist()
t = data[data.columns[2]].tolist()
delta_t = data[data.columns[3]].tolist()

#best fit line
z = np.polyfit(x=t, y=D, deg=1)
p = np.poly1d(z)

m = format_e(z[0]) #slope
k = int(z[1]*10000)/10000.0 #y-intercept

trend_eq = "D = "+ str(m)+ "* t + " + str(k)

#plot data
plt.errorbar(x=t, y=D, yerr = delta_D, xerr = delta_t, fmt = "o")
#plt.title("chi^2 = 0.995")
plt.ylabel("D (unit: m)")
plt.xlabel("t (unit: ms)")

plt.plot(t, p(t), "r", label = trend_eq) #trendline
plt.legend(loc = "upper left")

plt.savefig("scatter_plot.png")
