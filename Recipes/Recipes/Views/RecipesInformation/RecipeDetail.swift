//
//  RecipeDetail.swift
//  Recipes
//
//  Created by Ivan on 2/15/23.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    var recipeArray: Recipe
    
    var landmarkIndex: Int {
        modelData.recipes.firstIndex(where: {$0.id == recipeArray.id})!
        
    }
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
    
    
    var body: some View {
        ScrollView {
            CircleImage(image: recipeArray.image)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recipeArray.name.localizableString(languages[changeLanguage]))
                        .font(.title)
                    FavoriteButton(isSet: $modelData.recipes[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(recipeArray.name.localizableString(languages[changeLanguage]))
                    Spacer()
                    Text(recipeArray.name.localizableString(languages[changeLanguage]))
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(recipeArray.name.localizableString(languages[changeLanguage]))")
                    .font(.title2)
                Text(recipeArray.instructions.localizableString(languages[changeLanguage]))
                
                
            }
            .padding(.horizontal, 65.0)
            Spacer()
            
        }
        //???
        .navigationTitle(recipeArray.name)
        .environment(\.layoutDirection, languages[changeLanguage] == "ar" ? .rightToLeft : .leftToRight)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
        
    static var previews: some View {
        RecipeDetail(recipeArray: ModelData().recipes[0])
            .environmentObject(modelData)
    }
}
