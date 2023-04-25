//
//  RecipesList.swift
//  Recipes
//
//  Created by Ivan on 2/15/23.
//

import SwiftUI

struct RecipesList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
  
    let languages = ["en", "ar"]
    
    @State private var changeLanguage: Int = {
            let languageCode = Locale.current.languageCode
            if languageCode == "ar" {
                return 1
            } else if languageCode == "en" {
                return 0
            } else {
                return 0
            }
        }()
    
    var filteredRecipes: [Recipe] {
        modelData.recipes.filter{landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("savedOnly".localizableString(languages[changeLanguage]))
                }
                
                ForEach(filteredRecipes){recipe in
                    NavigationLink{
                        //destination when clicked
                        RecipeDetail(recipeArray: recipe)
                        
                    } label: {
                        RecipeRow(recipeArray: recipe)
                    }
                }
            }
            .navigationTitle("savedRecipies".localizableString(languages[changeLanguage]))
            
        }
    }
}

struct RecipesList_Previews: PreviewProvider {
    static var previews: some View {
            RecipesList()
            .environmentObject(ModelData())
        }
    }


