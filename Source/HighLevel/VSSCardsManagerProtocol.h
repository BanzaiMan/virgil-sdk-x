//
//  VSSCardsManagerProtocol.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 2/13/17.
//  Copyright © 2017 VirgilSecurity. All rights reserved.
//

#import "VSSVirgilCard.h"
#import "VSSVirgilKey.h"
#import "VSSVirgilIdentity.h"
#import "VSSVirgilGlobalIdentity.h"

@protocol VSSCardsManager <NSObject>

- (VSSVirgilCard * __nullable)createCardWithIdentity:(VSSVirgilIdentity * __nonnull)identity ownerKey:(VSSVirgilKey * __nonnull)ownerKey data:(NSDictionary<NSString *, NSString *> * __nullable)data error:(NSError * __nullable * __nullable)errorPtr;

- (VSSVirgilCard * __nullable)createCardWithIdentity:(VSSVirgilIdentity * __nonnull)identity ownerKey:(VSSVirgilKey * __nonnull)ownerKey error:(NSError * __nullable * __nullable)errorPtr;

- (void)publishCard:(VSSVirgilCard * __nonnull)card completion:(void (^ __nonnull)(NSError * __nullable))callback;

- (void)searchCardsWithIdentities:(NSArray<NSString *> * __nonnull)identities completion:(void (^ __nonnull)(NSArray<VSSVirgilCard *> * __nullable, NSError * __nullable))callback;

- (void)searchCardsWithIdentityType:(NSString * __nonnull)identityType identities:(NSArray<NSString *> * __nonnull)identities completion:(void (^ __nonnull)(NSArray<VSSVirgilCard *> * __nullable, NSError * __nullable))callback;

- (void)searchGlobalCardsWithIdentities:(NSArray<NSString *> * __nonnull)identities completion:(void (^ __nonnull)(NSArray<VSSVirgilCard *> * __nullable, NSError * __nullable))callback;

- (void)searchGlobalCardsWithIdentityType:(NSString * __nonnull)identityType identities:(NSArray<NSString *> * __nonnull)identities completion:(void (^ __nonnull)(NSArray<VSSVirgilCard *> * __nullable, NSError * __nullable))callback;

- (void)getCardWithId:(NSString * __nonnull)cardId completion:(void (^ __nonnull)(VSSVirgilCard * __nullable, NSError * __nullable))callback;

- (VSSVirgilCard * __nullable)importVirgilCardFromData:(NSString * __nonnull)data;

- (void)revokeCard:(VSSVirgilCard * __nonnull)card completion:(void (^ __nonnull)(NSError * __nullable))callback;

- (void)revokeGlobalCard:(VSSVirgilCard * __nonnull)card identity:(VSSVirgilGlobalIdentity * __nonnull)identity ownerKey:(VSSVirgilKey * __nonnull)ownerKey completion:(void (^ __nonnull)(NSError * __nullable))callback;

@end
