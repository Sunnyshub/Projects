import SwiftUI

@main
struct YourApp: App {
    var moodLogDataModel = MoodLogDataModel()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(moodLogDataModel)
        }
    }
}
