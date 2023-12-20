import Foundation

class MoodLogDataModel: ObservableObject {
    @Published var logEntries: [String] = []
}
