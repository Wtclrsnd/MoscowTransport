//
//  Builder.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 02.03.2022.
//

import Foundation

import Foundation
import UIKit

final class Builder {

	private let apiWorker: APIWorker

	func make() -> UINavigationController {
		let viewController = StopsViewController()
		let interactor = StopsInteractor(apiWorker)
		let presenter = StopsPresenter()
		viewController.output = interactor
		interactor.output = presenter
		presenter.output = viewController

		let nav = UINavigationController(rootViewController: viewController)
		return nav
	}

	init(_ worker: APIWorker) {
		self.apiWorker = worker
	}
}
