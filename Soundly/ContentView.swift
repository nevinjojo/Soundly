//
//  ContentView.swift
//  Soundly
//
//  Created by Nevin Jojo on 28/09/19.
//  Copyright © 2019 Nevin Jojo. All rights reserved.
//

import SwiftUI
import AVFoundation

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
    var audioPlayer = AVAudioPlayer()
    
    var body: some View {
        ZStack {
            Color.init(red: 20/255, green: 23/255, blue: 31/255)
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
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
                    Button(action: {
                        withAnimation {
                            self.playOrPause(soundNum: 2)
                        }
                    }) {
                       Image("rain")
                           .padding()
                           .background(Color.init(red:44/255, green:51/255, blue: 61/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:169/255, green:176/255, blue: 184/255))
                    }
                    
                    Button(action: {
                        withAnimation {
                            self.playOrPause(soundNum: 3)
                        }
                    }) {
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
    
    func playOrPause(soundNum: Int) {
        switch soundNum {
        case 1:
            print(1)
            self.playPlayer(playerNum: soundNum)
        case 2:
            print(2)
        case 3:
            print(3)
        default:
            print(1)
        }
    }
    
    func playPlayer(playerNum: Int) {
//        do {
//            self.audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
//            audioPlayer.prepareToPlay()
//        } catch {
//            print(error)
//        }
    }
}
