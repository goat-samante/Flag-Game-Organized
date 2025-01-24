//
//  Question View.swift
//  Flag Game Organized
//
//  Created by Samuel Amante on 1/9/25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        VStack (spacing: 20) {
            if gameManager.playingGame {
                HStack {
                    Text("Country Flag Game")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                }
                .foregroundColor(.yellow)
                
                ProgressBar(progress:gameManager.progress)
                VStack (spacing: 10) {
                    Text("Which Country's Flag is This?")
                    Image(gameManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(gameManager)
                    }
                }
                Button {
                    gameManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                Spacer()
            }
            else {
                Text("Country Flag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congratulations! You've completed the game")
                Text("You Scored \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                } label : {
                    CustomButton(text: "Play Again")
                }
            }
        }
        .foregroundColor(.yellow)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuestionView()
}
