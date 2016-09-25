import UIKit
import GameplayKit

var jackpotGenorator = GKRandomDistribution.init(lowestValue: 1000, highestValue: 10000)
var numberGenorator = GKRandomDistribution.init(lowestValue: 0, highestValue: 99)

var jackpot = jackpotGenorator.nextInt()
var userSuperBall = numberGenorator.nextInt()
var superBall = numberGenorator.nextInt()

var usersNumbers = Set <Int>()
var numbers = Set <Int>()
for index in 1...5{
    usersNumbers.insert(numberGenorator.nextInt())
}
for index in 1...5{
    numbers.insert(numberGenorator.nextInt())
}

print(usersNumbers)
print(numbers)
var numberOfCorrectGuess = 0.0
var superBallIsSame = false

for index in usersNumbers{
    if(numbers.index(of: index) == usersNumbers.index(of: index)){
        numberOfCorrectGuess += 1.0
    }
}
if(superBall == userSuperBall){
    superBallIsSame = true
}
func play (numberOfCorrectGuess: Double, superBallIsSame: Bool, jackpot: Double)-> Double{
    var usersWinings = 0.0
    if(superBallIsSame == true && numberOfCorrectGuess == 0){
        usersWinings = jackpot * 0.1
    }else if(numberOfCorrectGuess > 0 && superBallIsSame == true){
        usersWinings = (numberOfCorrectGuess * 0.2) * jackpot
    }else if(superBallIsSame == false && numberOfCorrectGuess > 0){
        usersWinings = (numberOfCorrectGuess * 0.1) * jackpot
    }else{
        usersWinings = 0
    }
    
    return usersWinings
}

print("You have won: $\(play(numberOfCorrectGuess: numberOfCorrectGuess, superBallIsSame: superBallIsSame, jackpot: Double(jackpot)))")


    
