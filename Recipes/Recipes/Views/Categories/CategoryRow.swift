//
//  CategoryRow.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Recipe]

    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(items){recipe in
                        NavigationLink{
                            RecipeDetail(recipeArray: recipe)
                        } label: {
                            CategoryItem(recipeArray: recipe)
                        }
                        
                    }
                    
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        CategoryRow(
            categoryName: recipes[0].category.rawValue,
            items: Array(recipes.prefix(3))
        )
    }
}
