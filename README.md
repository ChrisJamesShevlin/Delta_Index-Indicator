![image](https://github.com/user-attachments/assets/1b59e096-ba32-42da-bb23-6646b0f6d920)


# Delta Indicator for ProRealTime

## Overview
The **Delta Indicator** is designed for use in options trading, particularly for setting strike prices when selling options. This indicator calculates a delta value based on the **VIX**, the **current price** of the asset (e.g., US500), and the **30-period Simple Moving Average (SMA)** of the asset’s price. The resulting delta is clamped between 0.12 and 0.25, which helps traders determine suitable strike prices for selling options based on volatility and market conditions.

## Table of Contents
- [Overview](#overview)
- [Formula](#formula)
- [How to Use in ProRealTime](#how-to-use-in-prorealtime)
- [Customization](#customization)
- [Plotting](#plotting)
- [Example Use Case](#example-use-case)
- [License](#license)

## Formula

The delta is calculated using the following formula:

```prorealcode
deltaFormula = (VIX / 100) + ((currentPrice - movingAvg) / movingAvg) + ((VIX / 100) * sqrt(30 / 365) / 2)
delta = max(0.12, min(0.25, deltaFormula))
```

Where:
- `VIX` is the current volatility index (expressed as a percentage).
- `currentPrice` is the current price of the underlying asset (e.g., US500).
- `movingAvg` is the 30-period Simple Moving Average of the asset price.
- The final delta is clamped between 0.12 and 0.25.

## How to Use in ProRealTime

### Step 1: Define Variables
In the ProRealCode editor, the variables for VIX, current price, and the 30-period moving average are defined as follows:

```prorealcode
VIX = close // Replace "close" with the actual ticker for VIX in ProRealTime
currentPrice = close // This is the current price of the asset (e.g., US500)
movingAvg = average[30](close) // 30-period Simple Moving Average
```

### Step 2: Formula Calculation
The formula for calculating the delta is:

```prorealcode
deltaFormula = (VIX / 100) + ((currentPrice - movingAvg) / movingAvg) + ((VIX / 100) * sqrt(30 / 365) / 2)
```

### Step 3: Clamping the Delta
The delta is clamped between 0.12 and 0.25 to ensure it stays within the desired range:

```prorealcode
delta = max(0.12, min(0.25, deltaFormula))
```

### Step 4: Plot the Delta
Finally, the delta is plotted on the chart using:

```prorealcode
return delta
```

## Customization

You can modify the following aspects of the code to adapt the indicator to your trading needs:
1. **VIX Data Reference**: Ensure that you correctly reference the **VIX** data series in ProRealTime. Replace the `close` function in the `VIX` variable with the correct method for accessing VIX data.
2. **Moving Average Period**: You can change the `30-period SMA` to a different value based on your preferred time frame.
3. **Delta Range**: The delta range is clamped between 0.12 and 0.25. You can adjust these values if you prefer different boundaries for your option selling strategy.

## Plotting

Once the indicator is applied, the delta values will be plotted below the price chart. The delta index represents the calculated risk for options selling and helps you choose strike prices based on market conditions and volatility.

## Example Use Case

This Delta Indicator is useful for options traders, particularly those looking to sell options based on delta levels. For example, you might use this indicator to select a strike price with a delta between 0.12 and 0.25, which can help optimize the balance between risk and return when writing options contracts.

The chart shown in the image provides a clear view of the calculated delta as plotted below the asset’s price chart, making it easy to interpret in real-time trading scenarios.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

This guide should help you configure and use the Delta Indicator in **ProRealTime**. Adjust the parameters and formulas to suit your specific trading strategy.

