//
//  WebService.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 07/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebService : NSObject
//+ instance Globally -"ViewController me used "
//+ second Web View
//argumentname type objectname
+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void(^)(NSData *, NSError*))block;

@end

NS_ASSUME_NONNULL_END
