#import <Foundation/Foundation.h>
#import "zqltype.h"

@interface zqlparam:NSObject

@property(strong, nonatomic)zqltype *type;
@property(strong, nonatomic)id value;
@property(copy, nonatomic)NSString *name;

@end