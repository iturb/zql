#import "zqlquery.h"

static NSString* const zqlquerycreatetitle =            @"create table %@ ";
static NSString* const zqlquerycreateparamsprefix =     @"(";
static NSString* const zqlquerycreateparamspostfix =    @");";


@interface zqlquery ()

@property(copy, nonatomic)NSString *querystring;

@end

@implementation zqlquery

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params
{
    zqlquery *query;
    
    if(tablename && tablename.length && params)
    {
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:zqlquerycreatetitle, tablename];
        [string appendString:zqlquerycreateparamsprefix];
        
        for(zqlparam *param in params)
        {
            if([param.name isEqualToString:@""])
        }
        
        query = [[zqlquery alloc] init];
    }
    
    return query;
}

-(instancetype)init:(NSString*)querystring
{
    self = [super init];
    
    return self;
}

@end