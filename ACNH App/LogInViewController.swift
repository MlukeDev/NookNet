//
//  LogInViewController.swift
//  ACNH App
//
//  Created by Matt Luke on 3/22/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit
import AuthenticationServices

class LogInViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
  
    @IBOutlet weak var StackView: UIStackView!
    
    let defaults = UserDefaults.standard
    
     override func viewDidLoad() {
           super.viewDidLoad()

        
        
           let authorizationButton = ASAuthorizationAppleIDButton()
           
          authorizationButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchUpInside)
           StackView.addArrangedSubview(authorizationButton)
        
       }
    
    override func viewDidAppear(_ animated: Bool) {
        performExistingAccountSetupFlows()
    }

    private func performExistingAccountSetupFlows() {
        // Prepare requests for both Apple ID and password providers.
        let requests = [ASAuthorizationAppleIDProvider().createRequest(), ASAuthorizationPasswordProvider().createRequest()]
        
        // Create an authorization controller with the given requests.
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @objc private func handleLogInWithAppleIDButtonPress() {
        
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
        
            defaults.set(userIdentifier, forKey: "UserID")
            defaults.set(userFirstName, forKey: "UserFirstName")
            defaults.set(userLastName, forKey: "UserLastName")
            defaults.set(userEmail, forKey: "UserEmail")
            print("User ID: \(userIdentifier)")
            print("User First Name: \(String(userFirstName ?? "null"))")
            print("User Last Name: \(String(userLastName ?? "null"))")
            print("User Email: \(String(userEmail ?? "null"))")
            
            DispatchQueue.main.async {
               self.performSegue(withIdentifier: "signedIn", sender: self)
            }
            
            //Navigate to other view controller
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let userIdentifier = passwordCredential.user
            print("User ID: \(userIdentifier)")
            defaults.set(userIdentifier, forKey: "UserID")
            
            DispatchQueue.main.async {
               self.performSegue(withIdentifier: "signedIn", sender: self)
            }
            
            //Navigate to other view controller
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization Error: \(error)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
           return self.view.window!
       }
    
    
    
}
