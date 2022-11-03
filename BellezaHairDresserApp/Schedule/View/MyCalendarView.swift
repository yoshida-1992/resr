import SwiftUI
import InfiniteCalendar

struct MyCalendarView: View {
    @State var events: [EventCellView.VM] = SampleData().events
    @State var currentDate: Date = Date()
    @State var didTapToday: Bool = false
    @State var selectedItem: EventCellView.VM?
    @State private var showingAlert = false
    
    @ObservedObject var settings: CustomSettings = CustomSettings(numOfDays: 1, setDate: Date())
    
    
    var body: some View {
        VStack(spacing: 0.0) {
            calendarHeader(height: 42.0)
            
            InfiniteCalendar<EventCellView, EventCell, CustomSettings>(events: $events, settings: settings, didTapToday: $didTapToday)
                .onCurrentDateChanged { date in
                    if currentDate.month != date.month {
                        currentDate = date
                        print("update current month: \(date)")
                    }
                }
                .onItemSelected { item in
                    
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        selectedItem = item
                    }
                    
                }
                .onEventAdded { item in
                    events.append(item)
                    selectedItem = item
                }
                .onEventMoved { item in
                    // 予約は移動しない
                    if item.isMyTask{
                        if let index = events.firstIndex(where: {$0.id == item.id}) {
                            events[index] = item
                        }
                    }else{
                        self.showingAlert = true
//                            .alert("この予定は移動できません。", isPresented: $showingAlert)
                    }
                }
                .onEventCanceled { item in
                    // 予約は削除しない
                    let index: Int? = events.firstIndex(where: {$0.id == item.id})
                    events.remove(at: index!)
                    print("Canceled some event gesture.")
                }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("この予定は移動できません。"),
                  message: Text("予約の時間変更等は、別画面から変更してください"))
        }
        .fullScreenCover(
               item: $selectedItem,
               onDismiss: {
                selectedItem = nil
               },
               content: {
                DetailCalendarView(item: $0)
//                       .overlay(
//                           RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.gray, lineWidth: 0.3)
//                       )
               }
        )
        .ignoresSafeArea(.container, edges: .bottom)
        
    }
    
    private func calendarHeader(height: CGFloat) -> some View {
        let darkGray: Color = Color(red: 95.0/255.0, green: 98.0/255.0, blue: 103.0/255.0)
        var formatter: DateFormatter {
            let df = DateFormatter()
            df.calendar = Calendar(identifier: .gregorian)
            df.locale = Locale(identifier: "ja_JP")
            df.timeZone = TimeZone(identifier:  "Asia/Tokyo")
            df.dateFormat = "MMMM"
            return df
        }
        
        return HStack(spacing: 26.0) {
            Text(formatter.string(from: currentDate))
                .font(.system(size: 17.0))
                .bold()
                .padding(.leading, 12.0)
            
            Spacer()
            Button(action: { didTapToday.toggle() }) {
                Image(systemName: "calendar")
                    .font(.system(size: 22.0))
                    .foregroundColor(darkGray)
            }
            Menu {
                Button(action: {
                    settings.updateScrollType(numOfDays: 1)
                    didTapToday.toggle()
                }, label: {
                    Label("Day", image: "day")
                })
                Button(action: {
                    settings.updateScrollType(numOfDays: 3)
                    didTapToday.toggle()
                }, label: {
                    Label("3 Day", image: "3day")
                })
                Button(action: {
                    settings.updateScrollType(numOfDays: 7)
                    didTapToday.toggle()
                }, label: {
                    Label("Week", image: "week")
                })
            } label: {
                Image(systemName: "gearshape")
                    .font(.system(size: 22.0))
                    .foregroundColor(darkGray)
            }
        }
        .padding(.horizontal, 11.0)
        .frame(height: height)
    }
}

struct MyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}
