//
//  CustomHostingController.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/15/22.
//

import Foundation
import SwiftUI

class CustomHostingController<Content: View>: UIHostingController<Content> {

    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            presentationController.prefersGrabberVisible = true
        }
    }
    
}
