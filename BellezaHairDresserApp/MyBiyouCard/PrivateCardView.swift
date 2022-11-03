
import SwiftUI

/**
 美容師のMy美容カードのプライベートカード
 */
struct PrivateCardView:View{
    
    @State public var showAlert = false
    @State public var toSecondView = false
    
    var body: some View{
        NavigationView(){
            VStack(){
                Text("キャッチコピー")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                    .background(Color.black)
                ZStack(){
                    Image("1").resizable()
                    VStack(alignment: .leading){
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Nakano Keiko")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                        Color.yellow
                            .mask(
                                HStack(alignment: .center, spacing: 0){
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                }
                            )
                            .frame(width: UIScreen.main.bounds.width, height: 20)
                        Group{
                            HStack(){
                                Spacer()
                                VStack(){
                                    Text("趣味・特技")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 13, weight: .bold))
                                    Button(action: {
                                        // 普通にView遷移できるといいな。ここでやるとこの中でViewを出さないといけないから。(上書きされる）
                                    }, label: {
                                        Text("サーフィン")
                                    })
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(width: 120, height: 50)
                                    .background(Color.white)
                                }
                                VStack(){
                                    Text("マイブーム")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 13, weight: .bold))
                                    Button(action: {
                                        // 普通にView遷移できるといいな。ここでやるとこの中でViewを出さないといけないから。(上書きされる）
                                        self.showAlert = true
                                    }, label: {
                                        Text("韓国アイドル")
                                    })
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(width: 120, height: 50)
                                    .background(Color.white)
                                    .alert(isPresented: $showAlert){
                                        Alert(title: Text(""), message: Text("編集画面へ進みますか？"), primaryButton: .default(Text("はい"), action: {
                                                            self.toSecondView = true
                                                        }), secondaryButton: .default(Text("いいえ")))
                                    }
                                }
                                
                                // toSecondViewがtrueになることで、それをトリガーにして表示している。BarHiddenは遷移先のdetailでタイトル分下にViewが下がるので表示崩れを防ぐ
                                NavigationLink(destination: DetailView().navigationBarHidden(true), isActive: $toSecondView){
                                    EmptyView()
                                }
                                Spacer()
                            }
                            
                            
                            
                            
    //                        Spacer()
    //                        MyBiyouCardViewStyle(subject: "  趣味1", value: "   男遊び")
    //                        Spacer()
    //                        MyBiyouCardViewStyle(subject: "  趣味2", value: "   ファッション")
    //                        HStack(){
    //                            Text("趣味2")
    //                                .foregroundColor(Color.white)
    //                                .background(
    //                                    Path { path in
    //                                        path.addLines([
    //                                            CGPoint(x: 0, y: 0),     // 起点
    //                                            CGPoint(x: 125, y: 0),
    //                                            CGPoint(x: 150, y: 25),
    //                                            CGPoint(x: 125, y: 50),
    //                                            CGPoint(x: 0, y: 50),
    //                                        ])
    //                                    }.fill(Color.black)
    //                                )
    //                                .frame(width: UIScreen.main.bounds.width*3/10, alignment: .leading)
    //                                .padding(.trailing, 2.0)
    //                                // frameを作成した上で左づめ
    //
    //                            Text("aaaa")
    //                                .background(
    //                                    Path { path in
    //                                        path.addLines([
    //                                           CGPoint(x: 0, y: 0),
    //                                           CGPoint(x: UIScreen.main.bounds.width-100, y: 0),
    //                                           CGPoint(x: UIScreen.main.bounds.width-75, y: 25),
    //                                           CGPoint(x: UIScreen.main.bounds.width-100, y: 50),
    //                                           CGPoint(x: 0, y: 50),
    //                                           CGPoint(x: 25, y: 25)
    //                                        ])
    //                                    }.fill(LinearGradient(
    //                                        gradient:
    //                                                .init(colors: [Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255),
    //                                                               Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)]),   // start地点の色とend地点の色
    //                                        startPoint: .init(x: 0, y: 0),    // start地点
    //                                        endPoint: .init(x: 1, y: 0)     // end地点    //このstartとend地点を変えることで、斜めグラデーションなどになる。
    //                                    ))
    //                                )
    //                        }
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*3/5,
                        alignment: .bottom)
                }
            }
            .navigationBarHidden(true)
        }
    }
}


/**
 美容カードの各項目のViewスタイル
 */
struct MyBiyouCardViewStyle:View{
    public var subject:String
    public var value:String
    
    var body: some View{
        HStack(){
            Text("\(self.subject)")
                .foregroundColor(Color.white)
                .background(
                    Path { path in
                        path.addLines([
                            CGPoint(x: 0, y: 0),     // 起点
                            CGPoint(x: 125, y: 0),
                            CGPoint(x: 150, y: 25),
                            CGPoint(x: 125, y: 50),
                            CGPoint(x: 0, y: 50),
                        ])
                    }.fill(Color.black)
                )
                .frame(width: UIScreen.main.bounds.width*3/10, alignment: .leading)
                .padding(.trailing, 0.0)
                // frameを作成した上で左づめ
            
            Text("\(self.value)")
                .background(
                    Path { path in
                        path.addLines([
                           CGPoint(x: 0, y: 0),
                           CGPoint(x: UIScreen.main.bounds.width-100, y: 0),
                           CGPoint(x: UIScreen.main.bounds.width-75, y: 25),
                           CGPoint(x: UIScreen.main.bounds.width-100, y: 50),
                           CGPoint(x: 0, y: 50),
                           CGPoint(x: 25, y: 25)
                        ])
                    }.fill(LinearGradient(
                        gradient:
                                .init(colors: [Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255),
                                               Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)]),   // start地点の色とend地点の色
                        startPoint: .init(x: 0, y: 0),    // start地点
                        endPoint: .init(x: 1, y: 0)     // end地点    //このstartとend地点を変えることで、斜めグラデーションなどになる。
                    ))
                )
        }
    }
}


struct PrivateCardView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateCardView()
    }
}


