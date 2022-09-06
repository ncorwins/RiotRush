//
//  ContentView.swift
//  RiotRush2
//
//  Created by Nathan Corwin - Shah on 9/3/22.
//

import SwiftUI
import Foundation

class NSMutableArray : NSArray {}

struct ContentView: View {
    
    @State public var tokens = 15
    @State private var basicLabel = ""
    @State private var betsize = 1
    @State private var helpText = ""
    @State private var totalWin = 0
    @State private var slots: [String] = ["","","","","","","","","",""]
    @State private var winners: [Color] = [Color.white, Color.white, Color.white, Color.white, Color.white, Color.white,
                                           Color.white, Color.white, Color.white, Color.white, Color.white, Color.white,
                                           Color.white, Color.white, Color.white, Color.white, Color.white, Color.white,
                                           Color.white, Color.white, Color.white, Color.white, Color.white, Color.white,
                                           Color.white, Color.white, Color.white, Color.white, Color.white, Color.white,
                                           Color.white, Color.white, Color.white, Color.white, Color.white, Color.white]
    @State private var slotAmount = 9
    @State private var powerup1 = false
    @State private var powerup2 = false
    @State private var powerup3 = false
    @State private var activator = false
    @State private var turnsActive = 0
    @State private var normalColor = Color.gray
    @State private var winningColor = Color.green
    @State private var root = 3
    
