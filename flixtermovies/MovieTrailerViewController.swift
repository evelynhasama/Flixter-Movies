//
//  MovieTrailerViewController.swift
//  flixtermovies
//
//  Created by Evelyn Hasama on 10/2/20.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, WKUIDelegate{
    


    @IBOutlet var webView: WKWebView!
    
    var videos = [[String: Any]]()
    var movie: [String: Any]!
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://api.themoviedb.org/3/movie/"
        
        let movieID = movie["id"] as! Int
        
        let url = URL(string: baseURL + String(movieID) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.videos = dataDictionary["results"] as! [[String: Any]]
            
            let video = self.videos[0]
            
            let key = video["key"] as! String

            let playURL = URL(string: "https://www.youtube.com/watch?v=" + key)
            
            let myRequest = URLRequest(url: playURL!)
            
            self.webView.load(myRequest)
           
           }
        }
        task.resume()
        
        
        
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
