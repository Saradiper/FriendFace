//
//  ContentView.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 18/5/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var usersCD: FetchedResults<CachedUser>
    
    @FetchRequest(sortDescriptors: []) var friendCD: FetchedResults<CachedFriend>
    
    @State var users = [User]()
    
    
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(usersCD, id: \.self) { user in
                    
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack{
                            Text(user.initials)
                                .font(.title3)
                                .padding()
                                .clipShape(Circle())
                                .frame(width: 80)
                                .overlay(
                                    Circle()
                                        .stroke(user.isActive ? Color.green : Color.red, lineWidth: 2)
                                )
                                .padding([.top, .bottom, .trailing], 6)
                            
                            VStack(alignment: .leading, spacing: 6){
                                Text("\(user.wrappedName)")
                                    .font(.title2)
                                Text("Company: \(user.wrappedCompany)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("FriendFace")
                            .font(.title2)
                    }
                }
            }
            .task {
                users = await Network.loadData()
                
                await MainActor.run {
                    for user in users {
                        let cached = CachedUser(context: moc)
                        cached.id = user.id
                        cached.isActive = user.isActive
                        cached.name = user.name
                        cached.age = Int16(user.age)
                        cached.company = user.company
                        cached.about = user.about
                        cached.email = user.email
                        cached.address = user.address
                        cached.registered = user.registered
                        
                        for friend in user.friends {
                            let cachedFriend = CachedFriend(context: moc)
                            cachedFriend.name = friend.name
                            cachedFriend.id = friend.id
                            cached.addToCachedFriend(cachedFriend)
                            print("success friend cached")
                        }
                    }
                    
                    do {
                        if moc.hasChanges {
                            try moc.save()
                            print("success saved cached")
                        }
                    }
                    
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
