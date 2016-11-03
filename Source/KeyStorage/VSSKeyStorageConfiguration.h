//
//  VSSKeyStorageConfiguration.h
//  VirgilSDK
//
//  Created by Oleksandr Deundiak on 11/2/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface VSSKeyStorageConfiguration: NSObject <NSCopying>

+ (VSSKeyStorageConfiguration * __nonnull)keyStorageConfigurationWithDefaultValues;

@property (nonatomic, readonly, copy) NSString * __nonnull accessibility;
@property (nonatomic, readonly, copy) NSString * __nonnull accessGroup;

@end
