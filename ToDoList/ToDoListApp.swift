//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Van Dat on 27/02/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
