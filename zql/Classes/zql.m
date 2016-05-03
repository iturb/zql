#import "zql.h"
#import "zqlconnection.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;

@end

@implementation zql

+(zqlresult*)query:(zqlquery*)query
{
    zqlresult *result;
    
    return result;
}

-(instancetype)init
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    
    return self;
}

@end