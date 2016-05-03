#import "zqlconnection.h"

static NSInteger const zqlconnectiontype = SQLITE_OPEN_SHAREDCACHE | SQLITE_OPEN_READWRITE;

@implementation zqlconnection

-(void)connect:(NSString*)dbname
{
    sqlite3_open_v
    sqlite3_open_v2(_database.UTF8String, _sqlite, zqlconnectiontype, nil);
}

@end