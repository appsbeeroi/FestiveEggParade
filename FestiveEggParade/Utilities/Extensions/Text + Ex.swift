import SwiftUI

extension Text {
    func strokeText(fontSize: CGFloat) -> some View {
        ZStack {
            ZStack {
                self
                    .offset(x: 2, y: 2)
                
                self
                    .offset(x: 2, y: -2)
                
                self
                    .offset(x: -2, y: 2)
                
                self
                    .offset(x: -2, y: -2)
                
                self
                    .offset(x: 2, y: 3)
                
                self
                    .offset(x: 1, y: 3)
                
                self
                    .offset(x: 3, y: 3)
                
                self
                    .offset(x: 0, y: 3)
                
                self
                    .offset(x: -1, y: 3)
            }
            
            .font(.rammetto(with: fontSize))
            .foregroundStyle(.baseBrown)
            
            self
                .font(.rammetto(with: fontSize))
        }
    }
}
