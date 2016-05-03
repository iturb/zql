#import <Foundation/Foundation.h>

@interface zqlconfig:NSObject

+(instancetype)shared;
-(void)startdb:(NSString*)dbname;

@property(copy, nonatomic)NSString *dbname;

@end