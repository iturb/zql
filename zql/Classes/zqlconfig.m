#import "zqlconfig.h"

@implementation zqlconfig

+(instancetype)shared
{
    static zqlconfig *singleton;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { singleton = [[self alloc] init]; });
    
    return singleton;
}

#pragma mark public

-(void)startdb:(NSString*)dbname
{
    self.dbname = dbname;
}

@end