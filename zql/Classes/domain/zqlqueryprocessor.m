#import "zqlqueryprocessor.h"

@interface zqlqueryprocessor ()

@property(weak, nonatomic)zqlquery *query;
@property(assign, nonatomic)sqlite3_stmt *statement;

@end

@implementation zqlqueryprocessor

-(instancetype)init:(zqlquery*)query
{
    self = [super init];
    self.query = query;
    
    return self;
}

#pragma mark public

-(zqlresult*)prepare:(sqlite3**)sqlite;
{
    NSInteger resultnumber = sqlite3_prepare_v2(*sqlite, self.query.querystring.UTF8String, -1, &_statement, nil);
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    return result;
}

@end