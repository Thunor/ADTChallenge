//
//  Caption.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import SwiftUI

struct Caption: ViewModifier {
  let backgroundColor: Color
 
  func body(content: Content) -> some View {
    content
          .padding(10)
          .background(backgroundColor)
          .cornerRadius(5.0)
  }
}

extension View {
  func caption( backgroundColor: Color = Color(.secondarySystemBackground))
    -> some View {
        modifier(Caption(backgroundColor: backgroundColor))
  }
}
