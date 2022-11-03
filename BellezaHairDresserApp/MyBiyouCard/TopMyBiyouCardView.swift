
import SwiftUI

/**
 美容師のMy美容カード。
 */
struct TopMyBiyouCardView: View {
    
    @State private var selectedIndex = 0

    var body: some View {
        VStack(){
            Picker("", selection: self.$selectedIndex) {
                Text("オフィシャル")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(0)
                Text("プライベート")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(1)
                Text("スナップ")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.gray)
            VStack(){
                if(self.selectedIndex == 0){OfficialCardView().edgesIgnoringSafeArea(.all)}
                if(self.selectedIndex == 1){PrivateCardView().edgesIgnoringSafeArea(.all)}
                if(self.selectedIndex == 2){SnapCardView().edgesIgnoringSafeArea(.all).background(Color.black)}
            }.border(Color.white, width: 5)
        }
        .background(Color.black)
    }
}

struct MyBiyouCard_Previews: PreviewProvider {
    static var previews: some View {
        TopMyBiyouCardView()
    }
}









