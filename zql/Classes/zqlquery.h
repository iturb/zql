#import <Foundation/Foundation.h>
#import "zqlconnection.h"

@interface zqlquery:NSObject

@property(strong, nonatomic)zqlconnection *connection;
@property(copy, nonatomic)NSString *querystring;

@end