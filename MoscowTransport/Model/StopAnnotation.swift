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

	init(title: String, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.coordinate = coordinate
	}
}
