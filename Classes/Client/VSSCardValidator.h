//
//  VSSCardValidator.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 10/5/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSSCardValidatorProtocol.h"
#import "VSSCrypto.h"

@interface VSSCardValidator : NSObject <VSSCardValidator>

- (instancetype __nonnull)initWithCrypto:(id<VSSCrypto> __nonnull)crypto;

- (void)addVerifierWithId:(NSString * __nonnull)verifierId publicKey:(NSData * __nonnull)publicKey;

@end
