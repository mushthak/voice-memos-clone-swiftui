//
//  UIKitHelpers.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/15/22.
//

import Foundation
import SwiftUI

struct BottomSheetHelper<Content: View>: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    
    var content: Content
    var controller = UIViewController()
    var onClose: ()->()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent:self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let sheetController = CustomHostingController(rootView: content)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        } else {
            uiViewController.dismiss(animated: true)
        }
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: BottomSheetHelper
        
        init(parent: BottomSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.onClose()
        }
    }
    
}


