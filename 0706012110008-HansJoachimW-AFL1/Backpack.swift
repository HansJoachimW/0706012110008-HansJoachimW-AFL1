//
//  Backpack.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation

class Consumable {
    var itemType: String
    
    init(itemType: String) {
        self.itemType = itemType
    }
}

class Potion: Consumable {
    var potionAmount: Int
    
    init(itemType: String, potionAmount: Int) {
        self.potionAmount = potionAmount
        super.init(itemType: itemType)
    }

    func healWound(target: Hero) {
        tango.potionAmount -= 1
        mainCharacter.currentHealth += 20
    }
}

class Elixir: Consumable {
    var elixirAmount: Int
    
    init(itemType: String, elixirAmount: Int) {
        self.elixirAmount = elixirAmount
        super.init(itemType: itemType)
    }
    
    func extractMana(target: Hero) {
        clarity.elixirAmount -= 1
        mainCharacter.currentMana += 10
    }
}

class Aegis: Consumable {
    var aegisAmount: Int
    
    init(itemType: String, aegisAmount: Int) {
        self.aegisAmount = aegisAmount
        super.init(itemType: itemType)
    }
    
    func reinvigorate(target: Hero) {
        aegis.aegisAmount -= 1
        mainCharacter.maxHealth += 20
        mainCharacter.maxMana += 20
    }
}
