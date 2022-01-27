//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Audley-Williams, Schuyler (SPH) on 25/01/2022.
//

import Foundation

class Tamagotchi: ObservableObject {
    @Published var hunger: Int
    @Published var age: Int
    @Published var health: Int
    @Published var happiness: Int
    @Published var needsToilet: Bool
    @Published var isDirty: Bool
    @Published var isIll: Bool
    @Published var isAlive: Bool
    
    init() {
        hunger = 0
        age = 0
        health = 10
        happiness = 4
        needsToilet = false
        isDirty = false
        isIll = false
        isAlive = false
    }
    
    func displayStats() -> String {
        var needsToiletText = "Your tamagotchi does not need the toilet"
        var isDirtyText = "Your tamagotchi is clean"
        var isIllText = "Your tamagotchi is not ill"
        
        if needsToilet {
            needsToiletText = "Your tamagotchi needs the toilet"
        }
        if isDirty {
            isDirtyText = "Your tamagotchi is dirty"
        }
        if isIll {
            isIllText = "Your tamagotchi is ill"
        }
        
        return """
        Hunger: \(self.hunger)
        Age: \(self.age)
        Health: \(self.health)
        Happiness: \(self.happiness)
        \(needsToiletText)
        \(isDirtyText)
        \(isIllText)
        """
    }
    
    func feed(food: String) {
        var decrease = 1
        if food == "meal" {
            decrease = 2
        }
        if self.hunger == 1 {
            self.hunger = 0
        } else if self.hunger > 0 {
            self.hunger -= decrease
        }
        
        if self.happiness < 4 {
            self.happiness += decrease
        }
    }
    
    func goToToilet() {
        if self.needsToilet == true {
            self.needsToilet = false
        }
    }
}
