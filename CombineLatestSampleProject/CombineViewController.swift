//
//  CombineViewController.swift
//  CombineLatestSampleProject
//
//  Created by Akshara Unnikrishnan on 2023-02-13.
//


import UIKit
import Combine
class CombineViewController: UIViewController {
    // MARK: - Outlet connections
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var securityCodeTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    // MARK: - Declarations
    private var combineViewModel = CombineViewModel()
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSubmitButton()
    }
    /// Update submit button based on input params
    func updateSubmitButton() {
        combineViewModel.submitButtonPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: submitButton)
            .store(in: &combineViewModel.cancellable)
    }
}
// MARK: - Events
extension CombineViewController {
    @IBAction func didChangeNameField(_ sender: UITextField) {
        combineViewModel.name = sender.text ?? ""
    }
    @IBAction func didChangeSecurityField(_ sender: UITextField) {
        combineViewModel.securityCode = Int(sender.text ?? "0") ?? 0
    }
    @IBAction func didChangePasswordField(_ sender: UITextField) {
        combineViewModel.password = sender.text ?? ""
    }
    @IBAction func didChangeRepeatPasswordField(_ sender: UITextField) {
        combineViewModel.repeatPassword = sender.text ?? ""
    }
}
