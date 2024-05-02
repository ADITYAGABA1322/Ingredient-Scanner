
//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
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
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        
//        init(recognizedItems: Binding<[RecognizedItem]>) {
//            self._recognizedItems = recognizedItems
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
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
//}
//


//
//  DataScannerView.swift
//  BarcodeTextScanner
//
//  Created by Alfian Losari on 6/25/22.
//
//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
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
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, recognizedDataType: recognizedDataType, recognizesMultipleItems: recognizesMultipleItems)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    var coordinator: Coordinator?
//       
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        let recognizedDataType: DataScannerViewController.RecognizedDataType
//        let recognizesMultipleItems: Bool
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, recognizedDataType: DataScannerViewController.RecognizedDataType, recognizesMultipleItems: Bool) {
//            self._recognizedItems = recognizedItems
//            self.recognizedDataType = recognizedDataType
//            self.recognizesMultipleItems = recognizesMultipleItems
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
//            
//            // Process scanned items
//            processScannedItems(addedItems)
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
//        // Function to process scanned items and check ingredients
////        func processScannedItems(_ items: [RecognizedItem]) {
////            for item in items {
////                switch item {
////                case .barcode(let barcode):
////                    if let barcodeValue = barcode.payloadStringValue {
////                        if let ingredient = findIngredient(for: barcodeValue) {
////                            if ingredient.fat > 20 {
////                                // Show fat allergy alert
////                                showAlert("Fat Allergy", message: "Do not eat \(ingredient.name) due to fat allergy.")
////                            }
////                            if ingredient.carbohydrates > 20 {
////                                // Show carbohydrates alert
////                                showAlert("High Carbohydrates", message: "Be cautious: \(ingredient.name) contains high carbohydrates.")
////                            }
////                        } else {
////                            // Handle the case when ingredient is not found
////                            print("Ingredient not found for barcode: \(barcodeValue)")
////                        }
////                    } else {
////                        // Handle the case when payloadStringValue is nil
////                        // For example, display an error message or take appropriate action
////                        print("Barcode payloadStringValue is nil")
////                    }
////                default:
////                    break
////                }
////            }
////        }
//        func processScannedItems(_ items: [RecognizedItem]) {
//            print("Processing scanned items...") // Add a print statement to indicate that the function is being called
//            for item in items {
//                switch item {
//                case .barcode(let barcode):
//                    if let barcodeValue = barcode.payloadStringValue {
//                        if let ingredient = findIngredient(for: barcodeValue) {
//                            if ingredient.fat > 20 {
//                                // Show fat allergy alert
//                                showAlert("Fat Allergy", message: "Do not eat \(ingredient.name) due to fat allergy.")
//                            }
//                            if ingredient.carbohydrates > 20 {
//                                // Show carbohydrates alert
//                                showAlert("High Carbohydrates", message: "Be cautious: \(ingredient.name) contains high carbohydrates.")
//                            }
//                        } else {
//                            // Handle the case when ingredient is not found
//                            print("Ingredient not found for barcode: \(barcodeValue)")
//                        }
//                    } else {
//                        // Handle the case when payloadStringValue is nil
//                        // For example, display an error message or take appropriate action
//                        print("Barcode payloadStringValue is nil")
//                    }
//                case .text(let text):
//                    // Check if the text contains "Total fats" or "Added Sugars"
//                    let textContent = text.transcript
//                    if textContent.contains("Flavour") || textContent.contains("added sugars") {
//                        // Show alert for high fat or high sugar content
//                        showAlert("High Fat or High Sugar", message: "The scanned text contains information about high fat or high sugar content.")
//                    }
//                }
//            }
//        }
//
//
//        // Function to find ingredient from scanned barcode
//        func findIngredient(for barcode: String) -> Ingredient? {
//            // Implement logic to find ingredient from barcode
//            // Here's an example of a predefined list of ingredients
//            let ingredients = [
//                Ingredient(id: UUID(), name: "Ingredient 1", fat: 15, carbohydrates: 10),
//                Ingredient(id: UUID(), name: "Ingredient 2", fat: 25, carbohydrates: 5),
//                Ingredient(id: UUID(), name: "Ingredient 3", fat: 30, carbohydrates: 20),
//                // Add more ingredients as needed
//            ]
//            
//            // Search for the ingredient with the specified barcode value
//            return ingredients.first { $0.name == barcode }
//        }
//
//        
//        // Function to show alert
//        func showAlert(_ title: String, message: String) {
//            // Implement alert presentation logic here
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            
//            // Get the topmost view controller to present the alert
//            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
//                topViewController.present(alertController, animated: true)
//            }
//        }
//    }
//}
//
//struct Ingredient {
//    let id: UUID
//    let name: String
//    let fat: Double
//    let carbohydrates: Double
//}
//










//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
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
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, recognizedDataType: recognizedDataType, recognizesMultipleItems: recognizesMultipleItems)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    var coordinator: Coordinator?
//       
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        let recognizedDataType: DataScannerViewController.RecognizedDataType
//        let recognizesMultipleItems: Bool
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, recognizedDataType: DataScannerViewController.RecognizedDataType, recognizesMultipleItems: Bool) {
//            self._recognizedItems = recognizedItems
//            self.recognizedDataType = recognizedDataType
//            self.recognizesMultipleItems = recognizesMultipleItems
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
//            
//            // Process scanned items
//            processScannedItems(addedItems)
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
//        // Function to process scanned items and check ingredients
//        func processScannedItems(_ items: [RecognizedItem]) {
//            print("Processing scanned items...") // Add a print statement to indicate that the function is being called
//            for item in items {
//                switch item {
//                case .barcode(let barcode):
//                    if let barcodeValue = barcode.payloadStringValue {
//                        if let ingredient = findIngredient(for: barcodeValue) {
//                            if ingredient.fat > 20 {
//                                // Show fat allergy alert
//                                showAlert("Fat Allergy", message: "Do not eat \(ingredient.name) due to fat allergy.")
//                            }
//                            if ingredient.carbohydrates > 20 {
//                                // Show carbohydrates alert
//                                showAlert("High Carbohydrates", message: "Be cautious: \(ingredient.name) contains high carbohydrates.")
//                            }
//                        } else {
//                            // Handle the case when ingredient is not found
//                            print("Ingredient not found for barcode: \(barcodeValue)")
//                        }
//                    } else {
//                        // Handle the case when payloadStringValue is nil
//                        // For example, display an error message or take appropriate action
//                        print("Barcode payloadStringValue is nil")
//                    }
//                case .text(let text):
//                    // Check if the text contains "Flavour" or "added sugars"
//                    let textContent = text.transcript
//                    if textContent.contains("Flavour") || textContent.contains("added sugars") {
//                        // Show alert for high fat or high sugar content
//                        showAlert("High Fat or High Sugar", message: "The scanned text contains information about high fat or high sugar content.")
//                    }
//                }
//            }
//        }
//
//
//        // Function to find ingredient from scanned barcode
//        func findIngredient(for barcode: String) -> Ingredient? {
//            // Implement logic to find ingredient from barcode
//            // Here's an example of a predefined list of ingredients
//            let ingredients = [
//                Ingredient(id: UUID(), name: "Ingredient 1", fat: 15, carbohydrates: 10),
//                Ingredient(id: UUID(), name: "Ingredient 2", fat: 25, carbohydrates: 5),
//                Ingredient(id: UUID(), name: "Ingredient 3", fat: 30, carbohydrates: 20),
//                // Add more ingredients as needed
//            ]
//            
//            // Search for the ingredient with the specified barcode value
//            return ingredients.first { $0.name == barcode }
//        }
//
//        
//        // Function to show alert
//        func showAlert(_ title: String, message: String) {
//            // Implement alert presentation logic here
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            
//            // Get the topmost view controller to present the alert
//            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
//                topViewController.present(alertController, animated: true)
//            }
//        }
//    }
//}
//
//struct Ingredient {
//    let id: UUID
//    let name: String
//    let fat: Double
//    let carbohydrates: Double
//}






//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
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
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, recognizedDataType: recognizedDataType, recognizesMultipleItems: recognizesMultipleItems)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    var coordinator: Coordinator?
//       
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        let recognizedDataType: DataScannerViewController.RecognizedDataType
//        let recognizesMultipleItems: Bool
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, recognizedDataType: DataScannerViewController.RecognizedDataType, recognizesMultipleItems: Bool) {
//            self._recognizedItems = recognizedItems
//            self.recognizedDataType = recognizedDataType
//            self.recognizesMultipleItems = recognizesMultipleItems
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
//            
//            // Process scanned items
//            processScannedItems(addedItems)
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
//        // Function to process scanned items and check ingredients
//        func processScannedItems(_ items: [RecognizedItem]) {
//            print("Processing scanned items...") // Add a print statement to indicate that the function is being called
//            if items.isEmpty {
//                // Show alert for error message when no items are scanned
//                showAlert("Error", message: "No items were scanned.")
//            } else {
//                for item in items {
//                    switch item {
//                    case .barcode(let barcode):
//                        if let barcodeValue = barcode.payloadStringValue {
//                            if let ingredient = findIngredient(for: barcodeValue) {
//                                if ingredient.fat > 20 {
//                                    // Show fat allergy alert
//                                    showAlert("Fat Allergy", message: "Do not eat \(ingredient.name) due to fat allergy.")
//                                }
//                                if ingredient.carbohydrates > 20 {
//                                    // Show carbohydrates alert
//                                    showAlert("High Carbohydrates", message: "Be cautious: \(ingredient.name) contains high carbohydrates.")
//                                }
//                            } else {
//                                // Handle the case when ingredient is not found
//                                print("Ingredient not found for barcode: \(barcodeValue)")
//                            }
//                        } else {
//                            // Handle the case when payloadStringValue is nil
//                            // For example, display an error message or take appropriate action
//                            print("Barcode payloadStringValue is nil")
//                        }
//                    case .text(let text):
//                        showAlert("Detected!", message: "Works")
//                        NavigationLink(destination: DetailView(), isActive: self.$showDetail) { EmptyView() }
//                        // Show alert for error message when text is scanned
//                        // showAlert("Error", message: "Text was scanned: \(text.transcript)")
//                        // print("Item Recognised -->")
//                        // print(item)
//                    }
//                }
//            }
//        }
//
//        var body: some View {
//                VStack {
//                    NavigationLink(destination: DetailView(), isActive: self.$showDetail) { EmptyView() }
//                    Button(action: {
//                        self.displayPopupMessage = true
//                            // self.showDetail = true
//                            // self.displayPopupMessage = self.prepossess()
//                          } )
//                    {
//                        Text("Alert and Navigate")
//                    }
//                }
//                .alert(isPresented: $displayPopupMessage){
//                    Alert(title: Text("Warning"), message: Text("This is a test"), dismissButton: .default(Text("OK"), action: {
//                        print("Ok Click")
//                        self.showDetail = true
//                    })
//                    )
//                }
//            }
//        
//        // Function to find ingredient from scanned barcode
//        func findIngredient(for barcode: String) -> Ingredient? {
//            // Implement logic to find ingredient from barcode
//            // Here's an example of a predefined list of ingredients
//            let ingredients = [
//                Ingredient(id: UUID(), name: "Ingredient 1", fat: 15, carbohydrates: 10),
//                Ingredient(id: UUID(), name: "Ingredient 2", fat: 25, carbohydrates: 5),
//                Ingredient(id: UUID(), name: "Ingredient 3", fat: 30, carbohydrates: 20),
//                // Add more ingredients as needed
//            ]
//            
//            // Search for the ingredient with the specified barcode value
//            return ingredients.first { $0.name == barcode }
//        }
//
//        
//        // Function to show alert
//        func showAlert(_ title: String, message: String) {
//            // Implement alert presentation logic here
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            
//            // Get the topmost view controller to present the alert
//            
//            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
//                topViewController.present(alertController, animated: true)
//            }
//        }
//    }
//}
//
//struct Ingredient {
//    let id: UUID
//    let name: String
//    let fat: Double
//    let carbohydrates: Double
//}

//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    @State private var showAlert = false
//    @Binding var showDetailView: Bool // Binding for navigation
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        let vc = DataScannerViewController(
//            recognizedDataTypes: [recognizedDataType],
//            qualityLevel: .balanced,
//            recognizesMultipleItems: recognizesMultipleItems,
//            isGuidanceEnabled: true,
//            isHighlightingEnabled: true
//        )
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, recognizedDataType: recognizedDataType, recognizesMultipleItems: recognizesMultipleItems, showAlert: $showAlert, showDetailView: $showDetailView)
//    }
//    
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    var coordinator: Coordinator?
//       
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        let recognizedDataType: DataScannerViewController.RecognizedDataType
//        let recognizesMultipleItems: Bool
//        @Binding var showAlert: Bool
//        @Binding var showDetailView: Bool
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, recognizedDataType: DataScannerViewController.RecognizedDataType, recognizesMultipleItems: Bool, showAlert: Binding<Bool>, showDetailView: Binding<Bool>) {
//            self._recognizedItems = recognizedItems
//            self.recognizedDataType = recognizedDataType
//            self.recognizesMultipleItems = recognizesMultipleItems
//            self._showAlert = showAlert
//            self._showDetailView = showDetailView
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
//            
//            // Process scanned items
//            processScannedItems(addedItems)
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
//        // Function to process scanned items and check ingredients
//        func processScannedItems(_ items: [RecognizedItem]) {
//            print("Processing scanned items...") // Add a print statement to indicate that the function is being called
//            if items.isEmpty {
//                // Show alert for error message when no items are scanned
//                showAlert.toggle()
//            } else {
//                for item in items {
//                    switch item {
//                    case .barcode(let barcode):
//                        if let barcodeValue = barcode.payloadStringValue {
//                            if let ingredient = findIngredient(for: barcodeValue) {
//                                if ingredient.fat > 20 {
//                                    // Show fat allergy alert
//                                    showAlert("Fat Allergy", message: "Do not eat \(ingredient.name) due to fat allergy.")
//                                }
//                                if ingredient.carbohydrates > 20 {
//                                    // Show carbohydrates alert
//                                    showAlert("High Carbohydrates", message: "Be cautious: \(ingredient.name) contains high carbohydrates.")
//                                }
//                            } else {
//                                // Handle the case when ingredient is not found
//                                print("Ingredient not found for barcode: \(barcodeValue)")
//                            }
//                        } else {
//                            // Handle the case when payloadStringValue is nil
//                            // For example, display an error message or take appropriate action
//                            print("Barcode payloadStringValue is nil")
//                        }
//                    case .text(let text):
//                        if text.transcript.contains("specific text") {
//                            // Set showDetailView to true to navigate to DetailView
//                            showDetailView.toggle()
//                        }
//                    }
//                }
//            }
//        }
//
//
//        // Function to find ingredient from scanned barcode
//        func findIngredient(for barcode: String) -> Ingredient? {
//            // Implement logic to find ingredient from barcode
//            // Here's an example of a predefined list of ingredients
//            let ingredients = [
//                Ingredient(id: UUID(), name: "Ingredient 1", fat: 15, carbohydrates: 10),
//                Ingredient(id: UUID(), name: "Ingredient 2", fat: 25, carbohydrates: 5),
//                Ingredient(id: UUID(), name: "Ingredient 3", fat: 30, carbohydrates: 20),
//                // Add more ingredients as needed
//            ]
//            
//            // Search for the ingredient with the specified barcode value
//            return ingredients.first { $0.name == barcode }
//        }
//
//        
//        // Function to show alert
//        func showAlert(_ title: String, message: String) {
//            // Implement alert presentation logic here
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            
//            // Get the topmost view controller to present the alert
//            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
//                topViewController.present(alertController, animated: true)
//            }
//        }
//    }
//}
//
//struct Ingredient {
//    let id: UUID
//    let name: String
//    let fat: Double
//    let carbohydrates: Double
//}


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
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            recognizedItems.append(contentsOf: addedItems)
        //    print("didAddItems \(addedItems)")
            DispatchQueue.main.async {
                self.showAlert = true
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
