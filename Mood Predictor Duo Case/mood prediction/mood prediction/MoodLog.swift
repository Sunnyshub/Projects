import SwiftUI

struct MoodLogView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var moodLogDataModel: MoodLogDataModel

    var body: some View {
        ZStack {
            Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667)
                .ignoresSafeArea()

            VStack {
                Text("Mood Log")
                    .foregroundColor(.white)
                    .font(Font.custom("Roboto-Regular", size: 44))
                    .padding(.top, 60)
                    .frame(maxWidth: .infinity, alignment: .center)

                List(moodLogDataModel.logEntries, id: \.self) { logEntry in
                    Text(logEntry)
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .overlay(
                VStack {
                    Spacer()
                    CustomNavigationBar()
                }, alignment: .bottom
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct MoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        MoodLogView().environmentObject(MoodLogDataModel())
    }
}
