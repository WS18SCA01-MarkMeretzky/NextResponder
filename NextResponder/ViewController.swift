//
//  ViewController.swift
//  NextResponder
//
//  Created by Mark Meretzky on 2/11/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {
    
    @IBOutlet weak var lastNameTextField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func firstNameReturnKeyTapped(_ sender: UITextField) {
        guard sender.resignFirstResponder() else {
            fatalError("sender did not resignFirstResponder");
        }
        
        guard lastNameTextField.window != nil else {
            //See documentation for becomeFirstResponder.
            fatalError("lastNameTextField does not belong to the current view hierarchy");
        }

        guard lastNameTextField.becomeFirstResponder() else {
            fatalError("lastNameTextField did not becomeFirstResponder");
        }

        printResponderChain(startingWith: lastNameTextField);
    }
    
    func printResponderChain(startingWith firstResponder: UIResponder?) {
        var responder: UIResponder? = firstResponder;   //firstResponder is a constant
        var i = 0;

        while responder != nil {
            print("\(i) \(type(of: responder!))");
            responder = responder!.next;
            i += 1;
        }
        
        print();
    }
}

