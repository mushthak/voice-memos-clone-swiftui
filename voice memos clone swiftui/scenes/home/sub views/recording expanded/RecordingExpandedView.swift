//
//  RecordingExpandedScene.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/20/22.
//

import SwiftUI

struct RecordingExpandedView: View {
    @Environment(\.dismiss) var dismiss
    var onClose: ()->()

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing:14) {
                Text("New Recording")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("00:00:00")
                    .font(.footnote)
                    .foregroundColor(AppTheme.textSecondary)
                Spacer(minLength: 10)
                PlaygroundWaveStack(generatedMeter: [])
                    .frame(height: proxy.size.height/3)
                Spacer(minLength: 10)
                StopButtonView(clickHandler: {
                    onClose()
                })
            } .padding(EdgeInsets.init(top: 30, leading: 0, bottom: 20, trailing: 0))
                .background(AppTheme.bottomSheetBackground.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }

    }
}

struct RecordingExpandedScene_Previews: PreviewProvider {
    static var previews: some View {
        RecordingExpandedView(onClose: {})
            .previewLayout(.sizeThatFits)

        RecordingExpandedView(onClose: {})
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 400))
    }
}
