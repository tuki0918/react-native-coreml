//
//  RNCoreML.swift
//  AwesomeProject
//
//  Created by 山本雄大 on 2017/12/18.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import Foundation
import Vision
import CoreML

@objc(RNCoreML)
class RNCoreML: NSObject {
  
  @objc(predict:findEventsWithResolver:rejecter:)
  func predict(source: String, resolve: @escaping RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
    do {
      
      // https://dev.classmethod.jp/smartphone/ios-11-vision-framework-coreml/
      guard let model = try? VNCoreMLModel(for: MobileNet().model!) else {
        fatalError("Error create VMCoreMLModel")
      }
      
      // リクエスト（VNCoreMLRequest）の生成とハンドラ処理
      let request = VNCoreMLRequest(model: model) { request, error in
        // オブザーバ（VNClassificationObservation）による解釈
        guard let results = request.results as? [VNClassificationObservation] else {
          fatalError("Error results")
        }
        if let classification = results.first {
          resolve([
            "identifier": classification.identifier,
            "confidence": classification.confidence
            ])
          return
        } else {
          fatalError("Error results")
        }
      }
      
      // URLを読み込み
      let imageURL = URL(string: source)
      
      // CIImageへの変換
      guard let ciImage = CIImage(contentsOf: imageURL!) else {
        fatalError("Error convert CIImage")
      }
      
      // ハンドラの生成と実行
      let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
      guard (try? handler.perform([request])) != nil else {
        fatalError("Error handler.perform")
      }
      
    } catch {
      reject(nil, nil, nil);
    }
  }
  
}
