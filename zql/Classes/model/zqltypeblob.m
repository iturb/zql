#import "zqltypeblob.h"

static NSString* const zqltypeblobname = @"blob";

@implementation zqltypeblob

-(instancetype)init
{
    self = [super init];
    self.name = zqltypeblobname;
    
    return self;
}
@end