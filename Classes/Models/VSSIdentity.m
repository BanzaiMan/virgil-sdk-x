//
//  VSSIdentity.m
//  VirgilSDK
//
//  Created by Pavel Gorb on 1/20/16.
//  Copyright © 2016 VirgilSecurity. All rights reserved.
//

#import "VSSIdentity.h"
#import "VSSIdentityInfo.h"
#import "NSObject+VSSUtils.h"

@interface VSSIdentity ()

@property (nonatomic, copy, readwrite) NSString * __nonnull type;
@property (nonatomic, copy, readwrite) NSString * __nonnull value;

@end

@implementation VSSIdentity

@synthesize type = _type;
@synthesize value = _value;

#pragma mark - Lifecycle

- (instancetype)initWithType:(NSString *)type value:(NSString *)value {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _type = [type copy];
    _value = [value copy];
    return self;
}

- (instancetype)initWithId:(GUID *)Id createdAt:(NSDate *)createdAt {
    return [self initWithType:@"" value:@""];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithType:self.type value:self.value];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    GUID *gid = [[aDecoder decodeObjectForKey:kVSSModelId] as:[GUID class]];
    NSDate *cat = [[aDecoder decodeObjectForKey:kVSSModelCreatedAt] as:[NSDate class]];
    NSString *typ = [[aDecoder decodeObjectForKey:kVSSModelType] as:[NSString class]];
    NSString *val = [[aDecoder decodeObjectForKey:kVSSModelValue] as:[NSString class]];
    return [self initWithType:typ value:val];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];

    if (self.type != nil) {
        [aCoder encodeObject:self.type forKey:kVSSModelType];
    }
    if (self.value != nil) {
        [aCoder encodeObject:self.value forKey:kVSSModelValue];
    }
}

#pragma mark - VSSSerializable

+ (instancetype)deserializeFrom:(NSDictionary *)candidate {
    VSSIdentity *identity = [super deserializeFrom:candidate];
    
    NSString *type = [candidate[kVSSModelType] as:[NSString class]];
    identity.type = type;
    
    NSString *value = [candidate[kVSSModelValue] as:[NSString class]];
    identity.value = value;
    
    return identity;
}

#pragma mark - Public class logic

- (VSSIdentityInfo * __nonnull)asIdentityInfo {
    return [[VSSIdentityInfo alloc] initWithType:self.type value:self.value validationToken:nil];
}

@end
