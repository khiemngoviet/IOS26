//
//  MagicalRecord+Options.m
//  Magical Record
//
//  Created by Saul Mora on 3/6/12.
//  Copyright (c) 2012 Magical Panda Software LLC. All rights reserved.
//

#import "MagicalRecord+Options.h"

static MagicalRecordLoggingMask kMagicalRecordLoggingMask = MagicalRecordLoggingMaskVerbose;
static BOOL kMagicalRecordShouldAutoCreateManagedObjectModel = NO;
static BOOL kMagicalRecordShouldAutoCreateDefaultPersistentStoreCoordinator = NO;
static BOOL kMagicalRecordShouldDeleteStoreOnModelMismatch = NO;

@implementation MagicalRecord (Options)

#pragma mark - Configuration Options

+ (BOOL) shouldAutoCreateManagedObjectModel;
{
    return kMagicalRecordShouldAutoCreateManagedObjectModel;
}

+ (void) setShouldAutoCreateManagedObjectModel:(BOOL)autoCreate;
{
    kMagicalRecordShouldAutoCreateManagedObjectModel = autoCreate;
}

+ (BOOL) shouldAutoCreateDefaultPersistentStoreCoordinator;
{
    return kMagicalRecordShouldAutoCreateDefaultPersistentStoreCoordinator;
}

+ (void) setShouldAutoCreateDefaultPersistentStoreCoordinator:(BOOL)autoCreate;
{
    kMagicalRecordShouldAutoCreateDefaultPersistentStoreCoordinator = autoCreate;
}

+ (BOOL) shouldDeleteStoreOnModelMismatch;
{
    return kMagicalRecordShouldDeleteStoreOnModelMismatch;
}

+ (void) setShouldDeleteStoreOnModelMismatch:(BOOL)shouldDelete
{
    kMagicalRecordShouldDeleteStoreOnModelMismatch = shouldDelete;
}

+ (MagicalRecordLoggingMask) loggingMask;
{
    return kMagicalRecordLoggingMask;
}

+ (void) setLoggingMask:(MagicalRecordLoggingMask)mask;
{
    kMagicalRecordLoggingMask = mask;
}

@end
