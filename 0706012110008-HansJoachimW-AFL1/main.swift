//
//  main.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var anarchy = AttackEquipment("Anarchy", tier: 4, bonus: 40)

var otherside = AttackEquipment("The Other Side", tier: 5, bonus: 50)

var loot = [anarchy, otherside]

var mainCharacter = Hero(name: "", baseHealth: 100, bonusHealth: 0, maxHealth: 100, baseMana: 50, bonusMana: 0, maxMana: 50, baseAttack: 20, bonusAttack: 0, potionAmount: 5, elixirAmount: 5, aegisAmount: 0, stash: [])

var troll = Mob(enemyName: "Trolls of the Forest", enemyClass: "", enemyBaseHealth: 500, enemyBaseAttack: 15, itemDrops: loot, potionDrop: 2, elixirDrop: 4, aegisDrop: 0)

var golem = Mob(enemyName: "Guardian Golem", enemyClass: "", enemyBaseHealth: 1000, enemyBaseAttack: 40, itemDrops: loot, potionDrop: 6, elixirDrop: 2, aegisDrop: 1)

func openingScreen() {
    repeat {
        print("May I know your name?", terminator: " ")
        if let usernamePlaceholder = readLine() {
            mainCharacter.name = usernamePlaceholder
        }
    } while (mainCharacter.name.isEmpty || mainCharacter.name.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil)
    print("\nNice to meet you, \(mainCharacter.name)!")
    journeyScreen()
}

