#import "zqlresulterror.h"
#import "sqlite3.h"

static NSString* const zqlerrorunknown =                @"Unknown error";
static NSString* const zqlerrornodb =                   @"No database initialized";
static NSString* const zqlerrorerror =                  @"SQL error or missing database";
static NSString* const zqlerrorinternal =               @"Internal logic error in SQLite";
static NSString* const zqlerrorpermission =             @"Access permission denied";

@interface zqlresulterror ()

@property(copy, nonatomic)NSString *errordescr;

@end

@implementation zqlresulterror

+(instancetype)nodb
{
    zqlresulterror *error = [[zqlresulterror alloc] init:zqlerrornodb];
    
    return error;
}

+(instancetype)sqlerror:(NSInteger)errornumber
{
    NSString *errordescr;
    
    switch(errornumber)
    {
        case SQLITE_ERROR:
            
            errordescr = zqlerrorerror;
            
            break;
            
        case SQLITE_INTERNAL:
            
            errordescr = zqlerrorinternal;
            
            break;
            
        case SQLITE_PERM:
            
            errordescr = zqlerrorpermission;
            
            break;
            
        default:
            
            errordescr = zqlerrorunknown;
            
            break;
    }
    
    zqlresulterror *error = [[zqlresulterror alloc] init:errordescr];
    
    return error;
}

-(instancetype)init:(NSString*)errordescr
{
    self = [super init];
    self.errordescr = errordescr;
    
    return self;
}

-(NSString*)description
{
    return self.errordescr;
}

@end