//
//  ViewController.swift
//  Fitness360
//
//  Created by Sam KC on 3/29/20.
//  Copyright © 2020 BitBoard. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins
import AWSMobileClient

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checklogin()
        
    }


}



// Function to add data to Database (Mongodb)


func apiMutate() {
    let note = Users(name: "content")
    Amplify.API.mutate(of: note, type: .create) { (event) in
        switch event {
        case .completed(let result):
            switch result {
            case .success(let note):
                print("API Mutate successful, created note: \(note)")
            case .failure(let error):
                print("Completed with error: \(error.errorDescription)")
            }
        case .failed(let error):
            print("Failed with error \(error.errorDescription)")
        default:
            print("Unexpected event")
        }
    }
}


func checklogin() {
    AWSMobileClient.default().initialize { (userState, error) in
        if let userState = userState {
            print("UserState: \(userState.rawValue)")
        } else if let error = error {
            print("error: \(error.localizedDescription)")
        }
    }
}



