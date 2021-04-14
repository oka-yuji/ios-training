    //
    //  HomeView.swift
    //  IosTraining
    //
    //  Created by 岡優志 on 2021/04/13.
    //
    
    import SwiftUI
    import YumemiWeather
    
    struct HomeView: View {
        @State var weatherImageName = "sunny"
        var body: some View {
            VStack {
                VStack{
                    Image(weatherImageName)
                        .resizable()
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .frame(width: UIScreen.main.bounds.width * 0.5, height:  UIScreen.main.bounds.width * 0.5)
                    HStack {
                        Text("text")
                            .font(.callout)
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width * 0.25)
                        Text("text")
                            .font(.callout)
                            .foregroundColor(Color.red)
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
                    
                    Button(action: { weatherImageName = YumemiWeather.fetchWeather() }) {
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
