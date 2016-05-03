#import <Foundation/Foundation.h>
#import "zqlconnection.h"

@interface zqlquery:NSObject

-(instancetype)init:(NSString*)querystring;

@property(strong, nonatomic)zqlconnection *connection;

@end