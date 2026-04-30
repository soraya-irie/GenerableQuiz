import SwiftUI
import FoundationModels

struct ContentView: View {
    private var topicSelectionView: some View {
        VStack(spacing: 16) {
            Text("Pick a topic for your quiz")
                .font(.title)
        }
        .padding()
    }

    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            switch SystemLanguageModel.default.availability {
            case .available:
                topicSelectionView
            case .unavailable(let unavailableReason):
                UnavailableView(reason: unavailableReason)
            }
        }
    }
}

#Preview {
    ContentView()
}
