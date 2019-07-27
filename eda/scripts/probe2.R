#submitted the following constant solutions and got results

subs <- c(0.2,0.25,0.3,0.35,0.4,0.275,0.2875,0)
public_score <- c( 1.22032,1.21791, 1.21754,1.21922,1.22295,1.21747,1.21744,1.25011)

plot(subs,public_score)

subs2 <- subs[c(3,6,7)]
public_score2 <- public_score[c(3,6,7)]

plot(subs2,public_score2)

