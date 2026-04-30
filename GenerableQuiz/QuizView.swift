import SwiftUI

struct QuizView: View {
    @Environment(QuizGenerator.self) private var generator

    private var quizStack: some View {
        VStack(spacing: 16) {
            if let questions = generator.quiz?.questions {
                ForEach(questions, id: \.description) { question in
                    Text(question)
                }
            }
        }
        .navigationTitle(generator.topic)
        .padding()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)

                quizStack
            }
            .onAppear {
                generator.generateQuiz()
            }
        }
    }
}

#Preview {
    QuizView()
        .environment(QuizGenerator(topic: "Marin Life"))
}
