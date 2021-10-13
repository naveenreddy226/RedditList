//
//  UIImageView+Extension.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {

    func loadImageFromUrl(urlString: String)  {

        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        } else {
           // self.image = load a default image
            let session = URLSession.shared
            guard let url = URL(string: urlString) else { return }
            let request = URLRequest(url: url)
            session.dataTask(with: request, completionHandler: { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        if let imageToCache = UIImage(data: data){
                            imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                            self.image = imageToCache
                        }
                    }
                }

                
            }).resume()
        }
    }

}
