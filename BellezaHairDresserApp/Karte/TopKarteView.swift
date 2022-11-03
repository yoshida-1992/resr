

import SwiftUI

struct TopKarteView: View {
    @State private var selectedIndex = 0
    

    @State public var filter:Dictionary<String, Bool>!
    = ["filter_flg": true, "month2": false, "month3": false, "month6": false, "month12": false, "recent_6month_sales":false, "total_sales":false]
    
    // デフォルトであいうえお順表示
    @State public var isCheckList:Dictionary<String, Bool>
    = ["2ヶ月未来訪者":false, "3ヶ月未来訪者":false, "6ヶ月未来訪者":false, "12ヶ月未来訪者":false, "あいうえお順":true, "合計金額大きい順":false,
       "単価大きい順":false]
    
    @State public var karteflg:Bool = true
    @State public var messageflg:Bool = false

    
    var body: some View {
        NavigationView(){
            VStack(){
                KarteModeSelect(karte: self.$karteflg, message: self.$messageflg)
                KarteFilter2(FilterList: self.$isCheckList)
                Text("").frame(width: UIScreen.main.bounds.width,height:1).border(Color.white, width: 0.4)
                if(self.isCheckList["あいうえお順"]!){
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
                    if(self.karteflg){
                        VStack(){
                            if(self.selectedIndex == 0){KarteUserListView2(filter: "あ").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 1){KarteUserListView2(filter: "か").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 2){KarteUserListView2(filter: "さ").edgesIgnoringSafeArea(.all).background(Color.black)}
                            if(self.selectedIndex == 3){KarteUserListView2(filter: "た").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 4){KarteUserListView2(filter: "な").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 5){KarteUserListView2(filter: "は").edgesIgnoringSafeArea(.all).background(Color.black)}
                            if(self.selectedIndex == 6){KarteUserListView2(filter: "ま").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 7){KarteUserListView2(filter: "や").edgesIgnoringSafeArea(.all)}
                            if(self.selectedIndex == 8){KarteUserListView2(filter: "ら").edgesIgnoringSafeArea(.all).background(Color.black)}
                            if(self.selectedIndex == 9){KarteUserListView2(filter: "わ").edgesIgnoringSafeArea(.all)}
                        }
                    } else {
                        VStack(){
                            KarteUserListForSegmentView(filter: "や")   // もう少し構造を考えないと。中でフラグ変換だな。この親View内で結局表示リストはほぼ同じで、チェックがあるかどうかだから、それは顧客表示の中のコードで制御すれば。
                        }
                    }
                } else {
                    KarteUserListView3()
                }
            }.background(Color.black)
            .navigationBarHidden(true)
        }.navigationBarTitle("顧客リスト").foregroundColor(Color.black)
    }
}


/**
 フィルタは1つのみtrueにする。
 なので毎回チェックするたびに他のものを全てfalseにする。どのフィルタが今trueになってるかを別で持っておくのはアリかもね。
 ・単価（1回にどのくらい払ってくれる？）
 ・利用額は平均（合計/回数）　※ 期間はなし
 ・未 来訪者（最新2ヶ月きていない顧客、3,6,12）
 */
struct FilterView: View{
    
    @Binding var filter:Dictionary<String, Bool>!
    
