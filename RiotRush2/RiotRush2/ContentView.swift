//
//  ContentView.swift
//  RiotRush2
//
//  Created by school on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var s1 = 000
    @State private var s2 = 000
    @State private var s3 = 000
    @State private var s4 = 000
    @State private var s5 = 000
    @State private var s6 = 000
    @State private var s7 = 000
    @State private var s8 = 000
    @State private var s9 = 000
    
    @State private var p1 = ""
    @State private var p2 = ""
    @State private var p3 = ""
    @State private var p4 = ""
    @State private var p5 = ""
    @State private var p6 = ""
    @State private var p7 = ""
    @State private var p8 = ""
    @State private var p9 = ""
    
    
    @State private var tokens = 15
    @State private var basicLabel = ""
    @State private var betsize = 1
    @State private var helpText = ""
    @State private var totalWin = 0
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 20) {
            Button(action: {
                totalWin = 0
                if (betsize < tokens+1) {
                    helpText = ""
                    basicLabel = ""
                    let dictionary = [1: "apple",
                                      2: "lemon",
                                      3: "donut",
                                      4: "cherry",
                                      5: "blueberries"]
                    
                    s1 = Int.random(in: 1..<6)
                    s2 = Int.random(in: 1..<6)
                    s3 = Int.random(in: 1..<6)
                    s4 = Int.random(in: 1..<6)
                    s5 = Int.random(in: 1..<6)
                    s6 = Int.random(in: 1..<6)
                    s7 = Int.random(in: 1..<6)
                    s8 = Int.random(in: 1..<6)
                    s9 = Int.random(in: 1..<6)
                    
                    p1 = dictionary[s1] ?? ""
                    p2 = dictionary[s2] ?? ""
                    p3 = dictionary[s3] ?? ""
                    p4 = dictionary[s4] ?? ""
                    p5 = dictionary[s5] ?? ""
                    p6 = dictionary[s6] ?? ""
                    p7 = dictionary[s7] ?? ""
                    p8 = dictionary[s8] ?? ""
                    p9 = dictionary[s9] ?? ""
                    
                    // CHECK TOP HORIZONTAL
                    if (p1 == p2) {
                        if (p2 == p3) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK MIDDLE HORIZONTAL
                    if (p4 == p5) {
                        if (p5 == p6) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK BOTTOM HORIZONTAL
                    if (p7 == p8) {
                        if (p8 == p9) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 1st COLUMN
                    if (p1 == p4) {
                        if (p4 == p7) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 2nd COLUMN
                    if (p2 == p5) {
                        if (p5 == p8) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 3rd COLUMN
                    if (p3 == p6) {
                        if (p6 == p9) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    if (totalWin > 3) {
                        basicLabel = "BIG WIN! (+" + String(totalWin) + ")"
                    }
                    else if (totalWin > 1) {
                        basicLabel = "Winner! (+" + String(totalWin) + ")"
                    }
                    else {
                        basicLabel = ""
                        tokens -= betsize
                    }
                    
                }
                else {
                    if (tokens == 0) {
                        helpText = "Here are some more tokens"
                        tokens += 15
                    }
                    else {
                        helpText = "Decrease bet size to play!"
                    }
                }
                
            }, label: {
                Text("Spin!").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.red).cornerRadius(15)
                
            })
            
            HStack(alignment: .center, spacing: 30) {
                Image(p1).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p2).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p3).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                Image(p4).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p5).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p6).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                Image(p7).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p8).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(p9).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                //Text("")
            }
            
        }
            HStack(alignment: .center, spacing: 50) {
                Text("Tokens: " + String(tokens)).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.purple).cornerRadius(15)
                Text(basicLabel).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.blue).cornerRadius(10)
            }
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    if (betsize < tokens) {
                        betsize += 1
                        helpText = ""
                    }
                    else {
                        helpText = "You cannot bet more"
                    }
                    
                }, label: {
                    Text("Increase Bet (+1)").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.green).cornerRadius(15)
                    
                })
                Button(action: {
                    if betsize > 1 {
                        betsize -= 1
                        helpText = ""
                    }
                    else {
                        helpText = "You cannot bet below 1"
                    }
                    
                }, label: {
                    Text("Decrease Bet (-1)").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.orange).cornerRadius(15)
                    
                })
            }
            Text("Bet Size: " + String(betsize)).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.black).cornerRadius(15)
            
            Text(helpText).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.brown).cornerRadius(15)
        }
        
        
        
        
        
        
        
        
        
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
