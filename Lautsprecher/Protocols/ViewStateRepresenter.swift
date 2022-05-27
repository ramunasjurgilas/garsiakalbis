//
//  ViewStateRepresenter.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI

enum ViewState<T> {
    case loading
    case loaded(T)
    case error(Error)
}

protocol ViewStateRepresenter {
    associatedtype T
    var viewState: ViewState<T> { get set }
}
