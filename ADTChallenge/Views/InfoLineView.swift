//
//  InfoLineView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import SwiftUI

struct InfoLineView: View {
    @State var title: String?
    @State var infoTxt: String
    
    var body: some View {
        HStack {
            Text(title ?? "")
                .isHidden(title == nil, remove: title == nil)
            Spacer()
                .isHidden(title == nil, remove: title == nil)
            Text(infoTxt)
            Spacer()
                .isHidden(title != nil, remove: title != nil)
        }
        .padding(10)
        .padding(.horizontal)
    }
}

struct InfoLineView_Previews: PreviewProvider {
    static var previews: some View {
        InfoLineView(title: nil, infoTxt: "Testing...")
    }
}
