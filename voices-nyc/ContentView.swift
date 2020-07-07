//
//  ContentView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/4/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let councilMembers = Bundle.main
        .decode("CouncilMembers.json")
        .sorted(by: { $0.district < $1.district })

    var body: some View {
        NavigationView {
            List(councilMembers) { member in
                Image(systemName: "person.circle.fill")
                VStack(alignment: .leading){
                    Text("\(member.name)")
                    Text("District \(member.district)")
                }
                NavigationLink("", destination: DetailView(member: member))
            }
            .navigationBarTitle("NYC Council")
        }
    }
}

struct DetailView: View {
    var member: CouncilMember

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("District Office")
                Button(action: {
                    let tel = "tel://"
                    let formattedString = tel + self.member.districtPhone
                    let url: NSURL = URL(string: formattedString)! as NSURL
                    UIApplication.shared.open(url as URL)
                }) {
                    Text(verbatim: member.districtPhone)
                }
                Spacer()
                Text("Legislative Office")
                Button(action: {
                    let tel = "tel://"
                    let formattedString = tel + self.member.legislativePhone
                    let url: NSURL = URL(string: formattedString)! as NSURL
                    UIApplication.shared.open(url as URL)
                }) {
                    Text(verbatim: member.legislativePhone)
                }
                Spacer()
                Spacer()
                Spacer()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
