import SwiftUI
import FoundationModels

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            switch SystemLanguageModel.default.availability {
            case .available:
                Text("Apple Intelligence is available!")
            case .unavailable(let unavailableReason):
                UnavailableView(reason: unavailableReason)
            }
        }
    }
}

#Preview {
    ContentView()
}
