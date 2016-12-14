//
//  VSSSearchCardsCriteria.m
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 9/22/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSSSearchCardsCriteriaPrivate.h"
#import "NSObject+VSSUtils.h"
#import "VSSModelKeys.h"
#import "VSSModelCommonsPrivate.h"

@implementation VSSSearchCardsCriteria

+ (instancetype)searchCardsCriteriaWithScope:(VSSCardScope)scope identityType:(NSString *)identityType identities:(NSArray<NSString *> *)identities {
    return [[VSSSearchCardsCriteria alloc] initWithScope:scope identityType:identityType identities:identities];
}

- (instancetype)initWithScope:(VSSCardScope)scope identityType:(NSString *)identityType identities:(NSArray<NSString *> *)identities {
    self = [super init];

    if (self) {
        _scope = scope;
        _identityType = [identityType copy];
        _identities = [[NSArray alloc] initWithArray:identities copyItems:YES];
    }

    return self;
}

- (NSDictionary *)serialize {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[kVSSCModelIdentities] = [self.identities copy];
    dict[kVSSCModelIdentityType] = [self.identityType copy];
    
    switch (self.scope) {
        case VSSCardScopeGlobal:
            dict[kVSSCModelCardScope] = vss_getCardScopeString(VSSCardScopeGlobal);
            break;
            
        case VSSCardScopeApplication:
            break;
    }
    
    return dict;
}

@end
