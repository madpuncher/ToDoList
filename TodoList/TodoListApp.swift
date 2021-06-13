//
//  TodoListApp.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 12.06.2021.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var viewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(viewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
