//
//  main.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

private var username: String = ""
private var HP: Int = 100
private var MP: Int = 50
private var potionAmount: Int = 10
private var elixirAmount: Int = 5
private var enemyList: [String : String] = ["Troll": "As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around and find a Troll emerging from the shadows.", "Golem": "As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows."]

func openingScreen() {
    repeat {
        print("May I know your name?", terminator: " ")
        if let usernamePlaceholder = readLine() {
            username = usernamePlaceholder
        }
    } while (username.isEmpty || username.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil)
    print("\nNice to meet you, " + username + "!")
    journeyScreen()
}

func journeyScreen() {
    let option = ""
    
    repeat {
        print("From here, you can...?\n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potion")
        print("\n...or choose where you want to go")
        print("\n[F]orest of Trolls")
        print("[M]ountain of Golems")
        print("[Q]uit game")
        print("\nYour choice?", terminator: " ")
        
        let option = readLine()!
        switch option.lowercased() {
        case "c":
            playerStatsScreen()
            break;
        case "h":
            healWoundScreen()
            break;
        case "f":
            forestOfTrollsScreen()
            break;
        case "m":
            mountainOfGolemsScreen()
            break;
        case "q":
            print("Coward.")
            break;
        default:
            break;
        }
    } while (option.lowercased().contains("q"))
}

func playerStatsScreen() {
    var input = "placeholder"
    
    print("Player Name: \(username)")
    print("HP: \(HP)")
    print("MP: \(MP)")
    print("\nMagic:")
    print("- Physical Attack. No mana required. Deal 5pt of damage.")
    print("- Meteor. Use 15pt of MP. Deal 50pt of damage.")
    print("- Shield. Use 10pt of MP. BLock enemy's attack in 1 turn.")
    print("\nItems:")
    print("- Potion x\(potionAmount). Heal 20pt of your MP.")
    print("- Elixir x\(elixirAmount). Add 10pt of your MP.")
    
    while (input.isEmpty == false) {
        print("Press [return] to continue:", terminator: " ")
        input = readLine()!
        if (input.isEmpty == false) {
            print("Enter, 4head.")
        } else {
            journeyScreen()
        }
    }
}

func healWoundScreen() {
    var input = "placeholder"
    
    repeat {
        print("Your HP is \(HP).")
            print("You have \(potionAmount) Potions")
            print("Are you sure you want to use 1 potion to heal your wound? [Y/N]", terminator: " ")
            let option = readLine()!
            if option.lowercased() == "y" {
                potionAmount -= 1
                HP += 20
                
                if HP > 100 {
                    HP = 100
                }
            } else if option.lowercased() == "n" {
                break;
            }
    } while (potionAmount != 0)
    
    if potionAmount == 0 {
        print("You don't have any potions left. Be careful of your next journey.")
    }
    while (input.isEmpty == false) {
        print("Press [return] to continue:", terminator: " ")
        input = readLine()!
        if (input.isEmpty == false) {
            print("Enter, 4head.")
        } else {
            journeyScreen()
        }
    }
}

func forestOfTrollsScreen() {
    let monsterName: String = "Troll"
    var monsterHP: Int = 200
    let monsterAmount: Int = 1
    
    var input = "placeholder"
    var actionInput: String
    
    print(enemyList["Troll"]!)
    
    repeat {
        if monsterHP < 0 {
            monsterHP = 0
        } else {
            print("Name: \(monsterName) x\(monsterAmount)")
            print("Health: \(monsterHP)")
            
            print("Choose you action:")
            print("[1] Physical Attack. No mana required. Deal 5pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deal 50pt of damage.")
            print("[3] Shield. Use 10pt of MP. BLock enemy's attack in 1 turn.\n")
            
            print("[4] Use Potion to heal wound.")
            print("[5] Use Elixir to recover mana.")
            print("[6] Scan enemy's vital.")
            print("[7] Flee from battle.")
            
            print("\nYour Choice?")
            actionInput = readLine()!
            
            switch actionInput {
            case "1":
                monsterHP -= 5
                print("You have dealt 5 damage to the \(monsterName).")
                break;
            case "2":
                if MP < 15 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    monsterHP -= 50
                    MP -= 15
                    print("You have dealt 50 damage to the \(monsterName). You have spent 15 mana.")
                }
                break;
            case "3":
                if MP < 10 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    print("You have successfully blocked the \(monsterName)'s attack. You've taken 15 damage, instead of 30 damage. You have spent 10 mana.")
                }
                break;
            case "4":
                if potionAmount == 0 {
                    print("You don't have any potions left.")
                } else {
                    print("Your HP is \(HP).")
                    print("You have \(potionAmount) potions.")
                    print("You use a potion to heal your wound.")
                    potionAmount -= 1
                    HP += 20
                    
                    if HP > 100 {
                        HP = 100
                    }
                }
                break;
            case "5":
                if elixirAmount == 0 {
                    print("You don't have any elixirs left.")
                } else {
                    print("Your MP is \(MP).")
                    print("You have \(elixirAmount) elixirs.")
                    print("You use a potion to recover MP.")
                    elixirAmount -= 1
                    MP += 10
                    
                    if HP > 50 {
                        HP = 50
                    }
                }
                break;
            case "6":
                print("A paracausal force stops you from analyzing your opponent. Maybe if you get good, you can use this skill.")
                break;
            case "7":
                print("You feel that if you don't escape soon, you won't be able to continue the fight.")
                print("You look aroud frantically, searching for a way out. You sprint towards the exit, your heart pounding in you chest.\n")
                print("You're safe, for now.")
                while (input.isEmpty == false) {
                    print("Press [return] to continue:", terminator: " ")
                    input = readLine()!
                    if (input.isEmpty == false) {
                        print("Enter, 4head.")
                    } else {
                        journeyScreen()
                    }
                }
                break;
            default:
                break;
            }
        }
    } while (monsterHP != 0)
    print("The \(monsterName) has been defeated. You have gained +2 potions and +4 elixirs.")
    potionAmount += 2
    elixirAmount += 4
    
    while (input.isEmpty == false) {
        print("Press [return] to continue:", terminator: " ")
        input = readLine()!
        if (input.isEmpty == false) {
            print("Enter, 4head.")
        } else {
            journeyScreen()
        }
    }
}

