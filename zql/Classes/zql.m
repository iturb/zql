#import "zql.h"
#import "zqlconnection.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;
@property(assign, nonatomic)sqlite3 *sqlite;

@end

@implementation zql

+(zqlresult*)query:(zqlquery*)query
{
    zqlresult *result;
    
    if([zqlconfig shared].dbname)
    {
        zql *manager = [[zql alloc] init];
        [manager connect];
    }
    else
    {
        result = [zqlresult errornodb];
    }
    
    return result;
}

-(instancetype)init
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    
    return self;
}

#pragma mark functionality

-(NSInteger)connect
{
    return [self.connection connect:&_sqlite];
}

@end