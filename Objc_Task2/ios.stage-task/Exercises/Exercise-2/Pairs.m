#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
 
    NSInteger count = 0;
    
    for (int i = 0; i < [array count]; i++) {
        for (int j = 1 + i; j < [array count]; j++) {
            if (abs([array[j] intValue] - [array[i] intValue]) == [number intValue] ) {
                count ++;
            }
        }
    }

    return count;
}

@end
