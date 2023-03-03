//
//  main.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

func nameselection() {
    var username: String = ""
    
    repeat {
        print("May I know your name? ")
            username = readLine()!
            
            print("Nice to meet you, " + username + "!")
    } while (username.isEmpty)
}

func mainprocess() {
    var starting_input = "placeholder"

    print("Welcome to tbe world of magic! \n You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. \n Your adventure sites will take you to forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies")

    repeat {
        print("Press [return] to continue: ")
        starting_input = readLine()!
        
        print(nameselection())
        
    } while (!starting_input.isEmpty)
}

print(mainprocess())
