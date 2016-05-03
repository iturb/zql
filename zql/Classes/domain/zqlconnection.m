#import "zqlconnection.h"
#import "zqlconfig.h"

static NSInteger const zqlconnectiontype = SQLITE_OPEN_SHAREDCACHE | SQLITE_OPEN_READWRITE;

@implementation zqlconnection

-(NSInteger)connect:(sqlite3**)sqlite
{
    NSString *dbname = [zqlconfig shared].dbname;
    
    return sqlite3_open_v2(dbname.UTF8String, sqlite, zqlconnectiontype, nil);
}

@end