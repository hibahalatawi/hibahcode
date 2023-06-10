//
//  VisionClassifier.swift
//  Recognizlator
//
//  Created by sara ayed albogami on 21/07/1444 AH.
//

import Foundation
import CoreML
import Vision
import UIKit

class VisionClassifier {
    
    private let model: VNCoreMLModel
    private var completion: ((String, Double) -> ())?
    
    private lazy var requsets: [VNCoreMLRequest] = {
        
        let requset = VNCoreMLRequest(model: model) { (requset, error) in
        
        guard let results = requset.results as? [VNClassificationObservation] else {
            return
        }
            
        if !results.isEmpty {
            print(results.map { $0.confidence })
            if let result = results.first {
                print("\(result.identifier) \((result.confidence * 100)) %")
                self.completion!(result.identifier, Double(result.confidence))
                
            }
        }
    }
    
        requset.imageCropAndScaleOption = .centerCrop
        requset.usesCPUOnly = true
        return [requset]
    
}()
    
    init?(mlModel:MLModel) {
        if let model = try? VNCoreMLModel(for: mlModel){
            self.model = model
        } else {
            return nil
        }
    }
    
    func classify(_ image:UIImage, completion: @escaping (String, Double) -> Void){
        
        self.completion = completion
        
        DispatchQueue.global().async {
            
            guard let resizedImage = image.resizeImageTo(size: .init(width: 299, height: 299)) else { return }
            guard let cjImage = resizedImage.cgImage else { return }
            
            let handler = VNImageRequestHandler(cgImage: cjImage, options: [:])
            
            do {
                try handler.perform(self.requsets)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
