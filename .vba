// Define the variables
VIX = close // Replace "VIX" with the actual ticker for the VIX index in ProRealTime
currentPrice = close // This is the current price of the asset (e.g., US500)
movingAvg = average[30](close) // 45-period Simple Moving Average

// Formula calculation
deltaFormula = (VIX / 100) + ((currentPrice - movingAvg) / movingAvg) + ((VIX / 100) * sqrt(30 / 365) / 2)

// Clamp the delta between 0.12 and 0.25
delta = max(0.12, min(0.25, deltaFormula))

// Plot the delta
return delta