    //@StateObject var functions = Functions()
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 20) {
                Button(action: {
                    totalWin = 0
                    if (betsize < tokens + 1) {
                        helpText = ""
                        basicLabel = ""
                        let dictionary = ["1": "apple",
                                          "2": "lemon",
                                          "3": "donut",
                                          "4": "cherry",
                                          "5": "blueberries"]
                        slots = []
                        winners = [normalColor, normalColor, normalColor, normalColor, normalColor, normalColor,
                                   normalColor, normalColor, normalColor, normalColor, normalColor, normalColor,
                                   normalColor, normalColor, normalColor, normalColor, normalColor, normalColor,
                                   normalColor, normalColor, normalColor, normalColor, normalColor, normalColor,
                                   normalColor, normalColor, normalColor, normalColor, normalColor, normalColor,
                                   normalColor, normalColor, normalColor, normalColor, normalColor, normalColor]
                        
                        
                        // POWER UP
                        if (activator) {
                            if turnsActive == 0 {
                                powerup1 = true
                                turnsActive  += 1
                                helpText = "2 FREE SPIN(S)"
                            }
                            else if turnsActive == 1 {
                                powerup1 = false
                                powerup2 = true
                                turnsActive  += 1
                                helpText = "1 FREE SPIN(S)"
                            }
                            else if turnsActive == 2 {
                                powerup2 = false
                                powerup3 = true
                                turnsActive  += 1
                            }
                            else {
                                powerup3 = false
                                activator = false
                                turnsActive = 0
                            }
                        }
                        
                        // SLOT AMOUNTS
                        if (powerup3) {
                            slotAmount = 36
                        }
                        else if (powerup2) {
                            slotAmount = 25
                        }
                        else if (powerup1) {
                            slotAmount = 16
                        }
                        else {
                            slotAmount = 9
                        }
                        
                        
                        
                        
                        for _ in 0...(slotAmount  -  1) {
                            var num = (String(Int.random(in: 1..<6)))
                            num = dictionary[num] ?? "0"
                            slots.append(num)
                        }
                        
                        // CHECK LINEAR WINS
                        for i in 0...(slotAmount  -  1) {
                            root = Int((Double(slotAmount)  *  1.00).squareRoot())
                            if root == 3 {
                                if (i == 0 || i == root || i == root * 2) {
                                    if (slots[i] == slots[i + 1] && slots[i + 1] == slots[i + 2]) {
                                        winners[i] = winningColor
                                        winners[i + 1] = winningColor
                                        winners[i + 2] = winningColor
                                        totalWin  += totalWin  +  betsize * 3
                                        tokens  += betsize * 3
                                    }
                                }
                                if (i == 0 || i == 1 || i == 2) {
                                    if (slots[i] == slots[i + 3] && slots[i + 3] == slots[i + 6]) {
                                        totalWin  += totalWin  +  betsize * 3
                                        tokens  += betsize * 3
                                        winners[i] = winningColor
                                        winners[i + 3] = winningColor
                                        winners[i + 6] = winningColor
                                    }
                                }
                            }
                            if root == 4 {
                                if (i == 0 || i == root || i == root * 2 || i == root * 3) {
                                    if (slots[i] == slots[i + 1] && slots[i + 1] == slots[i + 2] && slots[i + 2] == slots[i + 3]) {
                                        totalWin  += totalWin  +  betsize * 4
                                        tokens  += betsize * 4
                                        winners[i] = winningColor
                                        winners[i + 1] = winningColor
                                        winners[i + 2] = winningColor
                                        winners[i + 3] = winningColor
                                    }
                                }
                                if (i == 0 || i == 1 || i == 2 || i == 3) {
                                    if (slots[i] == slots[i + 4] && slots[i + 4] == slots[i + 8] && slots[i + 8] == slots[i + 12]) {
                                        totalWin  += totalWin  +  betsize * 4
                                        tokens  += betsize * 4
                                        winners[i] = winningColor
                                        winners[i + 4] = winningColor
                                        winners[i + 8] = winningColor
                                        winners[i + 12] = winningColor
                                    }
                                }
                            }
                            if root == 5 {
                                if (i == 0 || i == root || i == root * 2 || i == root * 3 || i == root * 4) {
                                    if (slots[i] == slots[i + 1] && slots[i + 1] == slots[i + 2] && slots[i + 2] == slots[i + 3] && slots[i + 3] == slots[i + 4]) {
                                        totalWin  += totalWin  +  betsize * 5
                                        tokens  += betsize * 5
                                        winners[i] = winningColor
                                        winners[i + 1] = winningColor
                                        winners[i + 2] = winningColor
                                        winners[i + 3] = winningColor
                                        winners[i + 4] = winningColor
                                    }
                                }
                                if (i == 0 || i == 1 || i == 2 || i == 3 || i == 4) {
                                    if (slots[i] == slots[i + 5] && slots[i + 5] == slots[i + 10] && slots[i + 10] == slots[i + 15] && slots[i + 15] == slots[i + 20]) {
                                        totalWin  += totalWin  +  betsize * 5
                                        tokens  += betsize * 5
                                        winners[i] = winningColor
                                        winners[i + 5] = winningColor
                                        winners[i + 10] = winningColor
                                        winners[i + 15] = winningColor
                                        winners[i + 20] = winningColor
                                    }
                                }
                            }
                            if root == 6 {
                                if (i == 0 || i == root || i == root * 2 || i == root * 3 || i == root * 4 || i == root * 5) {
                                    if (slots[i] == slots[i + 1] && slots[i + 1] == slots[i + 2] && slots[i + 2] == slots[i + 3] && slots[i + 3] == slots[i + 4] && slots[i + 4] == slots[i + 5]) {
                                        totalWin  += totalWin  +  betsize * 6
                                        tokens  += betsize * 6
                                        winners[i] = winningColor
                                        winners[i + 1] = winningColor
                                        winners[i + 2] = winningColor
                                        winners[i + 3] = winningColor
                                        winners[i + 4] = winningColor
                                        winners[i + 5] = winningColor
                                    }
                                }
                                if (i == 0 || i == 1 || i == 2 || i == 3 || i == 4 || i == 5) {
                                    if (slots[i] == slots[i + 6] && slots[i + 6] == slots[i + 12] && slots[i + 12] == slots[i + 18] && slots[i + 18] == slots[i + 24] && slots[i + 24] == slots[i + 30]) {
                                        totalWin  += totalWin  +  betsize * 6
                                        tokens  += betsize * 6
                                        winners[i] = winningColor
                                        winners[i + 6] = winningColor
                                        winners[i + 12] = winningColor
                                        winners[i + 18] = winningColor
                                        winners[i + 24] = winningColor
                                        winners[i + 30] = winningColor
                                    }
                                }
                            }
                        }
                        
                        
                        
                        if (totalWin > 3 * betsize) {
                            basicLabel = "Big Win! ( + "  +  String(totalWin)  +  ")"
                        }
                        else if (totalWin > 1) {
                            basicLabel = "Winner! ( + "  +  String(totalWin)  +  ")"
                        }
                        else {
                            basicLabel = ""
                            if (!activator) {
                                tokens  -= betsize
                            }
                        }
                        
                        if (!activator) {
                            if (slots[4] == "donut") {
                                helpText = "POWERUP ENABLED!\n + 3 FREE SPINS"
                                activator = true
                            }
                        }
                        
                    }
                    else {
                        if (tokens == 0) {
                            helpText = "Here are some more tokens"
                            tokens  += 15
                        }
                        else {
                            helpText = "Decrease bet size to play!"
                        }
                    }
                    
                }, label: {
                    Text("Spin!").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.red).cornerRadius(15).font(.system(size: 36))
                    
                })
            }
            Group {
                VStack(alignment: .center, spacing: 8) {
                    let wxhHelp = ((root - 3) * 4)
                    let opacityHelp = (Double(root)) / 10.0
                    let wxh = CGFloat(64 - wxhHelp) // 3: 64, 4: 60, 5: 56, 6: 52
                    let opacity = (opacityHelp - 0.1) // 3: .2, 4: .3, 5: .4, 6: .5
                    let space = CGFloat(20  -  root * 2)
                    
                    // FIRST ROW
                    
                    HStack(alignment: .center, spacing: space) {
                        ForEach((0...(root - 1)), id: \.self) {
                                Image(slots[($0)]).resizable()
                                    .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                            }
                    }
                    // SECDOND ROW
                    HStack(alignment: .center, spacing: space) {
                        ForEach(((root)...(root*2 - 1)), id: \.self) {
                                Image(slots[($0)]).resizable()
                                    .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                            }
                    }
                    // THIRD ROW
                    HStack(alignment: .center, spacing: space) {
                        ForEach(((root*2)...(root*3 - 1)), id: \.self) {
                                Image(slots[($0)]).resizable()
                                    .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                            }
                    }
                    
                    // FOURTH ROW
                    HStack(alignment: .center, spacing: space) {
                        if (root > 3) {
                            ForEach(((root*3)...(root*4 - 1)), id: \.self) {
                                    Image(slots[($0)]).resizable()
                                        .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                                }
                        }
                    }
                    
                    // FIFTH ROW
                    HStack(alignment: .center, spacing: space) {
                        if (root > 4) {
                            ForEach(((root*4)...(root*5 - 1)), id: \.self) {
                                    Image(slots[($0)]).resizable()
                                        .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                                }
                        }
                    }
                    
                    // SIXTH ROW
                    HStack(alignment: .center, spacing: space) {
                        if (root > 5) {
                            ForEach(((root*5)...(root*6 - 1)), id: \.self) {
                                    Image(slots[($0)]).resizable()
                                        .frame(width: wxh, height: wxh).background(winners[($0)].opacity(opacity))
                                }
                        }
                    }
                }
            }
            
            HStack(alignment: .center, spacing: 50) {
                Text("Tokens: "  +  String(tokens)).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.purple).cornerRadius(15)
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
                        betsize  += 1
                        helpText = ""
                    }
                    else {
                        helpText = "You cannot bet more"
                    }
                    
                }, label: {
                    Text("Increase Bet ( + 1)").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.green).cornerRadius(15)
                    
                })
                Button(action: {
                    if betsize > 1 {
                        betsize  -= 1
                        helpText = ""
                    }
                    else {
                        helpText = "You cannot bet below 1"
                    }
                    
                }, label: {
                    Text("Decrease Bet ( - 1)").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.orange).cornerRadius(15)
                    
                })
            }
            Text("Bet Size: "  +  String(betsize)).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.black).cornerRadius(15)
            
            if (helpText == "") {
                Text("..........").fontWeight(.heavy).foregroundColor(.white).padding().cornerRadius(15)
            }
            else {
                Text(helpText).fontWeight(.heavy).foregroundColor(.white).padding().background(Color.brown).cornerRadius(15).frame(maxHeight: 100, alignment: .top)
            }
        }
        
        
        
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
