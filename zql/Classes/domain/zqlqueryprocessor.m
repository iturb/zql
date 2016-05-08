#import "zqlqueryprocessor.h"
#import "zqlresultsuccess.h"

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

#pragma mark functionality

-(NSInteger)stepresult
{
    return sqlite3_step(self.statement);
}

#pragma mark public

-(zqlresult*)prepare:(sqlite3*)sqlite
{
    NSInteger resultnumber = sqlite3_prepare_v2(sqlite, self.query.querystring.UTF8String, -1, &_statement, nil);
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    return result;
}

-(zqlresult*)step
{
    NSInteger resultnumber = [self stepresult];
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    if([result isKindOfClass:[zqlresultsuccess class]])
    {
        zqlresultsuccess *success = (zqlresultsuccess*)result;
        
        if(success.moresteps)
        {
            NSMutableArray *columns = [NSMutableArray array];
            NSInteger columncount = sqlite3_column_count(self.statement);
            
            for(NSInteger indexcolumn = 0; indexcolumn < columncount; indexcolumn++)
            {
                const char *colname = sqlite3_column_name(self.statement, (int)indexcolumn);
                NSString *columname = [NSString stringWithUTF8String:colname];
                [columns addObject:columns];
            }
        }
    }
    
    return result;
}

-(zqlresult*)finalizestatement
{
    NSInteger resultnumber = sqlite3_finalize(self.statement);
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    return result;
}

-(void)lastinsert:(sqlite3*)sqlite result:(zqlresultsuccess*)result
{
    NSInteger lastinsert = (NSInteger)sqlite3_last_insert_rowid(sqlite);
    result.lastinsertid = lastinsert;
}

@end