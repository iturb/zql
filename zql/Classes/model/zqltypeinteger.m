#import "zqltypeinteger.h"

static NSString* const zqltypeintegername = @"integer";

@implementation zqltypeinteger

-(instancetype)init
{
    self = [super init];
    self.name = zqltypeintegername;
    
    return self;
}

#pragma mark -
#pragma mark type

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    NSInteger intvalue = sqlite3_column_int(*statement, (int)column);
    NSNumber *value = @(intvalue);
    
    return value;
}

@end