//
//  DetailsView.swift
//  Day60Challenge
//
//  Created by Santhosh Srinivas on 10/09/25.
//

import SwiftUI

struct DetailsView: View {
    
    var user: Users
    var registeredDate: Date{
        var newFormatter = ISO8601DateFormatter()
        return newFormatter.date(from: user.registered) ?? Date.now
    }
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                VStack{
                    ActivityView(isActive: user.isActive)
                }
                Divider()
                VStack(alignment: .leading){
                    Text("About")
                        .font(.title)
                        .bold()
                    Text(user.about)
                        .padding()
                        .font(.title3)
                        .background(.ultraThinMaterial)
                }
                
                Divider()
                    .padding(.vertical)
                Text("Friends")
                    .font(.title3)
                    .bold()
                LazyVStack(alignment: .leading){
                    ForEach(user.friends, id: \.id){ friend in
                        Text(friend.name)
                    }
                }
                Divider()
                    .padding(.vertical)
                Text("User Registered on:")
                Text("\(registeredDate)")
                    .font(.caption)
            }
            .padding()
        }
        .navigationTitle(user.name)
//        .padding()
    }
    
    func formatDate(){
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: Users(id: "123", isActive: false, name: "Santhosh", age: 23, company: "Sagent", email: "snthshsrinivas@gmail.com", address: "Bengaluru", about: "Hi Loves iOS", registered: "2022-01-31T02:22:40+00:00", tags: ["a","b"], friends: []))
    }
}
