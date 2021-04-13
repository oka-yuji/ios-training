    //
    //  HomeView.swift
    //  IosTraining
    //
    //  Created by 岡優志 on 2021/04/13.
    //
    
    import SwiftUI
    
    struct HomeView: View {
        var body: some View {
            VStack {
                VStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.5, height:  UIScreen.main.bounds.width * 0.5)
                    HStack {
                        Text("text")
                            .font(.callout)
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width * 0.25)
                        Text("text")
                            .font(.callout)
                            .foregroundColor(.red)
                            .frame(width: UIScreen.main.bounds.width * 0.25)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                }
                .padding(.bottom, 80)
                
                HStack{
                    Button(action: {}) {
                        Text("Close")
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.25)
                    
                    Button(action: {}) {
                        Text("Reload")
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.25)
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
            }
            .offset(y: 40)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
