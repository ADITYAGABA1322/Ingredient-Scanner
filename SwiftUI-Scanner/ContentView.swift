////
////  ContentView.swift
////  SwiftUI-Scanner
////
////  Created by Amit Gulati on 02/05/24.
////
//
//import SwiftUI
//import VisionKit
//
//struct ContentView: View {
//    
//    @EnvironmentObject var vm: AppViewModel
//    @State var isAlertVisible = false
//
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
////        ("All", .none),
////        ("URL", .URL),
////        ("Phone", .telephoneNumber),
////        ("Email", .emailAddress),
////        ("Address", .fullStreetAddress)
//    ]
//    
//    var body: some View {
//        switch vm.dataScannerAccessStatus {
//        case .scannerAvailable:
//            mainView
//        case .cameraNotAvailable:
//            Text("Your device doesn't have a camera")
//        case .scannerNotAvailable:
//            Text("Your device doesn't have support for scanning barcode with this app")
//        case .cameraAccessNotGranted:
//            Text("Please provide access to the camera in settings")
//        case .notDetermined:
//            Text("Requesting camera access")
//        }
//    }
//    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//        .alert(
//                    "Scan Results",
//                    isPresented: $isAlertVisible
//                    
//                ) {
//                    Button(role: .destructive) {
//                        // Handle the deletion.
//                    } label: {
//                        Text("Delete")
//                    }
//                    Button("Retry") {
//                        // Handle the retry action.
//                    }
//                } message: {
//                    Text("RESULTS")
//                }
////        .alert(isPresented: $vm.showAlert) {
////            Alert(title: Text("Scanned Text"), message: Text("The scanner has scanned some text."), dismissButton: .default(Text("OK")))
////        }
//    }
//    
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Barcode").tag(ScanType.barcode)
//                    Text("Text").tag(ScanType.text)
//                }.pickerStyle(.segmented)
//                
//              //  Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
//            }.padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text content type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.self.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }.pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }.padding(.horizontal)
//    }
//    
//    private var bottomContainerView: some View {
//        VStack {
//            headerView
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            
//                        case .text(let text):
//                            Text(text.transcript)
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}


//
//  ContentView.swift
//  SwiftUI-Scanner
//
//  Created by Amit Gulati on 02/05/24.
//

import SwiftUI
import VisionKit


struct AllergySelectionView: View {
    @Binding var selectedAllergy: String
    @Binding var isPresented: Bool

    let allergies = ["Peanut", "Egg", "Milk"]

    var body: some View {
        List(allergies, id: \.self) { allergy in
            Button(action: {
                selectedAllergy = allergy
                isPresented = false
            }) {
                Text(allergy)
            }
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var vm: AppViewModel
    @State var selectedAllergy = ""
    @State var isAlertVisible = false
    @State var navigateToNewContentView = false
    @State var isAllergySelectionViewPresented = true

    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//        ("All", .none),
//        ("URL", .URL),
//        ("Phone", .telephoneNumber),
//        ("Email", .emailAddress),
//        ("Address", .fullStreetAddress)
    ]
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case .scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case .cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case .notDetermined:
            Text("Requesting camera access")
        }
    }
    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//        .alert(
//                    "Scan Results",
//                    isPresented: $isAlertVisible
//                    
//                ) {
//                    Button(role: .destructive) {
//                        // Handle the deletion.
//                    } label: {
//                        Text("Delete")
//                    }
//                    Button("Retry") {
//                        // Handle the retry action.
//                    }
//                } message: {
//                    Text("RESULTS")
//                }
//    }
    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
