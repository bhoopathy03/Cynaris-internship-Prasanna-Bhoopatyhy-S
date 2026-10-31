## 1.Filtering sales in power bi

Furniture Sales =
CALCULATE(
SUM(Sales[SalesAmount]),
Sales[Category] = "Furniture"
)

## 2. Running total (this creates to add on the total)--Earlier

Running Total =
CALCULATE(
SUM(Sales[SalesAmount]),
FILTER(
Sales,
Sales[OrderDate] <= EARLIER(Sales[OrderDate])
)
)

## 3. To calculate the sales profit

Running Total =
CALCULATE(
SUM(Sales[SalesAmount]),
FILTER(
Sales,
Sales[OrderDate] <= EARLIER(Sales[OrderDate])
)
)

## 4. IF condition

Sales Status =
IF(
Sales[SalesAmount] > 1000,
"High",
"Low"
)

## 5. Classfying High, Medium, Low sales

Sales Category =
SWITCH(
TRUE(),
Sales[SalesAmount] > 5000, "High",
Sales[SalesAmount] > 2000, "Medium",
"Low"
)
