import UIKit

var str = "Hello, playground"


func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 81...100:
        print("Kanye and Kanye")
    case 41...80:
        print("Coke and Mentos")
    case ...40:
        print("Alone Bro")
    default:
        print("No limits")
    }
    
}


var playerName : String? = nil

print(playerName)

playerName = "Steph Curry"

var unwrappedPlayerName = playerName!

print(unwrappedPlayerName)
