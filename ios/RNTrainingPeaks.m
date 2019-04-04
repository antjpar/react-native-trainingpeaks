#import <SafariServices/SafariServices.h>
#import <Foundation/Foundation.h>

#import "RNTrainingPeaks.h"

@implementation RNTrainingPeaks

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()


  // client_id, redirect_uri, response_type = 'code', approval_prompt = 'auto', scope = 'activity:write,read'
  RCT_EXPORT_METHOD(login:(NSString*)client_id
                    redirect_uri:(NSString*)redirect_uri
                    response_type:(NSString*)response_type
                    scope:(NSString*)scope
                    sandbox: (BOOL) sandbox
                    ) {
    NSString* sandboxUrl = @"https://oauth.sandbox.trainingpeaks.com/OAuth/Authorize";
    NSString* productionUrl = @"https://oauth.trainingpeaks.com/OAuth/Authorize";
    
    response_type = response_type == NULL ? @"code" : response_type;
    scope = scope == NULL ? @"file:write athlete:profile workouts:wod" : scope;
    scope = [scope stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

    NSString* url = sandbox ? sandboxUrl : productionUrl;
    
    NSString* endpoint = [NSString stringWithFormat: @"%@?client_id=%@&redirect_uri=%@&response_type=%@&scope=%@", url, client_id, redirect_uri, response_type, scope ];

    NSURL* authUrl = [NSURL URLWithString:endpoint];
    
    if ([UIApplication.sharedApplication canOpenURL:authUrl ]) {
      [UIApplication.sharedApplication openURL:authUrl];
    } else {
      if (@available(iOS 11.0, *)) {
        SFAuthenticationSession* _authSession = [[SFAuthenticationSession alloc] initWithURL:authUrl callbackURLScheme:@"noblepro://" completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
          [[UIApplication sharedApplication] openURL:callbackURL];
        }];
        [_authSession start];
      }
      
      //    if (@available(iOS 12.0, *)) {
      //
      //      _authSessionA = [[ASWebAuthenticationSession alloc] initWithURL: webOAuthUrl callbackURLScheme:@"noblepro://mobile" completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
      //        [[UIApplication sharedApplication] openURL:callbackURL];
      //      }];
      //      [_authSessionA start];
      //    } else {
      //      if (@available(iOS 11.0, *)) {
      //        _authSession = [[SFAuthenticationSession alloc] initWithURL:webOAuthUrl callbackURLScheme:@"noblepro://" completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
      //          [[UIApplication sharedApplication] openURL:callbackURL];
      //        }];
      //        [_authSession start];
      //      } else {
      //        // Fallback on earlier versions
      //      }
      //    }
    }
  }

  
  
RCT_EXPORT_METHOD(readFitFile: (NSString *) path
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  NSURL *fileUrl = [NSURL fileURLWithPath:path];
  NSData *fileData = [NSData dataWithContentsOfURL:fileUrl];
  if (fileData != NULL) {
   
    NSString *str = [fileData base64EncodedStringWithOptions:0];
    resolve(str);
  } else {
    reject(@"file_not_found", @"Empty or invalid file", NULL);
  }
}
  
@end
  
