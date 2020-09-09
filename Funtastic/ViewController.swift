//
//  ViewController.swift
//  Funtastic
//
//  Created by Martin Daum on 15.07.20.
//

import UIKit
import LingoHub

final class ViewController: UIViewController {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var claimLabel: UILabel!
    @IBOutlet private(set) weak var loginButton: UIButton!
    @IBOutlet private(set) weak var signUpButton: UIButton!
    @IBOutlet private(set) weak var forgotPasswordButton: UIButton!
    
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        observer = NotificationCenter.default.addObserver(forName: .LingoHubDidUpdateLocalization, object: nil, queue: nil) { [weak self] _ in
            DispatchQueue.main.async {
                self?.updateLocalizations()
            }
        }
        
        updateLocalizations()
    }
    
    deinit {
        observer.map({ NotificationCenter.default.removeObserver($0) })
    }
    
    private func updateLocalizations() {
        claimLabel.text = NSLocalizedString("claim", comment: "")
        loginButton.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        signUpButton.setTitle(NSLocalizedString("sign_up", comment: ""), for: .normal)
        forgotPasswordButton.setTitle(NSLocalizedString("forgot_password", comment: ""), for: .normal)
    }
}
