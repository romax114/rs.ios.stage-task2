#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 number = n;
    NSMutableString *binaryString = [[NSMutableString alloc] init];
    NSMutableString *reversedString = [[NSMutableString alloc] init];
    for (int i = 0; i < 8; i++) {
        [binaryString insertString:(number & 1) ? @"1" : @"0"  atIndex:0];
        number = number / 2;
    }
    for (int i = 0; i < 8; i++) {
        NSString *buffer = [NSString stringWithFormat:@"%c", [binaryString characterAtIndex:(i)]];
        [reversedString insertString:buffer atIndex:0];
    }
    number = strtol([reversedString UTF8String], NULL, 2);
    
    return number;
}
