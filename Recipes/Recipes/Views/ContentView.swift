//
//  ContentView.swift
//  Recipes
//
//  Created by Ivan on 2/14/23.
//

import SwiftUI

extension String {
    func localizableString(_ language: String) -> String {
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

struct ContentView: View {
    @State private var selection: Tab = .featured
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
    
    
    
    enum Tab {
        case featured
        case list
        case profile
    }
    
    var body: some View {
        
        TabView(selection: $selection){
            
            CategoryHome()
                .tabItem{
                    Label("featured".localizableString(languages[changeLanguage]), systemImage: "star")
                }
                .tag(Tab.featured)
            
            // display every landmark from the recipe array
            RecipesList()
                .tabItem{
                    Label("list".localizableString(languages[changeLanguage]), systemImage: "list.bullet")
                    
                }
                .tag(Tab.list)
            ProfileHost()
                .tabItem{
                    Label("profile".localizableString(languages[changeLanguage]), systemImage: "person.crop.circle")
                }
                .tag(Tab.profile)
        }
    }
}

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ModelData())
                
        }
    }

