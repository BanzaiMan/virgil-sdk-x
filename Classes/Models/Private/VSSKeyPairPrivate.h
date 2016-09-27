//
//  VSSKeyPairPrivate.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 9/27/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

@interface VSSKeyPair ()

- (instancetype __nonnull)initWithPrivateKey:(VSSPrivateKey * __nonnull)privateKey andPublicKey:(VSSPublicKey * __nonnull)publicKey;

@end
