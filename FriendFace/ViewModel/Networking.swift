import CoreData
import SwiftUI


struct Network {
    static func loadData() async -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid URL")
        }
        
        do {
            let (data, _) = try await  URLSession.shared.data(from: url)
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                return decodedUsers
            }
        } catch {
            print("Invalid data")
        }
        return []
    }
}


