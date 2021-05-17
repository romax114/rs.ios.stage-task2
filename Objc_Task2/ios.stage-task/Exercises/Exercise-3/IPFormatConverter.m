#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (!numbersArray || numbersArray.count == 0) {
           return @"";
       }
       
       NSDictionary *invalidNumber = @{@"invalidValue": @"The numbers in the input array can be in the range from 0 to 255.",
                                       @"negativeValue": @"Negative numbers are not valid for input."};
       
       NSMutableString *address = [[NSMutableString alloc] init];
       
       for (NSInteger i = 0; i < 4; i++) {
           NSInteger nextOct = 0;
           if (i < numbersArray.count) {
               nextOct = [numbersArray[i] intValue];
           }
           if (nextOct > 255) {
               return invalidNumber[@"invalidValue"];
           } else if (nextOct < 0) {
               return invalidNumber[@"negativeValue"];
           } else {
               [address appendFormat:@"%ld.", nextOct];
           }
       }
       
       return [address substringToIndex:[address length] - 1];
   }

@end
