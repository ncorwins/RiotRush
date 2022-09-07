//
//  ContentView.swift
//  RiotRush2
//
//  Created by Nathan Corwin - Shah on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            PlayView()
                .tabItem() {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
            SettingsView()
                .tabItem() {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
