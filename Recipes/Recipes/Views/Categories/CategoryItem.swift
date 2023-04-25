//
//  CategoryItem.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import SwiftUI

struct CategoryItem: View {
    var recipeArray: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
                    recipeArray.image
                .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                    Text(recipeArray.name)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                .padding(.leading, 15)
            }
    }


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(recipeArray: ModelData().recipes[0])
    }
}
