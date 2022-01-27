//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Audley-Williams, Schuyler (SPH) on 25/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tamagotchi = Tamagotchi()
    
    @State private var currentTime = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Lifetime: \(currentTime)")
                .onReceive(timer) { _ in
                   currentTime += 1
                }
            Text(tamagotchi.displayStats())
            HStack {
                Button("Feed snack", action: {
                    tamagotchi.feed(food: "snack")
                }).buttonStyle(.bordered)
                Button("Feed meal", action: {
                    tamagotchi.feed(food: "meal")
                }).buttonStyle(.bordered)
            }
        }
        .onAppear {
            tamagotchi.hunger = 5
            tamagotchi.happiness = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
