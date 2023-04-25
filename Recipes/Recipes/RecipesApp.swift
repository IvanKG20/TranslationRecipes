//
//  RecipesApp.swift
//  Recipes
//
//  Created by Ivan on 2/14/23.
//

import SwiftUI

@main
struct RecipesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
