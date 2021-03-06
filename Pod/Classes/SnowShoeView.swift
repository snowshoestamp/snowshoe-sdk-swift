//
//  SnowShoeView.swift
//  Pods
//
//  Created by Matt Luedke on 8/27/15.
//
//

import ObjectMapper

open class SnowShoeView: UIView {
    
    open var apiKey: String?
    open var delegate: SnowShoeDelegate?
    
    let baseUrl = "https://api.snowshoestamp.com/v3/stamp"
    let touchCount = 5
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupStampDetection()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStampDetection()
    }
    
    func setupStampDetection() {
        let tapRecognizer = SSTapGestureRecognizer(target: self, action: #selector(SnowShoeView.handleStamp(_:)))
        addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleStamp(_ sender: SSTapGestureRecognizer) {
        
        //Check stamp count is correct amount.
        var curTouchCount: Int? = (sender.allTouches?.count)!
        if (curTouchCount != touchCount) {
            curTouchCount = nil
        }
        
        if let apiKey = apiKey, let _ = curTouchCount {
            var stampPoints = [[Double]]()
            
            for touch in sender.allTouches! {
                let point = touch.location(in: self)
                stampPoints.append([Double(point.x), Double(point.y)])
            }
            
            //POST method
            var request = URLRequest(url: URL(string: baseUrl)!, timeoutInterval: Double.infinity)
            request.addValue(apiKey, forHTTPHeaderField: "SnowShoe-Api-Key")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            
            do {
                let bodyData = SnowShoeRequest(stampPoints)
                let bodyJson = try JSONEncoder().encode(bodyData)
                request.httpBody = bodyJson
            }
            catch {
                print("ERROR: failed to create JSON for stamp request.")
            }
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                data, response, error in
                
                guard error == nil else {
                    print("ERROR: \(error!.localizedDescription)")
                    self.delegate?.onStampResult(nil)
                    return
                }
                guard let data = data else {
                    print(String(describing: error))
                    self.delegate?.onStampResult(nil)
                    return
                }
                if (data.count == 0) {
                    print("ERROR: no data returned. Do you have the correct apiKey?")
                    self.delegate?.onStampResult(nil)
                    return
                }
                print(String(data: data, encoding: .utf8)!)

                let response = SnowShoeResult(JSONString: String(data: data, encoding: .utf8)!)
                self.delegate?.onStampResult(response)
            })
            
            task.resume()
            
            delegate?.onStampRequestMade()
            
        } else {
            if let _ = apiKey {
                
            }
            else {
                assertionFailure("error: apiKey can not be empty.")
            }
        }
    }
}
