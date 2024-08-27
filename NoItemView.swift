//
//  NoItemView.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 27/08/24.
//

import SwiftUI

struct NoItemView: View {
    
    @State private var animate: Bool = false
    @State private var currentFrame: Int = 1
    let secoundryAccentColor = Color("SecoundryAccentColor")
    
   /* let totalFrames = 3*/ // Number of frames in your animation
    /*let animationDuration: TimeInterval = 0.1*/ // Adjust this based on your frame rate
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Are you a product person? I think you are. You should click the add button.")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView(),
                               label: {
                    Text("Add something")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secoundryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secoundryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
                // Animated Image
                Image("aniamtedImage") // Dynamically update the image based on the current frame
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300) // Adjusted height to ensure image fits well
                    .padding(.top, 20)
                    .shadow(
                        color: animate ? secoundryAccentColor.opacity(0.5) : Color.accentColor.opacity(0.5),
                        radius: animate ? 20 : 10,
                        x: 0,
                        y: animate ? 20 : 10
                    )
            }
            .frame(minWidth: 40)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: startAnimations)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func startAnimations() {
        // Start button animation
        withAnimation(Animation
            .easeInOut(duration: 2.0)
            .repeatForever()
        ) {
            animate.toggle()
        }
        
    }
}

#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("Title")
    }
}
