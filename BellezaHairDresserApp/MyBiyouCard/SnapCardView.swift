

import SwiftUI

/**
 美容師のMy美容カードのスナップカード
 */
struct SnapCardView:View{
    
    var body: some View{
        VStack(spacing: 0){
            TabView(){
                Image("1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*7/10)
                    .tag(0)
                Image("1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*7/10)
                    .tag(1)
                Image("1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*7/10)
                    .tag(2)
                Image("1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*7/10)
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(height: UIScreen.main.bounds.height*8/10)
        //.border(Color.white, width: 5)
        .background(Color.black)
        Spacer()
    }
    
}


// 今あるViewを埋めずめしたいのであれば、もう1つVStackを親View入れて、そこでspacer()を下に入れて上詰めする


struct SnapCardView_Previews: PreviewProvider {
    static var previews: some View {
        SnapCardView()
    }
}


