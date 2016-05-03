#import "zqlconnection.h"
#import "zqlconfig.h"

static NSInteger const zqlconnectiontype = SQLITE_OPEN_SHAREDCACHE | SQLITE_OPEN_READWRITE;

@implementation zqlconnection

-(void)connect
{
//    sqlite3_open_v2(_database.UTF8String, _sqlite, zqlconnectiontype, nil);
}

@end