////        .sheet(isPresented: $isAlertVisible) {
////            VStack {
////                Text("Scan Results")
////                Button(role: .destructive) {
////                    // Handle the deletion.
////                } label: {
////                    Text("Delete")
////                }
////                Button("Retry") {
////                    // Handle the retry action.
////                }
////            }
////        }
//        .sheet(isPresented: $isAlertVisible) {
//            VStack {
//                Text("Scan Results")
//                Image(systemName: "xmark.circle")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.red)
//                Text("This product contains harmful ingredients for your health.")
//                    .foregroundColor(.red)
//                    .padding()
//                Button(role: .destructive) {
//                    // Handle the deletion.
//                } label: {
//                    Text("Delete")
//                }
//                Button("Retry") {
//                    // Handle the retry action.
//                }
//            }
//        }
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//    }
    
    private var mainView: some View {
//        NavigationView {
//            DataScannerView(
//                recognizedItems: $vm.recognizedItems,
//                showAlert: $isAlertVisible,
//                recognizedDataType: vm.recognizedDataType,
//                recognizesMultipleItems: vm.recognizesMultipleItems)
//            .background { Color.gray.opacity(0.3) }
//            .ignoresSafeArea()
//            .id(vm.dataScannerViewId)
//            .sheet(isPresented: $isAlertVisible) {
//                VStack {
//                    Text("Scan Results")
//                    Image(systemName: "xmark.circle")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.red)
//                    Text("This product contains harmful ingredients for your health.")
//                        .foregroundColor(.red)
//                        .padding()
//                    Button(role: .destructive) {
//                        // Handle the deletion.
//                    } label: {
//                        Text("Delete")
//                    }
//                    Button("Retry") {
//                        // Handle the retry action.
//                    }
//                    NavigationLink(destination: ContentView(), isActive: $navigateToNewContentView) {
//                        Button("Done") {
//                            navigateToNewContentView = true
//                        }
//                    }
//                }
//            }
//            .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//            .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//            .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//        }
//    }
    

        NavigationView {
            DataScannerView(
                recognizedItems: $vm.recognizedItems,
                showAlert: $isAlertVisible,
                recognizedDataType: vm.recognizedDataType,
                recognizesMultipleItems: vm.recognizesMultipleItems)
            .background { Color.gray.opacity(0.3) }
            .ignoresSafeArea()
            .id(vm.dataScannerViewId)
            .sheet(isPresented: $isAllergySelectionViewPresented) {
                        AllergySelectionView(selectedAllergy: $selectedAllergy, isPresented: $isAllergySelectionViewPresented)
                    }
            .sheet(isPresented: $isAlertVisible) {
                VStack {
                    Text("Scan Results")
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                    Text("This product contains harmful ingredients for your health.")
                        .foregroundColor(.red)
                        .padding()
                    Button(role: .destructive) {
                        // Handle the deletion.
                    } label: {
                        Text("Delete")
                    }
                    Button("Retry") {
                        // Handle the retry action.
                    }
                    NavigationLink(destination: ContentView(), isActive: $navigateToNewContentView) {
                        Button("Done") {
                            navigateToNewContentView = true
                        }
                    }
                }
            }
            .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
            .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
            .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack {
                Picker("Scan Type", selection: $vm.scanType) {
                    Text("Barcode").tag(ScanType.barcode)
                    Text("Text").tag(ScanType.text)
                }.pickerStyle(.segmented)
                
              //  Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
            }.padding(.top)
            
            if vm.scanType == .text {
                Picker("Text content type", selection: $vm.textContentType) {
                    ForEach(textContentTypes, id: \.self.textContentType) { option in
                        Text(option.title).tag(option.textContentType)
                    }
                }.pickerStyle(.segmented)
            }
            
            Text(vm.headerText).padding(.top)
        }.padding(.horizontal)
    }
    
    private var bottomContainerView: some View {
        VStack {
            headerView
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(vm.recognizedItems) { item in
                        switch item {
                        case .barcode(let barcode):
                            Text(barcode.payloadStringValue ?? "Unknown barcode")
                            
                        case .text(let text):
                            Text(text.transcript)
                            
                        @unknown default:
                            Text("Unknown")
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
