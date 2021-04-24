//
//  YumemiWeatherFetchingRepository.swift
//  IosTraining
//
//  Created by 岡優志 on 2021/04/23.
//

import Foundation
import YumemiWeather

private enum YumemiDTO: String {
    case sunny = "sunny"
    case cloudy = "cloudy"
    case rainy = "rainy"
}

struct YumemiWeatherFetchingRepository: WeatherFethcingRepositoryProtocol {
    func fetch(at area: String, completion: (Result<Weather, WeatherFethcingError>) -> Void) {
        do {
            let name = try YumemiWeather.fetchWeather(at: area)
            guard let dto = YumemiDTO(rawValue: name) else {
                completion(.failure(.parserError))
                return
            }

            completion(.success(Weather(dto: dto)))
        } catch let yumemiError as YumemiWeatherError {
            completion(.failure(WeatherFethcingError(yumemiError: yumemiError)))
        } catch {
            completion(.failure(WeatherFethcingError.unknown))
        }
    }
}

private extension Weather {
    init(dto: YumemiDTO) {
        switch dto {
        case .cloudy:
            self = Weather.cloudy
        case .rainy:
            self = Weather.rainy
        case .sunny:
            self = Weather.sunny
        }
    }
}

private extension WeatherFethcingError {
    init(yumemiError: YumemiWeatherError) {
        switch yumemiError {
        case .invalidParameterError:
            self = WeatherFethcingError.invalidRequest
        case .jsonDecodeError:
            self = WeatherFethcingError.parserError
        case .unknownError:
            self = WeatherFethcingError.unknown
        }
    }
}
