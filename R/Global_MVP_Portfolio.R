library(tseries)
library(moments)
library(quadprog)

options(scipen=9999)

#---------------------------------------- Get mean reutrns for Individual assets in Portfolio ---------------------------------------------------

# close any previous plots
graphics.off()

start="2020-04-01"
# load prices and dividend adjusted prices on BHP from Yahoo Finance 
stocks = c("KHC","AAPL","AMZN","FB","TSLA","MSFT","NVDA","AOSL")
results = matrix(0,8,3)
for(i in 1:length(stocks)){
  pStock = get.hist.quote(stocks[i], start=start, quote = "Adjusted",retclass="zoo",compression="m")
  #Calculate simple net returns 
  dStock=diff(pStock)/pStock[-length(pStock)]
  rStock = diff(log(pStock))
  results[i,1] = mean(dStock) #Simple Net Return (Mean)
  results[i,2] = exp(mean(rStock) +var(rStock)/2) - 1 #Simple Net return (Parametric - Log normal) 
  results[i,3] = exp(2*mean(rStock)+var(rStock))*(exp(var(rStock))-1)
  
}
colnames(results)=c("Simple Net Return (Non-Parametric)", "Simple net return (Parametric-lognormal distribution)","Variance of return (Parametric)")

#For Simple Annual Net return for each stock
mean_return=results[,1] #Averaged Monthly
mean_annual=((1+mean_return)^12) - 1 #Averaged Annually - CHeck Annualized rate or return formula

#---------------------------------------- Obtain weights for Global MVP ---------------------------------------------------

# -- Using Package --- 

# Get Covariance matrix 
Vmat = matrix(0,8,8)
for(i in 1:length(stocks)){
  pMain = get.hist.quote(stocks[i], start=start, quote = "Adjusted",retclass="zoo",compression="m")
  rMain = diff(log(pMain))
  for(j in 1:length(stocks)){
    pSub = get.hist.quote(stocks[j], start=start, quote = "Adjusted",retclass="zoo",compression="m")
    rSub = diff(log(pSub))
    Vmat[i,j]= cov(rMain,rSub)
  }
}

p=8
N=1000

# Short selling
minSS = solve.QP(Dmat=2*Vmat,dvec=rep(0,p),Amat=cbind(rep(1,p)),bvec=c(1),meq=1)
sqrt(minSS$value) #sd
minSS$solution #weights

# -- Cross Validating using equations --- 

# Efficient Frontier
iota=c(1,1,1,1,1,1,1,1)
z=mean_annual

A=drop(t(iota)%*%solve(Vmat,z))
B=drop(t(z)%*%solve(Vmat,z))
C=drop(t(iota)%*%solve(Vmat,iota))
D=B*C-A^2
h=(1/D)*( C*solve(Vmat,z) - A*solve(Vmat,iota) )
g=(1/D)*( B*solve(Vmat,iota) - A*solve(Vmat,z) )

N=1000
mup=seq(min(results)-2,max(results)+2,length=N) # close to the range of max and min individual return.
weights=matrix(0,N,8)
sdP = mup
for(i in 1:N){
  weights[i,]=g+h*mup[i]
  sdP[i]=sqrt(weights[i,]%*%Vmat%*%weights[i,])
}
weight_MVP = weights[which.min(sdP),]
return_MVP = weight_MVP%*%results

# -- Find returns for optimal weights (specify Initial Investment) --- 

invest<-3000
invest*weight_MVP


min_std = min(sdP)
count_MVP = 0
for (i in 1:length(sdP)){
  if (mup[i]<return_MVP){
    count_MVP = count_MVP + 1
  }
}

mup1 <- mup[count_MVP+1:length(mup)]
sdP1<- sdP[count_MVP+1:length(sdP)]
plot(sdP1, mup1, xlab = 'Standard deviation', ylab = 'Expected return',type = 'l', main = 'Efficient Frontier (short selling allowed)')


# No short selling
minNSS = solve.QP(Dmat=2*Vmat,dvec=rep(0,p),Amat=cbind(rep(1,p),diag(rep(1,p))),bvec=c(1,rep(0,p)),meq=1)
sqrt(minNSS$value)
minNSS$solution

invest<-1850
invest*minNSS$solution

barplot(invest*minNSS$solution,x)
barplot(invest*weight_MVP)
barplot(invest.tab, main="Investment - NSS vs SS ",
        xlab="Stock",
        legend = stocks, beside=TRUE)