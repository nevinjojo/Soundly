//
//  ContentView.swift
//  Soundly
//
//  Created by Nevin Jojo on 28/09/19.
//  Copyright © 2019 Nevin Jojo. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color.init(red: 28/255, green: 32/255, blue: 41/255)
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                Image("close")
                    .padding()
                    .foregroundColor(Color.init(red:169/255, green:176/255, blue: 184/255))
                    .frame(width: 35.0, height: 35.0)
            }
        }
    }
}

struct ContentView: View {
    @State var soundPlaying = false
    @State var menuDisplayed = false
    
    var body: some View {
        ZStack {
            Color.init(red: 20/255, green: 23/255, blue: 31/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
                            self.soundPlaying.toggle()
                            self.playOrPause(soundNum: 1)
                        }
                    }) {
                        Image("night")
                            .padding()
                            .background(Color.init(red:44/255, green:51/255, blue: 61/255))
                            .clipShape(Circle())
                            .font(.largeTitle)
                            .foregroundColor(Color.init(red:169/255, green:176/255, blue: 184/255))
                    }
                }
                
                HStack() {
                    Button(action: {self.playOrPause(soundNum: 2)}) {
                       Image("rain")
                           .padding()
                           .background(Color.init(red:44/255, green:51/255, blue: 61/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:169/255, green:176/255, blue: 184/255))
                    }
                    
                    Button(action: {self.playOrPause(soundNum: 3)}) {
                       Image("sun")
                           .padding()
                           .background(Color.init(red:44/255, green:51/255, blue: 61/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:169/255, green:176/255, blue: 184/255))
                    }
                }
                
                //TODO: Replace Dividers with some sort of margin top??
                Divider()
                Divider()
                Divider()
                Divider()
                Divider()
                Divider()
                
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
                            self.menuDisplayed.toggle()
                        }
                    }) {
                        Circle()
                            .stroke(Color.init(red:169/255, green:176/255, blue: 184/255), lineWidth: 3)
                            .frame(width: 35, height: 35)
                    }.sheet(isPresented: self.$menuDisplayed) {
                        MenuView()
                    }
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


    func playOrPause(soundNum: Int) {
        //TODO use soundplaying state to decide to play sound or not
        print(soundNum)
    }
}
