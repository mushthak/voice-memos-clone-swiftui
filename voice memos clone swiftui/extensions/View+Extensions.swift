//
//  View+Extensions.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/15/22.
//

import Foundation
import SwiftUI

extension View {
    func bottomSheet<Content: View>(isPresented:Binding<Bool>,
                                    @ViewBuilder content: @escaping () -> Content,
                                    onClose: @escaping ()->())-> some View {
        return self
            .background(BottomSheetHelper(isPresented: isPresented,content: content(), onClose: onClose))
    }
}
