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
    zql *manager = [[zql alloc] init];
    [manager connect];
    
    return result;
}

-(instancetype)init
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    
    return self;
}

#pragma mark functionality

-(void)connect
{
    
}

@end