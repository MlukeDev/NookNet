//
//  InitialViewController.swift
//  ACNH App
//
//  Created by Matt Luke on 3/22/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit
import AuthenticationServices

class InitialViewController: UIViewController {

    let defaults = UserDefaults.standard
    var userIdentifier = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        userIdentifier = defaults.string(forKey: "UserID") ?? "null"
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
            switch credentialState {
            case .authorized:
                print("User is authorized")
                DispatchQueue.main.async {
                   self.performSegue(withIdentifier: "toApp", sender: self)
                }
                break
            case .revoked:
                print("User revoked account")
                DispatchQueue.main.async {
                   self.performSegue(withIdentifier: "toSignIn", sender: self)
                }
                break
            case .notFound:
                print("User account not found")
                DispatchQueue.main.async {
                   self.performSegue(withIdentifier: "toSignIn", sender: self)
                }
                
                break
            default:
                break
            }
        }
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
