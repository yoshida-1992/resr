
import SwiftUI


struct SegmentView: View {
    
    @State private var selectedIndex = 0
    @State public var isChecked:Bool = false
    @State public var segment_flg:Bool = true
    @State public var filter:Dictionary<String, Bool>!
    = ["filter_flg": true, "month2": false, "month3": false, "month6": false, "month12": false, "recent_6month_sales":false, "total_sales":false]
    
    @State public var message_input:Bool = false
    @State public var message_context:String = ""
    
    var body: some View {
        VStack(){
            if(self.message_input){
                MessageIkkatsuSend(message_context: $message_context)
            }else{
                Button(action: {
                    self.message_input.toggle()
                }, label: {
                    Text("グループにメッセージ内容を入力する").foregroundColor(Color.white)
                })
                .frame(width: 300, height: 50)
                .foregroundColor(Color(.white))
                .background(Color.blue.opacity(0.5))
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(.blue), lineWidth: 1.0)
                )
                
                
                // フィルタや並び替えの画面（固定）
                VStack(){
                    FilterView(filter: self.$filter)
                }
                Text("").frame(width: UIScreen.main.bounds.width,height:1).border(Color.white, width: 0.4)
                // デフォルトであかさたなを表示。
                if(self.filter["filter_flg"]!){
                    Picker("", selection: self.$selectedIndex) {
                        Text("あ")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(0)
                        Text("か")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(1)
                        Text("さ")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(2)
                        Text("た")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(3)
                        Text("な")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(4)
                        Text("は")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(5)
                        Text("ま")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(6)
                        Text("や")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(7)
                        Text("ら")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(8)
                        Text("わ")
                            .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                            .tag(9)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray)
                    VStack(){
                        if(self.selectedIndex == 0){KarteUserListForSegmentView(filter: "あ").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 1){KarteUserListForSegmentView(filter: "か").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 2){KarteUserListForSegmentView(filter: "さ").edgesIgnoringSafeArea(.all).background(Color.black)}
                        if(self.selectedIndex == 3){KarteUserListForSegmentView(filter: "た").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 4){KarteUserListForSegmentView(filter: "な").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 5){KarteUserListForSegmentView(filter: "は").edgesIgnoringSafeArea(.all).background(Color.black)}
                        if(self.selectedIndex == 6){KarteUserListForSegmentView(filter: "ま").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 7){KarteUserListForSegmentView(filter: "や").edgesIgnoringSafeArea(.all)}
                        if(self.selectedIndex == 8){KarteUserListForSegmentView(filter: "ら").edgesIgnoringSafeArea(.all).background(Color.black)}
                        if(self.selectedIndex == 9){KarteUserListForSegmentView(filter: "わ").edgesIgnoringSafeArea(.all)}
                    }
                }
                //KarteUserListForSegmentView(filter: "")
            }
        }.background(Color.black)
    }
}



//item作成するときにプロパティに一括falseでフラグつけかな。
class Customer{
    public var customer_id:String
    public var name:String
    public var final:String  // 最終施術日
    
    init(_ customer_id:String, _ name:String, _ final:String){
        self.customer_id = customer_id
        self.name = name
        self.final = final
    }
}

class CustomerObservedObject: ObservableObject{
    @Published public var customer:Customer = Customer("1","yoshida","2022年8月25日")
}


/**
 顧客カルテの顧客リスト一覧（フィルタかかってる状態のリスト表示）（元々のKarteのやつとほとんど変わらないので、どうにかif文で表示変更させたい）
 */
struct KarteUserListForSegmentView:View{
    
    @State public var test:Bool = false
    @State public var customer_id:String = ""
    @State public var isChecked:Bool = false
    //@State public var segment_flg:Bool
    
    public var filter:String
        
    var body:some View{
        VStack(){
            List{
                ForEach(1..<7){ num in
                    HStack(){
                        Image("\(num)")
                            .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 100.0, height: 100.0)
                           .clipShape(Circle())
                           .shadow(radius: 20)
                        VStack(alignment: .leading){
                            Text("氏名:吉田草太").font(.system(size: 17))
                            Text("最終施術日:2022年5月10日").font(.system(size: 17)).padding(.top, 6)
                        }
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        
                        //if(self.segment_flg){
                        Button(action: {
                            self.isChecked = !self.isChecked
                        }, label: {
                            if(self.isChecked) {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.green)
                            } else {
                                //Image(systemName: "square")
                                Rectangle().stroke(Color.white, lineWidth: 1).frame(width: 15, height: 15)
                            }
                        }).padding(.leading, 30)
                       // }
                    }
                    .listRowBackground(Color.black)
                }
            }.listStyle(PlainListStyle())
        }.frame(width: UIScreen.main.bounds.width)
    }
    
}



// 255文字以上したらエラー判定
// ここもボタンにしているけど、右スワイプでの繊維とかの方がいいか。
struct MessageIkkatsuSend:View{
    
    @Binding public var message_context:String
    
    var body:some View{
        VStack(){
            Spacer()
            Text("② 送信内容の入力")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.white)
            Spacer()
            Spacer()
            Text("個人情報や公序良俗違反となるような内容、\n嫌がらせ内容、個人を特定できるような情報\nを入力することは禁止しております。")
                .foregroundColor(Color.white)
                .padding(.top, 50)
            Text("送信したい内容を255文字以内で記載してください。")
                .foregroundColor(Color.white)
                .padding(.top, 50)
            TextField("送信内容を記載してください。（255文字以内）",text: self.$message_context)
                .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                .foregroundColor(Color.white)
                .border(Color.white, width: 1)
            HStack(){
                Button(action: {
                    
                }, label: {
                    Text("送信内容確認する").foregroundColor(Color.white)
                })
                .frame(width: 200, height: 70)
                .foregroundColor(Color(.white))
                .background(Color.red.opacity(0.5))
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(.red), lineWidth: 1.0)
                )
                .padding(.leading, 20)
                
                Button(action: {
                    
                }, label: {
                    Text("顧客一覧へ戻る").foregroundColor(Color.white)
                })
                .frame(width: 200, height: 70)
                .foregroundColor(Color(.white))
                .background(Color.blue.opacity(0.5))
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(.blue), lineWidth: 1.0)
                )
            }
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}


// 255文字以上したらエラー判定
struct MessageResultView:View{
    
    @Binding public var message_context:String
    
    var body:some View{
        VStack(){
            Text("② 送信内容の入力").padding(.top, 100)
            Text("送信したい内容を255文字以内で記載してください。")
            TextField("送信内容を記載してください。（255文字以内）",text: self.$message_context)
                .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                .foregroundColor(Color.white)
                .border(Color.white, width: 3)
            Button(action: {
                
            }, label: {
                Text("一括送信する").foregroundColor(Color.white)
            })
            .background(Color.gray)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}

