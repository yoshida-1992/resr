import SwiftUI

struct DetailCalendarView: View {
    @State var item: EventCellView.VM
    @State var events: [EventCellView.VM] = SampleData().events
    @Environment(\.dismiss) var dismiss
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        dismiss()
                    }
                }) {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(.gray)
                }
                Spacer()
                if item.isMyTask {
                    Menu {
                    Button(action: {
                        
                        let index: Int? = events.firstIndex(where: {$0.id == item.id})
                        events.remove(at: index!)
                        
                        dismiss()
//                        item.removeAll()
//                        settings.updateScrollType(numOfDays: 1)
//                        didTapToday.toggle()
                    }, label: {
                        Label("削除", image: "削除")
                    })
                    Button(action: {
                        withAnimation() {
                            editMode?.wrappedValue = .active
//                            if editMode?.wrappedValue.isEditing == true {
//                                editMode?.wrappedValue = .inactive
//                            } else {
//                                editMode?.wrappedValue = .active
//                            }
                            dismiss()
                        }
                    }, label: {
                        Label("編集", image: "編集")
                    })
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.gray)
                    }
                }
            }.padding([.top,.horizontal])
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 24.0) {
                    RoundedRectangle(cornerRadius: 4.0)
                        .frame(width: 16.0, height: 16.0)
                        .foregroundColor(item.color)
                        .padding(.top, 5.0)
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(item.text).font(.system(size: 24))
                        Text(schedule(dates: item.startDate...(item.endDate ?? Date()), isAllDay: item.isAllDay)).font(.system(size: 14))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 24.0)
                .padding(.top, 60.0)
                
                HStack(alignment: .top, spacing: 24.0) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                        .scaledToFill()
                    
                    Button(action: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
//                            dismiss()
                        }
                    }) {
                        HStack(spacing: 17){
                            Image(systemName: "person.fill")
                                .resizable()
                                .foregroundColor(Color.blue.opacity(0.7))
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .cornerRadius(75)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 75).stroke(Color.gray, lineWidth: 0.1)
                                        .background(Color.blue.opacity(0.2))
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(75)
                            )
    //                            .padding(.trailing)
                        
                            Text(item.userName).font(.system(size: 18))
                        }
                    }

                }
                .padding(.top)
                
                HStack(alignment: .top, spacing: 24.0) {
                    Image(systemName: "text.alignleft")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                        .scaledToFill()
                        

                    
                            Text(item.description).font(.system(size: 16)).multilineTextAlignment(.leading)
                }
                .padding(.top)
                    
                Spacer()
            }
        }
    }
    
    private func schedule(dates: ClosedRange<Date>, isAllDay: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        dateFormatter.dateFormat = "M / d (EE) "
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "H:mm"
        
        if dates.lowerBound.day == dates.upperBound.day {
            if isAllDay {
                return "\(dateFormatter.string(from: dates.lowerBound))"
            } else {
                return "\(dateFormatter.string(from: dates.lowerBound))・\(timeFormatter.string(from: dates.lowerBound))-\(timeFormatter.string(from: dates.upperBound))"
            }
        } else {
            if isAllDay {
                return "\(dateFormatter.string(from: dates.lowerBound))-\n\(dateFormatter.string(from: dates.upperBound))"
            } else {
                return "\(dateFormatter.string(from: dates.lowerBound)) at \(timeFormatter.string(from: dates.lowerBound))-\n\(dateFormatter.string(from: dates.upperBound)) at \(timeFormatter.string(from: dates.upperBound))"
            }
        }
    }
}

struct DetailCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}
