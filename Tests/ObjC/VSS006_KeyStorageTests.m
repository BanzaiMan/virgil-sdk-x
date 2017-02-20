//
//  VSS006_KeyStorageTests.m
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 11/2/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "VSSTestsUtils.h"

@interface VSS006_KeyStorageTests : XCTestCase

@property (nonatomic) VSSCrypto * __nonnull crypto;
@property (nonatomic) VSSKeyStorage * __nonnull storage;
@property (nonatomic) VSSKeyEntry * __nonnull keyEntry;
@property (nonatomic) NSString * __nonnull privateKeyName;

@end

@implementation VSS006_KeyStorageTests

#pragma mark - Setup

- (void)setUp {
    [super setUp];
    
    self.crypto = [[VSSCrypto alloc] init];
    self.storage = [[VSSKeyStorage alloc] init];
    VSSKeyPair *keyPair = [self.crypto generateKeyPair];
    
    NSData *privateKeyRawData = [self.crypto exportPrivateKey:keyPair.privateKey withPassword:nil];
    NSString *privateKeyName = [[NSUUID UUID] UUIDString];
    
    self.keyEntry = [VSSKeyEntry keyEntryWithName:privateKeyName value:privateKeyRawData];
}

- (void)tearDown {
    [self.storage deleteKeyEntryWithName:self.keyEntry.name error:nil];
    
    [super tearDown];
}

- (void)test001_StoreKey {
    NSError *error;
    BOOL res = [self.storage storeKeyEntry:self.keyEntry error:&error];
    XCTAssert(res);
    XCTAssert(error == nil);
}

- (void)test002_StoreKeyWithDuplicateName {
    NSError *error;
    BOOL res = [self.storage storeKeyEntry:self.keyEntry error:&error];
    XCTAssert(res);
    XCTAssert(error == nil);
    
    res = [self.storage storeKeyEntry:self.keyEntry error:&error];
    XCTAssert(!res);
    XCTAssert(error != nil);
}

- (void)test003_LoadKey {
    NSError *error;
    [self.storage storeKeyEntry:self.keyEntry error:&error];
    XCTAssert(error == nil);
    
    VSSKeyEntry *loadedKeyEntry = [self.storage loadKeyEntryWithName:self.keyEntry.name error:&error];
    
    XCTAssert(error == nil);
    XCTAssert(loadedKeyEntry != nil);
    XCTAssert([loadedKeyEntry.name isEqualToString:self.keyEntry.name]);
    XCTAssert([loadedKeyEntry.value isEqualToData:self.keyEntry.value]);
}

- (void)test004_ExistsKey {
    BOOL exists = [self.storage existsKeyEntryWithName:self.keyEntry.name];
    XCTAssert(!exists);
    
    [self.storage storeKeyEntry:self.keyEntry error:nil];
    
    exists = [self.storage existsKeyEntryWithName:self.keyEntry.name];
    
    XCTAssert(exists);
}

- (void)test005_DeleteKey {
    [self.storage storeKeyEntry:self.keyEntry error:nil];
    
    NSError *error;
    BOOL res = [self.storage deleteKeyEntryWithName:self.keyEntry.name error:&error];
    
    XCTAssert(res);
    XCTAssert(error == nil);
    
    BOOL exists = [self.storage existsKeyEntryWithName:self.keyEntry.name];
    XCTAssert(!exists);
}

@end