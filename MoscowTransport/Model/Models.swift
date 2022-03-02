//
//  Models.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import Foundation

struct Data: Codable {
	var data: [Stop]?
}

struct Stop: Codable {
	var id: String?
	var lat: Double?
	var lon: Double?
	var name: String?
	var type: Transport?
	var routeNumber: String?
	var color: String?
	var routeName: String?
	var subwayID: String?
	var shareURL: String?
	var wifi: Bool?
	var usb: Bool?
//	var transportType: NSNull?
	var transportTypes: [Transport]?
	var isFavorite: Bool?
//	var icon: NSNull?
	var mapIcon: String?
//	var mapIconSmall: NSNull?
	var cityShuttle: Bool?
	var electrobus: Bool?
}

enum Transport: Codable {
	case bus
	case mcd
	case publicTransport
	case subwayHall
	case train
	case tram
}
