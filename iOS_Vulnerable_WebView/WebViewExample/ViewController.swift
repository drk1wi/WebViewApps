
import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    
        self.webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        
  
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
             urlTextField.text =  self.webView.url?.absoluteString
        }
        
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear( animated )
        
        let urlString:String = "http://google.com/"
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    
        urlTextField.text = urlString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString:String = urlTextField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }
    
    

    @IBAction func forwardButtonTapped(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    

}

