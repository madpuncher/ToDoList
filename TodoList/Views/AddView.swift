//
//  AddView.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 12.06.2021.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText = ""
    @State var showAlert = false
    @State var alertTitle = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("SAVE".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    //MARK: FUNCTIONS
    func saveButtonPressed() {
        if textIsAppropriate() {
            viewModel.appendItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Ваш текст слишком короткий. Пожалуйста, введите текст больше трёх символов 🥺"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
