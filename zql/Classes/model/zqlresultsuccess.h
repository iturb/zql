#import <Foundation/Foundation.h>
#import "zqlresult.h"
#import "zqlresultparams.h"

@interface zqlresultsuccess:zqlresult

-(instancetype)init:(BOOL)moresteps;

@property(strong, nonatomic, readonly)NSMutableArray<zqlresultparams*> *params;
@property(assign, nonatomic)NSInteger lastinsertid;
@property(assign, nonatomic)BOOL moresteps;

@end