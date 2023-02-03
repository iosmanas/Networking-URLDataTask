//
//  ViewController.swift
//  Networking-URLDataTask
//
//  Created by new on 3/2/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sendPost()
//        getPosts()
        
    }


//    MARK: GET request to the server
    
    func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error {
                
                print("Oooh there was an error: \(error.localizedDescription)")
                
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response is: \(jsonResponse)")
            }
        }.resume() 
    }
    
    
    
//    MARK: POST request to the server
    
    func sendPost(){
        let params = [
        
            "title": "Manas is the best",
            "body": "This is the body off the post. Get over it faaam"
            
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let session = URLSession.shared.dataTask(with: request){
            data, response, error in
            
            if let error = error {
                print("The error was: \(error.localizedDescription)")
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response is: \(jsonResponse)")
            }
        }.resume()
    }
    
}

