#import <Foundation/Foundation.h>
#import "zqltype.h"

@interface zqlparam:NSObject

+(instancetype)type:(zqltype*)type name:(NSString*)name value:(id)value;

@property(strong, nonatomic)zqltype *type;
@property(strong, nonatomic)id value;
@property(copy, nonatomic)NSString *name;

@end