//
//  RNCoreML.swift
//  AwesomeProject
//
//  Created by 山本雄大 on 2017/12/18.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import Foundation
import CoreML
import Vision
import UIKit

@objc(RNCoreML)
class RNCoreML: NSObject {
  
  @objc(addEvent:success:reject:)
  func addEvent(name: String, success: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
    do {
      success(name);
    } catch {
      reject(nil, nil, nil);
    }
  }
  
}
