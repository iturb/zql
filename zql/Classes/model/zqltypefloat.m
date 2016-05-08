#import "zqltypefloat.h"

static NSString* const zqltypefloatname = @"float";

@implementation zqltypefloat

-(instancetype)init
{
    self = [super init];
    self.name = zqltypefloatname;
    
    return self;
}

@end