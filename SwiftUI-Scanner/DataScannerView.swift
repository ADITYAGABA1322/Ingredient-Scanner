////
////  DataScannerView.swift
////  SwiftUI-Scanner
////
////  Created by Amit Gulati on 02/05/24.
////
//
//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
//    @Binding var showAlert: Bool
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        let vc = DataScannerViewController(
//            recognizedDataTypes: [recognizedDataType],
//            qualityLevel: .balanced,
//            recognizesMultipleItems: recognizesMultipleItems,
//            isGuidanceEnabled: true,
//            isHighlightingEnabled: true
//        )
//        vc.delegate = context.coordinator
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        @Binding var showAlert: Bool
//
//        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>) {
//            self._recognizedItems = recognizedItems
//            self._showAlert = showAlert
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//          //  print("didAddItems \(addedItems)")
//            DispatchQueue.main.async {
//                self.showAlert = true
//            }
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            self.recognizedItems = recognizedItems.filter { item in
//                !removedItems.contains(where: {$0.id == item.id })
//            }
//            print("didRemovedItems \(removedItems)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//            print("became unavailable with error \(error.localizedDescription)")
//        }
//        
//    }
//    
//}
//


//
//  DataScannerView.swift
//  SwiftUI-Scanner
//
//  Created by Amit Gulati on 02/05/24.
//

import Foundation
import SwiftUI
import VisionKit

struct DataScannerView: UIViewControllerRepresentable {
    
    @Binding var recognizedItems: [RecognizedItem]
    @Binding var showAlert: Bool
    let recognizedDataType: DataScannerViewController.RecognizedDataType
    let recognizesMultipleItems: Bool
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let vc = DataScannerViewController(
            recognizedDataTypes: [recognizedDataType],
            qualityLevel: .balanced,
            recognizesMultipleItems: recognizesMultipleItems,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        try? uiViewController.startScanning()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert)
    }
    
    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
        uiViewController.stopScanning()
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        @Binding var recognizedItems: [RecognizedItem]
        @Binding var showAlert: Bool

        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>) {
            self._recognizedItems = recognizedItems
            self._showAlert = showAlert
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            print("didTapOn \(item)")
        }
        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//          //  print("didAddItems \(addedItems)")
//            DispatchQueue.main.async {
//                self.showAlert = true
//            }
//        }
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            // Check if any of the added items contain the string "potato"
//            for item in addedItems {
//                switch item {
//                case .text(let text):
//                    if text.transcript.lowercased().contains("potato") {
//                        DispatchQueue.main.async {
//                            self.showAlert = true
//                        }
//                        break
//                    }
//                default:
//                    break
//                }
//            }
//        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            recognizedItems.append(contentsOf: addedItems)
            // Check if any of the added items contain the name of any ingredient
            for item in addedItems {
                switch item {
                case .text(let text):
                    for ingredient in ingredients {
                        if text.transcript.lowercased().contains(ingredient.name) {
                            DispatchQueue.main.async {
                                self.showAlert = true
                            }
                            break
                        }
                    }
                default:
                    break
                }
            }
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            self.recognizedItems = recognizedItems.filter { item in
                !removedItems.contains(where: {$0.id == item.id })
            }
            print("didRemovedItems \(removedItems)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
            print("became unavailable with error \(error.localizedDescription)")
        }
        
    }
    
}

