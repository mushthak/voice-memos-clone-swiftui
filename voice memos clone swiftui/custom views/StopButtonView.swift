//
//  StopButtonView.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/21/22.
//

import SwiftUI

struct StopButtonView: View {
    var clickHandler: OnClickHandler

    var body: some View {
        ZStack {

            Button(action: clickHandler) {
                Text("")
                    .padding()
            }
            .frame(width: 25, height: 25)
            .foregroundColor(Color.black)
            .background(Color.red)
            .clipShape(Rectangle())
            .cornerRadius(5)


            Circle()
                .strokeBorder(Color.gray, lineWidth: 3)
        }.frame(width: 62, height: 62)
    }
}

struct StopButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StopButtonView(clickHandler: {})
            .previewLayout(.sizeThatFits)
    }
}
