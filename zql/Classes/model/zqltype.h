#import <Foundation/Foundation.h>

@interface zqltype:NSObject

+(instancetype)integer;
+(instancetype)text;
-(NSString*)queryvalue:(id)value;

@property(copy, nonatomic)NSString *name;

@end