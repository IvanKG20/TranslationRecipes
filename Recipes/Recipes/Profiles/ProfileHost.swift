//
//  ProfileHost.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State private var draftprofile = Profile.default
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStackLayout(alignment: .leading, spacing: 20){
            HStack{
                if (editMode?.wrappedValue == .active){
                    Button("Cancel", role: .cancel){
                        draftprofile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                        
                    }
                }
                
                Spacer()
            }
            if(editMode?.wrappedValue == .inactive){
                // naychi kak  se vzima ot skobite
                ProfileSummary(profile: modelData.profile)
            }
            else{
                ProfileEditor(profile: $draftprofile)
                    .onAppear{
                        draftprofile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftprofile
                    }
            }
        }
        .padding()
            
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
