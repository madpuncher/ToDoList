//
//  NoItemsView.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 13.06.2021.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animated = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 10) {
                
                Text("There a no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you productive person? I think you should click the add button and create new bunch if items bratka")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(), label: {
                        Text("Add something 🤓")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animated ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, animated ? 30 : 50)
                    .shadow(color: animated ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animated ? 30 : 10,
                            x: 0,
                            y: animated ? 50 : 30)
                    .scaleEffect(animated ? 1.1 : 1.0)
                    .offset(y: animated ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            animation()
        }
         
    }
    
    func animation() {
        guard !animated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animated.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
