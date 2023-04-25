//
//  Landmark.swift
//  Recipes
//
//  Created by Ivan on 2/15/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var source: String
    var preptime: Int
    var waittime: Int
    var cooktime: Int
    var servings: Int
    var comments: String
    var calories: Int
    var fat: Int
    var satfat: Int
    var carbs: Int
    var fiber: Int
    var sugar: Int
    var protein: Int
    var instructions: String
    var isFeatured: Bool
    var isFavorite: Bool
    
    
    var category: Category
    
    enum Category: String,CaseIterable, Codable {
        case top3 = "Top3"
        case newest = "Newest"
      
        
    }
    
    private var imageName: String
    var image: Image{
        Image(imageName);
    }   
    
}