    var body: some View{
        VStack(){
            // あかさたな、並び替え
            Button(action: {
                self.filter["filter_flg"]?.toggle()
            }, label: {
                Text("あいうえお順").foregroundColor(self.filter["filter_flg"]! ? Color.black : Color.white)
            })
            .frame(width: 150, height: 30)
            .background(self.filter["filter_flg"]! ? Color.white : Color.black)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(self.filter["filter_flg"]! ? Color.black : Color.white, lineWidth: 1)
            )
            
            // 最新2,3,6,12ヶ月の利用者絞り込み
            HStack(){
                Button(action: {
                    self.filter["month2"]?.toggle()
                }, label: {
                    Text("最新2ヶ月未来訪者").foregroundColor(self.filter["month2"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["month2"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["month2"]! ? Color.black : Color.white, lineWidth: 1)
                )
                

                Button(action: {
                    self.filter["month3"]?.toggle()
                }, label: {
                    Text("最新3ヶ月未来訪者").foregroundColor(self.filter["month3"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["month3"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["month3"]! ? Color.black : Color.white, lineWidth: 1)
                )
            }
            
            HStack(){
                Button(action: {
                    self.filter["month6"]?.toggle()
                }, label: {
                    Text("最新6ヶ月未来訪者").foregroundColor(self.filter["month6"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["month6"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["month6"]! ? Color.black : Color.white, lineWidth: 1)
                )
                
                Button(action: {
                    self.filter["month12"]?.toggle()
                }, label: {
                    Text("最新12ヶ月未来訪者").foregroundColor(self.filter["month12"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["month12"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["month12"]! ? Color.black : Color.white, lineWidth: 1)
                )
            }
            
            // 直近6ヶ月売上順
            HStack(){
                Button(action: {
                    self.filter["recent_6month_sales"]?.toggle()
                }, label: {
                    Text("直近6ヶ月売上順").foregroundColor(self.filter["recent_6month_sales"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["recent_6month_sales"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["recent_6month_sales"]! ? Color.black : Color.white, lineWidth: 1)
                )
                
                // 過去売上順
                Button(action: {
                    self.filter["total_sales"]?.toggle()
                }, label: {
                    Text("合計金額高い順").foregroundColor(self.filter["total_sales"]! ? Color.black : Color.white)
                })
                .frame(width: 150, height: 30)
                .background(self.filter["total_sales"]! ? Color.white : Color.black)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(self.filter["total_sales"]! ? Color.black : Color.white, lineWidth: 1)
                )
            }
        }
    }
}


/**
 顧客カルテの顧客リスト一覧
 */
struct KarteUserListView:View{
    
    @State public var test:Bool = false
    @State public var customer_id:String = ""
    
    public var filter:String
    
    var body:some View{
       // NavigationView(){
        VStack(){
            if(self.test){
                KarteUserDetailView(customer_id: self.$customer_id)
            } else {
                VStack(){
                    HStack(spacing: 10){
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            NavigationLink(destination: {
                                KarteUserDetailView(customer_id: self.$customer_id)
                            }, label: {
                                Image("1").resizable().frame(width: 150, height: 150)
                            }).frame(width: 150, height: 150)
                        }
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            Image("1").resizable().frame(width: 150, height: 150)
                        }
                    }
                }
                VStack(){
                    HStack(spacing: 10){
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            Image("1").resizable().frame(width: 150, height: 150)
                        }
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            Image("1").resizable().frame(width: 150, height: 150)
                        }
                        
                    }
                }
                VStack(){
                    HStack(spacing: 10){
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            Image("1").resizable().frame(width: 150, height: 150)
                        }
                        VStack(){
                            Text("ああああ").foregroundColor(Color.white).font(.system(size: 13, weight: .bold))
                            Image("1").resizable().frame(width: 150, height: 150)
                        }
                        
                    }
                }
                Spacer()
            }
        }
       // }.navigationBarTitle("顧客詳細")
    }
    
}


/**
 デフォルトは、あかさたな、、、
 あかさたな、、フィルタはフィルタ画面や並び替え画面の下に置く感じ。でデフォルトはフィルタであかさたながチェックしてある状態で、下にその選択タブが出てる状態。
 ● フィルタ：あかさたな、最新施術日が現在から2,3,6,12ヶ月経ってるユーザー
 ● 並び替え：過去の金額の大きい順に並べる
 
 */


struct KarteTopView2: View{
    
    @State private var selectedIndex = 0
    @State public var test:Bool = false
    @State public var customer_id:String = ""
    
    init(){
        UITableView.appearance().backgroundColor = UIColor.black
    }

    var body: some View {
        NavigationView(){
            VStack(){
                VStack(){
                    Button(action: {
                        
                    }, label: {
                        Text("並び替え")
                    })
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                .border(Color.white, width: 3)
                VStack(){
                    List{
                        ForEach(1..<7){ num in
                            HStack(){
                                NavigationLink(destination: KarteUserDetailView(customer_id: self.$customer_id), label: {
                                    Image("1").resizable().mask(Circle()).frame(width: 100, height: 100)
                                    VStack(alignment: .leading){
                                        Text("氏名:吉田草太")
                                        Text("最終施術日:2022年5月10日")
                                    }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .bold))
                                })
                            }.listRowBackground(Color.black)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*2/3)
                .border(Color.white, width: 3)
            }.background(Color.black)
            .navigationBarHidden(true)
        }.navigationBarTitle("顧客リスト").foregroundColor(Color.black)
    }
    
    
}




/**
 顧客カルテの顧客リスト一覧（フィルタかかってる状態のリスト表示）
 */
struct KarteUserListView2:View{
    
    @State public var test:Bool = false
    @State public var customer_id:String = ""
    
    public var filter:String
    
    var body:some View{
       // NavigationView(){
        VStack(){
            if(self.test){
                KarteUserDetailView(customer_id: self.$customer_id)
            } else {
                List{
                    ForEach(1..<7){ num in
                        HStack(){
                            NavigationLink(destination: KarteUserDetailView(customer_id: self.$customer_id), label: {
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
                            })
                        }.listRowBackground(Color.black)
                    }
                }.listStyle(PlainListStyle())
            }
        }.frame(width: UIScreen.main.bounds.width)
       // }.navigationBarTitle("顧客詳細")
    }
    
}


/**
 顧客カルテの顧客リスト一覧（フィルタかかってる状態のリスト表示）
 */
struct KarteUserListView3:View{
    
    @State public var test:Bool = false
    @State public var customer_id:String = ""
    @State public var isChecked:Bool = false
        
    var body:some View{
      //  NavigationView(){
            VStack(){
                if(self.test){
                    KarteUserDetailView(customer_id: self.$customer_id)
                } else {
                    List{
                        ForEach(1..<7){ num in
                            HStack(){
                                NavigationLink(destination: KarteUserDetailView(customer_id: self.$customer_id), label: {
                                    Image("\(num)")
                                        .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 100.0, height: 100.0)
                                       .clipShape(Circle())
                                       .shadow(radius: 20)
                                    VStack(alignment: .leading){
                                        Text("氏名:吉田草太").font(.system(size: 17))
                                        Text("最終施術日:2022年5月10日").font(.system(size: 14)).padding(.top, 10)
                                    }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .bold))
                                })
                                
//                                Button(action: {
//                                    self.isChecked = !self.isChecked
//                                    //self.flg.toggle()
//                                }, label: {
//                                    if(self.isChecked) {
//                                        Image(systemName: "checkmark.square.fill")
//                                            .foregroundColor(.green)
//                                    } else {
//                                        Image(systemName: "square")
//                                    }
//                                })
                            }
                            .listRowBackground(Color.black)
                        }
                    }.listStyle(PlainListStyle())
                }
            }.frame(width: UIScreen.main.bounds.width)
      //  }.navigationBarTitle("顧客詳細")
    }
    
}



/**
 Karteのアコーディオン型のフィルタ/並び替えメニュー
 リストのセルの背景色を変更する　https://zenn.dev/ch3cooh/articles/ios_listrowbackground_doesnot_work
 */
struct KarteFilter:View{
    
    struct FileItem: Identifiable {
        let id = UUID()
        var name: String
        var children: [FileItem]? = nil
        var isDirectory: Bool {
            return children != nil
        }
        var isChecked:Bool = false
    }
    
    // フィルタ、並び替えのメニュー
    private var AcodionMenuFilter: [FileItem] = [
        FileItem(name: "絞り込み検索",
                 children: [FileItem(name:"2ヶ月未来訪者"),FileItem(name:"3ヶ月未来訪者"),FileItem(name:"6ヶ月未来訪者"),
                            FileItem(name:"12ヶ月未来訪者")]),
        FileItem(name: "並び替え",
                 children: [FileItem(name:"あいうえお順"),FileItem(name:"合計金額大きい順"),FileItem(name:"単価大きい順")])
        ]
    
    // 各項目のチェック状況
    @State public var isCheckList:Dictionary<String, Bool>
    = ["2ヶ月未来訪者":false, "3ヶ月未来訪者":false, "6ヶ月未来訪者":false, "12ヶ月未来訪者":false, "あいうえお順":false, "合計金額大きい順":false,
       "単価大きい順":false, ]

    
    init(){
        UITableView.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View{
        VStack(){
            List(AcodionMenuFilter, children: \.children) { item in
                HStack {
                    if(item.isDirectory){
                        Text(item.name).listRowBackground(Color.blue)
                    }
                    if(!item.isDirectory){
                        Text(item.name).listRowBackground(Color.blue)
                        Spacer()
                        Button(action: {
                            self.isCheckList["\(item.name)"]! = !self.isCheckList["\(item.name)"]!
                            //item.isChecked = !item.isChecked
                        }, label: {
                            if(self.isCheckList["\(item.name)"]!) {
                            //if(item.isChecked) {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "square")
                            }
                        })
                    }
                }
            }.listStyle(GroupedListStyle())
        }
    }
}



struct KarteFilter2:View{

    // 各項目のチェック状況
//    @State public var FilterList:Dictionary<String, Bool>
//    = ["2ヶ月未来訪者":false, "3ヶ月未来訪者":false, "6ヶ月未来訪者":false, "12ヶ月未来訪者":false, "あいうえお順":false, "合計金額大きい順":false,"単価大きい順":false]
    
    @Binding public var FilterList:Dictionary<String, Bool>
    
    var body: some View{
        VStack(){
            HStack(){
                Text("フィルタ")
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView(.horizontal){
                HStack(){
                    Button(action: {
                        self.FilterList["2ヶ月未来訪者"]?.toggle()
                    }, label: {
                        Text("2ヶ月未来訪者")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["2ヶ月未来訪者"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["2ヶ月未来訪者"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["2ヶ月未来訪者"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    Button(action: {
                        self.FilterList["3ヶ月未来訪者"]?.toggle()
                    }, label: {
                        Text("3ヶ月未来訪者")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["3ヶ月未来訪者"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["3ヶ月未来訪者"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["3ヶ月未来訪者"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    Button(action: {
                        self.FilterList["6ヶ月未来訪者"]?.toggle()
                    }, label: {
                        Text("6ヶ月未来訪者")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["6ヶ月未来訪者"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["6ヶ月未来訪者"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["6ヶ月未来訪者"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    Button(action: {
                        self.FilterList["12ヶ月未来訪者"]?.toggle()
                    }, label: {
                        Text("12ヶ月未来訪者")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["12ヶ月未来訪者"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["12ヶ月未来訪者"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["12ヶ月未来訪者"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                }
            }
            Text("").frame(width: UIScreen.main.bounds.width, height: 1).border(Color.white, width: 0.2)
            HStack(){
                Text("並び替え")
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView(.horizontal){
                HStack(){
                    
                    Button(action: {
                        self.FilterList["あいうえお順"]?.toggle()
                    }, label: {
                        Text("あいうえお順")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["あいうえお順"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["あいうえお順"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["あいうえお順"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    Button(action: {
                        self.FilterList["合計金額大きい順"]?.toggle()
                    }, label: {
                        Text("合計金額大きい順")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["合計金額大きい順"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["合計金額大きい順"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["合計金額大きい順"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    Button(action: {
                        self.FilterList["単価大きい順"]?.toggle()
                    }, label: {
                        Text("単価大きい順")
                            .font(.system(size: 13))
                            .foregroundColor(self.FilterList["単価大きい順"]! ? Color.black : Color.white)
                    })
                    .frame(width: 120, height: 25)
                    .background(self.FilterList["単価大きい順"]! ? Color.white : Color.black)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(self.FilterList["単価大きい順"]! ? Color.black : Color.white, lineWidth: 1)
                    )
                    
                    
                    
                }
            }
            //Text("").frame(width: UIScreen.main.bounds.width, height: 1).border(Color.white, width: 0.2)
        }.background(Color.black)
    }
}

// あくまで画面の半分がフィルタで埋まるから、それを解決するためにアコーディオにゃドロップダウンにするのであれば、
//横スクロールにしてフィルタでもいいのでは？


struct KarteModeSelect:View{
    
    @Binding public var karte:Bool
    @Binding public var message:Bool
    
    // バインディングを配列に入れるか。
    
    var body:some View{
        HStack(){
            Button(action: {
                self.karte.toggle()
            }, label: {
                Text("カルテモード").foregroundColor(self.karte ? Color.black : Color.white)
            })
            .frame(width: 150, height: 30)
            .background(self.karte ? Color.gray : Color.black)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(self.karte ? Color.white : Color.white, lineWidth: 1)
            )
            
            Button(action: {
                self.message.toggle()
            }, label: {
                Text("一括送信モード").foregroundColor(self.message ? Color.black : Color.white)
            })
            .frame(width: 150, height: 30)
            .background(self.message ? Color.gray : Color.black)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(self.message ? Color.white : Color.white, lineWidth: 1)
            )
            
//            if(self.message){
//                Button(action: {
//                    self.message.toggle()
//                }, label: {
//                    Text("送信内容入力").foregroundColor(self.message ? Color.black : Color.white)
//                })
//                .frame(width: 150, height: 30)
//                .background(self.message ? Color.gray : Color.black)
//                .cornerRadius(24)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 24)
//                        .stroke(self.message ? Color.white : Color.white, lineWidth: 1)
//                )
//            }
        }
    }
    
}
















































