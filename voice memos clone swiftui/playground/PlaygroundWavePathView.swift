//
//  PlaygroundView.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/20/22.
//

import SwiftUI

struct PlaygroundWavePathView: View {

    let inputs = [2,1,5,6]

    @State var generatedMeter = Array(Array(20...80).shuffled())

    @State private var percentage: CGFloat = .zero

    @State var timeRemaining = 10
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()


    let startingPoint = CGPoint(x:UIScreen.main.bounds.minX,y: UIScreen.main.bounds.midY)
    let endPoint = CGPoint(x:UIScreen.main.bounds.maxX,y: UIScreen.main.bounds.midY)

    let topPoint = CGPoint(x:UIScreen.main.bounds.midX,y: UIScreen.main.bounds.minY)
    let bottomPoint = CGPoint(x:UIScreen.main.bounds.midX,y: UIScreen.main.bounds.maxY)

    @State private var width: CGFloat?

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            WaveView(meterValues: $generatedMeter)
                .stroke()
                .foregroundColor(.red)
                .padding()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)

                .onReceive(timer) { _ in
                    generatedMeter.append(Int.random(in: 20...90))
                }
        }
    }
}

struct WaveView: Shape {

    @Binding var meterValues:[Int]

    func path(in rect: CGRect) -> Path {
        let step = 10
        var path = Path()

        for i in 0 ..< meterValues.count {

            let xPosition: CGFloat = CGFloat(rect.minX) + CGFloat(i * step)
            let startY: CGFloat = rect.midY + CGFloat(meterValues[i])
            let endY: CGFloat = rect.midY - CGFloat(meterValues[i])

            let startPoint = CGPoint.init(x: xPosition, y: startY)
            let endPoint = CGPoint(x: xPosition, y: endY)
            path.move(to: startPoint)
            path.addLine(to: endPoint)

        }

        return path
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundWavePathView()
    }
}
