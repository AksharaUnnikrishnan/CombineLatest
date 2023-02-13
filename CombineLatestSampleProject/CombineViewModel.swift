//
//  CombineViewModel.swift
//  CombineLatestSampleProject
//
//  Created by Akshara Unnikrishnan on 2023-02-13.
//

import Combine

class CombineViewModel: ObservableObject {
    // MARK: - properties
    @Published var name: String = ""
    @Published var securityCode: Int = 0
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    /// Cancellable
    var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    /// CombineLatest
    var submitButtonPublisher: AnyPublisher<Bool,Never> {
        return Publishers.CombineLatest4($name, $securityCode, $password, $repeatPassword)
            .map { name, securityCode, password, repeatPassword in
                !name.isEmpty && password.count >= 6 && password == repeatPassword && securityCode.isMultiple(of: 3)
            }.eraseToAnyPublisher()
    }
}
