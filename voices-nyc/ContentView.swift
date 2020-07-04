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
