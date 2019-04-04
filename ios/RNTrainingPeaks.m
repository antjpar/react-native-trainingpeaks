
#import "RNTrainingPeaks.h"

@implementation RNTrainingPeaks

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(readFitFile: (NSString *) path
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  NSURL *fileUrl = [NSURL fileURLWithPath:path];
  NSData *fileData = [NSData dataWithContentsOfURL:fileUrl];
  if (fileData != NULL) {
   
    NSString *str = [fileData base64EncodedStringWithOptions:0];
    resolve(str)
  } else {
    reject(@"file_not_found");
  }
}
  
@end
  
