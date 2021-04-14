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
        @State var imageColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        var body: some View {
            VStack {
                VStack{
                    Image(weatherImageName)
                        .resizable()
                        .foregroundColor(Color(imageColor))
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
                    
                    Button(action: {
                            weatherImageName = YumemiWeather.fetchWeather()
                        switch weatherImageName {
                        case "sunny":
                            return imageColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        case "rainy":
                            return imageColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
                        default:
                            return imageColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                        }
                        
                    }) {
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
