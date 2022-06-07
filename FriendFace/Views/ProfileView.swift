//
//  ProfileView.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 23/5/22.
//

import SwiftUI

struct ProfileView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(user.wrappedEmail)")
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Address:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(user.wrappedAddress)")
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Company:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(user.wrappedCompany)")
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Age:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(user.age)")
                }
                
                VStack(alignment: .leading) {
                    Text("\(user.isActive ? "Active" : "Offline")")
                        .foregroundColor(user.isActive ? Color.green : Color.red)
                }
            }
            .padding(.vertical, 8)
            
            
            Section(header: Text("About")) {
                Text("\(user.wrappedAbout)")
                    .font(.subheadline)
                    .padding(.vertical, 16)
            }
            .textCase(nil)
            .font(.body)
            
            Section {
                VStack(alignment: .leading) {
                    Text("ID:")
                    Text("\(user.wrappedId)")
                        .font(.caption)
                }
                
                VStack(alignment: .leading) {
                    Text("Registered date:")
                    Text("\(user.registeredDate)")
                }
            }
            .padding(.vertical, 6)
            .font(.subheadline)
            
        }
    }
}

