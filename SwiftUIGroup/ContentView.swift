//
//  ContentView.swift
//  SwiftUIGroup
//
//  Created by sss on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedColor = Color.black
    @State var fontStile = Font.Weight.regular
    @State var opacityTextValue = 1.0
    
    
    var body: some View {
        ScrollView {
            Text("The text for work")
                .foregroundColor(selectedColor)
                .font(.title)
                .fontWeight(fontStile)
                .padding(.top)
                .opacity(opacityTextValue)
            
            colorSettingsView
            fontSettingsView
            opacitySettingsView
            readDocView
            Spacer()
        }
    }
    
    var readDocView: some View {
        DisclosureGroup(content: {

            if let url = URL(string: "https://www.apple.com/ru/") {
                Link("Read", destination: url)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .padding(.top)
            }
        }, label: {
            Text("Additionaly")
        })
        .tint(.black)
        .padding()
    }
    
    var opacitySettingsView: some View {
        DisclosureGroup(content: {
            
            Stepper(label: {
                Text("Value \(opacityTextValue.formatted(.percent))")
            }, onIncrement: {
                guard opacityTextValue < 1.0 else {return}
                opacityTextValue += 0.1
            }, onDecrement: {
                guard opacityTextValue > 0 else {return }
                opacityTextValue -= 0.1
            }, onEditingChanged: { bool in
                
            })
            
            .padding(.top)
        }, label: {
            Text("Settings opacity")
        })
        .tint(.black)
        .padding()
    }
    
    
    var fontSettingsView: some View {
        DisclosureGroup(content: {
            
            ControlGroup {
                
                Button {
                    fontStile = Font.Weight.regular
                } label: {
                    Text("Regular")
                }
                
                Button {
                    fontStile = Font.Weight.bold
                } label: {
                    Text("Bold")
                }
            }
            .padding(.top)
        }, label: {
            Text("Settings font")
        })
        .tint(.black)
        .padding()
    }
    
    var colorSettingsView: some View {
            DisclosureGroup(content: {
                HStack {
                    Label {
                        Text("Choose color for the text")
                    } icon: {
                        Image(systemName: "paintpalette.fill")
                    }

                    ColorPicker("", selection: $selectedColor)
                }
                .padding(.top)
            }, label: {
                Text("Settings color")
            })
            .tint(.black)
            .padding()
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
