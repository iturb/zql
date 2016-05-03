#import "zqltype.h"

@implementation zqltype

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    
    return self;
}

@end