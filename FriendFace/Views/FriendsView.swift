//
//  FriendsView.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 23/5/22.
//

import SwiftUI

struct FriendsView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            ForEach(user.friendsArray, id: \.self) { i in
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(i.wrappedName)")
                    Text("id: \(i.wrappedId)")
                        .font(.footnote)
                }
                .padding(.vertical, 8)
            }
        }
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
