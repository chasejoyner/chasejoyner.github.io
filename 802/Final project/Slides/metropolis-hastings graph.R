x = seq(-2,6,by=0.001)
dx = dnorm(x, 2, 1)
plot(x, dx, type = "l", lwd = 2, main = "Metropolis-Hastings")

x2 = seq(2.75,4.25,by=0.001)
dx2 = dnorm(x2, 3.5, 1/5) / 50
lines(x2, dx2, type = "l", lwd = 2, col = "blue")

legend('topright', inset = 0.01, c("posterior", "proposal"), lty = c(1,1), lwd = c(2,2),col = c('black', 'blue'))
