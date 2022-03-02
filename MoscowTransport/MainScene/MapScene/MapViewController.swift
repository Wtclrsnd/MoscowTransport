//
//  MapViewController.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

	private lazy var mapView = MKMapView()

	var annotation: StopAnnotation?
	var lat: Double?
	var lon: Double?
	var stop: CurrentStop?

	override func viewDidLoad() {
		super.viewDidLoad()

		lat = stop?.lat
		lon = stop?.lon

		setUpUI()
	}

	private func setUpUI() {
		view.addSubview(mapView)
		mapView.frame = view.bounds
	}
}
