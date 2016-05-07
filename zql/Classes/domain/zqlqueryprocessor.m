#import "zqlqueryprocessor.h"

@interface zqlqueryprocessor ()

@property(assign, nonatomic)sqlite3_stmt *statement;

@end

@implementation zqlqueryprocessor

-(NSInteger)prepare:(sqlite3**)sqlite query:(zqlquery*)query
{
    NSInteger result = sqlite3_prepare_v2(*sqlite, query.querystring.UTF8String, -1, &_statement, nil);
    
    return result;
}

@end