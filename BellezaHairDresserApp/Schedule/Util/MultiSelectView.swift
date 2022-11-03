import SwiftUI

struct MultiSelectView: View {
//    @State var selectedItems:[String]
//    @State var allItems:[String]
     
    @State var selectedItems = [String]()
    @State var allItems:[String] = [
        "more items",
        "another item",
        "and more",
        "still more",
        "yet still more",
        "and the final item"
    ]
    var body: some View {
        NavigationView {
            Form {
                Section("Choose your items:", content: {
                    NavigationLink(destination: {
                        MultiSelectPickerView(sourceItems: allItems, selectedItems: $selectedItems)
                            .navigationTitle("Choose Your Items")
                    }, label: {
                        HStack {
                            Text("Select Items:")
                                .foregroundColor(Color(red: 0.4192, green: 0.2358, blue: 0.3450))
                            Spacer()
                            Text( "\($selectedItems.count) items")
                                .foregroundColor(Color(red: 0.4192, green: 0.2358, blue: 0.3450))
                                .font(.title3)
                        }
                    })
                })
                // Made a quick text section so we can see what we selected
                Section("My selected items are:", content: {
                    Text(selectedItems.joined(separator: "\n"))
                        .foregroundColor(Color(red: 0.4192, green: 0.2358, blue: 0.3450))
                })
            }
            .navigationTitle("My Items")
        }
    }
}


struct MultiSelectPickerView: View {
    //the list of all items to read from
    @State var sourceItems: [String]
    
    //a binding to the values we want to track
    @Binding var selectedItems: [String]
    
    var body: some View {
        Form {
            List {
                ForEach(sourceItems, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            if self.selectedItems.contains(item) {
                                self.selectedItems.removeAll(where: { $0 == item })
                            } else {
                                self.selectedItems.append(item)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(self.selectedItems.contains(item) ? 1.0 : 0.0)
                            Text("\(item)")
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct MultiSelectView_Previews: PreviewProvider {
    static var previews: some View {
//        @State var selectedItems = [String]()
//        @State var allItems:[String] = [
//            "more items",
//            "another item",
//            "and more",
//            "still more",
//            "yet still more",
//            "and the final item"
//        ]
        MultiSelectView()
//        MultiSelectView(selectedItems: selectedItems, allItems: allItems)
    }
}
