#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSArray *subarray;
    NSArray *sortedArray = @[];
    NSArray *singleSortedArray = @[];
    NSMutableArray *commonArray = [[NSMutableArray alloc] init];
    NSMutableArray *splitedArraysSorted;
    
    
    if ([array count] != 0) {
        
        for (int i = 0; i < array.count; i++) {
            
            if ([[array objectAtIndex:i] isKindOfClass:[NSArray class]]) {
                subarray = [array objectAtIndex:i];
                [commonArray addObjectsFromArray:subarray];
                
                for (int j = 0; j < commonArray.count; j++) {
                    
                    if ([[commonArray objectAtIndex:j] isKindOfClass:[NSNumber class]]) {
                        sortedArray = [commonArray sortedArrayUsingSelector:@selector(compare:)];
                    } else if ([[commonArray objectAtIndex:j] isKindOfClass:[NSString class]]) {
                        sortedArray = [commonArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                    } else  if ([[commonArray objectAtIndex:j] isKindOfClass:[NSNumber class]] && [[commonArray objectAtIndex:j] isKindOfClass:[NSString class]]) {
                        
                        for (int k = 0; k < subarray.count; k++) {
                            
                            if ([[subarray objectAtIndex:k] isKindOfClass:[NSNumber class]]) {
                                singleSortedArray = [subarray sortedArrayUsingSelector:@selector(compare:)];
                                [splitedArraysSorted addObject:singleSortedArray];
                            } else if ([[subarray objectAtIndex:j] isKindOfClass:[NSString class]]) {
                                singleSortedArray =[subarray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                                [splitedArraysSorted addObject:singleSortedArray];
                            }
                            
                            sortedArray = [splitedArraysSorted copy];
                        }
                    }
                }
            }
        }
    }
    return sortedArray;
}
@end
