#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "zqlquery.h"

@interface zqlqueryprocessor:NSObject

-(NSInteger)prepare:(sqlite3**)sqlite query:(zqlquery*)query;

@end