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

	let sheetViewController = SheetViewController()

	override func viewDidLoad() {
		super.viewDidLoad()

		lat = stop?.lat
		lon = stop?.lon

		setUpUI()
		sheet()

		guard let lat = lat else { return }
		guard let lon = lon else { return }


		let stopAnnotation = StopAnnotation(title: stop?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))

		mapView.addAnnotation(stopAnnotation)
		mapView.showAnnotations([stopAnnotation], animated: true)
		
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		sheetViewController.dismiss(animated: true, completion: nil)
	}

	private func setUpUI() {
		view.addSubview(mapView)
		mapView.frame = view.bounds
	}

	private func sheet() {
		guard let routes = stop?.routePath else { return }
		sheetViewController.routes = routes
		sheetViewController.name = stop?.name
		sheetViewController.type = "Автобусы"
		if let sheet = sheetViewController.sheetPresentationController {
			sheet.detents = [.medium()]
		}
		present(sheetViewController, animated: true)
	}
}
