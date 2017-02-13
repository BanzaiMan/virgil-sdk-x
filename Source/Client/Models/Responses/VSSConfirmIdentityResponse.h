//
//  VSSConfirmIdentityResponse.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 12/14/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import "VSSBaseModel.h"
#import "VSSCreateCardSnapshotModel.h"

/**
 Response from Virgil Identity Service after confirmation step.
 */
@interface VSSConfirmIdentityResponse : VSSBaseModel

/**
 NSString with identity type
 */
@property (nonatomic, copy, readonly) NSString * __nonnull identityType;

/**
 NSString with identity value
 */
@property (nonatomic, copy, readonly) NSString * __nonnull identityValue;

/**
 NSString with validation token
 */
@property (nonatomic, copy, readonly) NSString * __nonnull validationToken;

/**
 Unavailable no-argument initializer inherited from NSObject
 */
- (instancetype __nonnull)init NS_UNAVAILABLE;

@end
