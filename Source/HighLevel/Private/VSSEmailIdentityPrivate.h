//
//  VSSEmailIdentityPrivate.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 3/3/17.
//  Copyright © 2017 VirgilSecurity. All rights reserved.
//

#import "VSSVirgilIdentityPrivate.h"
#import "VSSEmailIdentity.h"

@interface VSSEmailIdentity ()

@property (nonatomic) NSString * __nullable actionId;
@property (nonatomic) NSString * __nullable token;
@property (nonatomic) BOOL checkInvoked;

@end
