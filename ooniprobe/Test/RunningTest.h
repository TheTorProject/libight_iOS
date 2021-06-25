#import <Foundation/Foundation.h>
#import "Suite.h"
#import "Tests.h"

NS_ASSUME_NONNULL_BEGIN

@interface RunningTest : NSObject

+ (RunningTest *) currentTest;
@property (nonatomic, strong) AbstractSuite *testSuite;

@end

NS_ASSUME_NONNULL_END
