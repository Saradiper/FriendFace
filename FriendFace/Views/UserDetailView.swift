//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 19/5/22.
//

import SwiftUI

struct UserDetailView: View {
    var user: CachedUser
   
    
    @State var pickerView = ["Profile", "Friends"]
    @State var pickerViewSelected = "Profile"
    
    var body: some View {
        VStack(spacing: 16){
            Text(user.initials)
                .font(.title3)
                .padding()
                .clipShape(Circle())
                .frame(width: 100)
                .overlay(
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            
            Text("\(user.wrappedName)")
                .font(.title)
            
            Picker("pickerViewSelected", selection: $pickerViewSelected) {
                ForEach(pickerView, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
        
        if pickerViewSelected == "Profile" {
            ProfileView(user: user)
        } else {
            FriendsView(user: user)
        }
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//    }
//}