func journeyScreen() {
    let option = ""
    
    repeat {
        print("From here, you can...?\n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potion")
        print("[E]xtract mana from elixirs")
        print("[R]einvigorate your flesh by consuming an aegis")
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
        case "e":
            extractManaScreen()
            break;
        case "r":
            reinvigorateScreen()
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
    
    print("""
          Player name : \(mainCharacter.name)
          Health: \(mainCharacter.currentHealth)/\(mainCharacter.maxHealth)
          Mana: \(mainCharacter.currentMana)/\(mainCharacter.maxMana)
          Magic:
                - Physical Attack. No mana required. Deal \(mainCharacter.baseAttack)pt of damage.
                - Meteor. Use 15pt of MP. Deal \(mainCharacter.baseAttack + mainCharacter.bonusAttack)pt of damage.
                - Shield. Use 10pt of MP. Negate damage taken from enemy's attack in 1 turn.
          Backpack:
                - Potion x\(mainCharacter.potionAmount). Heal 20pt of your MP.
                - Elixir x\(mainCharacter.elixirAmount). Add 10pt of your MP.
                - Aegis x\(mainCharacter.aegisAmount). Permanently add 20pt of your HP and MP.
          """)
    
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
        print("Your HP is \(mainCharacter.currentHealth)/\(mainCharacter.maxHealth).")
            print("You have \(mainCharacter.potionAmount) Potions")
            print("Are you sure you want to use 1 potion to heal your wound? [Y/N]", terminator: " ")
            let option = readLine()!
            if option.lowercased() == "y" {
                mainCharacter.potionAmount -= 1
                mainCharacter.currentHealth += 20
                
                if mainCharacter.currentHealth > mainCharacter.maxHealth {
                    mainCharacter.currentHealth = mainCharacter.maxHealth
                }
            } else if option.lowercased() == "n" {
                break;
            }
    } while (mainCharacter.potionAmount != 0)
    
    if mainCharacter.potionAmount == 0 {
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

func extractManaScreen() {
    var input = "placeholder"
    
    repeat {
        print("Your MP is \(mainCharacter.currentMana)/\(mainCharacter.maxMana).")
        print("You have \(mainCharacter.elixirAmount) Potions")
        print("Are you sure you want to use 1 elixir to regain mana? [Y/N]", terminator: " ")
        let option = readLine()!
        if option.lowercased() == "y" {
            mainCharacter.elixirAmount -= 1
            mainCharacter.currentMana += 10
            
            if mainCharacter.currentMana > mainCharacter.maxMana {
                mainCharacter.currentMana = mainCharacter.maxMana
            }
        } else if option.lowercased() == "n" {
            break;
        }
    } while (mainCharacter.elixirAmount != 0)
    
    if mainCharacter.elixirAmount == 0 {
        print("You don't have any elixirs left. Be careful of your next journey.")
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

func reinvigorateScreen() {
    var input = "placeholder"
    
    repeat {
        print("Your max HP is \(mainCharacter.maxHealth).")
        print("Your max MP is \(mainCharacter.maxMana).")
        print("You have \(mainCharacter.aegisAmount) aegises")
        print("Are you sure you want to use 1 aegis to permanently boost stats? [Y/N]", terminator: " ")
        let option = readLine()!
        if option.lowercased() == "y" {
            if mainCharacter.aegisAmount == 0 {
                mainCharacter.aegisAmount -= 1
                mainCharacter.maxHealth += 20
                mainCharacter.maxMana += 20
            }
        } else if option.lowercased() == "n" {
            break;
        }
    } while (mainCharacter.elixirAmount != 0)
    
    if mainCharacter.elixirAmount == 0 {
        print("You don't have any aegises left. Be careful of your next journey.")
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
    let chance = Int.random(in: 1...10)
    troll.bossEncounter(chance: chance)
    
    var input = "placeholder"
    var actionInput: String
    
    print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around and find a Troll emerging from the shadows.")
    
    repeat {
        if troll.enemyBaseHealth < 0 {
            troll.enemyBaseHealth = 0
        } else {
            print("Name: \(troll.enemyName)")
            print("Health: \(troll.enemyBaseHealth)")
            print("Choose your action:")
            print("[1] Physical Attack. No mana required. Deal \(mainCharacter.baseAttack)pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deal \(mainCharacter.baseAttack + mainCharacter.bonusAttack)pt of damage.")
            print("[3] Shield. Use 10pt of MP. Negate damage taken from enemy's attack in 1 turn.\n")
            
            print("[4] Use Potion to heal wound.")
            print("[5] Use Elixir to recover mana.")
            print("[6] Use Aegis to permanently boost stats.")
            print("[7] Scan enemy's vital.")
            print("[8] Flee from battle.")
            
            print("\nYour Choice?")
            actionInput = readLine()!
            
            switch actionInput {
            case "1":
                troll.enemyBaseHealth -= 5
                print("You have dealt 5 damage to the \(troll.enemyName).")
                break;
            case "2":
                if mainCharacter.currentMana < 15 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    troll.enemyBaseHealth -= (mainCharacter.baseAttack + mainCharacter.bonusAttack)
                    mainCharacter.decreaseHP(by: troll.enemyBaseAttack)
                    print("You have dealt \(mainCharacter.baseAttack + mainCharacter.bonusAttack) damage to the \(troll.enemyBaseHealth). You've also taken \(troll.enemyBaseAttack) damage due to its rigid exterior. You have spent 15 mana.")
                }
                break;
            case "3":
                if mainCharacter.currentMana < 10 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    print("You have successfully blocked the \(troll.enemyName)'s attack.You have spent 10 mana.")
                }
                break;
            case "4":
                if mainCharacter.potionAmount == 0 {
                    print("You don't have any potions left.")
                } else {
                    print("Your HP is \(mainCharacter.currentHealth).")
                    print("You have \(mainCharacter.potionAmount) potions.")
                    print("You use a potion to heal your wound.")
                    mainCharacter.potionAmount -= 1
                    mainCharacter.currentHealth += 20
                    
                    if mainCharacter.currentHealth > mainCharacter.maxHealth {
                        mainCharacter.currentHealth = mainCharacter.maxHealth
                    }
                }
                break;
            case "5":
                if mainCharacter.elixirAmount == 0 {
                    print("You don't have any elixirs left.")
                } else {
                    print("Your MP is \(mainCharacter.currentMana).")
                    print("You have \(mainCharacter.elixirAmount) elixirs.")
                    print("You use a potion to recover MP.")
                    mainCharacter.elixirAmount -= 1
                    mainCharacter.currentMana += 10
                    
                    if mainCharacter.currentMana > mainCharacter.maxMana {
                        mainCharacter.currentMana = mainCharacter.maxMana
                    }
                }
                break;
            case "6":
                if mainCharacter.aegisAmount == 0 {
                    print("You don't have any aegises.")
                } else {
                    print("Your max HP is \(mainCharacter.maxHealth).")
                    print("Your max MP is \(mainCharacter.maxMana).")
                    print("You have \(mainCharacter.aegisAmount) aegises.")
                    print("You use an aegis to increase your max HP and MP.")
                    mainCharacter.aegisAmount -= 1
                    mainCharacter.maxHealth += 20
                    mainCharacter.maxMana += 20
                }
                    break;
                case "7":
                    print("A paracausal force stops you from analyzing your opponent. The troll grows weary of your presence.")
                    break;
                case "8":
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
        } while (troll.enemyBaseHealth != 0)
    print("The \(troll.enemyName) has been defeated. You have gained +\(troll.potionDrop) potions, +\(troll.elixirDrop) elixirs and \(troll.aegisDrop) aegises.")
    mainCharacter.potionAmount += troll.potionDrop
    mainCharacter.elixirAmount += troll.elixirDrop
    mainCharacter.aegisAmount += troll.aegisDrop
    
    let equipmentDropChance = Int.random(in: 1...100)
    
    let equipmentSelectionChance = Int.random(in: 0...1)
    
    if equipmentSelectionChance == 0 {
        anarchy.dropChance(chance: equipmentDropChance)
    } else if equipmentSelectionChance == 1 {
        otherside.dropChance(chance: equipmentDropChance)
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

func mountainOfGolemsScreen() {
    let chance = Int.random(in: 1...10)
    golem.bossEncounter(chance: chance)
    
    var input = "placeholder"
    var actionInput = "placeholder"
    
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
    
    repeat {
        if golem.enemyBaseHealth < 0 {
            golem.enemyBaseHealth = 0
        } else {
            print("Name: \(golem.enemyName)")
            print("Health: \(golem.enemyBaseHealth)")
            
            print("Choose your action:")
            print("[1] Physical Attack. No mana required. Deal 5pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deal \(mainCharacter.baseAttack + mainCharacter.bonusAttack)pt of damage.")
            print("[3] Shield. Use 10pt of MP. Negate damage taken from enemy's attack in 1 turn.\n")
            
            print("[4] Use Potion to heal wound.")
            print("[5] Use Elixir to recover mana.")
            print("[6] Use Aegis to permanently boost stats.")
            print("[7] Scan enemy's vital.")
            print("[8] Flee from battle.")

            print("\nYour Choice?")
            actionInput = readLine()!
            
            switch actionInput {
            case "1":
                golem.enemyBaseHealth -= 5
                mainCharacter.decreaseHP(by: golem.enemyBaseAttack)
                print("You have dealt 5 damage to the \(golem.enemyBaseHealth). You've also taken \(golem.enemyBaseAttack) damage due to its rigid exterior.")
                break;
            case "2":
                if mainCharacter.currentMana < 15 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    golem.enemyBaseHealth -= (mainCharacter.baseAttack + mainCharacter.bonusAttack)
                    mainCharacter.currentMana -= 15
                    print("You have dealt \(mainCharacter.baseAttack + mainCharacter.bonusAttack) damage to the \(golem.enemyName). You have spent 15 mana.")
                }
                break;
            case "3":
                if mainCharacter.currentMana < 10 {
                    print("You don't have a sufficient amount of mana.")
                } else {
                    mainCharacter.currentMana -= 10
                    print("You have successfully blocked the \(golem.enemyName)'s attack. You have spent 10 mana.")
                }
                break;
            case "4":
                if mainCharacter.potionAmount == 0 {
                    print("You don't have any potions left.")
                } else {
                    print("Your HP is \(mainCharacter.currentHealth).")
                    print("You have \(mainCharacter.potionAmount) potions.")
                    print("You use a potion to heal your wound.")
                    mainCharacter.potionAmount -= 1
                    mainCharacter.currentHealth += 20
                    
                    if mainCharacter.currentHealth > mainCharacter.maxHealth {
                        mainCharacter.currentHealth = mainCharacter.maxHealth
                    }
                }
                break;
            case "5":
                if mainCharacter.elixirAmount == 0 {
                    print("You don't have any elixirs left.")
                } else {
                    print("Your MP is \(mainCharacter.currentMana).")
                    print("You have \(mainCharacter.elixirAmount) elixirs.")
                    print("You use a potion to recover MP.")
                    mainCharacter.elixirAmount -= 1
                    mainCharacter.currentMana += 10
                    
                    if mainCharacter.currentMana > mainCharacter.maxMana {
                        mainCharacter.currentMana = mainCharacter.maxMana
                    }
                }
                break;
            case "6":
                if mainCharacter.aegisAmount == 0 {
                    print("You don't have any aegises.")
                } else {
                    print("Your max HP is \(mainCharacter.maxHealth).")
                    print("Your max MP is \(mainCharacter.maxMana).")
                    print("You have \(mainCharacter.aegisAmount) aegises.")
                    print("You use an aegis to increase your max HP and MP.")
                    mainCharacter.aegisAmount -= 1
                    mainCharacter.maxHealth += 20
                    mainCharacter.maxMana += 20
                }
                break;
            case "7":
                print("A paracausal force stops you from analyzing your opponent. The golem grows weary from your presence.")
                break;
            case "8":
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
    } while (golem.enemyBaseHealth != 0)
    print("The \(golem.enemyName) has been defeated. You have gained +\(golem.potionDrop) potions, +\(golem.elixirDrop) elixirs and +\(golem.aegisDrop) aegises.")
    mainCharacter.potionAmount += golem.potionDrop
    mainCharacter.elixirAmount += golem.elixirDrop
    mainCharacter.aegisAmount += golem.aegisDrop
    
    let equipmentDropChance = Int.random(in: 1...100)
    
    let equipmentSelectionChance = Int.random(in: 0...1)
    
    if equipmentSelectionChance == 0 {
        anarchy.dropChance(chance: equipmentDropChance)
    } else if equipmentSelectionChance == 1 {
        otherside.dropChance(chance: equipmentDropChance)
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
