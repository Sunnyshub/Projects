import SwiftUI
import CoreMotion

class StepCounterViewModel: ObservableObject {
    private let pedometer = CMPedometer()
    @Published var totalStepsToday: Int = 0

    init() {
        fetchTotalStepsToday()
    }

    private func fetchTotalStepsToday() {
        if CMPedometer.isStepCountingAvailable() {
            let startOfDay = Calendar.current.startOfDay(for: Date())
            pedometer.queryPedometerData(from: startOfDay, to: Date()) { data, error in
                DispatchQueue.main.async {
                    self.totalStepsToday = data?.numberOfSteps.intValue ?? 0
                }
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var stepCounterViewModel = StepCounterViewModel()

    var body: some View {
        ZStack {
            Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667)
                .ignoresSafeArea()
<<<<<<< HEAD

=======
            
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi,")
                    .foregroundColor(.white)
                    .font(Font.custom("Roboto-Regular", size: 34))
                    .padding(.leading,30)
<<<<<<< HEAD

=======
                
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
                Text("[Name]")
                    .foregroundColor(.white)
                    .font(Font.custom("Roboto-Regular", size: 44))
                    .padding(.leading,30)

                HStack {
                    Text("Statistics")
                        .foregroundColor(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                        .font(Font.custom("Roboto-Regular-Bold", size: 37))
                        .rotationEffect(Angle.degrees(-90))
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .frame(width: 150, height: 300)
<<<<<<< HEAD

=======
                    
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
                    VStack {
                        Text("You have made")
                            .padding(.trailing, 40)
                            .padding(.top, 10)
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))

                        Text("\(stepCounterViewModel.totalStepsToday) steps")
                            .font(Font.custom("Roboto-Regular", size: 30))
<<<<<<< HEAD
                            .padding(.trailing, -1)

=======
                            .padding(.trailing, -17)
                        
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
                        Text("Your mood has changed")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .padding(.top, 5)
                            .padding(.leading, -110)
<<<<<<< HEAD

=======
                        
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
                        Text("3 times")
                            .font(Font.custom("Roboto-Regular", size: 30))

                        Text("In the past")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .padding(.top, 5)

                        Text("24 hours")
                            .font(Font.custom("Roboto-Regular", size: 30))
                            .padding(.leading, -15)
                    }
                    .foregroundColor(.white)
                    .frame(width: 260, height: 240, alignment: .topTrailing)
                    .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                    .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .bottomLeft]))
                    .padding(.trailing, -2)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
                .ignoresSafeArea()
<<<<<<< HEAD

            }
            Image("Image")
=======
                

            }
            Image("WhatsApp Image 2023-11-10 at 17.58.45")
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
                .resizable()
                .scaledToFit()
                .frame(height:400)
                .position(CGPoint(x: 185.0, y: 610.0))
<<<<<<< HEAD

            
            Spacer()
            
=======
            
            Spacer()
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
            CustomNavigationBar()
                .position(x: 213, y: 740)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
<<<<<<< HEAD

=======
    
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
<<<<<<< HEAD
=======

// The CustomNavigationBar struct should be placed here if it's not in a separate file.
// Make sure to define it according to the functionality you need.
>>>>>>> be21a9e0c5ab40e2ba2b8071da537eceb55be1e6
