//
//  ViewController.swift
//  SnowShoe-Swift
//
//  Created by mluedke2 on 08/25/2015.
//  Copyright (c) 2015 mluedke2. All rights reserved.
//

import UIKit
import SnowShoe_Swift

class ViewController: UIViewController {
  
  @IBOutlet var snowShoeView: SnowShoeView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    snowShoeView.apiKey = "YOUR_API_KEY"
    snowShoeView.delegate = self
  }
}

extension ViewController: SnowShoeDelegate {
  
  func onStampRequestMade() {
    // start activity indicator, etc
  }

  func onStampResult(_ result: SnowShoeResult?) {
    if let result = result {
      if let stamp = result.stamp {
        // handle stamp
        print("stamp found! serial: \(String(describing: stamp.serial))")
      } else if let error = result.error {
        // handle snowshoe error
        print("\(String(describing: error.message))")
      }
    } else {
      // handle request error
      print("There was an error, try again.")
    }
  }
}
