//
//  VSSSearchCardsRequest.h
//  VirgilSDK
//
//  Created by Pavel Gorb on 2/4/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import "VSSCardsBaseRequest.h"
#import "VSSRequestContext.h"
#import "VSSSearchCards.h"
#import "VSSCard.h"

@interface VSSSearchCardsRequest : VSSCardsBaseRequest

@property (nonatomic, readonly) NSArray <VSSCard *>* __nullable cards;

- (instancetype __nonnull)initWithContext:(VSSRequestContext * __nonnull)context searchCards:(VSSSearchCards * __nonnull)searchCards NS_DESIGNATED_INITIALIZER;

- (instancetype __nonnull)initWithContext:(VSSRequestContext * __nonnull)context NS_UNAVAILABLE;

@end
