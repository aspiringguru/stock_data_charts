/*  .schema yf_stock_data

https://www.excelpricefeed.com/userguide/excel-formula-yahoo-finance/stocks
https://nodatanobusiness.com/resources/yahoo-finance-built-in-selectors/
https://algotrading101.com/learn/yahoo-finance-api-guide/

*/

CREATE TABLE IF NOT EXISTS "yf_stock_data" (
"stockCode" TEXT,
"date_run" TEXT,
"time_run" TEXT,
"gmtOffSetMilliseconds" TEXT,
  "lastDividendDate" TEXT,
  "previousClose" TEXT,
  "shortName" TEXT,
  "fiftyDayAverage" TEXT,
  "totalAssets" TEXT,
  "beta" TEXT,
  "strikePrice" TEXT,
  "phone" TEXT,
  "sharesShortPreviousMonthDate" TEXT,
  "financialCurrency" TEXT,
  "dayHigh" TEXT,
  "currentPrice" TEXT,
  "address2" TEXT,
  "52WeekChange" TEXT,
  "lastFiscalYearEnd" TEXT,
  "quoteType" TEXT,
  "isEsgPopulated" TEXT,
  "priceToBook" TEXT,
  "err" TEXT,
  "headSymbol" TEXT,
  "returnOnAssets" TEXT,
  "marketCap" TEXT,
  "earningsGrowth" TEXT,
  "underlyingSymbol" TEXT,
  "industry" TEXT,
  "preMarketChange" TEXT,
  "lastCapGain" TEXT,
  "category" TEXT,
  "mostRecentQuarter" TEXT,
  "underlyingExchangeSymbol" TEXT,
  "sharesPercentSharesOut" TEXT,
  "fullTimeEmployees" TEXT,
  "bidSize" TEXT,
  "volumeAllCurrencies" TEXT,
  "zip" TEXT,
  "companyOfficers" TEXT,
  "dividendYield" TEXT,
  "twoHundredDayAverage" TEXT,
  "postMarketPrice" TEXT,
  "currentRatio" TEXT,
  "lastSplitFactor" TEXT,
  "recommendationKey" TEXT,
  "totalCash" TEXT,
  "pegRatio" TEXT,
  "regularMarketOpen" TEXT,
  "circulatingSupply" TEXT,
  "trailingEps" TEXT,
  "regularMarketTime" TEXT,
  "dividendRate" TEXT,
  "startDate" TEXT,
  "uuid" TEXT,
  "sharesOutstanding" TEXT,
  "maxSupply" TEXT,
  "fiveYearAvgDividendYield" TEXT,
  "grossMargins" TEXT,
  "messageBoardId" TEXT,
  "quickRatio" TEXT,
  "targetMedianPrice" TEXT,
  "regularMarketDayHigh" TEXT,
  "expireDate" TEXT,
  "fiftyTwoWeekHigh" TEXT,
  "totalCashPerShare" TEXT,
  "beta3Year" TEXT,
  "regularMarketVolume" TEXT,
  "totalRevenue" TEXT,
  "earningsQuarterlyGrowth" TEXT,
  "averageDailyVolume10Day" TEXT,
  "exDividendDate" TEXT,
  "openInterest" TEXT,
  "grossProfits" TEXT,
  "sharesShortPriorMonth" TEXT,
  "regularMarketPrice" TEXT,
  "ebitdaMargins" TEXT,
  "shortPercentOfFloat" TEXT,
  "askSize" TEXT,
  "freeCashflow" TEXT,
  "exchangeTimezoneName" TEXT,
  "dayLow" TEXT,
  "maxAge" TEXT,
  "lastSplitDate" TEXT,
  "payoutRatio" TEXT,
  "regularMarketDayLow" TEXT,
  "postMarketChange" TEXT,
  "sharesShort" TEXT,
  "recommendationMean" TEXT,
  "sector" TEXT,
  "dateShortInterest" TEXT,
  "floatShares" TEXT,
  "volume24Hr" TEXT,
  "priceToSalesTrailing12Months" TEXT,
  "lastMarket" TEXT,
  "fax" TEXT,
  "priceHint" TEXT,
  "ebitda" TEXT,
  "targetHighPrice" TEXT,
  "volume" TEXT,
  "regularMarketSource" TEXT,
  "averageVolume" TEXT,
  "heldPercentInsiders" TEXT,
  "revenueQuarterlyGrowth" TEXT,
  "toCurrency" TEXT,
  "returnOnEquity" TEXT,
  "fundInceptionDate" TEXT,
  "heldPercentInstitutions" TEXT,
  "SandP52WeekChange" TEXT,
  "impliedSharesOutstanding" TEXT,
  "regularMarketChange" TEXT,
  "operatingCashflow" TEXT,
  "currencySymbol" TEXT,
  "revenueGrowth" TEXT,
  "navPrice" TEXT,
  "revenuePerShare" TEXT,
  "longName" TEXT,
  "country" TEXT,
  "city" TEXT,
  "address1" TEXT,
  "operatingMargins" TEXT,
  "exchangeTimezoneShortName" TEXT,
  "forwardEps" TEXT,
  "fiftyTwoWeekLow" TEXT,
  "targetMeanPrice" TEXT,
  "market" TEXT,
  "currency" TEXT,
  "preMarketPrice" TEXT,
  "regularMarketChangePercent" TEXT,
  "annualHoldingsTurnover" TEXT,
  "lastDividendValue" TEXT,
  "algorithm" TEXT,
  "shortRatio" TEXT,
  "morningStarRiskRating" TEXT,
  "fromCurrency" TEXT,
  "legalType" TEXT,
  "longBusinessSummary" TEXT,
  "trailingAnnualDividendRate" TEXT,
  "averageVolume10days" TEXT,
  "exchangeDataDelayedBy" TEXT,
  "symbol" TEXT,
  "exchangeName" TEXT,
  "threeYearAverageReturn" TEXT,
  "fiveYearAverageReturn" TEXT,
  "profitMargins" TEXT,
  "open" TEXT,
  "bid" TEXT,
  "logo_url" TEXT,
  "yield" TEXT,
  "morningStarOverallRating" TEXT,
  "exchange" TEXT,
  "fundFamily" TEXT,
  "tradeable" TEXT,
  "debtToEquity" TEXT,
  "ytdReturn" TEXT,
  "website" TEXT,
  "enterpriseValue" TEXT,
  "netIncomeToCommon" TEXT,
  "annualReportExpenseRatio" TEXT,
  "targetLowPrice" TEXT,
  "trailingAnnualDividendYield" TEXT,
  "state" TEXT,
  "totalDebt" TEXT,
  "nextFiscalYearEnd" TEXT,
  "enterpriseToRevenue" TEXT,
  "forwardPE" TEXT,
  "regularMarketPreviousClose" TEXT,
  "ask" TEXT,
  "quoteSourceName" TEXT,
  "averageDailyVolume3Month" TEXT,
  "enterpriseToEbitda" TEXT,
  "trailingPE" TEXT,
  "marketState" TEXT,
  "numberOfAnalystOpinions" TEXT,
  "bookValue" TEXT
);


