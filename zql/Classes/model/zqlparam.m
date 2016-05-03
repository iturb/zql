#import "zqlparam.h"

@implementation zqlparam

+(instancetype)type:(zqltype*)type name:(NSString*)name value:(id)value
{
    zqlparam *param;
    
    if(type && name)
    {
        param = [[zqlparam alloc] init];
        param.type = type;
        param.name = name;
        param.value = value;
    }
    
    return param;
}

@end