//
//  LautsprecherApp.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI

@main
struct LautsprecherApp: App {
    var body: some Scene {
        WindowGroup {
            MusicAlbumsScreen(viewModel: MusicAlbumsViewModel())
        }
    }
}
