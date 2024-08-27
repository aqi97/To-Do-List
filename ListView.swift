//
//  ListView.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 26/08/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel


    var body: some View {
        ZStack{
            if listViewModel.item.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.item) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(updatedItem: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleatItem)
                    .onMove(perform: listViewModel.onMoveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
       
        .navigationTitle("ToDo List📋" )
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
       
    }

}

struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