func mountainOfGolemsScreen() {
    let monsterName: String = "Golem"
    var monsterHP: Int = 300
    let monsterAmount: Int = 1
    
    var input = "placeholder"
    var actionInput = "placeholder"
    
    print(enemyList["Golem"]!)
    
    repeat {
        if monsterHP < 0 {
            monsterHP = 0
        } else {
            print("Name: \(monsterName) x\(monsterAmount)")
            print("Health: \(monsterHP)")
            
            print("Choose you action:")
            print("[1] Physical Attack. No mana required. Deal 5pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deal 50pt of damage.")
            print("[3] Shield. Use 10pt of MP. BLock enemy's attack in 1 turn.\n")
            
            print("[4] Use Potion to heal wound.")
            print("[5] Use Elixir to recover MP")
            print("[6] Scan enemy's vital.")
            print("[7] Flee from battle.")
            
            print("\nYour Choice?")
            actionInput = readLine()!
            
            switch actionInput {
            case "1":
                monsterHP -= 5
                HP -= 5
                print("You have dealt 5 damage to the \(monsterName). You've also taken 5 damage due to its rigid exterior.")
                break;
            case "2":
                if MP < 15 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    monsterHP -= 50
                    MP -= 15
                    print("You have dealt 50 damage to the \(monsterName). You have spent 15 mana.")
                }
                break;
            case "3":
                if MP < 10 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    print("You have successfully blocked the \(monsterName)'s attack. You've taken 30 damage, instead of 60 damage. You have spent 10 mana.")
                }
                break;
            case "4":
                if potionAmount == 0 {
                    print("You don't have any potions left.")
                } else {
                    print("Your HP is \(HP).")
                    print("You have \(potionAmount) potions.")
                    print("You use a potion to heal your wound.")
                    potionAmount -= 1
                    HP += 20
                    
                    if HP > 100 {
                        HP = 100
                    }
                }
                break;
            case "5":
                if elixirAmount == 0 {
                    print("You don't have any elixirs left.")
                } else {
                    print("Your MP is \(MP).")
                    print("You have \(elixirAmount) elixirs.")
                    print("You use a potion to recover MP.")
                    elixirAmount -= 1
                    MP += 10
                    
                    if HP > 50 {
                        HP = 50
                    }
                }
                break;
            case "6":
                print("A paracausal force stops you from analyzing your opponent. Maybe if you get good, you can use this skill.")
                break;
            case "7":
                print("You feel that if you don't escape soon, you won't be able to continue the fight.")
                print("You look aroud frantically, searching for a way out. You sprint towards the exit, your heart pounding in you chest.\n")
                print("You're safe, for now.")
                while (input.isEmpty == false) {
                    print("Press [return] to continue:", terminator: " ")
                    input = readLine()!
                    if (input.isEmpty == false) {
                        print("Enter, 4head.")
                    } else {
                        journeyScreen()
                    }
                }
                break;
            default:
                break;
            }
        }
    } while (monsterHP != 0)
    print("The \(monsterName) has been defeated. You have gained +3 potions and +2 elixirs.")
    potionAmount += 3
    elixirAmount += 2
    
    while (input.isEmpty == false) {
        print("Press [return] to continue:", terminator: " ")
        input = readLine()!
        if (input.isEmpty == false) {
            print("Enter, 4head.")
        } else {
            journeyScreen()
        }
    }
}

func main() {
    var input = "placeholder"

    print("Welcome to the world of magic! \nYou have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. \nYour adventure sites will take you to forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies")
    
    while (input.isEmpty == false) {
        print("Press [return] to continue:", terminator: " ")
        input = readLine()!
        if (input.isEmpty == false) {
            print("Enter, 4head.")
        } else {
            openingScreen()
        }
    }
}

print(main())
