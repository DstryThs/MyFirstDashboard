import SwiftUI

@main
struct VolleyballTrackerApp: App {
    @StateObject private var store = MatchStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
