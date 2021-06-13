//
//  ListView.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 12.06.2021.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        
        VStack {
            
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                
                List {
                    
                    ForEach(viewModel.items) { item in
                        ListRowView(title: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(item: item)
                                    print(item.isCompleted)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
