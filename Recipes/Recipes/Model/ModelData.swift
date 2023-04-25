//
//  ModelData.swift
//  Recipes
//
//  Created by Ivan on 2/15/23.
//

import Foundation
import Combine


final class ModelData: ObservableObject{
    //@Published push new changes into the data(array)  
    @Published var recipes : [Recipe] = load("db-recipes.json")
    @Published var profile = Profile.default
    
    
    var categories: [String: [Recipe]]{
        Dictionary(
        grouping: recipes,
        by: {$0.category.rawValue}
        )
    }
    
    var features: [Recipe] {
        recipes.filter{$0.isFeatured}
            
    }
}




//Decodes the data into a string
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
           let decoder = JSONDecoder()
           return try decoder.decode(T.self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
       }
}
    

