//
//  SecondaryPage.swift
//  mood prediction
//
//  Created by Christiyan Borisov on 08/11/2023.
//

import SwiftUI

struct ViewLog: View {
    var body: some View {
        ZStack {
            Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667)
                .ignoresSafeArea()
            
            // Your other content here
            // Other layers will respect the safe area edges
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Viewing Log")
                    .foregroundColor(.white)
                    .font(Font.custom("Roboto-Regular", size: 44))
                    .padding(.leading,30)
                    .padding(.top, 60)
                HStack {
                    // "Statistics" text
                    Text("19:00")
                        .foregroundColor(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                        .font(Font.custom("Roboto-Regular", size: 34))
                        .rotationEffect(Angle.degrees(-90))
                        .frame(width: 90, height: 100)
                    
                    
                    VStack {
                        HStack{
                            Text("😃")
                                .font(Font.custom("Roboto-Regular",size: 40))
                                .padding(.leading, -60)
                                .padding(.top, 10)
                                
                                
                                
                            
                            // "You have made 4 logs" text
                            Text("You were feeling")
                                .padding(.leading
                                         , 10)
                                .padding(.top, 14)
                                .font(Font.custom("Roboto-Regular", size: 20))
                                .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            
                            
                        }
                        Text("Happy")
                            .font(Font.custom("Roboto-Regular", size: 30))
                            .padding(.trailing
                                     , 45)
                        
                        
                        Text("I managed to get all my work done, I did all my hobbies and saw my friends")
                            .font(Font.custom("Roboto-Regular", size: 17))
                            .padding(.leading
                                     , -19)
                            .frame(width: 260,height: 80)
                        
                        Text("Suggestions")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .frame(width: 220, height: 5, alignment: .bottomLeading)
                            .padding(.top, 4)
                            .position(.init(x: 133, y: 21))
                        
                        Text("Mood score")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .frame(width: 240, height: 5, alignment: .bottomTrailing)
                        
                        Text("8/10")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .frame(width: 240, height: 15, alignment: .bottomTrailing)
                            
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 330, height:230, alignment: .topLeading)
                    .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                    .clipShape(RoundedCorner(radius: 50, corners: [.topLeft, .bottomLeft]))
                    .padding(.top, 0)
                    .padding(.trailing, -22)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
                .ignoresSafeArea()
            }
            VStack{
                HStack{
                    VStack{
                        HStack{
                        Text("You were feeling")
                            .padding(.leading,35)
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .font(Font.custom("Roboto-Regular", size: 20))
                                    Text("😔")
                                        .font(Font.custom("Roboto-Regular",size: 40))
                                            .padding(.trailing, -390)
                                            .padding(.top, 0)
                                                
                                                }
                        Text("Sad")
                            .font(Font.custom("Roboto-Regular", size: 30))
                            .padding(.leading, 120)
                        
                        Text("Got some bad grades didn't manage to see my friends and the worst part is I wasn't able to make time for fun.")
                            .font(Font.custom("Roboto-Regular", size: 17))
                            .padding(.leading
                                     , 10)
                            .frame(width: 290,height: 60)
                        
                        Text("Suggestions")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .position(.init(x: 233, y: 31))
                        
                        
                        Text("Mood score")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .padding(.trailing, 180)
                        
                            Text("4/10")
                                .font(Font.custom("Roboto-Regular", size: 20))
                                .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                                .frame(width: 280, height: 13, alignment: .bottomLeading)
                                .padding(.bottom, 10)

                            
                            
                        
                    }
                  .padding(.top, 5)
                  .foregroundColor(.white)
                  .frame(width: 320, height:230, alignment: .topLeading)
                  .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                  .clipShape(RoundedCorner(radius: 50, corners: [.topRight, .bottomRight]))
                  .padding(.top, 370)
                  .padding(.trailing, -22)
                    
                    Text("14:52")
                        .foregroundColor(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                        .font(Font.custom("Roboto-Regular", size: 34))
                        .rotationEffect(Angle.degrees(90))
                        .padding(.top, 360)
                    

                }
                HStack {
                    Text("12:00")
                        .foregroundColor(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                        .font(Font.custom("Roboto-Regular", size: 34))
                        .rotationEffect(Angle.degrees(-90))
                        .frame(width: 90, height: 100)
                    
                    
                    VStack {
                        HStack{
                            Text("😠")
                                .font(Font.custom("Roboto-Regular",size: 40))
                                .padding(.leading, -40)
                                .padding(.top, 10)
                            
                            
                            // "You have made 4 logs" text
                            Text("You were feeling")
                                .padding(.leading
                                         , 10)
                                .padding(.top, 14)
                                .font(Font.custom("Roboto-Regular", size: 20))
                                .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                        }
                        Text("Angry")
                            .font(Font.custom("Roboto-Regular", size: 30))
                            .padding(.trailing
                                     , 45)
                        
                        
                        Text("I managed to get all my work done, I did all my hobbies and saw my friends")
                            .font(Font.custom("Roboto-Regular", size: 17))
                            .padding(.leading
                                     , 10)
                            .frame(width: 290,height: 80)
                        
                        Text("Suggestions")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .frame(width: 220, height: 5, alignment: .bottomLeading)
                            .padding(.top, 4)
                            .position(.init(x: 133, y: 21))
                        
                        Text("Mood score")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .padding(.top, 5)
                            .frame(width: 280, height: 1, alignment: .bottomTrailing)
                        
                        Text("2/10")
                            .font(Font.custom("Roboto-Regular", size: 20))
                            .foregroundColor(Color(red: 191/255.0, green: 234/255.0, blue: 248/255.0))
                            .padding(.top, 5)
                            .frame(width: 280, height: 15, alignment: .bottomTrailing)

                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height:230, alignment: .topLeading)
                    .background(Color(red: 53/255.0, green: 147/255.0, blue: 177/255.0))
                    .clipShape(RoundedCorner(radius: 50, corners: [.topLeft, .bottomLeft]))
                    .padding(.top, 10)
                    .padding(.trailing, -22)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
                .ignoresSafeArea()
                
                VStack {
                    // Use the static navbar view
                    StaticNavbar()
                }
                .padding(20)
            }
        }
        

            .padding(.top, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .ignoresSafeArea()
        }
    }
    


struct StaticNavbar: View {
    var body: some View {
        HStack {
            Image(systemName: "house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
            
            ZStack {
                Circle()
                    .frame(width: 140, height: 50)
                    .foregroundColor(.white)
                
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 0.4117647058823529, green: 0.7568627450980392, blue: 0.8666666666666667))
            }
            
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }
    }
}

struct SecondaryPage_Previews: PreviewProvider {
    static var previews: some View {
        ViewLog()
            
    }
}
