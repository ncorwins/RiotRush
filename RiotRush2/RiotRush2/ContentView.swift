//
//  ContentView.swift
//  RiotRush2
//
//  Created by school on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var s1 = ""
    @State private var s2 = ""
    @State private var s3 = ""
    @State private var s4 = ""
    @State private var s5 = ""
    @State private var s6 = ""
    @State private var s7 = ""
    @State private var s8 = ""
    @State private var s9 = ""
    
    
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
                    let dictionary = ["1": "apple",
                                      "2": "lemon",
                                      "3": "donut",
                                      "4": "cherry",
                                      "5": "blueberries"]
                    
                    s1 = String(Int.random(in: 1..<6))
                    s2 = String(Int.random(in: 1..<6))
                    s3 = String(Int.random(in: 1..<6))
                    s4 = String(Int.random(in: 1..<6))
                    s5 = String(Int.random(in: 1..<6))
                    s6 = String(Int.random(in: 1..<6))
                    s7 = String(Int.random(in: 1..<6))
                    s8 = String(Int.random(in: 1..<6))
                    s9 = String(Int.random(in: 1..<6))
                    
                    s1 = dictionary[s1] ?? ""
                    s2 = dictionary[s2] ?? ""
                    s3 = dictionary[s3] ?? ""
                    s4 = dictionary[s4] ?? ""
                    s5 = dictionary[s5] ?? ""
                    s6 = dictionary[s6] ?? ""
                    s7 = dictionary[s7] ?? ""
                    s8 = dictionary[s8] ?? ""
                    s9 = dictionary[s9] ?? ""
                    
                    // CHECK TOP HORIZONTAL
                    if (s1 == s2) {
                        if (s2 == s3) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK MIDDLE HORIZONTAL
                    if (s4 == s5) {
                        if (s5 == s6) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK BOTTOM HORIZONTAL
                    if (s7 == s8) {
                        if (s8 == s9) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 1st COLUMN
                    if (s1 == s4) {
                        if (s4 == s7) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 2nd COLUMN
                    if (s2 == s5) {
                        if (s5 == s8) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    // CHECK 3rd COLUMN
                    if (s3 == s6) {
                        if (s6 == s9) {
                            tokens += betsize*3
                            totalWin = totalWin + betsize*3
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    if (totalWin > 3) {
                        basicLabel = "Big Win! (+" + String(totalWin) + ")"
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
                Text("Spin!").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.red).cornerRadius(15).font(.system(size: 36))
                
            })
            
            HStack(alignment: .center, spacing: 30) {
                Image(s1).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s2).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s3).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                Image(s4).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s5).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s6).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                Image(s7).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s8).resizable()
                    .frame(width: 64.0, height: 64.0)
                Image(s9).resizable()
                    .frame(width: 64.0, height: 64.0)
            }
            HStack(alignment: .center, spacing: 30) {
                //Text("")
            }
            
        }
            HStack(alignment: .center, spacing: 50) {
                Text("Tokens: " + String(tokens)).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.purple).cornerRadius(15)
                if (basicLabel == "") {
                    Text("..................").fontWeight(.heavy).foregroundColor(.white).padding().cornerRadius(10)
                }
                else {
                    Text(basicLabel).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.blue).cornerRadius(10)
                }

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
            
            if (helpText == "") {
                Text("..........").fontWeight(.heavy).foregroundColor(.white).padding().cornerRadius(15)
            }
            else {
                Text(helpText).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.brown).cornerRadius(15)
            }
        }
        
        
        
        
        
        
        
        
        
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
