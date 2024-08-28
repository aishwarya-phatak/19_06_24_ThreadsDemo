//
//  ViewController.swift
//  19_06_24_ThreadsDemo
//
//  Created by Vishal Jagtap on 28/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        queueOperation()
    }
    
    
    @IBAction func btnClick(_ sender: Any) {
        print("Button Clicked!")
    }
    
    func queueOperation(){
        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
    
        queue.sync {
            
            for i in 0...1000{
                print("\(i ) -- Enquiry is sitting and filling enquiry form -- \(Thread.isMainThread) -- \(Thread.current.description) -- \(Thread.current.name) -- \(Thread.current.threadPriority)")
            }
        }
        
        queue.sync{
            print("Enquiry sitting with Pallavi Mam and discussing -- \(Thread.isMainThread) -- \(Thread.current.description) -- \(Thread.current.name) -- \(Thread.current.threadPriority) ")
        }
        
        DispatchQueue.main.async {
            print("Electrician call is handled by Pallavi Mam -- \(Thread.isMainThread) -- \(Thread.current.description) -- \(Thread.current.name) -- \(Thread.current.threadPriority)")
        }
        
        queue.async {
            print("Admission Process is being done by Pallavi Mam -- \(Thread.isMainThread) -- \(Thread.current.description) -- \(Thread.current.name) -- \(Thread.current.threadPriority)")
        }
    }
}
