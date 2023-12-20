import SwiftUI

enum Emotion: String, CaseIterable {
    case happy = "😁"
    case pleased = "🙂"
    case neutral = "😐"
    case displeased = "🙁"
    case sad = "😢"
}

struct MoodRating: View {
    @State private var selectedEmotion: Emotion? = nil
    @State private var isNavigationActive = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                Text("So... how are you doing?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                VStack(spacing: 20) {
                    ForEach(Emotion.allCases, id: \.self) { emotion in
                        Button(action: {
                            withAnimation {
                                self.selectedEmotion = emotion
                            }
                        }) {
                            Text(emotion.rawValue)
                                .font(.system(size: 60))
                                .foregroundColor(self.selectedEmotion == emotion ? .white : Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                                .opacity(self.selectedEmotion == emotion ? 1 : 0.5)
                                .scaleEffect(self.selectedEmotion == emotion ? 1.1 : 1.0)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)

                Spacer()

                NavigationLink(destination: MoodText(), isActive: $isNavigationActive) {
                    EmptyView()
                }

                Button("Continue") {
                    isNavigationActive = true
                }
                .padding()
                .frame(width: 200, height: 50)
                .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                .foregroundColor(.white)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
            .ignoresSafeArea()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct MoodRating_Previews: PreviewProvider {
    static var previews: some View {
        MoodRating()
    }
}
