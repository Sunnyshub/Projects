import SwiftUI

struct MoodText: View {
    @EnvironmentObject var moodLogDataModel: MoodLogDataModel
    @State private var descriptionText: String = ""
    @State private var navigateToMoodLog = false

    let emotions = ["Excited", "Upset", "Anxious", "Bored", "Relaxed", "Stressed"]
    let textBoxColor = Color(red: 150/255, green: 213/255, blue: 233/255)
    let placeholderTextColor = Color(red: 191/255, green: 234/255, blue: 248/255)
    let wordCounterColor = Color(red: 53/255, green: 147/255, blue: 177/255)
    let maxWords = 100

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    // Title and close button
                    HStack {
                        Text("What did you do today?")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Spacer()

                        Button(action: {
                            // Action to close the view
                        }) {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()

                    // Text input with placeholder and character limit
                    ZStack(alignment: .topLeading) {
                        if descriptionText.isEmpty {
                            Text("Describe your day so we can predict your mood...")
                                .foregroundColor(placeholderTextColor)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                                .font(.system(size: 18, weight: .medium))
                        }
                        TextEditor(text: $descriptionText)
                            .frame(minHeight: 100, alignment: .top)
                            .padding(4)
                            .background(textBoxColor)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .onChange(of: descriptionText) { newValue in
                                if descriptionText.count > maxWords {
                                    descriptionText = String(descriptionText.prefix(maxWords))
                                }
                            }
                    }
                    .padding(.horizontal)

                    // Word counter
                    HStack {
                        Spacer()
                        Text("\(descriptionText.count)/\(maxWords)")
                            .foregroundColor(wordCounterColor)
                            .font(.system(size: 14, weight: .medium))
                            .padding(.trailing)
                    }

                    Spacer()

                    // Emotion buttons and continue button at the bottom
                    VStack(spacing: 20) {
                        // Emotion buttons grid
                        let columns = Array(repeating: GridItem(.flexible()), count: 3)
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(emotions, id: \.self) { emotion in
                                Button(emotion) {
                                    // Action for emotion button
                                }
                                .font(.system(size: 19, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(wordCounterColor)
                                .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal)

                        // Continue button with NavigationLink
                        Button("Continue") {
                            moodLogDataModel.logEntries.append(descriptionText)
                            navigateToMoodLog = true
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(wordCounterColor)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .font(.system(size: 19, weight: .bold))

                        NavigationLink(destination: MoodLogView(), isActive: $navigateToMoodLog) {
                            EmptyView()
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationBarHidden(true) // Hides the default navigation bar
        }
    }
}

// Preview for MoodText
struct MoodText_Previews: PreviewProvider {
    static var previews: some View {
        MoodText().environmentObject(MoodLogDataModel())
    }
}
