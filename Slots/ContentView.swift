//
//  ContentView.swift
//  Slots
//
//  Created by Angelika Khodzhaian on 16.05.2021.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {

            VStack {
                Image("gameOver").resizable()
                
                Button("Tap to restart") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .padding([.leading, .trailing], 40)
                .foregroundColor(.white)
                .background(Color(red: 0.9, green: 0.6, blue: 0.7))
                .cornerRadius(25)
                .font(.system(size: 18, weight: .bold, design: .default))
                
            }
            

        }
    }
}

struct ContentView: View {
    
    @State var credits = 1000
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    @State private var showingAlert = false

    
    var body: some View {

        VStack(spacing: 10.0) {
            
            Spacer()
            Text("SwiftUI Slots").font(.largeTitle)
            Spacer()
            
            Text("Credits: \(credits)")
            
            HStack {

                Image("fruit\(slot1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("fruit\(slot2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("fruit\(slot3)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Button("Spin") {
                
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                if slot1 == slot2 && slot2 == slot3 {
                    credits += 200
                } else {
                    credits -= 50
                }
                
                // GAME OVER
                if credits <= 0 {
                    credits = 0

                    //show as a popup or as a new page GAME OVER
//                    Button("Show Alert") {
//                        self.showingAlert.toggle()
//                    }
//                    .sheet(isPresented: $showingAlert) {
//                        SecondView()
//                    }            .padding()
//                        .padding([.leading, .trailing], 40)
//                        .foregroundColor(.white)
//                        .background(Color(red: 0.9, green: 0.6, blue: 0.7))
//                        .cornerRadius(25)
//                        .font(.system(size: 18, weight: .bold, design: .default))
                    
                }
                
                // WINNER
                if credits >= 1500 {

                    //show as a popup or as a new page  YOU ARE THE WINNER
                    
                    //show NEW GAME button

                }
                
            }
            .padding()
            .padding([.leading, .trailing], 40)
            .foregroundColor(.white)
            .background(Color(red: 0.9, green: 0.6, blue: 0.7))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default))
            Spacer()
            
            
            Button("Show Second View") {
                self.showingAlert.toggle()
            }
            .sheet(isPresented: $showingAlert) {
                SecondView()
            }
            .padding()
            .padding([.leading, .trailing], 40)
            .foregroundColor(Color(red: 0.9, green: 0.6, blue: 0.7))
            .background(Color(.white))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
