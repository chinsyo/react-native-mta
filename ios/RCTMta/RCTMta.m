#import "RCTMta.h"
#import "MTA.h"
#import "MTA+Account.h"
#import "MTAConfig.h"

@interface RCTMta ()

@end

@implementation RCTMta

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startWithAppKey:(NSString *)key debug:(BOOL)debug) {
    
    [MTAConfig getInstance].debugEnable = debug;
    [MTA startWithAppkey:key];
}

RCT_EXPORT_METHOD(trackPageViewBegin:(NSString *)page) {
    [MTA trackPageViewBegin:page];
}

RCT_EXPORT_METHOD(trackPageViewEnd:(NSString *)page props:(NSDictionary *)props) {
    [MTA trackPageViewEnd:page props:props];
}

RCT_EXPORT_METHOD(trackActiveBegin) {
    [MTA trackActiveBegin];
}

RCT_EXPORT_METHOD(trackActiveEnd) {
    [MTA trackActiveEnd];
}

RCT_EXPORT_METHOD(trackError:(NSString *)error resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    MTAErrorCode code = [MTA trackError:error];
    resolve(@(code));
}

RCT_EXPORT_METHOD(trackCustomKeyValueEvent:(NSString *)eventId props:(NSDictionary *)props resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    MTAErrorCode code = [MTA trackCustomKeyValueEvent:eventId props:props];
    resolve(@(code));
}

RCT_EXPORT_METHOD(trackCustomKeyValueEventBegin:(NSString *)eventId props:(NSDictionary *)props resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    MTAErrorCode code = [MTA trackCustomKeyValueEventBegin:eventId props:props];
    resolve(@(code));
}

RCT_EXPORT_METHOD(trackCustomKeyValueEventEnd:(NSString *)eventId props:(NSDictionary *)props resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    MTAErrorCode code = [MTA trackCustomKeyValueEventEnd:eventId props:props];
    resolve(@(code));
}

RCT_EXPORT_METHOD(setAccount:(NSString *)account type:(NSInteger)type) {
    [MTA setAccount:account type:type];
}

RCT_EXPORT_METHOD(setUserProperty:(NSDictionary *)props) {
    [MTA setUserProperty:props];
}

RCT_EXPORT_METHOD(getMtaUDID:(RCTPromiseResolveBlock)resolve) {
    NSString *udid = [MTA getMtaUDID];
    resolve(udid ?: @"");
}

@end
