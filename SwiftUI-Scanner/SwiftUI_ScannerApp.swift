//
//  SwiftUI_ScannerApp.swift
//  SwiftUI-Scanner
//
//  Created by Amit Gulati on 02/05/24.
//

import SwiftUI

@main
struct SwiftUI_ScannerApp: App {
    
    @StateObject var vm:AppViewModel = AppViewModel()
    
    var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(vm)
                    .task {
                        await vm.requestDataScannerAccessStatus()
                    }
            }
        }
}
