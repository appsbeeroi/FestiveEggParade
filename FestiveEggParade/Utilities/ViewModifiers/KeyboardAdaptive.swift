import SwiftUI
import Combine

struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    @State var cancellable: AnyCancellable?

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onAppear {
                cancellable = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
                    .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
                    .sink { notification in
                        withAnimation(.easeOut(duration: 0.25)) {
                            keyboardHeight = Self.keyboardHeight(from: notification)
                        }
                    }
            }
            .onDisappear {
                cancellable?.cancel()
            }
    }

    static func keyboardHeight(from notification: Notification) -> CGFloat {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return 0
        }
        if frame.origin.y >= UIScreen.main.bounds.height {
            return 0
        } else {
            return frame.height
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        self.modifier(KeyboardAdaptive())
    }
}
