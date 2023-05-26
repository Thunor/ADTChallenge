//
//  View+OnBecomingVisible.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//
//  I used this StackOverflow answer to get this viewmodifier code:
//    https://stackoverflow.com/a/73038067/466197
//

import Foundation
import SwiftUI

public extension View {
    
    func onBecomingVisible(perform action: @escaping () -> Void) -> some View {
        modifier(BecomingVisible(action: action))
    }
}

private struct BecomingVisible: ViewModifier {
    
    @State var action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: VisibleKey.self,
                        // See discussion!
                        value: UIScreen.main.bounds.intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisibleKey.self) { isVisible in
                        guard isVisible, let action else { return }
                        action()
                    }
            }
        }
    }

    struct VisibleKey: PreferenceKey {
        static var defaultValue: Bool = false
        static func reduce(value: inout Bool, nextValue: () -> Bool) { }
    }
}
