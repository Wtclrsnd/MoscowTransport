//
//  MapViewController.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {

	private lazy var mapView = MKMapView()

	private var annotation: StopAnnotation?
	private var lat: Double?
	private var lon: Double?
	var stop: CurrentStop?

	override func viewDidLoad() {
		super.viewDidLoad()

		lat = stop?.lat
		lon = stop?.lon

		setUpUI()
		sheet()

		let stopAnnotation = StopAnnotation(title: stop?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: lon ?? 0))
	}

	private func setUpUI() {
		view.addSubview(mapView)
		mapView.frame = view.bounds
	}

	private func sheet() {
		let sheetViewController = SheetViewController()
		if let sheet = sheetViewController.sheetPresentationController {
			sheet.detents = [.medium()]
		}
		present(sheetViewController, animated: true)
	}
}
