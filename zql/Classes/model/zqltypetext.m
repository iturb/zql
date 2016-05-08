#import "zqltypetext.h"

static NSString* const zqltypetextname = @"text";

@implementation zqltypetext

-(instancetype)init
{
    self = [super init];
    self.name = zqltypetextname;
    
    return self;
}

#pragma mark -
#pragma mark type

#pragma mark public

-(NSString*)queryvalue:(id)value
{
    NSString *string = [NSString stringWithFormat:@"\"%@\"", value];
    
    return string;
}

@end