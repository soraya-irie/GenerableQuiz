import SwiftUI

struct QuizView: View {
    @State var quiz: Quiz

    private var quizStack: some View {
        VStack(spacing: 16) {
            ForEach(quiz.questions, id: \.description) { question in
                Text(question)
            }
        }
        .padding()
    }

    var body: some View {
        quizStack
    }
}

#Preview {
    var sampleQuiz: Quiz {
        Quiz(questions: [
            "Question 1",
            "Question 2",
            "Question 3"
        ])
    }

    QuizView(quiz: sampleQuiz)
}
