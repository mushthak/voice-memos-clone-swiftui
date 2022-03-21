//
//  RecordButtonView.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/14/22.
//

import SwiftUI

struct RecordButtonView: View {
    var clickHandler: OnClickHandler

    var body: some View {
        ZStack {
            Button(action: clickHandler) {
                Text("")
                    .padding()
            }
            .frame(width: 50, height: 50)
            .foregroundColor(Color.black)
            .background(Color.red)
            .clipShape(Circle())
            Circle()
                .strokeBorder(Color.gray, lineWidth: 3)
        }.frame(width: 62, height: 62)
    }
}

struct RecordButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecordButtonView(clickHandler: {})
            .previewLayout(.sizeThatFits)
    }
}
