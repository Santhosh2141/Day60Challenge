//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Santhosh Srinivas on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [Users]()
    var body: some View {
        NavigationStack{
            LazyVStack{
                List(users, id: \.id){ user in
                    NavigationLink{
                        DetailsView(user: user)
                    } label: {
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.title.bold())
                                .padding(.vertical,5)
                            ActivityView(isActive: user.isActive)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Your Friends")
            }
//            .padding()
            .task {
                await loadUser()
            }
        }
    }
    
    func loadUser() async {
        if users.isEmpty {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedUser = try? JSONDecoder().decode([Users].self, from: data) {
                    users = decodedUser
                }
            } catch {
                print("Error in decoding Data")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
