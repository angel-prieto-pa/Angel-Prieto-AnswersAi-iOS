//
//  Event.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/3/24.
//

import SwiftUI

struct EventView: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Image("St. Jude Rock 'n' Roll Washington DC Half Marathon")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ZStack(alignment: .top) {
                Color.init(hex: 0x161616)
                .transition(.opacity)
                .mask(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .clear, location: 0.05),
                        .init(color: .black, location: 0.245) ]),
                                     
                    startPoint: .top,
                    endPoint: .bottom
                ))
                
                Text("St. Jude Rock 'n' Roll Washington DC Half Marathon")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
        
        
        //        HStack {
        //            Image(imageName)
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 50, height: 50)
        //
        //            VStack(alignment: .leading, spacing: 4) {
        //                Text(title)
        //                    .font(.system(size: 14, weight: .black, design: .rounded))
        //                    .foregroundColor(Color(hex: colorHex))
        //
        //                Text(description)
        //                    .font(.system(size: 10, weight: .medium, design: .rounded))
        //                    .foregroundColor(Color.gray)
        //            }
        //        }
       
            

//            .frame(width: .infinity, alignment: .top)

//            VStack(alignment: .leading) {
//                
//                
//                
//                HStack{
//                
//                    Image("St. Jude Rock 'n' Roll Washington DC Half Marathon")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 50)
//                    
//                    Text("Half Marathon")
//                        .foregroundStyle(Color.white)
//                
//                
//                }.frame(maxWidth: 100, alignment: .bottom)
//            
//            
//            //                .frame(width: 50, height: 50)
//            
//            Text("The St. Jude Rock ‘n’ Roll Washington DC Half Marathon takes runners on a 21.1 km journey through the nation's capital, featuring iconic landmarks and live music along the course. With a festive atmosphere and strong support for St. Jude Children's Research Hospital, this race offers a unique blend of fitness, charity, and fun.")
//                .foregroundColor(Color.gray)
//        }
//            
        
            
//            Button("Visit Website") {}
//                .buttonStyle(.borderedProminent)
//                .tint(Color.init(hex: 0x21272C))
//                .foregroundStyle(Color.white)
//                .clipShape(RoundedRectangle(cornerRadius: 5))
//                .border(Color.white, width: 2)
//                .clipShape(RoundedRectangle(cornerRadius: 5))
////                Color.white
                    
                    // Your other content here
                    // Other layers will respect the safe area edges
            }
        
//            .font(.system(size: 10, weight: .medium, design: .rounded))
//            .foregroundColor(Color.gray)
        // Set the size of entire row. maxWidth makes it take up whole width of device.
//            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
//            .padding(10) // Spacing around all the contents
        // Add a solid colored background that you can put a shadow on
        // (corner radius optional)
//            .background(Color.white.cornerRadius(5).shadow(radius: 3))
    }
//}

struct EventOverview: View {
    
    var body: some View {
        
        Text("St. Jude Rock 'n' Roll Washington DC Half Marathon")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.black)
        
    }
    
}

#Preview {
    EventView()
}


//import SwiftUI
//
//struct MarathonDetailView: View {
//    var body: some View {
//        VStack {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    // Header Image with Fade Effect
//                    ZStack {
//                        Image("St. Jude Rock 'n' Roll Washington DC Half Marathon") // Replace with your image asset
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 200)
//                            .clipped()
//
//                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]), startPoint: .bottom, endPoint: .center)
//                            .frame(height: 200)
//                    }
//
//                    // Main Content
//                    VStack(alignment: .leading, spacing: 16) {
//                        // Title and Metadata
//                        Text("St. Jude Rock 'n' Roll Washington DC Half Marathon")
//                            .font(.title2)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//
//                        HStack(spacing: 16) {
//                            Label("Half Marathon", systemImage: "figure.walk")
//                            Label("Sat, Mar 15, 2025", systemImage: "calendar")
//                            Label("Washington DC, United States", systemImage: "mappin.and.ellipse")
//                            Label("Moderate", systemImage: "bolt")
//                        }
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//
//                        Divider()
//                            .background(Color.gray)
//
//                        // Participation Info
//                        HStack {
//                            Image(systemName: "person.2.fill")
//                                .foregroundColor(.blue)
//                            Text("634 other Runners")
//                                .font(.subheadline)
//                                .foregroundColor(.white)
//                        }
//
//                        // Description
//                        Text("The St. Jude Rock 'n' Roll Washington DC Half Marathon takes runners on a 21.1 km journey through the nation’s capital, featuring iconic landmarks and live music along the course. With a festive atmosphere and strong support for St. Jude Children’s Research Hospital, this race offers a unique blend of fitness, charity, and fun.")
//                            .font(.body)
//                            .foregroundColor(.white)
//
//                        Spacer(minLength: 20)
//                    }
//                    .padding()
//                }
//            }
//
//            // Buttons at the Bottom
//            VStack(spacing: 12) {
//                Button(action: {
//                    // Visit website action
//                }) {
//                    Text("Visit Website")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//
//                Button(action: {
//                    // Select race action
//                }) {
//                    Text("Select Race")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.gray.opacity(0.2))
//                        .foregroundColor(.blue)
//                        .cornerRadius(8)
//                }
//            }
//            .padding()
//        }
//        .background(Color.black.edgesIgnoringSafeArea(.all))
//        .edgesIgnoringSafeArea(.top)
//    }
//}
//
//struct MarathonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MarathonDetailView()
//    }
//}
