

import SwiftUI

/**
 美容師のMy美容カードのオフィシャルカード
 */
struct OfficialCardView:View{
    
    var body: some View{
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
                                Text("得意スタイル")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 13, weight: .bold))
                                Button(action: {
                                    // 普通にView遷移できるといいな。ここでやるとこの中でViewを出さないといけないから。(上書きされる）
                                }, label: {
                                    Text("メンズ")
                                })
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 120, height: 50)
                                .background(Color.white)
                            }
                            VStack(){
                                Text("得意技術")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 13, weight: .bold))
                                Button(action: {
                                    // 普通にView遷移できるといいな。ここでやるとこの中でViewを出さないといけないから。(上書きされる）
                                }, label: {
                                    Text("ミディアム")
                                })
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 120, height: 50)
                                .background(Color.white)
                            }
                            VStack(){
                                Text("エリア")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 13, weight: .bold))
                                Button(action: {
                                    // 普通にView遷移できるといいな。ここでやるとこの中でViewを出さないといけないから。(上書きされる）
                                }, label: {
                                    Text("表参道")
                                })
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 120, height: 50)
                                .background(Color.white)
                            }
                            Spacer()
                        }
//                        Spacer()
//                        HStack(){
//                            // backgroundはframeの左上を基準にして
//                            Text("  得意スタイル")
//                                .foregroundColor(Color.white)
//                                .background(
//                                    Path { path in
//                                        path.addLines([
//                                           CGPoint(x: 0, y: 0),     // 起点
//                                           CGPoint(x: 125, y: 0),
//                                           CGPoint(x: 150, y: 25),
//                                           CGPoint(x: 125, y: 50),
//                                           CGPoint(x: 0, y: 50),
//                                        ])
//                                    }.fill(Color.black)
//                                )
//                                .frame(width: UIScreen.main.bounds.width*3/10,alignment: .leading)
//                                .padding(.trailing, 0.0)
//                                // frameを作成した上で左づめ
//                            Text("    カット、パーマ、トリ")   //\nで改行
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
//                                                               Color(red: 220 / 255, green: 220 / 255, blue: 200 / 255)]),   // start地点の色とend地点の色
//                                        startPoint: .init(x: 0, y: 0),    // start地点
//                                        endPoint: .init(x: 0.5, y: 0.5)     // end地点    //このstartとend地点を変えることで、斜めグラデーションなどになる。
//                                    ))
//                                )
//
//                        }
//                        Spacer()
//                        HStack(){
//                            Text("  得意技術")
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
//                                .padding(.trailing, 0.0)
//                                // frameを作成した上で左づめ
//
//                            Text("    aaaa")
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
//                        Spacer()
//                        HStack(){
//                            Text("  エリア")
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
//                                .padding(.trailing, 0.0)
//                                // frameを作成した上で左づめ
//
//                            Text("    aaaa")
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
    }
    
}

struct OfficalCard_Previews: PreviewProvider {
    static var previews: some View {
        OfficialCardView()
    }
}


