# Tutorial Objective-C/Swift SDK 

- [Introduction](#introduction)
- [Install](#install)
- [Obtaining an Access Token](#obtaining-an-access-token)
- [Identity Check](#identity-check)
  - [Request Verification](#request-verification)
  - [Confirm and Get an Identity Token](#confirm-and-get-an-identity-token)
- [Cards and Public Keys](#cards-and-public-keys)
  - [Publish a Virgil Card](#publish-a-virgil-card)
  - [Search for Cards](#search-for-cards)
  - [Search for Application Cards](#search-for-application-cards)
  - [Trust a Virgil Card](#trust-a-virgil-card)
  - [Untrust a Virgil Card](#untrust-a-virgil-card)
  - [Revoke a Virgil Card](#revoke-a-virgil-card)
  - [Get a Public Key](#get-a-public-key)
- [Private Keys](#private-keys)
  - [Stash a Private Key](#stash-a-private-key)
  - [Get a Private Key](#get-a-private-key)
  - [Destroy a Private Key](#destroy-a-private-key)

##Introduction

This tutorial explains how to use the Virgil Security Services with SDK library in Objective-C/Swift applications. 

##Install

Coming soon.

##Obtaining an Access Token

First you must create a free Virgil Security developer's account by signing up [here](https://virgilsecurity.com/account/signup). Once you have your account you can [sign in](https://virgilsecurity.com/account/signin) and generate an access token for your application.

The access token provides an authenticated secure access to the Virgil Security Services and is passed with each API call. The access token also allows the API to associate your app’s requests with your Virgil Security developer's account.

Simply add your access token to the client constuctor as application token.

###### Objective-C
```objective-c
//...
VSSClient *client = [[VSSClient alloc] initWithApplicationToken:<# Virgil Access Token #>];
//...
```

###### Swift
```swift
//...
let client = VSSClient(applicationToken: <# Virgil Access Token #>)
//...
```

## Identity Check

All the Virgil Security services are strongly interconnected with the Identity Service. It determines the ownership of the identity being checked using particular mechanisms and as a result it generates a temporary token to be used for the operations which require an identity verification. 

#### Request Verification

Initialize the identity verification process.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Confirm and Get an Identity Token

Confirm the identity and get a temporary token.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

## Cards and Public Keys

A Virgil Card is the main entity of the Public Keys Service, it includes the information about the user and his public key. The Virgil Card identifies the user by one of his available types, such as an email, a phone number, etc.

#### Publish a Virgil Card

An identity token which can be received [here](#identity-check) is used during the registration.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Search for Cards

Search for the Virgil Card by provided parameters.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Search for Application Cards

Search for the Virgil Cards by a defined pattern. The example below returns a list of applications for Virgil Security company.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Trust a Virgil Card

Any Virgil Card user can act as a certification center within the Virgil Security ecosystem. Every user can certify another's Virgil Card and build a net of trust based on it.

The example below demonstrates how to certify a user's Virgil Card by signing its hash attribute. 

<!--В рамках экосистемы Virgil Security любой пользователь карты может выступать в качестве центра сертификации. Каждый пользователь может заверить карту другого, и построить на основе этого сеть доверия. 
В приведенном примере ниже показанно как заверить карту пользователя, путем подписи ее hash атирибута.  -->
 
###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Untrust a Virgil Card

Naturally it is possible to stop trusting the Virgil Card owner as in all relations. This is not an exception in Virgil Security system.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Revoke a Virgil Card

This operation is used to delete the Virgil Card from the search and mark it as deleted. 

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Get a Public Key

Gets a public key from the Public Keys Service by the specified ID.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

## Private Keys

The security of private keys is crucial for the public key cryptosystems. Anyone who can obtain a private key can use it to impersonate the rightful owner during all communications and transactions on intranets or on the internet. Therefore, private keys must be in the possession only of authorized users, and they must be protected from unauthorized use.

Virgil Security provides a set of tools and services for storing private keys in a safe storage which lets you synchronize your private keys between the devices and applications.

Usage of this service is optional.

#### Stash a Private Key

Private key can be added for storage only in case you have already registered a public key on the Public Keys Service.

Use the public key identifier on the Public Keys Service to save the private keys. 

The Private Keys Service stores private keys the original way as they were transferred. That's why we strongly recommend to trasfer the keys which were generated with a password.

###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Get a Private Key

To get a private key you need to pass a prior verification of the Virgil Card where your public key is used.
  
###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

#### Destroy a Private Key

This operation deletes the private key from the service without a possibility to be restored. 
  
###### Objective-C
```objective-c
//...

//...
```

###### Swift
```swift
//...

//...
```

## See Also

* [Quickstart](quickstart.md)
* [Reference API for SDK](sdk-reference-api.md)
