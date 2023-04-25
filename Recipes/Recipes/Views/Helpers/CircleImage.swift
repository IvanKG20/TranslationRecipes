//
//  CircleImage.swift
//  Recipes
//
//  Created by Ivan on 2/14/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 500, height: 350)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth:4)
            }.shadow(radius: 7)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("godivapie"))
    }
}
