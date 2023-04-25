//
//  ProfileSummary.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile : Profile
    @EnvironmentObject var modelData: ModelData

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
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("completedBadges".localizableString(languages[changeLanguage]))
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "oneReview".localizableString(languages[changeLanguage]))
                            HikeBadge(name: "fiveReviews".localizableString(languages[changeLanguage]))
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "tenReviews".localizableString(languages[changeLanguage]))
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                            
                        }
                        .padding(.bottom)
                        
                    }
                }
                
                Divider()
            
                    
                }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
