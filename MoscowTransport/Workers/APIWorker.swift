//
//  APIWorker.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import Foundation

final class APIWorker: NSObject {
	func getStopsData(request: URLRequest, completion: @escaping ([Stop]) -> Void) {
		URLSession.shared.dataTask(with: request) { data, _, error in
			guard error == nil else {
				print(String(describing: error?.localizedDescription))
				return
			}
			guard let data = data else {
				return
			}

			print(data)

			let jsonDecoder = JSONDecoder()

			do {
				let responseObject = try jsonDecoder.decode(
					[Data].self,
					from: data)
			} catch let error {
				print(String(describing: error.localizedDescription))
			}
		}
	}
}
