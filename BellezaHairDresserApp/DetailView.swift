

/**
 美容師の詳細情報登録画面 & 編集画面
 */


import SwiftUI

struct DetailView: View {
    @State private var selectedIndex = 0
    @Environment(\.editMode) var mode
    
    @ObservedObject public var hairDresser:HairDresserA = HairDresserA()
    
    init(){
        // https://stackoverflow.com/questions/57735761/how-to-change-selected-segment-color-in-swiftui-segmented-picker
        UISegmentedControl.appearance().backgroundColor = .white   // Picker全体の背景色
        UISegmentedControl.appearance().selectedSegmentTintColor = .gray     // 選択しているタグの背景色
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)  // 選択しているタグの文字の色
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)   // 選択していないタグの文字の色
    }

    var body: some View {
        VStack(){
            Picker("", selection: self.$selectedIndex) {
                Text("基本情報")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(0)
                Text("サービス情報")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(1)
                Text("店舗情報")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(2)
                Text("写真")
                    .font(.custom("BodoniSvtyTwoITCTT-Bold", size: 16))
                    .tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("Nakano Keiko").font(.system(size: 30, weight: .bold))
            Text("").frame(width: UIScreen.main.bounds.width, height: 5).border(Color.gray, width: 4)
            EditButton().frame(width: 100, height: 20).background(Color.black).foregroundColor(Color.white)
            VStack(){
                if(self.selectedIndex == 0){BasicInfoView(hairDresser: hairDresser).edgesIgnoringSafeArea(.all)}
                if(self.selectedIndex == 1){ServiceInfoView(hairDresser: hairDresser).edgesIgnoringSafeArea(.all)}
                if(self.selectedIndex == 2){StoreInfoView(hairDresser: hairDresser).edgesIgnoringSafeArea(.all)}
                if(self.selectedIndex == 3){BasicInfoView(hairDresser:hairDresser).edgesIgnoringSafeArea(.all)}
            }
        }
    }
}


class HairDresserA:ObservableObject{
    @Published var ha:HairDresserInfo = .init("Nakano Keiko", "男性", "1991年7月20日", "東京都 綾瀬", "指名数No.1!\nメンズ特化美容師", ["Instagram","Youtube"], "12年", "○○コンテスト優勝", "トータルカット", "メンズ", "ミディアム","極秘トーク", "提案型", "O型", "ラーメン巡り", "韓国アイドル", "ミスチル", "飲み会", "水色", "スターウォーズ", "長澤まさみ", "シンプル", "ZARA", "RADWIMPS",
        "Ash", "世田谷区太子堂5-20-2", "https://", "8:00-20:00", "クレジット, 電子マネー", "三軒茶屋駅　徒歩5分", "無","有","可","不可")
}

class HairDresserInfo{
    public var name:String
    public var gender:String
    public var birthday:String
    public var origin:String
    public var catch_copy:String
    public var sns:Array<String>
    //public var sns:String
    
    public var stylist_history:String
    public var jyusho:String
    public var skill:String
    public var style:String
    public var length:String
    public var conversation:String
    public var hearing:String
    
    public var blad:String
    public var hobby:String
    public var myboom:String
    public var favorite_music:String
    public var holiday:String
    public var like_color:String
    public var like_movie:String
    public var like_famous_person_and_model:String
    public var like_fashion:String
    public var like_brand:String
    public var like_artist:String
    
    public var store_name:String
    public var address:String
    public var link:String  //(URL)
    public var time:String
    public var pay:String
    public var near_station:String
    public var car_spot:String
    public var use_wifi:String
    public var take_children:String
    public var take_pet:String
    
    
    init(_ name:String,
         _ gender:String,
         _ birthday:String,
         _ origin:String,
         _ catch_copy:String,
         _ sns:Array<String>,
         //_ sns:String,
         _ stylist_history:String,
         _ jyusho:String,
         _ skill:String,
         _ style:String,
         _ length:String,
         _ conversation:String,
         _ hearing:String,
         _ blad:String,
         _ hobby:String,
         _ myboom:String,
         _ favorite_music:String,
         _ holiday:String,
         _ like_color:String,
         _ like_movie:String,
         _ like_famous_person_and_model:String,
         _ like_fashion:String,
         _ like_brand:String,
         _ like_artist:String,
         _ store_name:String,
         _ address:String,
         _ link:String,
         _ time:String,
         _ pay:String,
         _ near_station:String,
         _ car_spot:String,
         _ use_wifi:String,
         _ take_children:String,
         _ take_pet:String){
        self.name = name
        self.gender = gender
        self.birthday = birthday
        self.origin = origin
        self.catch_copy = catch_copy
        self.sns = sns
        self.stylist_history = stylist_history
        self.jyusho = jyusho
        self.skill = skill
        self.style = style
        self.length = length
        self.conversation = conversation
        self.hearing = hearing
        self.blad = blad
        self.hobby = hobby
        self.myboom = myboom
        self.favorite_music = favorite_music
        self.holiday = holiday
        self.like_color = like_color
        self.like_movie = like_movie
        self.like_famous_person_and_model = like_famous_person_and_model
        self.like_fashion = like_fashion
        self.like_brand = like_brand
        self.like_artist = like_artist
        self.store_name = store_name
        self.address = address
        self.link = link
        self.time = time
        self.pay = pay
        self.near_station = near_station
        self.car_spot = car_spot
        self.use_wifi = use_wifi
        self.take_children = take_children
        self.take_pet = take_pet
    }
    
}


