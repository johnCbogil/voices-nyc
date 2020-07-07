//
//  MemberDetailView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/5/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI

struct MemberDetailView: View {
    var member: CouncilMember
    let numberString = "516 458 9308"

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle.fill")
                Button(action: {
                    let tel = "tel://"
                    let formattedString = tel + self.numberString
                    let url: NSURL = URL(string: formattedString)! as NSURL

                    UIApplication.shared.open(url as URL)

                }) {
                    Text(verbatim: numberString)
                }

            }

        }
        .navigationBarTitle("\(member.name)")
        .navigationBarItems(trailing:
            Button(action: {
                print("button pressed")
            }) {
                Image(systemName: "flag.fill")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
            }

        )
    }
}

struct MemberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailView()
    }
}
