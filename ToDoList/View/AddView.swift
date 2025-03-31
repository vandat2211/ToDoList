//
//  AddView.swift
//  ToDoList
//
//  Created by Van Dat on 03/03/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText:String = ""
    
    @State var alerTitle: String = ""
    @State var showAlter : Bool = false
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55 )
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                )
            }
            .padding(14)
           
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlter, content: getAlter)
        
    }
    
    func saveButonPressed(){
        if(textIsApprppriate()){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApprppriate() -> Bool {
        if(textFieldText.count < 3){
            alerTitle = "your new todo item must be at least 3 characters long !!!"
            showAlter.toggle()
            return false
        }
        return true
    }
    
    func getAlter() -> Alert{
        return Alert(title: Text(alerTitle))
    }
}

struct AddView_Previews: PreviewProvider{
    static var previews: some View {
        Group{
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
        
    }
}

