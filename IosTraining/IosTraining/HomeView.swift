//
//  HomeView.swift
//  IosTraining
//
//  Created by 岡優志 on 2021/04/13.
//

import SwiftUI

// 共通型
enum Weather {
    case sunny
    case cloudy
    case rainy
}

// 共通型
enum WeatherFethcingError: Error {
    case invalidRequest
    case parserError
    case unknown
}

// 共通型
protocol WeatherFethcingRepositoryProtocol {
    func fetch(at area: String, completion: (Result<Weather, WeatherFethcingError>) -> Void)
}

struct FakeWeatherFetchingRepository: WeatherFethcingRepositoryProtocol {
    func fetch(at area: String, completion: (Result<Weather, WeatherFethcingError>) -> Void) {
        completion(.failure(.unknown))
    }
}

struct InputWeatherFetchingRepository: WeatherFethcingRepositoryProtocol {
    private let result: Result<Weather, WeatherFethcingError>
    
    init(text: String) {
        switch text {
        case "1":
            result = .success(.cloudy)
        case "2":
            result = .success(.rainy)
        case "3":
            result = .success(.sunny)
        default:
            result = .failure(.unknown)
        }
    }
    
    func fetch(at area: String, completion: (Result<Weather, WeatherFethcingError>) -> Void) {
        completion(result)
    }
}

struct HomeView: View {
    @State var weatherImageName = "sunny"
    @State var imageColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    @State var showAlert = false
    @State var halfWidth:CGFloat = UIScreen.main.bounds.width * 0.5
    @State var errorMessage = ""
    @State var weatherText = "sunny"
    var body: some View {
        VStack {
            VStack{
                TextField("weather", text: $weatherText)
                //天気のイメージ写真
                Image(weatherImageName)
                    .resizable()
                    .foregroundColor(Color(imageColor))
                    .frame(width:halfWidth, height:halfWidth)
                //最高気温と最低気温の表示(未実装)
                HStack {
                    Text("text")
                        .font(.callout)
                        .foregroundColor(.blue)
                        .frame(width: halfWidth * 0.5)
                    Text("text")
                        .font(.callout)
                        .foregroundColor(Color.red)
                        .frame(width: halfWidth * 0.5)
                }
                .frame(width: halfWidth)
            }
            .padding(.bottom, 80)
            //リロード処理と遷移(未実装)のボタン
            HStack{
                Button(action: {}) {
                    Text("Close")
                }
                .frame(width: halfWidth * 0.5)
                
                Button(action: {
                    //                    let repository: WeatherFethcingRepositoryProtocol = YumemiWeatherFetchingRepository()
                    let repository: WeatherFethcingRepositoryProtocol = InputWeatherFetchingRepository(text: weatherText)
                    
                    repository.fetch(at: "tokyo", completion: { result in
                        switch result {
                        case let .success(weather):
                            imageColor = weather.imageColor
                            weatherImageName = weather.weatherImageName
                        case .failure(.unknown):
                            showAlert = true
                            errorMessage = "エラー(1)です。"
                        case .failure(.invalidRequest), .failure(.parserError):
                            showAlert = true
                            errorMessage = "エラー(2)です。"
                        }
                    })
                }) {
                    Text("Reload")
                }
                .frame(width: halfWidth * 0.5)
                //アラート処理
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("エラー"),
                          message: Text("\(errorMessage)"),
                          dismissButton: .default(Text("OK")))
                }
            }
            .frame(width: halfWidth)
        }
        .offset(y: 40)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private extension Weather {
    var imageColor: UIColor {
        switch self {
        case .cloudy:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case .rainy:
            return #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        case .sunny:
            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
    }
    
    var weatherImageName: String {
        switch self {
        case .cloudy:
            return "cloudy"
        case .rainy:
            return "rainy"
        case .sunny:
            return "sunny"
        }
    }
}
