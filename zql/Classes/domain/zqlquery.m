#import "zqlquery.h"
#import "zqlpk.h"
#import "zqltypetext.h"

static NSString* const zqlquerycreatetitle =                    @"create table %@ ";
static NSString* const zqlqueryinserttitle =                    @"insert into %@ ";
static NSString* const zqlqueryvaluestitle =                    @" values";
static NSString* const zqlqueryparamsprefix =                   @"(";
static NSString* const zqlqueryparamsseparator =                @", ";
static NSString* const zqlqueryparamspostfix =                  @")";
static NSString* const zqlqueryparamsclosure =                  @";";

@interface zqlparam ()

@property(copy, nonatomic)NSString *comparename;

@end

@interface zqlquery ()

@property(copy, nonatomic)NSString *querystring;

@end

@implementation zqlquery

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params
{
    zqlquery *query;
    
    if(tablename && tablename.length && params)
    {
        zqlpk *primarykey = [zqlpk primarykey];
        
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:zqlquerycreatetitle, tablename];
        [string appendString:zqlqueryparamsprefix];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            
            if(indexparam)
            {
                [string appendString:zqlqueryparamsseparator];
            }
            
            if(![param.comparename isEqualToString:primarykey.name])
            {
                [string appendString:[param querycreate]];
            }
        }
        
        [string appendString:zqlqueryparamsseparator];
        [string appendString:[primarykey querycreate]];
        [string appendString:zqlqueryparamspostfix];
        [string appendString:zqlqueryparamsclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

+(instancetype)insert:(NSString*)tablename params:(NSArray<zqlparam*>*)params
{
    zqlquery *query;
    
    if(tablename && tablename.length && params)
    {
        NSMutableString *string = [NSMutableString string];
        NSMutableString *stringvalues = [NSMutableString string];
        [string appendFormat:zqlqueryinserttitle, tablename];
        [string appendString:zqlqueryparamsprefix];
        [stringvalues appendString:zqlqueryvaluestitle];
        [stringvalues appendString:zqlqueryparamsprefix];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            
            if(indexparam)
            {
                [string appendString:zqlqueryparamsseparator];
                [stringvalues appendString:zqlqueryparamsseparator];
            }
            
            [string appendString:param.name];
            [stringvalues appendString:[param queryvalue]];
        }
        
        [string appendString:zqlqueryparamspostfix];
        [stringvalues appendString:zqlqueryparamspostfix];
        [string appendString:stringvalues];
        [string appendString:zqlqueryparamsclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

-(instancetype)init:(NSString*)querystring
{
    self = [super init];
    self.querystring = querystring;
    
    return self;
}

@end