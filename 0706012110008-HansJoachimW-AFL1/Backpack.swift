//
//  Backpack.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation

class Backpack {
    var itemType: String
    
    init(itemType: String) {
        self.itemType = itemType
    }
}

class Potion: Backpack {
    var potionAmount: Int
    
    init(itemType: String, potionAmount: Int) {
        self.potionAmount = potionAmount
        super.init(itemType: itemType)
    }

    func healWound(player: Hero) {
        mainCharacter.potionAmount -= 1
        mainCharacter.baseHealth += 20
    }
}

class Elixir: Backpack {
    var elixirAmount: Int
    
    init(itemType: String, elixirAmount: Int) {
        self.elixirAmount = elixirAmount
        super.init(itemType: itemType)
    }
    
    func extractMana(player: Hero) {
        mainCharacter.elixirAmount -= 1
        mainCharacter.baseMana += 10
    }
}

class Aegis: Backpack {
    var aegisAmount: Int
    
    init(itemType: String, aegisAmount: Int) {
        self.aegisAmount = aegisAmount
        super.init(itemType: itemType)
    }
    
    func reinvigorate(target: Hero) {
        mainCharacter.aegisAmount -= 1
        mainCharacter.maxHealth += 20
        mainCharacter.maxMana += 20
    }
}
