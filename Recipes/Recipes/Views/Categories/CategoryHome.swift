//
//  CategoryHome.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
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
        NavigationView {
            List{
                modelData.features[3].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                CategoryRow(categoryName: key, items: ModelData().categories[key]!)
            }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("featured".localizableString(languages[changeLanguage]))
            }
        }
    }


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
        
            .environmentObject(ModelData())
    }
}
