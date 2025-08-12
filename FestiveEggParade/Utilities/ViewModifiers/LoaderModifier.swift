import SwiftUI

struct LoaderModifier: ViewModifier {
    
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .allowsHitTesting(isLoading ? false : true)
            
            if isLoading {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.baseWhite.opacity(0.4))
                
                ProgressView()
            }
        }
    }
}

extension View {
    func setLoader(isLoading: Bool) -> some View {
        modifier(LoaderModifier(isLoading: isLoading))
    }
}
