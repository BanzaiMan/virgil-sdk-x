//
//  VSSCardData.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 9/28/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import "VSSCardData.h"
#import "VSSCanonicalSerializable.h"
#import "VSSCanonicalDeserializable.h"
#import "VSSSerializable.h"
#import "VSSDeserializable.h"

@interface VSSCardData () <VSSSerializable, VSSDeserializable, VSSCanonicalSerializable, VSSCanonicalDeserializable>

+ (instancetype __nonnull)createWithIdentity:(NSString * __nonnull)identity identityType:(NSString * __nonnull)identityType scope:(VSSCardScope)scope publicKey:(NSData * __nonnull)publicKey data:(NSDictionary * __nullable)data;

- (instancetype __nonnull)initWithIdentity:(NSString * __nonnull)identity identityType:(NSString * __nonnull)identityType scope:(VSSCardScope)scope publicKey:(NSData * __nonnull)publicKey data:(NSDictionary * __nullable)data info:(NSDictionary * __nonnull)info;

+ (instancetype __nonnull)createWithIdentity:(NSString * __nonnull)identity identityType:(NSString * __nonnull)identityType publicKey:(NSData * __nonnull)publicKey data:(NSDictionary * __nullable)data;
+ (instancetype __nonnull)createWithIdentity:(NSString * __nonnull)identity identityType:(NSString * __nonnull)identityType publicKey:(NSData * __nonnull)publicKey;

+ (instancetype __nonnull)createGlobalWithIdentity:(NSString * __nonnull)identity publicKey:(NSData * __nonnull)publicKey;
+ (instancetype __nonnull)createGlobalWithIdentity:(NSString * __nonnull)identity publicKey:(NSData * __nonnull)publicKey data:(NSDictionary * __nullable)data;

@end