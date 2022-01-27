//
//  TamgotchiTests.swift
//  TamagotchiAppTests
//
//  Created by Audley-Williams, Schuyler (SPH) on 25/01/2022.
//

import XCTest
@testable import TamagotchiApp

class TamgotchiTests: XCTestCase {

    func testTamagotchiStatsReturnsAllStartingStats() {
        //arrange
        let tamagotchi = Tamagotchi()
        let stats = tamagotchi.displayStats()
        let expected = """
Hunger: 0
Age: 0
Health: 10
Happiness: 4
Your tamagotchi does not need the toilet
Your tamagotchi is clean
Your tamagotchi is not ill
"""
        //assert
        XCTAssertEqual(stats, expected)
        
    }
    
    func testFeedTamagotchiSnackDecreasesHungerBy1AndIncreasesHappinessBy1() {
        //arrange
        let tamagotchi = Tamagotchi()
        var hunger = tamagotchi.hunger
        var happiness = tamagotchi.happiness
        let testingStats = [hunger, happiness]
        let expected = [0,4]
        
        hunger += 1
        happiness -= 1
        
        //act
        tamagotchi.feed(food: "snack")
        
        //assert
        XCTAssertEqual(testingStats, expected)
    }
    
    func testFeedTamagotchiMealDecreasesHungerBy2AndIncreasesHappinessBy2() {
        //arrange
        let tamagotchi = Tamagotchi()
        var hunger = tamagotchi.hunger
        var happiness = tamagotchi.happiness
        let testingStats = [hunger, happiness]
        let expected = [0,4]
        
        hunger += 2
        happiness -= 2
        
        //act
        tamagotchi.feed(food: "snack")
        
        //assert
        XCTAssertEqual(testingStats, expected)
    }
    
    func testGoToToiletChangesNeedsToiletToFalse() {
        //arrange
        let tamagotchi = Tamagotchi()
        var needsToilet = tamagotchi.needsToilet
        needsToilet = true
        let expected = false
        
        //act
        tamagotchi.goToToilet()
        
        //assert
        XCTAssertEqual(needsToilet, expected)
    }

}
