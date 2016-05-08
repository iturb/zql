#import <Foundation/Foundation.h>

@interface zqltype:NSObject

+(instancetype)integer;
+(instancetype)floatnum;
+(instancetype)text;
+(instancetype)blob;
+(instancetype)fromsqltype:(NSInteger)sqltype;
-(NSString*)queryvalue:(id)value;

@property(copy, nonatomic)NSString *name;

@end