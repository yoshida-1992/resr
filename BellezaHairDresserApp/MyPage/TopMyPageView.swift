
/**
 美容師のマイページトップ画面
 */

import SwiftUI

struct TopMyPageView: View {
    
    @State private var toMyBiyou:Bool = false
    
    var body: some View {
        VStack(){
            if(self.toMyBiyou){
                TopMyBiyouCardView()
            } else {
            Spacer()
                HStack(){
                    // My美容師カードへの遷移
                    Button(action: {
                        self.toMyBiyou.toggle()
                    }, label: {
                        Image("1").resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        VStack(){
                            Text("中野 慶子").font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color.black)
                            Text("keiko Nakano").font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color.black)
                            Image("star")
                            
                        }
                    })
                    .frame(width: UIScreen.main.bounds.width-30, height: 150)
                    .border(Color.black, width: 1)
                    .background(Color.white)  // これ入れないと全てのviewに対して影が作られてしまう
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.black), lineWidth: 1.0)
                    )
                    .compositingGroup()
                    .shadow(color: Color.gray.opacity(0.5), radius: 1, x: 5, y: 5)
                    
                }
                Spacer()
                VStack(){
                    HStack(){
                        Image("個人情報").resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 50)
                        Spacer()
                        Text("個人登録情報の編集")
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 60)
                    .border(Color.black, width: 1)
                    .background(Color.white)  // これ入れないと全てのviewに対して影が作られてしまう
                    .compositingGroup()
                    .shadow(color: Color.gray.opacity(0.5), radius: 1, x: 5, y: 5)
                    HStack(){
                        Image("ダッシュボード").resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 50)
                        Spacer()
                        Text("顧客分析ダッシュボード")
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 60)
                    .border(Color.black, width: 1)
                    .background(Color.white)  // これ入れないと全てのviewに対して影が作られてしまう
                    .compositingGroup()
                    .shadow(color: Color.gray.opacity(0.5), radius: 1, x: 5, y: 5)
                    HStack(){
                        Image("原価入力").resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 50)
                        Spacer()
                        Text("原価入力")
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 60)
                    .border(Color.black, width: 1)
                    .background(Color.white)  // これ入れないと全てのviewに対して影が作られてしまう
                    .compositingGroup()   // ここで今までのViewをまとめる？
                    .shadow(color: Color.gray.opacity(0.5), radius: 1, x: 5, y: 5)
                    HStack(){
                        Spacer()
                        Image("退会").resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 20)
                        Spacer()
                        Text("プライバシーポリシー・退会など")
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 60)
                    .border(Color.black, width: 1)
                    .background(Color.white)  // これ入れないと全てのviewに対して影が作られてしまう
                    .compositingGroup()
                    .shadow(color: Color.gray.opacity(0.5), radius: 1, x: 5, y: 5)
                }
                Spacer()
           }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        TopMyPageView()
    }
}



