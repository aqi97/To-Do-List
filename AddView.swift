//
//  AddView.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 26/08/24.
//

import SwiftUI

struct AddView: View {
    
    let textFieldBackgroundColor = Color("TextFieldBackGroundColor")
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("type some thing...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(textFieldBackgroundColor)
                    .cornerRadius(10)
                Button(action: saveButtonPress, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Ass An item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPress() {
        if textIsApproprate() == true {
            listViewModel.addItem(title:textFieldText)
            presentationMode.wrappedValue.dismiss()
            
        }
    }
    
    func textIsApproprate() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "you text must be more than three characters 😳"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


