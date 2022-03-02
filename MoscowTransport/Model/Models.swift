//
//  Models.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import Foundation

struct StopsData: Codable {
	let data: [Stop]
}

// MARK: - Datum
struct Stop: Codable {
	let id: String
	let lat, lon: Double
	let name: String
	let type: TypeElement
	let routeNumber, color, routeName, subwayID: String?
	let shareURL: String
	let wifi, usb: Bool
	let transportType: Bool?
	let transportTypes: [TypeElement]
	let isFavorite: Bool
	let icon: String?
	let mapIcon: String?
	let mapIconSmall: String?
	let cityShuttle, electrobus: Bool

	enum CodingKeys: String, CodingKey {
		case id, lat, lon, name, type, routeNumber, color, routeName
		case subwayID = "subwayId"
		case shareURL = "shareUrl"
		case wifi, usb, transportType, transportTypes, isFavorite, icon, mapIcon, mapIconSmall, cityShuttle, electrobus
	}
}

enum TypeElement: String, Codable {
	case bus = "bus"
	case mcd = "mcd"
	case publicTransport = "public_transport"
	case subwayHall = "subwayHall"
	case train = "train"
	case tram = "tram"
}

// MARK: - CurrentStop
struct CurrentStop: Codable{
	var id: String?
	var name: String?
	var type: String?
	var wifi: Bool?
	var commentTotalCount: Int?
	var routePath: [RoutePath]?
	var color: String?
	var routeNumber: String?
	var isFavorite: Bool?
	var shareURL: String?
	var lat: Double?
	var lon: Double?
	var cityShuttle: Bool?
	var electrobus: Bool?
	var transportTypes: [String]?
	var regional: Bool?
}

// MARK: - RoutePath
struct RoutePath: Codable {
	var id: String?
	var routePathID: String?
	var type: String?
	var number: String?
	var timeArrivalSecond: [Int]?
	var timeArrival: [String]?
	var lastStopName: String?
	var isFifa: Int?
	var weight: Int?
	var byTelemetry: Int?
	var color: String?
	var fontColor: String?
	var cityShuttle: Bool?
	var electrobus: Bool?
	var tmIDS: [Int]?
	var externalForecastTime: [ExternalForecastTime]?
	var byTelemetryArray: [Int]?
	var sberShuttle: Bool?
	var isFavorite: Bool?
}

// MARK: - ExternalForecastTime
struct ExternalForecastTime: Codable {
	var time: Int?
	var byTelemetry: Int?
	var tmID: Int?
	var routePathID: String?
}
