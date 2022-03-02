//
//  StopsViewModel.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import Foundation

protocol StopsPresenterProtocol: AnyObject {
}

final class StopsInteractor: StopsInteractorProtocol {

	var output: StopsPresenterProtocol?

	private var worker: APIWorker

	init(_ worker: APIWorker) {
		self.worker = worker
	}
//	private var apiWorker: APIWorker!
//
//	private let urlString = "https://api.mosgorpass.ru/v8.2/stop"
//
//	internal lazy var stops: [Stop] = []
//
//	override init() {
//		super.init()
//		self.apiWorker = APIWorker()
//	}
//
//	func getStopsData(urlString: String, completion: @escaping (([Stop]) -> Void)) {
//		let url = URL(string: urlString)
//		guard let safeUrl = url else { return }
//		let request = URLRequest(url: safeUrl)
//
//	}
}
