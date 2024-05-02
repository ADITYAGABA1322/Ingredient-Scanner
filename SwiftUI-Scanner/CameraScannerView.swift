//
//  CameraScannerView.swift
//  SwiftUI-Scanner
//
//  Created by Amit Gulati on 02/05/24.
//

import SwiftUI

struct CameraScanner: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Text("Scanning View")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
self.presentationMode.wrappedValue.dismiss()
                        } label: {
                              Text("Cancel")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

