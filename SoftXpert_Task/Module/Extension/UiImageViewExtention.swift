//
//  UiImageViewExtention.swift
//  SoftXpert_Task
//
//  Created by Admin on 26/06/2022.
//

import UIKit

var imageCahs = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        let urlstring =  String(describing: url)
        if let image = imageCahs.object(forKey: urlstring as NSString) as? UIImage {
            self.image = image
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                imageCahs.setObject(image, forKey: urlstring as NSString)
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
