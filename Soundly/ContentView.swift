//
//  ContentView.swift
//  Sound Fox
//
//  Created by Nevin Jojo on 28/09/19.
//  Designed by Nikolai Bain.
//  Copyright © 2019 Nevin Jojo. All rights reserved.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?  /// Audio player for sounds
let aColor = UIColor(named: "customBackColor")  /// BackgroundColour for dark mode

/// View that displays the menu contents
struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.init(red: 245/255, green: 247/255, blue: 250/255)
            .edgesIgnoringSafeArea(.all)

            // Menu About Text
            VStack {
                Text("Sound Fox is a lightweight custom sound app designed to be used as background noise for day to day activities.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 50.0)
                    .padding(.trailing, 50.0)
                Text("It is best when used for focusing on work, studies, or sleep.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 50.0)
                    .padding(.trailing, 50.0)
                Text("It is designed and developed by Nikolai Bain and Nevin Jojo. Feel free to contact us.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 50.0)
                    .padding(.trailing, 50.0)
            }
            
            // Menu Close Button
            Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                Image("close")
                    .padding()
                    .foregroundColor(Color.init(red:214/255, green:219/255, blue: 225/255))
                    .frame(width: 35.0, height: 35.0)
            }
            .padding(.top, 600)
        }
    }
}


/// View that displays the Root view components
struct ContentView: View {
    // States of the 3 audio buttons and the menu button
    @State var sound1Playing = false
    @State var sound2Playing = false
    @State var sound3Playing = false
    @State var menuDisplayed = false

    var body: some View {
        ZStack {
            // Background colout of ContentView
            Color.init(red: 245/255, green: 247/255, blue: 250/255)
            .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center) {
                // Top Button
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
                            self.playOrPauseSounds(soundNum: 1)
                        }
                    }) {
                        Image("night")
                            .padding(35)
                            .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                            .clipShape(Circle())
                            .font(.largeTitle)
                            .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }
                }

                HStack() {
                    // Left Button
                    Button(action: {
                        self.playOrPauseSounds(soundNum: 2)
                    }) {
                       Image("rain")
                           .padding(35)
                           .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }
                    .padding(12)

                    // Right Button
                    Button(action: {
                        self.playOrPauseSounds(soundNum: 3)
                    }) {
                       Image("sun")
                           .padding(35)
                           .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }.padding(12)
                }
            }

            // Menu Button
            HStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        self.menuDisplayed.toggle()
                    }
                }) {
                    Circle()
                        .stroke(Color.init(red:214/255, green:219/255, blue: 225/255), lineWidth: 3)
                        .frame(width: 35, height: 35)
                }.sheet(isPresented: self.$menuDisplayed) {
                    MenuView()
                }
            }.padding(.top, 620)
        }
    }
    
    /// Sets the path for the audio player to the appropriate file
    private func initializePlayer(soundNum: Int) -> AVAudioPlayer? {
        guard let path = Bundle.main.path(forResource: "\(soundNum)", ofType: "mp3") else {
            return nil
        }

        return try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
    }
    
    /// Changes the button states and requests to initialise the appopriate file
    private func playOrPauseSounds(soundNum: Int) {
        switch soundNum {
        case 1:
            self.sound1Playing.toggle()
            audioPlayer = self.initializePlayer(soundNum: 1)
            audioPlayer?.numberOfLoops = -1
            if (self.sound1Playing) {
                self.sound2Playing = false
                self.sound3Playing = false
                audioPlayer?.play()
            } else {
                audioPlayer?.stop()
            }
        case 2:
            self.sound2Playing.toggle()
            audioPlayer = self.initializePlayer(soundNum: 2)
            audioPlayer?.numberOfLoops = -1
            if (self.sound2Playing) {
                self.sound1Playing = false
                self.sound3Playing = false
                audioPlayer?.play()
            } else {
                audioPlayer?.stop()
            }
        case 3:
            self.sound3Playing.toggle()
            audioPlayer = self.initializePlayer(soundNum: 3)
            audioPlayer?.numberOfLoops = -1
            if (self.sound3Playing) {
                self.sound1Playing = false
                self.sound2Playing = false
                audioPlayer?.play()
            } else {
                audioPlayer?.stop()
            }
        default:
            print("Invalid soundNum.")
        }
    }
}
