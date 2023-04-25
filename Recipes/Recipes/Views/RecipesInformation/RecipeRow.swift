//
//  RecipeRow.swift
//  Recipes
//
//  Created by Ivan on 2/15/23.
//

import SwiftUI

struct RecipeRow: View {
    var recipeArray: Recipe
    
    var body: some View {
        HStack {
            recipeArray.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(recipeArray.name)
            
            Spacer()

            if(recipeArray.isFavorite){
                //system name creates an object directly from the system
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes
    
    static var previews: some View {
        //from the array display only the first and the second element
        Group {
            RecipeRow(recipeArray:  recipes[0])
            RecipeRow(recipeArray: recipes[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
