//
//  CTAButton.swift
//  voices-nyc
//
//  Created by John Bogil on 7/11/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI


struct CTAButton: View {
    var text: String

    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        CTAButton(text: "Hello")
    }
}
