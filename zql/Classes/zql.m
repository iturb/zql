#import "zql.h"
#import "zqlconnection.h"
#import "zqlresultsuccess.h"

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
        result = [manager connect];
        
        if([result isKindOfClass:[zqlresultsuccess class]])
        {
        }
        else
        {
            [manager disconnect];
        }
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

-(zqlresult*)connect
{
    NSInteger resultnumber = [self.connection connect:&_sqlite];
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    return result;
}

-(zqlresult*)disconnect
{
    NSInteger resultnumber = [self.connection close:&_sqlite];
    zqlresult *result = [zqlresult sqlresponse:resultnumber];
    
    return result;
}

@end