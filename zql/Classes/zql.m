#import "zql.h"
#import "zqlconnection.h"
#import "zqlqueryprocessor.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;
@property(strong, nonatomic)zqlqueryprocessor *queryprocessor;
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
        
        if(result.success)
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
    self.queryprocessor = [[zqlqueryprocessor alloc] init];
    
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