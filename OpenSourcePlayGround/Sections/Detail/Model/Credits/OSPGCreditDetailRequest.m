//
//  OSPGCreditDetailRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGCreditDetailRequest.h"

@implementation OSPGCreditDetailRequest

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"credit/%@", self.creditId];
}

@end
