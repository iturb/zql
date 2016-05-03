#import "zqlresulterror.h"

@interface zqlresulterror ()

@property(copy, nonatomic)NSString *errordescr;

@end

@implementation zqlresulterror



-(NSString*)description
{
    return self.errordescr;
}

@end