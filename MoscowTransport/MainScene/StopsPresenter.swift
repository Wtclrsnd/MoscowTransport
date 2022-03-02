//
//  StopsPresenter.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 02.03.2022.
//

import Foundation

protocol StopsViewControllerProtocol: AnyObject {
	func getData(stops: [Stop])
}

final class StopsPresenter: StopsPresenterProtocol {

	weak var output: StopsViewControllerProtocol?

	func getData(stops: [Stop]) {
		output?.getData(stops: stops)
	}
}
