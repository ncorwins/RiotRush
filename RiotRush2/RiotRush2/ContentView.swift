//
//  ContentView.swift
//  RiotRush2
//
//  Created by school on 9/3/22.
//

import SwiftUI

class NSMutableArray : NSArray {}

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
    @State private var slots: [String] = ["","","","","","","","","",""]
    
    
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
                        slots = []
                        for i in 0...8 {
                            var num = (String(Int.random(in: 1..<6)))
                            num = dictionary[num] ?? "0"
                            slots.insert(num, at: i)
                        }
                        
                        // CHECK HORIZONTALS
                        for i in 0...8 {
                            if (i == 0 || i == 3 || i == 6) {
                                if (slots[i] == slots[i+1] && slots[i+1] == slots[i+2]) {
                                    totalWin += totalWin + betsize*3
                                    tokens += betsize*3
                                }
                            }
                            if (i == 0 || i == 1 || i == 2) {
                                if (slots[i] == slots[i+3] && slots[i+3] == slots[i+6]) {
                                    totalWin += totalWin + betsize*3
                                    tokens += betsize*3
                                }
                            }
                        }
                        
                        
                        if (totalWin > 3*betsize) {
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
            }
                HStack(alignment: .center, spacing: 30) {
                    Image(slots[0]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[1]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[2]).resizable()
                        .frame(width: 64.0, height: 64.0)
                }
                HStack(alignment: .center, spacing: 30) {
                    Image(slots[3]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[4]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[5]).resizable()
                        .frame(width: 64.0, height: 64.0)
                }
                HStack(alignment: .center, spacing: 30) {
                    Image(slots[6]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[7]).resizable()
                        .frame(width: 64.0, height: 64.0)
                    Image(slots[8]).resizable()
                        .frame(width: 64.0, height: 64.0)
                }
                HStack(alignment: .center, spacing: 30) {
                    //Text("")
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
