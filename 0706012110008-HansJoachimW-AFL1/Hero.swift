//
//  Hero.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

struct Hero {
    var name: String
    
    var baseHealth: Int
    var bonusHealth: Int
    var currentHealth: Int
    var maxHealth: Int
    
    var baseMana: Int
    var bonusMana: Int
    var currentMana: Int
    var maxMana: Int
    
    var baseAttack: Int
    var bonusAttack: Int
    
    var potion: Potion
    var elixir: Elixir
    var aegis: Aegis
    
    init(name: String, baseHealth: Int, bonusHealth: Int, maxHealth: Int, baseMana: Int, bonusMana: Int, maxMana: Int, baseAttack: Int, bonusAttack: Int, potion: Potion, elixir: Elixir, aegis: Aegis) {
        self.name = name
        
        self.baseHealth = baseHealth
        self.bonusHealth = bonusHealth
        self.currentHealth = baseHealth + bonusHealth
        self.maxHealth = maxHealth
        
        self.baseMana = baseMana
        self.bonusMana = bonusMana
        self.currentMana = baseMana + bonusMana
        self.maxMana = maxMana
        
        self.baseAttack = baseAttack
        self.bonusAttack = bonusAttack
        
        self.potion = potion
        self.elixir = elixir
        self.aegis = aegis
    }
    
    mutating func getCharacterInfo(){
        print("""
              Player name : \(name)
              Health: \(baseHealth)/\(maxHealth)
              Mana: \(baseMana)/\(maxMana)
              Magic:
                    - Physical Attack. No mana required. Deal 5pt of damage.
                    - Meteor. Use 15pt of MP. Deal \(baseAttack + bonusAttack)pt of damage.
                    - Shield. Use 10pt of MP. Negate damage taken from enemy's attack in 1 turn.
              Backpack:
                    - Potion x\(tango.potionAmount). Heal 20pt of your MP.
                    - Elixir x\(clarity.elixirAmount). Add 10pt of your MP.
                    - Aegis x\(aegis.aegisAmount). Permanently add 20pt of your HP and MP.
              """)
    }

    mutating func decreaseHP(by point: Int) {
        currentHealth -= point
    }
}
