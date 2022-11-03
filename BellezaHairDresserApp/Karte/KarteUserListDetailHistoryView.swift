

import SwiftUI

/**
 指定した顧客の過去の施術履歴一覧
 */
struct KarteUserListDetailHistoryView:View{
    
    @State public var mo:Bool = false
    @Binding public var customer_id:String
    
    public var blur_value:CGFloat {
        if(self.mo){ return 4.0 }
        return 0
    }
    
    var body:some View{
        NavigationView{
            ZStack(){
                VStack(){
                    VStack(){
                        Image("1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        Text("相田 直希")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding(10)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                    .border(Color.black, width: 3)
                    VStack(){
                        VStack(){
                            List(){
                                Section(header: Text("2022年").foregroundColor(Color.white), content: {
                                    Button(action: {
                                        self.mo.toggle()
                                    }, label: {
                                        Text("3月1日")
                                    })
                                })
                                Section(header: Text("2021年").foregroundColor(Color.white), content: {
                                    Button(action: {
                                        self.mo.toggle()
                                    }, label: {
                                        Text("12月20日")
                                    })
                                })
                                Section(header: Text("2020年").foregroundColor(Color.white), content: {
                                    Button(action: {
                                        self.mo.toggle()
                                    }, label: {
                                        Text("1月10日")
                                    })
                                })
                            }.listStyle(PlainListStyle())
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*2/3)
                }
                .background(Color.black)
                .blur(radius: self.blur_value)

                // モーダルの表示。履歴の詳細
                if(self.mo){
                    VStack(){
                        //EmptyView.opacity(0.5)   透明なViewレイヤーを作りたかったができない。なので元々のやつを透明にする
                        HStack(){
                            Button(action: {
                                self.mo.toggle()
                            }, label: {
                                Text("戻る").foregroundColor(Color.white)
                            })
                            .frame(width: 100, height: 40)
                            .background(Color.black)
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            EditButton()
                                .foregroundColor(Color.white)
                                .frame(width: 100, height: 40)
                                .background(Color.black)
                                .cornerRadius(24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }.padding(.top, 20)
                        HistoryContent()
                    }
                    .background(Color.white)
                }
            }
        }
    }
}

/**
 指定した顧客の過去の施術履歴詳細
 */
struct HistoryContent:View{
    public var fix_width:CGFloat = UIScreen.main.bounds.width/2-10
    @Environment(\.editMode) var mode
    
    var body: some View{
        VStack(){
            HStack(){
                // 画像はaspect比率で拡大縮小とかもありだよね。
                Text("施術内容").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                HStack(){
                    Image("parm").resizable().frame(width: 50, height: 30)
                    Image("shampoo").resizable().frame(width: 50, height: 30)
                    Image("treatment").resizable().frame(width: 50, height: 30)
                }.frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("金額").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("¥ 13,900").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("カット").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("メディアム").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("カラーナンバー").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("XXXの8番").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("パーマロッド").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("XXXロッド").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("使用シャンプー").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("Core i Care 5").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("使用トリートメント").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("Core i Care 5").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
            HStack(){
                Text("施術メモ").frame(width: fix_width, height: 30, alignment: .leading)
                Text("|").frame(width: 5, height: 30)
                Text("この女性臭かった").frame(width: fix_width, height: 30, alignment: .leading)
            }.padding(.top, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 500)
        
    }
    
    
    func makeRecord(_ subject:String, _ value:String, _ bind:Binding<String>)->some View{
        return
            HStack(){
                if(self.mode?.wrappedValue == .inactive){
                    Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                    Text("|").frame(width: 5, height: 30)
                    Text("\(value)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                } else {
                    var _ = print("aaa")
                    
                    Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                    Text("|").frame(width: 50, height: 30)
                    TextField("入力してください",text: bind).frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading).border(Color.gray, width: 1)
                }
            }
    }
    
}



//struct KarteUserListDetailHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        KarteUserListDetailHistoryView()
//    }
//}


