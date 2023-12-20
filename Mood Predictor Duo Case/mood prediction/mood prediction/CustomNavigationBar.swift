import SwiftUI

struct CustomNavigationBar: View {
    @State private var showContentView = false
    @State private var showMoodLog = false

    var body: some View {
        HStack {
            // Button for navigating to ContentView
            Button(action: {
                self.showContentView = true
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .background(
                NavigationLink("", destination: ContentView().navigationBarHidden(true), isActive: $showContentView)
            )

            Spacer()

            // Plus icon with white circle background
            NavigationLink(destination: MoodRating().navigationBarHidden(true)) {
                ZStack {
                    Circle()
                        .foregroundColor(.white) // White circle background
                        .frame(width: 60, height: 60)
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
                }
            }

            Spacer()

            // Button for navigating to MoodLogView
            Button(action: {
                self.showMoodLog = true
            }) {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .background(
                NavigationLink("", destination: MoodLogView().navigationBarHidden(true), isActive: $showMoodLog)
            )
        }
        .padding()
        .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
        .cornerRadius(25)
        .padding(.horizontal, 20)
    }
}

