#import "zqlresultsuccess.h"

@interface zqlresultsuccess ()

@property(strong, nonatomic, readwrite)NSMutableArray<zqlresultparams*> *params;

@end

@implementation zqlresultsuccess

-(instancetype)init:(BOOL)moresteps
{
    self = [super init];
    self.success = YES;
    self.moresteps = moresteps;
    self.lastinsertid = 0;
    self.params = [NSMutableArray array];
    
    return self;
}

@end