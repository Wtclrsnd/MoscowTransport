//
//  StopsViewModel.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import Foundation

protocol StopsPresenterProtocol: AnyObject {
	func getData(stops: [Stop])
}

final class StopsInteractor: StopsInteractorProtocol {

	var output: StopsPresenterProtocol?

	private let urlString = "https://api.mosgorpass.ru/v8.2/stop"
	private var worker: APIWorker?

	init(_ worker: APIWorker) {
		self.worker = worker
	}

	//getting data of stop list
	func getData() {
		let url = URL(string: urlString)
		guard let safeUrl = url else { return }
		let request = URLRequest(url: safeUrl)
		worker?.getStopsData(request: request, completion: {stops in
			self.output?.getData(stops: stops)
		})
	}

	//here i break VIP Cycle. Sssooory...
	func getStopData(id: String, completion: @escaping (CurrentStop) -> Void) {
		let urlId = urlString + "/" + id
		let url = URL(string: urlId)
		guard let safeUrl = url else { return }
		let request = URLRequest(url: safeUrl)
		worker?.getCurrentStopData(request: request, completion: { stop in
			completion(stop)
		})
	}
}
