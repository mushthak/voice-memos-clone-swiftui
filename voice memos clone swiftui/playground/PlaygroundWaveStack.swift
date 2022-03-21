//
//  PlaygroundWaveStack.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/20/22.
//

import SwiftUI

struct PlaygroundWaveStack: View {

    @State var generatedMeter:[Int]
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { reader in
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer(minLength: 1)
                    HStack(spacing:3) {
                        ForEach(generatedMeter, id: \.self) { meter in
                            Rectangle()
                                .fill(AppTheme.waveActive)
                                .frame(width: 1, height: (CGFloat(meter) / 100) * proxy.size.height)
                        }
                        Spacer().frame(width: proxy.size.width/2)
                            .id("spacer_id")
                    }
                    .padding()
                    Spacer(minLength: 1)


                }
                .onChange(of: generatedMeter) { _ in
                    withAnimation(.linear(duration: 5)) {
                        reader.scrollTo("spacer_id")
                    }
                }
                .onReceive(timer) { _ in
                    withAnimation(.linear(duration: 0.1)) {
                        generatedMeter.append(Int.random(in: 2...100))
                    }
                }

            }
        }

    }

}

struct PlaygroundWaveStack_Previews: PreviewProvider {
    static var previews: some View {
        let sampleInputs:[Int] = Array(Array(10...50).shuffled())
        PlaygroundWaveStack(generatedMeter: sampleInputs)
    }
}

extension PlaygroundWaveStack {
    struct BarItemView {

    }
}
