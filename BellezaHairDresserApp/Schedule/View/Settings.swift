import Foundation
import SwiftUI
import InfiniteCalendar

class CustomSettings: ICSettings {
    typealias DateHeaderView = CustomDateHeaderView
    typealias DateHeader = CustomDateHeader

    @Published public var numOfDays: Int = 1
    @Published public var initDate: Date = Date()
    @Published public var scrollType: ScrollType = .pageScroll
    @Published public var moveTimeMinInterval: Int = 15
    @Published public var timeRange: (startTime: Int, endTime: Int) = (1, 23)
    @Published public var withVibrateFeedback: Bool = true
    @Published public var datePosition: ICViewUI.DatePosition = .left

    required public init() {}

    init(numOfDays: Int, setDate: Date) {
        self.numOfDays = numOfDays
        initDate = setDate
        scrollType = (numOfDays == 1 || numOfDays == 7) ? .pageScroll : .sectionScroll
    }

    func updateScrollType(numOfDays: Int) {
        self.numOfDays = numOfDays
        scrollType = (numOfDays == 1 || numOfDays == 7) ? .pageScroll : .sectionScroll
    }
}

class CustomDateHeader: ICDateHeader<CustomDateHeaderView> {}

struct CustomDateHeaderView: ICDateHeaderView {
    /// When you create custom DateHeader, should set `ICDateHeaderItem` to get property
    public typealias Item = ICDateHeaderItem
    
    var item: Item
    
    var isToday: Bool { return item.date.startOfDay == Date().startOfDay }
    var weekDay: String {
        let weekday = Calendar.current.component(.weekday, from: item.date) - 1
        let weekdayString = DateFormatter().shortWeekdaySymbols[weekday].uppercased()
        return String(weekdayString)
    }
    
    private let accentRed = Color.blue.opacity(1)
    
    public init(_ item: Item) {
        self.item = item
    }
    
    public var body: some View {
        VStack(spacing: 0.2){
            Text(weekDay)
                .font(.system(size: 10))
                .foregroundColor(isToday ? .blue : Color.black.opacity(0.7))
            VStack{
                Text("\(item.date.day)")
                    .font(.system(size: 17))
                    .foregroundColor(isToday ? .white : .black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: 36.0, height: 36.0)
                    .foregroundColor(isToday ? accentRed : .clear)
                    .cornerRadius(75)
            )
        }
    }
}

struct CustomDateHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}
