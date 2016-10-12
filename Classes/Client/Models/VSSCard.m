//
//  VSSCard.m
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 9/29/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSSCard.h"
#import "VSSCardPrivate.h"
#import "VSSSignedDataPrivate.h"
#import "VSSCardDataPrivate.h"
#import "VSSModelKeys.h"
#import "NSObject+VSSUtils.h"

@implementation VSSCard

+ (instancetype)cardWithIdentity:(NSString *)identity identityType:(NSString *)identityType publicKey:(NSData *)publicKey data:(NSDictionary *)data {
    VSSCardData *cardData = [VSSCardData cardDataWithIdentity:identity identityType:identityType publicKey:publicKey data:data];
    return [[VSSCard alloc] initWithCardData:cardData];
}

+ (instancetype)cardWithIdentity:(NSString *)identity identityType:(NSString *)identityType publicKey:(NSData *)publicKey {
    return [VSSCard cardWithIdentity:identity identityType:identityType publicKey:publicKey data:nil];
}

+ (instancetype)cardGlobalWithIdentity:(NSString *)identity publicKey:(NSData *)publicKey data:(NSDictionary *)data {
    VSSCardData *cardData = [VSSCardData cardDataGlobalWithIdentity:identity publicKey:publicKey data:data];
    return [[VSSCard alloc] initWithCardData:cardData];
}

+ (instancetype)cardGlobalWithIdentity:(NSString *)identity publicKey:(NSData *)publicKey {
    return [VSSCard cardGlobalWithIdentity:identity publicKey:publicKey data:nil];
}

- (instancetype)initWithSnapshot:(NSData *)snapshot cardData:(VSSCardData *)cardData signatures:(NSDictionary *)signatures cardVersion:(NSString *)cardVersion createdAt:(NSDate *)createdAt {
    self = [super initWithSnapshot:snapshot signatures:signatures cardVersion:cardVersion createdAt:createdAt];
    if (self) {
        _data = cardData;
    }
    
    return self;
}

- (instancetype)initWithSnapshot:(NSData *)snapshot cardData:(VSSCardData *)cardData {
    return [self initWithSnapshot:snapshot cardData:cardData signatures:nil cardVersion:nil createdAt:nil];
}

- (instancetype)initWithCardData:(VSSCardData *)cardData signatures:(NSDictionary *)signatures cardVersion:(NSString *)cardVersion createdAt:(NSDate *)createdAt {
    NSData *snapshot = [cardData getCanonicalForm];
    return [self initWithSnapshot:snapshot cardData:cardData signatures:signatures cardVersion:cardVersion createdAt:createdAt];
}

- (instancetype)initWithCardData:(VSSCardData *)cardData {
    return [self initWithCardData:cardData signatures:nil cardVersion:nil createdAt:nil];
}

- (instancetype)initWithSnapshot:(NSData *)snapshot signatures:(NSDictionary *)signatures cardVersion:(NSString *)cardVersion createdAt:(NSDate *)createdAt {
    VSSCardData *cardData = [VSSCardData createFromCanonicalForm:snapshot];
    return [self initWithSnapshot:snapshot cardData:cardData signatures:signatures cardVersion:cardVersion createdAt:createdAt];
}

- (instancetype)initWithSnapshot:(NSData *)snapshot {
    return [self initWithSnapshot:snapshot signatures:nil cardVersion:nil createdAt:nil];
}

#pragma mark - VSSDeserializable

- (instancetype)initWithDict:(NSDictionary *)candidate {
    self = [super initWithDict:candidate];
    if (self) {
        VSSCardData *cardData = [VSSCardData createFromCanonicalForm:self.snapshot];
        if (cardData == nil)
            return nil;
        _data = cardData;
    }
    
    return self;
}

@end