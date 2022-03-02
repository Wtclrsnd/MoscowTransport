//
//  StopAnnotation.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 02.03.2022.
//

import Foundation
import MapKit

class StopAnnotation: NSObject, MKAnnotation {
	var title: String?
	var coordinate: CLLocationCoordinate2D
	var info: [String]

	init(title: String, coordinate: CLLocationCoordinate2D, info: [String]) {
		self.title = title
		self.coordinate = coordinate
		self.info = info
	}
}
