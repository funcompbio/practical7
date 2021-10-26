## read COVID19 data
dat <- read.csv("catalunya_setmanal.csv", sep=";", stringsAsFactors=TRUE)

## subset the data from the general population
datg <- dat[dat$RESIDENCIA == "No", ]

## fetch starting date
startingdate <- as.Date(datg$DATA_INI)

## extract the month from the starting date
m <- months(startingdate, abbreviate=TRUE)

## build a factor for the months of the year in the data
mf <- factor(m, levels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
mf <- droplevels(mf)

## plot R0 and risk of outbreak as function of the month
plot(datg$R0_CONFIRMAT_M ~ mf, xlab="Month", ylab="R0")
plot(datg$IEPG_CONFIRMAT ~ mf, xlab="Month", ylab="Risk of outbreak")

## group risk of outbreak by month
iepgbymonth <- split(datg$IEPG_CONFIRMAT, mf)

## plot distributions of risk of outbreak for April and June
par(mfrow=c(1, 2))
hist(iepgbymonth$Apr, xlab="Risk of outbreak", main="April")
hist(iepgbymonth$Jun, xlab="Risk of outbreak", main="June")

## group risk of outbreak by month using a list
iepgbymonth <- split(datg$IEPG_CONFIRMAT, mf)

## calculate mean of the risk of outbreak by month
sapply(iepgbymonth, mean, na.rm=TRUE)

## plot exitus by month
plot(datg$EXITUS ~ mf)

## calculate mean of exitus per month
exituspermonth <- split(datg$EXITUS, mf)
meanexituspermonth <- sapply(exituspermonth, mean, na.rm=TRUE)
points(1:nlevels(mf), meanexituspermonth, pch=18)
