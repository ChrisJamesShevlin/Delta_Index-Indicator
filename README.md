![image](https://github.com/user-attachments/assets/1b59e096-ba32-42da-bb23-6646b0f6d920)


# Serenity Index Strategy for ProRealTime

## Overview
The **Serenity Index Strategy** is a custom-built technical analysis tool designed for use in ProRealTime. This indicator combines three core elements:
- **Volatility** via the **Average True Range (ATR)**.
- **Momentum** via the **Relative Strength Index (RSI)**.
- **Trend-following** via the **Simple Moving Average (SMA)**.

The Serenity Index helps traders assess market "serenity" or stability, identifying potential buy and sell opportunities based on risk-adjusted market conditions.

## Table of Contents
- [Overview](#overview)
- [Formula](#formula)
- [Parameters](#parameters)
- [How to Use in ProRealTime](#how-to-use-in-prorealtime)
- [Customization](#customization)
- [Example Use Case](#example-use-case)
- [License](#license)

## Formula

The Serenity Index is calculated using the following formula:

```
SerenityIndex = (100 - ATRValue) * (RSIValue / 100) * (Close / 50-period SMA)
```

Where:
- `ATRValue` is the 14-period Average True Range (ATR).
- `RSIValue` is the 14-period Relative Strength Index (RSI).
- `Close` is the current closing price of the asset.
- `50-period SMA` is the 50-period Simple Moving Average of the asset’s closing price.

## Parameters

The Serenity Index has three key parameters, which you can adjust depending on your trading preferences:

| Parameter  | Description                                       | Default Value |
|------------|---------------------------------------------------|---------------|
| ATRPeriod  | Period for calculating the Average True Range     | 14            |
| MAPeriod   | Period for the Simple Moving Average calculation  | 50            |
| RSIPeriod  | Period for the Relative Strength Index calculation| 14            |

## How to Use in ProRealTime

### Step 1: Installation
1. Open **ProRealTime**.
2. Go to the **Indicators** tab.
3. Select **Create Indicator** or **New Indicator**.
4. Copy and paste the following ProRealCode into the code editor:

```prorealcode
// Parameters for the Serenity Index
ATRPeriod = 14
MAPeriod = 50
RSIPeriod = 14

// Calculate the components
TRValue = max(high - low, max(abs(high - close[1]), abs(low - close[1]))) // True Range calculation
ATRValue = average[ATRPeriod](TRValue) // Average True Range
MALong = average[MAPeriod](close) // 50-period Simple Moving Average
RSIValue = RSI[RSIPeriod] // 14-period RSI

// Serenity Index Calculation
SerenityIndex = (100 - ATRValue) * (RSIValue / 100) * (close / MALong)

// Plot the Serenity Index
return SerenityIndex
```

### Step 2: Customization (Optional)
You can modify the default values of `ATRPeriod`, `MAPeriod`, and `RSIPeriod` to better fit your trading strategy or to adapt the indicator for different timeframes and assets.

### Step 3: Applying the Indicator
Once you've pasted the code, the Serenity Index will automatically plot on your chart. It can be used alongside other technical indicators or strategies to enhance your decision-making process.

## Customization

The Serenity Index can be customized to match your specific trading needs:

1. **Timeframes:**
   - The default settings assume a medium-term strategy, but you can shorten or lengthen the periods for ATR, RSI, and the Moving Average to adapt to different market conditions.

2. **Threshold Adjustments:**
   - If you find that the Serenity Index reaches extreme values too often or too rarely, adjust the ATR and RSI periods to better reflect the market's volatility and momentum.

## Example Use Case

The Serenity Index is particularly useful in volatile markets where traditional indicators might provide conflicting signals. By combining the ATR for volatility, the RSI for momentum, and the Moving Average for trend-following, traders can better assess whether a market is truly trending or simply experiencing short-term volatility.

For example, a rising Serenity Index indicates bullish momentum with decreasing volatility, which may be a good signal for entering long trades. Conversely, a falling Serenity Index may suggest waning momentum and increased risk, signaling caution or potential short trades.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more information.

---

This guide provides everything you need to implement and customize the Serenity Index in ProRealTime. Make sure to adjust parameters and settings based on your specific market and trading style.

