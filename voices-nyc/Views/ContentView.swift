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
            VStack {
                NavigationLink(destination: AddressView()) {
                    CTAButton(text: "Who is my CouncilMember?")
                }

                List(councilMembers) { member in
                    Image(systemName: "person.circle.fill")
                    VStack(alignment: .leading){
                        Spacer()
                        Text("\(member.name)").bold()
                        Spacer()
                        Text("District \(member.district)")
                        Spacer()
                    }
                    NavigationLink("", destination: DetailView(member: member))
                }
            }
            .navigationBarTitle("NYC Council")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
