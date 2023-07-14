b = seq(-2, 3.5, by = 0.001)

n = 100
a = 1
R = 1
beta.true = 2

x = rnorm(n, 0, 1)
probs = exp(x * beta.true) / (1 + exp(x * beta.true))
y = rbinom(n, 1, probs)

eval = function(u){
	val = exp(-(1/2) * (u - a)^2 + sum(y*x*u - log(1 + exp(x*u))))
	return(val)
}

yb = rep(0, length(b))
for(i in 1:length(b)){
	yb[i] = (1e29)*eval(b[i])
}
plot(b,yb/(11e8),main="BIWLS -- true = 2, initial guess = -1",type="l",lwd=3,ylab="density",xlab="x")


########## Random walk ############
br = seq(-1.5,-0.5,by=0.0001)
dbr = dnorm(br,-1,0.075)
points(br,dbr,col="blue",type="l",lwd=3)


########## Gamerman #############
c = -1
b2 = seq(1.9,2.6,by=0.001)
pis = exp(x * c) / (1 + exp(x * c))
newY = x * c + (y - pis) * (pis*(1-pis))^(-1)
W = diag(pis * (1 - pis))
C = solve(solve(R) + x %*% W %*% x)
m = C %*% (solve(R) %*% a + x %*% W %*% newY)
db = dnorm(b2, m, C)
#points(b,db,col="red")
#points(b,db,col="red")
points(b2,db,col="red",type="l",lwd=3)
legend('topleft', inset = 0.01,c("True","Proposal","Random Walk"), col=c("black","red","blue"),lty=1,lwd=3)
