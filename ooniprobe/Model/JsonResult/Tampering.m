#import "Tampering.h"

@implementation Tampering

-(id)initWithValue:(id)currentValue{
    self = [super init];
    if(self)
    {
        NSLog(@"currentValue %@", currentValue);
        if ([currentValue isKindOfClass:[NSDictionary class]]){
            NSLog(@"currentValue NSDictionary");
            self.value = NO;
            NSDictionary *dic = (NSDictionary*)currentValue;
            NSDictionary *tampering = [dic objectForKey:@"tampering"];
            NSArray *chcekKeys = [[NSArray alloc]initWithObjects:@"header_field_name", @"header_field_number", @"header_field_value", @"header_name_capitalization", @"request_line_capitalization", @"total", nil];
            for (NSString *key in chcekKeys) {
                if ([tampering objectForKey:key] &&
                    [tampering objectForKey:key] != [NSNull null] &&
                    [[tampering objectForKey:key] boolValue]) {
                    self.value = YES;
                }
            }
        }
        else {
            NSLog(@"currentValue Boolean");
            Boolean value = (Boolean)currentValue;
            self.value = value;
        }
    }
    return self;
}

@end