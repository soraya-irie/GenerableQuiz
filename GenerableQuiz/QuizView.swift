import SwiftUI

struct QuizView: View {
    @Environment(QuizGenerator.self) private var generator

    private var quizStack: some View {
        VStack(spacing: 16) {
            if let error = generator.error {
                Label(error.localizedDescription, systemImage: "xmark.circle")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.red)
                    .padding(.horizontal)
            }

            if let questions = generator.quiz?.questions {
                ForEach(questions) { question in
                    QuestionView(question: question)
                        .disabled(generator.isGenerating)
                        .padding(.vertical, 8)
                }
            }

            Button {

            } label: {
                Text("Start a new quiz")
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

                ScrollView {
                    quizStack
                }
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
