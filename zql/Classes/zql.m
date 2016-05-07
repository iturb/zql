#import "zql.h"
#import "zqlconnection.h"
#import "zqlqueryprocessor.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;
@property(strong, nonatomic)zqlqueryprocessor *queryprocessor;
@property(strong, nonatomic)zqlresult *result;
@property(assign, nonatomic)sqlite3 *sqlite;

@end

@implementation zql

+(zqlresult*)query:(zqlquery*)query
{
    zqlresult *result;
    
    if([zqlconfig shared].dbname)
    {
        zql *manager = [[zql alloc] init:query];
        [manager connect];
        
        if(manager.result.success)
        {
            [manager prepare];
            
            if(manager.result.success)
            {
                
            }
        }
        else
        {
            result = manager.result;
            [manager disconnect];
        }
    }
    else
    {
        result = [zqlresult errornodb];
    }
    
    return result;
}

-(instancetype)init:(zqlquery*)query
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    self.queryprocessor = [[zqlqueryprocessor alloc] init:query];
    
    return self;
}

#pragma mark functionality

-(void)connect
{
    NSInteger resultnumber = [self.connection connect:&_sqlite];
    self.result = [zqlresult sqlresponse:resultnumber];
}

-(void)disconnect
{
    NSInteger resultnumber = [self.connection close:&_sqlite];
    self.result = [zqlresult sqlresponse:resultnumber];
}

-(void)prepare
{
    self.result = [self.queryprocessor prepare:&_sqlite];
}

@end