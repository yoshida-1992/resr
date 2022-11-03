import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
//            profileStep1View()
            EmptyView()
                .tabItem {
                    Image(systemName: "calendar")
                }.tag(0)
            MyCalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }.tag(1)
        }
        .ignoresSafeArea()
//        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}


