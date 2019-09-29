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
            Color.init(red: 245/255, green: 247/255, blue: 250/255)
            .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Noiise is a lightweight sound app designed to be used as background noise.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 60.0)
                    .padding(.trailing, 60.0)
                Text("It’s best when used for when trying to focus on work or studies, or for getting to sleep.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 60.0)
                    .padding(.trailing, 60.0)
                Text("It has been designed by Nikolai Bain and Nevin Jojo. feel free to contact us.")
                    .foregroundColor(Color(red: 135/255, green: 147/255, blue: 159/255))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.leading, 60.0)
                    .padding(.trailing, 60.0)
            }
            
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

struct ContentView: View {
    @State var soundPlaying = false
    @State var menuDisplayed = false

    var body: some View {
        ZStack {
            Color.init(red: 245/255, green: 247/255, blue: 250/255)
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
                            .padding(35)
                            .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                            .clipShape(Circle())
                            .font(.largeTitle)
                            .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }
                }

                HStack() {
                    Button(action: {self.playOrPause(soundNum: 2)}) {
                       Image("rain")
                           .padding(35)
                           .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }.padding(12)


                    Button(action: {self.playOrPause(soundNum: 3)}) {
                       Image("sun")
                           .padding(35)
                           .background(Color.init(red:219/255, green:225/255, blue: 231/255))
                           .clipShape(Circle())
                           .font(.largeTitle)
                           .foregroundColor(Color.init(red:122/255, green:135/255, blue: 149/255))
                    }.padding(12)
                }
            }

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
            }.padding(.top, 600)
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
