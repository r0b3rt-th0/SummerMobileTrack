//
//  ContentView.swift
//  MyArtist
//
//  Created by Robert Thomas on 6/22/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        ZStack {
            HStack{
                RoundedRectangle(cornerRadius: 130)
                    .frame(width: 420, height: 500)
                    .offset(x:0, y:430)
            }
            Rectangle()
                .frame(width: 100, height: 62)
                .foregroundStyle(.brown)
                .offset(x: 0, y: 150)
            Capsule()
                .frame(width: 250, height: 300)
                .foregroundStyle(.brown)
                .shadow(color: .black,radius: 10)
            //Eyes//
            HStack {
                Capsule()
                    .frame(width: 50, height: 30)
                    .foregroundStyle(.black)
                    .offset(x: 75, y: -30)
                    .shadow(color: .black,radius: 5)
                Capsule()
                    .frame(width: 50, height: 30)
                    .foregroundStyle(.black)
                    .offset(x:-75, y: -30)
                    .shadow(color: .black,radius: 5)
            }
            HStack {
                Capsule()
                    .frame(width: 40, height: 25)
                    .foregroundStyle(.white)
                    .offset(x:-46, y: -30)
            }
            HStack {
                Capsule()
                    .frame(width: 40, height: 25)
                    .foregroundStyle(.white)
                    .offset(x:46, y: -30)
            }
            HStack {
                Circle()
                    .frame(width: 40, height: 20)
                    .foregroundStyle(.black)
                    .offset(x:-22, y: -30)
                Circle()
                    .frame(width: 40, height: 20)
                    .foregroundStyle(.black)
                    .offset(x:22, y: -30)
            }
            //Mouth
            HStack {
                Circle()
                    .frame(width: 125, height: 125)
                    .offset(x:0, y:60)
            }
            HStack {
                Circle()
                    .frame(width: 110, height: 110)
                    .offset(x:0, y:60)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        playSound()
                    }
            }
            HStack {
                Rectangle()
                    .frame(width: 125, height: 80)
                    .foregroundStyle(.brown)
                    .offset(x:0, y:35)
                    .allowsHitTesting(false)
            }
            HStack {
                Rectangle()
                    .frame(width: 5, height: 25)
                    .offset(x:0, y:15)
            }
            HStack {
                Rectangle()
                    .frame(width: 50, height: 8)
                    .offset(x:75 , y:-55)
                Rectangle()
                    .frame(width: 50, height: 8)
                    .offset(x:-75, y:-55)
            }
            HStack{
                Rectangle()
                    .frame(width:175, height: 50)
                    .offset(x:0, y:-110)
            }
            HStack {
                Image("Image")
                    .resizable()
                    .frame(width: 400, height: 360)
                    .allowsHitTesting(false)
            }
        }
    }
    func playSound() {
        if let url = Bundle.main.url(forResource: "Spider", withExtension: "mp3") {
            print("Audio file URL: \(url)")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                print("Audio started playing")
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found!")
        }
    }
}
#Preview {
    ContentView()
}
