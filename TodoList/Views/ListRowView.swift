//
//  ListRowView.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 12.06.2021.
//

import SwiftUI

struct ListRowView: View {
    
    var title: ItemModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: title.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(title.isCompleted ? .green : .red)
            
            Text(title.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "This is first title!", isCompleted: false)
    static var item2 = ItemModel(title: "This is second title!", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(title: item1)
            ListRowView(title: item2)
        }.previewLayout(.sizeThatFits)
    }
}

