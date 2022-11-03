

import SwiftUI

/**
 顧客カルテの指定したユーザーの詳細画面
 */
struct KarteUserDetailView: View {
    
    @Binding public var customer_id:String
    @State public var check_history:Bool = false
    @State public var check_ordercard:Bool = false
    
    var body:some View{
//        NavigationView(){
            VStack(){
                VStack(){
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
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
                    Text("相田 直希")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(10)
                    Text("話が好きな子。アニメ好きで鬼滅の刃\nで盛り上がる。NG会話は特にない。").foregroundColor(Color.white).font(.system(size: 16))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*2/5)
                VStack(){
                    VStack(){
                        NavigationLink(destination: KarteUserListDetailHistoryView(customer_id: self.$customer_id), label: {
                            Text("メッセージのやりとりをする")
                        }).frame(width: 300, height: 50).background(Color.white).foregroundColor(Color.black).font(.system(size: 18, weight: .bold))
                        NavigationLink(destination: KarteUserListDetailHistoryView(customer_id: self.$customer_id), label: {
                            Text("過去の施術履歴を見る")
                        }).frame(width: 300, height: 50).background(Color.white).foregroundColor(Color.black).font(.system(size: 18, weight: .bold))
//                        NavigationLink(destination: TopMyBeautyCardView(), label: {
//                            Text("オーダーカードを見る")
//                        }).frame(width: 300, height: 50).background(Color.white).foregroundColor(Color.black).font(.system(size: 18, weight: .bold))
                        
//
//                        Button(action: {
//                            self.check_history.toggle()
//                        }, label: {Text("過去の施術履歴を見る")}).frame(width: 300, height: 50).background(Color.white).foregroundColor(Color.black).font(.system(size: 18, weight: .bold))
//                        Button(action: {
//                            self.check_ordercard.toggle()
//                        }, label: {Text("オーダーカードを見る")}).frame(width: 300, height: 50).background(Color.white).foregroundColor(Color.black).font(.system(size: 18, weight: .bold))
                    }.padding(.top,20)
                    VStack(){
                        VStack(spacing:25){
                            HStack(){
                                Spacer()
                                Text("性別")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Text("").frame(width: 3, height: 30)
                                    .border(Color.white, width: 1)
                                Text("女性")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Spacer()
                            }
                            HStack(){
                                Text("年代")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Text("").frame(width: 3, height: 30)
                                    .border(Color.white, width: 1)
                                Text("20代")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                            }
                            HStack(){
                                Text("アレルギー")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Text("").frame(width: 3, height: 30)
                                    .border(Color.white, width: 1)
                                Text("なし")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                            }
                            HStack(){
                                Text("シャンプー強度")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Text("").frame(width: 3, height: 30)
                                    .border(Color.white, width: 1)
                                Text("強め")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                            }
                            HStack(){
                                Text("施術中の過ごし方")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                                Text("").frame(width: 3, height: 30)
                                    .border(Color.white, width: 1)
                                Text("静かに過ごしたい")
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width/2-50, alignment: .leading)
                            }
                        }.frame(width: UIScreen.main.bounds.width, height: 300)
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            }
            .border(Color.white, width: 5)
            .background(Color.black)
 //           .navigationBarHidden(true)
//        }
    }
}

//struct KarteUserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        KarteUserDetailView(customer_id: "1")
//    }
//}