select stockCode, longName, marketCap, dividendYield, fiveYearAvgDividendYield, yield,
trailingAnnualDividendYield, currentRatio, pegRatio, quickRatio, payoutRatio, shortRatio,
forwardPE, trailingPE
from yf_stock_data_view
where marketCap !="None" AND marketCap is NOT NULL
order by marketCapInt desc
limit 10;


select stockCode, marketCap, dividendYield, currentPrice
from yf_stock_data_view
where marketCap !="None" AND marketCap !="None"
  AND dividendYield is NOT NULL AND dividendYield !="None"
order by marketCapInt desc
limit 10;

select count(*)
from yf_stock_data_view
where marketCap !="None" AND marketCap !="None"
  AND dividendYield is NOT NULL AND dividendYield !="None"
order by marketCapInt desc;
/*  536  */


select stockCode, symbol, trailingPE, forwardPE, bookValue
from yf_stock_data
limit 5;

select count(*)
from yf_stock_data
where trailingPE IS NULL OR trailingPE = '';
/* 5277 */
select count(*)
from yf_stock_data
where forwardPE IS NULL OR forwardPE = '' OR forwardPE = 'None';
/*  5639  */

select count(distinct stockCode) from yf_stock_data;
/*  2873  */
select date_run, count(distinct stockCode) as count from yf_stock_data group by date_run;
/*
date_run    count
----------  -----
2021-10-06  2210
2021-10-07  2348
2021-10-08  1932
2021-10-09  321
*/
select count(distinct stockCode) from yf_stock_data  where date_run = "2021-10-07";
select count(*) from yf_stock_data  where date_run != "2021-10-07";
delete from yf_stock_data  where date_run != "2021-10-07";


select count(*) from yf_stock_data where bookValue is NULL;
select count(*) from yf_stock_data where bookValue ="None";

select count(*) from yf_stock_data where bookValue !="None" AND bookValue is NOT NULL;

select max(bookValue) as maxbookvalue, min(bookValue) as minbookvalue
from yf_stock_data
where bookValue !="None" AND bookValue is NOT NULL;

select max(bookValue) as maxbookvalue, min(bookValue) as minbookvalue from yf_stock_data;

select max(CAST(marketCap AS INTEGER)) as maxmarketCap, min(CAST(marketCap AS INTEGER)) as minmarketCap
from yf_stock_data
where marketCap !="None" AND marketCap is NOT NULL;
/*
maxmarketCap      minmarketCap
----------------  ------------
2383163804352512  37971

2,383,163,804,352,512  37,971
    T  B   M
*/


CREATE VIEW yf_stock_data_view AS
SELECT *, CAST(marketCap AS INTEGER) AS marketCapInt
FROM   yf_stock_data;

select max(marketCapInt) as max_marketCap, min(marketCapInt) as min_marketCap from yf_stock_data_view;
/*
max_marketCap     min_marketCap
----------------  -------------
2,383,163,804,352,512  0
*/
select count(*) from yf_stock_data_view where  marketCapInt>1000000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>100000000000000 AND marketCapInt<=1000000000000000
select count(*) from yf_stock_data_view where  marketCapInt>100000000000000 AND marketCapInt<=500000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>10000000000000  AND marketCapInt<=100000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>1000000000000   AND marketCapInt<=10000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>100000000000    AND marketCapInt<=1000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>10000000000     AND marketCapInt<=1000000000000;
select count(*) from yf_stock_data_view where  marketCapInt>1000000000      AND marketCapInt<=100000000000;
select count(*) from yf_stock_data_view where  marketCapInt>100000000       AND marketCapInt<=10000000000;
select count(*) from yf_stock_data_view where  marketCapInt>10000000        AND marketCapInt<=1000000000;
select count(*) from yf_stock_data_view where  marketCapInt>1000000        AND marketCapInt<=100000000;
select count(*) from yf_stock_data_view where  marketCapInt>100000        AND marketCapInt<=10000000;
select count(*) from yf_stock_data_view where  marketCapInt>10000        AND marketCapInt<=1000000;
select count(*) from yf_stock_data_view where  marketCapInt<=10000;


2383163804352512
1000000000000000



SELECT DISTINCT bookValue/5*5 AS bin,
       COUNT(*) OVER (PARTITION BY time/5*5) AS count
FROM geolocation;
