// DataManager.m
#define IMAGES_DIRECTORY_NAME @"images"
#import "DataManager.h"

NSString * const DataManagerDidSaveNotification = @"DataManagerDidSaveNotification";
NSString * const DataManagerDidSaveFailedNotification = @"DataManagerDidSaveFailedNotification";

@interface DataManager ()

- (NSString*)sharedDocumentsPath;

@end

@implementation DataManager

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize mainObjectContext = _mainObjectContext;
@synthesize objectModel = _objectModel;

NSString * const kDataManagerBundleName = @"CoreDataBasic";
NSString * const kDataManagerModelName = @"CoreDataBasic";
NSString * const kDataManagerSQLiteName = @"CoreDataBasic.sqlite";
//Singleton
+ (DataManager*)sharedInstance {
	static dispatch_once_t pred;
	static DataManager *sharedInstance = nil;

	dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
	return sharedInstance;
}

- (void)dealloc {
	[self save];

}

- (NSManagedObjectModel*)objectModel {
	/*if (_objectModel)
		return _objectModel;

	NSBundle *bundle = [NSBundle mainBundle];
	if (kDataManagerBundleName) {
		NSString *bundlePath = [[NSBundle mainBundle] pathForResource:kDataManagerBundleName ofType:@"bundle"];
		bundle = [NSBundle bundleWithPath:bundlePath];
	}
	NSString *modelPath = [bundle pathForResource:kDataManagerModelName ofType:@"momd"];
	_objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSURL fileURLWithPath:modelPath]];

	return _objectModel;*/
    
    if (_objectModel)
		return _objectModel;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kDataManagerModelName withExtension:@"momd"];
    _objectModel= [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _objectModel;

}
- (void)removeExistingData {
    // Get the paths to the SQLite file
    NSString *storePath = [[self sharedDocumentsPath] stringByAppendingPathComponent:kDataManagerSQLiteName];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
}
- (NSPersistentStoreCoordinator*)persistentStoreCoordinator {
	if (_persistentStoreCoordinator)
		return _persistentStoreCoordinator;

	// Get the paths to the SQLite file
	NSString *storePath = [[self sharedDocumentsPath] stringByAppendingPathComponent:kDataManagerSQLiteName];
	NSURL *storeURL = [NSURL fileURLWithPath:storePath];

	// Define the Core Data version migration options
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
				 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
				 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
				 nil];

	// Attempt to load the persistent store
	NSError *error = nil;
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.objectModel];
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
						       configuration:nil
								 URL:storeURL
							     options:options
							       error:&error]) {
		NSLog(@"Fatal error while creating persistent store: %@", error);
        
        //If schema errors then delete sqlite file
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
		abort();
	}

	return _persistentStoreCoordinator;
}

- (NSManagedObjectContext*)mainObjectContext {
	if (_mainObjectContext)
		return _mainObjectContext;

	// Create the main context only on the main thread
	if (![NSThread isMainThread]) {  //Not main thread
		[self performSelectorOnMainThread:@selector(mainObjectContext)
 				       withObject:nil
				    waitUntilDone:YES];
		return _mainObjectContext;
	} else {                        //Main thread then create _mainObjectContext
        _mainObjectContext = [[NSManagedObjectContext alloc] init];
        [_mainObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        return _mainObjectContext;
    }
}

- (BOOL) save {
	if (![self.mainObjectContext hasChanges])
		return YES;

	NSError *error = nil;
	if (![self.mainObjectContext save:&error]) {
		NSLog(@"Error while saving: %@\n%@", [error localizedDescription], [error userInfo]);
		[[NSNotificationCenter defaultCenter] postNotificationName:DataManagerDidSaveFailedNotification
								    object:error];
		return NO;
	}

	[[NSNotificationCenter defaultCenter] postNotificationName:DataManagerDidSaveNotification object:nil];
	return YES;
}

- (NSString*)sharedDocumentsPath {
	static NSString *SharedDocumentsPath = nil;
	if (SharedDocumentsPath)
		return SharedDocumentsPath;

	// Compose a path to the <Library>/Database directory
	NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] ;
	SharedDocumentsPath = [libraryPath stringByAppendingPathComponent:@"Database"];

	// Ensure the database directory exists
	NSFileManager *manager = [NSFileManager defaultManager];
	BOOL isDirectory;
	if (![manager fileExistsAtPath:SharedDocumentsPath isDirectory:&isDirectory] || !isDirectory) {
		NSError *error = nil;
		NSDictionary *attr = [NSDictionary dictionaryWithObject:NSFileProtectionComplete
								 forKey:NSFileProtectionKey];
		[manager createDirectoryAtPath:SharedDocumentsPath
		   withIntermediateDirectories:YES
				    attributes:attr
					 error:&error];
		if (error)
			NSLog(@"Error creating directory path: %@", [error localizedDescription]);
	}

	return SharedDocumentsPath;
}

#pragma mark - My Extended Functions
- (NSArray *) fetRecordsOfEntity : (NSString *)entityName withSortDescriptors: (NSArray *) sortDescriptors
{
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.mainObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];	
	
    if (sortDescriptors) {
        [request setSortDescriptors:sortDescriptors];
    }
    
	// Fetch the records and handle an error
	NSError *error;
	NSArray *fetchResults = [[self.mainObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
    if (!fetchResults) {
        NSLog(@"Error when fetch data %@", error);
    }
	return  fetchResults;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.mainObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Manage photos funtion
-(NSArray *)saveImageToDocument:(NSArray *)imageArray{
    NSString *imagesDiretory = [DOCUMENT_DIRECTORY_PATH stringByAppendingPathComponent:IMAGES_DIRECTORY_NAME];
    NSMutableArray *imagePathArray = [[NSMutableArray alloc] init ];
    for (UIImage *imageItem in imageArray) {
        NSData *pngData = UIImagePNGRepresentation(imageItem);
        NSString *imageName = [NSString stringWithFormat:@"%@.png",UNIQUE_STRING];
        NSString *imagePath = [imagesDiretory stringByAppendingPathComponent:imageName];
        [pngData writeToFile:imagePath atomically:YES];
        [imagePathArray addObject:imageName];
    }
    
    return imagePathArray;
}

- (UIImage *)getImageFromDocument:(NSString *)imageFileName{
    NSString *imagesDiretory = [DOCUMENT_DIRECTORY_PATH stringByAppendingPathComponent:IMAGES_DIRECTORY_NAME];
    return [UIImage imageWithContentsOfFile:[imagesDiretory stringByAppendingPathComponent:imageFileName]];
}
@end
