//
//  RNCoreML.swift
//  AwesomeProject
//
//  Created by 山本雄大 on 2017/12/18.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import Foundation

 @objc(RNCoreML)
 class RNCoreML: NSObject {

   @objc(findEvents:findEventsWithResolver:rejecter:)
   func findEvents(name: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
     do {
       resolve(name);
     } catch {
       reject(nil, nil, nil);
     }
   }

 }
