//
//  ViewController.swift
//  NSURLSession
//
//  Created by Jonathan Dixon on 26/07/2016.
//  Copyright © 2016 Jonathan Dixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url:NSURL = NSURL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Elbow")!
        let session = URLSession.shared
        
        let request = URLRequest.init(url: url as URL)
        
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error
            {
                print(error.localizedDescription)
            }
            else if let httpResponse = response as? HTTPURLResponse
            {
                if httpResponse.statusCode == 200
                {
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print(dataString)
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