/**
 基本情報のView
 */
struct BasicInfoView:View{
    
    @Environment(\.editMode) var mode
    @ObservedObject public var hairDresser:HairDresserA
    
    var body: some View{
        VStack(spacing: 20){
            ScrollView(){
                Group(){
                    VStack(spacing: 15){
                        Text("基本情報").frame(width: UIScreen.main.bounds.width, alignment: .leading).font(.system(size: 20 ,weight: .bold)).padding([.top,.leading],30)
                        Text("").frame(width: UIScreen.main.bounds.width, height: 3).border(Color.gray, width: 3)
                        makeRecord("性別","\(hairDresser.ha.gender)", self.$hairDresser.ha.gender)
                        makeRecord("年月日","\(hairDresser.ha.birthday)", self.$hairDresser.ha.birthday)
                        makeRecord("出身地","\(hairDresser.ha.origin)", self.$hairDresser.ha.origin)
                        makeRecord("キャッチコピー","\(hairDresser.ha.catch_copy)", self.$hairDresser.ha.catch_copy)
                        makeImageRecord("SNS")
                    }
                }
                Group(){
                    VStack(spacing: 15){
                        Text("技術情報").frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.system(size: 20 ,weight: .bold)).padding([.top,.leading],30)
                        Text("").frame(width: UIScreen.main.bounds.width, height: 3).border(Color.gray, width: 3)
                        makeRecord("スタイリスト歴","\(hairDresser.ha.style)", self.$hairDresser.ha.style)
                        makeRecord("経歴・受賞歴","\(hairDresser.ha.jyusho)", self.$hairDresser.ha.jyusho)
                        makeRecord("得意な技術","\(hairDresser.ha.skill)", self.$hairDresser.ha.skill)
                        makeRecord("得意なスタイル","\(hairDresser.ha.style)", self.$hairDresser.ha.style)
                        makeRecord("得意なレングス","\(hairDresser.ha.length)", self.$hairDresser.ha.length)
                        makeRecord("施術中の会話","\(hairDresser.ha.conversation)", self.$hairDresser.ha.conversation)
                        makeRecord("ヒアリング","\(hairDresser.ha.hearing)", self.$hairDresser.ha.hearing)
                    }
                }
                Group(){
                    VStack(spacing: 15){
                        Text("プライベート情報").frame(width: UIScreen.main.bounds.width, alignment: .leading).font(.system(size: 20 ,weight: .bold)).padding([.top,.leading],30)
                        Text("").frame(width: UIScreen.main.bounds.width, height: 3).border(Color.gray, width: 3)
                        makeRecord("血液型","\(hairDresser.ha.blad)", self.$hairDresser.ha.blad)
                        makeRecord("趣味・特技","\(hairDresser.ha.hobby)", self.$hairDresser.ha.hobby)
                        makeRecord("マイブーム","\(hairDresser.ha.myboom)", self.$hairDresser.ha.myboom)
                        makeRecord("好きな音楽","\(hairDresser.ha.favorite_music)", self.$hairDresser.ha.favorite_music)
                        makeRecord("休日の過ごし方","\(hairDresser.ha.holiday)", self.$hairDresser.ha.holiday)
                        makeRecord("好きな色","\(hairDresser.ha.like_color)", self.$hairDresser.ha.like_color)
                        makeRecord("好きな映画","\(hairDresser.ha.like_movie)", self.$hairDresser.ha.like_movie)
                        Group{
                            makeRecord("好きな芸能人・モデル","\(hairDresser.ha.like_famous_person_and_model)", self.$hairDresser.ha.like_famous_person_and_model)
                            makeRecord("好きなファッション","\(hairDresser.ha.like_fashion)", self.$hairDresser.ha.like_fashion)
                            makeRecord("好きなブランド","\(hairDresser.ha.like_brand)", self.$hairDresser.ha.like_brand)
                            makeRecord("好きなアーティスト","\(hairDresser.ha.like_artist)", self.$hairDresser.ha.like_artist)
                        }
                    }
                }
            }
        }
    }
    
    /**
     各種項目のレコードを生成
     */
    func makeRecord(_ subject:String, _ value:String, _ bind:Binding<String>)->some View{
        return HStack(){
            if(self.mode?.wrappedValue == .inactive){
                Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                Text("--").frame(width: 20, height: 20)
                Text("\(value)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
            } else {
                Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                Text("--").frame(width: 20, height: 20)
                TextField("入力してください",text: bind).frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading).border(Color.gray, width: 1)
            }
        }
    }
    
    func makeImageRecord(_ subject:String)->some View{
        return HStack(){
            Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
            Text("--").frame(width: 20, height: 20)
            Image("Instagram").resizable().frame(width: 20, height: 20)
            Image("Youtube").resizable().frame(width: 20, height: 20)
        }
    }
}






