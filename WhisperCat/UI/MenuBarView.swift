import SwiftUI

struct MenuBarView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(appState.status.rawValue)
                .font(.headline)

            if let error = appState.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)

                if error.contains("Accessibility") {
                    Button("Open Accessibility Settings") {
                        PermissionChecker.openAccessibilitySettings()
                    }
                }
                if error.contains("Microphone") {
                    Button("Open Microphone Settings") {
                        PermissionChecker.openMicrophoneSettings()
                    }
                }
            }

            Divider()

            Button("Quit WhisperCat") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
        .padding(8)
    }
}
