//
//  ContentView.swift
//  GuesstheLogo
//
//  Created by Robert Thomas on 6/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Logos = [
        "Walmart",
        "Mcdonalds",
        "Starbucks",
        "Motorola",
        "Pepsi",
        "Chanel",
        "Lays",
        "Target",
        "Google",
        "Safari"
    ].shuffled()
    @State private var correctAnswer
    = Int.random(in:0...2)
    @State private var showingScore = false
    @State private var score = 0
    @State private var questionCount = 0
    @State private var gameOver = false
    @State private var scoreTitle: String = ""
    func logoTapped(_ number: Int){
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        }else{
            scoreTitle = "Wrong, that is the logo of of \(Logos[number])"
        }
        questionCount = questionCount + 1
        
        if questionCount == 10 {
            gameOver = true
        }
        else{
            showingScore = true
        }
    }
    
    func askQuestion(){
        Logos.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.3).ignoresSafeArea(edges: .all)
            
            VStack{
                Text("Guess the Logo")
                    .font(.largeTitle)
                    .padding(20)
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the logo of")
                            .font(.subheadline)
                            .padding(10)
                            
                        
                        Text(Logos[correctAnswer])
                    }
                    
                    ForEach(0..<3){ number in
                        Button{
                            logoTapped(number)
                            print("\(Logos[number])")
                        }label:{
                            Image(Logos[number])
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(30)
                        }
                    }
                }//middle vstack
            }.alert(scoreTitle, isPresented: $showingScore){
                Button("continue", action: askQuestion)
            }
            message: {
                Text("Your score is \(score)")
            }
                
        }
    }
}

#Preview {
    ContentView()
}
