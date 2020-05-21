//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Neha Gupta on 09/05/20.
//  Copyright © 2020 Neha Gupta. All rights reserved.
//


import SwiftUI




struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var showingTitle = ""
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            //Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(Color.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.blue, lineWidth: 1)).shadow(color:.black,radius: 2)
                    }
                }
                Spacer()
            }
            }.alert(isPresented: $showingScore){
                Alert(title: Text(showingTitle), message: Text("Your Score is ???"), dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                    })
        }
    }
    func flagTapped(_ number :Int) {
        if number == correctAnswer {
            showingTitle = "Correct"
        }else {
            showingTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 HStack(spacing: 20.0) {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Hello, World!")
                    Text("This is inside the Stack")
                    Text("This is inside VStack")
                }
                VStack (alignment: .leading, spacing: 20.0){
                    Text("This Stack 2")
                    Text("This Stack 2")
                    Text("This Stack 2")
                }
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("This Stack 3")
                    Text("This Stack 3")
                    Text("This Stack 3")
                }


            }
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            Text("This is inside Text")
        }
        LinearGradient(gradient: Gradient(colors: [.black,.white]), startPoint: .top, endPoint: .bottom)
        RadialGradient(gradient: Gradient(colors: [.black,.blue,.red,.yellow,.white,.green,.orange,.pink,.purple,.white]), center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(gradient: Gradient(colors: [.black,.blue,.yellow,.orange,.red,.white,.gray,.green]), center: .center)
        Button("Tap Me") {
            print("hello you tap me")
        }

        Button(action:{
            print("Edit button was tapped")
        }){
            HStack(spacing: 20.0) {
                Image(systemName: "pencil").renderingMode(.original)
                Text("Edit").foregroundColor(Color.red)
            }
        }
 */
