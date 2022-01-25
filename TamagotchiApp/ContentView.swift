//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Audley-Williams, Schuyler (SPH) on 25/01/2022.
//

import SwiftUI

struct ContentView: View {
    var tamagotchi = Tamagotchi()
    
    var body: some View {
        VStack {
            Text(tamagotchi.displayStats())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
