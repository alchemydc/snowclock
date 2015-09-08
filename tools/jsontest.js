#!/opt/local/bin/node

var data = '{"USD": {"7d": "857.83", "30d": "777.16", "24h": "898.60"}, "ILS": {"7d": "3312.35", "30d": "2913.02", "24h": "3258.69"}, "GBP": {"7d": "534.48", "30d": "490.74", "24h": "558.22"}, "DKK": {"7d": "5043.59", "30d": "4682.28", "24h": "5095.73"}, "CAD": {"7d": "849.18", "30d": "745.49", "24h": "921.62"}, "MXN": {"7d": "12405.69", "30d": "10145.81", "24h": "11097.89"}, "XRP": {"7d": "21301.86", "30d": "37067.48", "24h": "23546.77"}, "SEK": {"7d": "5924.03", "30d": "4975.73", "24h": "6175.33"}, "SGD": {"7d": "1052.33", "30d": "1000.34", "24h": "1149.11"}, "HKD": {"7d": "7172.72", "30d": "4874.96", "24h": "7153.12"}, "AUD": {"7d": "959.12", "30d": "845.08", "24h": "1033.61"}, "CHF": {"7d": "822.37", "30d": "683.80", "24h": "866.08"}, "timestamp": 1386824228, "CNY": {"7d": "5403.44", "30d": "5154.96", "24h": "5499.02"}, "LTC": {"7d": "27.94", "30d": "40.76", "24h": "27.33"}, "NZD": {"7d": "1091.56", "30d": "942.63", "24h": "1166.82"}, "THB": {"7d": "28174.50", "30d": "26279.97", "24h": "29566.48"}, "EUR": {"7d": "648.91", "30d": "569.81", "24h": "673.37"}, "SLL": {"7d": "214679.81", "30d": "183339.36", "24h": "224035.72"}, "ARS": {"7d": "9328.19", "30d": "7498.77", "24h": "8404.09"}, "NOK": {"7d": "5494.60", "30d": "4907.43", "24h": "5536.22"}, "RUB": {"7d": "29120.85", "30d": "26086.42", "24h": "29820.95"}, "INR": {"7d": "61505.57", "30d": "54217.00", "24h": "60483.08"}, "JPY": {"7d": "92167.98", "30d": "73373.02", "24h": "94168.94"}, "CZK": {"7d": "19187.26", "30d": "15522.09", "24h": "18804.52"}, "BRL": {"7d": "2372.92", "30d": "2227.42", "24h": "2306.14"}, "PLN": {"7d": "2756.32", "30d": "2254.89", "24h": "2760.02"}, "ZAR": {"7d": "9551.04", "30d": "9359.82", "24h": "9192.82"}}'

var json = JSON.parse(data)

console.dir(json)