/**
 サービス情報のView
 */
struct ServiceInfoView:View{
    @Environment(\.editMode) var mode
    @ObservedObject public var hairDresser:HairDresserA

    
    var body: some View{
        VStack(spacing: 20){
            ScrollView(){
                Group(){
                    VStack(spacing: 15){
                        makeRecord("コンテンツ","雑誌、タブレット",self.$hairDresser.ha.gender)
                        makeRecord("アシスタント切替え","無",self.$hairDresser.ha.gender)
                    }
                }
                Group(){
                    VStack(spacing: 15){
                        Text("提供メニュー").frame(width: UIScreen.main.bounds.width, alignment: .leading).font(.system(size: 20 ,weight: .bold)).padding([.top,.leading],30)
                        Text("").frame(width: UIScreen.main.bounds.width, height: 3).border(Color.gray, width: 3)
                    }
                }
            }
        }
    }
    
    func makeRecord(_ subject:String, _ value:String, _ bind:Binding<String>)->some View{
        return HStack(){
            if(self.mode?.wrappedValue == .inactive){
                Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                Text("--").frame(width: 20, height: 20)
                Text("\(value)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
            }else {
                Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                Text("--").frame(width: 20, height: 20)
                TextField("入力してください",text: bind).frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading).border(Color.gray, width: 1)
            }
        }
    }

}

/**
 店舗情報のView
 */
struct StoreInfoView:View{
    @Environment(\.editMode) var mode
    @ObservedObject var hairDresser:HairDresserA
    
    var body: some View{
        VStack(){
            ScrollView(){
                Group(){
                    VStack(spacing: 15){
                        Text("店舗情報").frame(width: UIScreen.main.bounds.width, alignment: .leading).font(.system(size: 20 ,weight: .bold)).padding([.top,.leading],30)
                        Text("").frame(width: UIScreen.main.bounds.width, height: 3).border(Color.gray, width: 3)
                        Group(){
                            makeRecord("所属店舗名","\(self.hairDresser.ha.store_name)",self.$hairDresser.ha.store_name)
                            makeRecord("住所","\(self.hairDresser.ha.address)",self.$hairDresser.ha.address)
                            makeRecord("リンク","\(self.hairDresser.ha.link)",self.$hairDresser.ha.link)
                            makeRecord("営業時間","\(self.hairDresser.ha.time)",self.$hairDresser.ha.time)
                            makeRecord("支払い方法","\(self.hairDresser.ha.pay)",self.$hairDresser.ha.pay)
                            makeRecord("最寄駅","\(self.hairDresser.ha.near_station)",self.$hairDresser.ha.near_station)
                            makeRecord("駐車場","\(self.hairDresser.ha.car_spot)",self.$hairDresser.ha.car_spot)
                            makeRecord("Wi-Fi","\(self.hairDresser.ha.use_wifi)",self.$hairDresser.ha.use_wifi)
                            makeRecord("子連れ","\(self.hairDresser.ha.take_children)",self.$hairDresser.ha.take_children)
                            makeRecord("ペット","\(self.hairDresser.ha.take_pet)",self.$hairDresser.ha.take_pet)
                        }
                    }
                }
            }
        }
    }
    
    func makeRecord(_ subject:String, _ value:String, _ bind:Binding<String>)->some View{
        return
            HStack(){
                if(self.mode?.wrappedValue == .inactive){
                    Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                    Text("--").frame(width: 20, height: 20)
                    Text("\(value)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                } else {
                    Text("\(subject)").frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading)
                    Text("--").frame(width: 20, height: 20)
                    TextField("入力してください",text: bind).frame(width: UIScreen.main.bounds.width*9/20, height: 20, alignment: .leading).border(Color.gray, width: 1)
                }
            }
    }

}

