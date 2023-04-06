//
//  Enemy.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

protocol Enemy {
    func bossEncounter(chance: Int)
    func basicAttack(target: Hero)
}

class Mob: Enemy {
    var enemyName: String
    var enemyClass: String
    var enemyBaseHealth: Int
    var enemyBaseAttack: Int
    var itemDrops: [Equipment]
    var potionDrop: Int
    var elixirDrop: Int
    var aegisDrop: Int
    
    init(enemyName: String, enemyClass: String, enemyBaseHealth: Int, enemyBaseAttack: Int, itemDrops: [Equipment], potionDrop: Int, elixirDrop: Int, aegisDrop: Int) {
        self.enemyName = enemyName
        self.enemyClass = enemyClass
        self.enemyBaseHealth = enemyBaseHealth
        self.enemyBaseAttack = enemyBaseAttack
        self.itemDrops = itemDrops
        self.potionDrop = potionDrop
        self.elixirDrop = elixirDrop
        self.aegisDrop = aegisDrop
    }
    
    func bossEncounter(chance: Int) {
        if chance <= 1 { // chance = 1 / 10
            enemyName.append(" [Boss]")
            enemyClass = "Boss"
            enemyBaseAttack *= 2
            enemyBaseHealth *= 3
        }
    }
    
    func basicAttack(target: Hero) {
        mainCharacter.baseHealth -= enemyBaseAttack
        print("You have taken \(enemyBaseAttack) damage.")
    }
}
