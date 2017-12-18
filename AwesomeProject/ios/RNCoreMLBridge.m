//
//  RNCoreMLBridge.m
//  AwesomeProject
//
//  Created by 山本雄大 on 2017/12/18.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNCoreML, NSObject)

RCT_EXTERN_METHOD(findEvents:(NSString *)name findEventsWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
