// DataManager.h
#define DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define UNIQUE_STRING (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, CFUUIDCreate(kCFAllocatorDefault))
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const DataManagerDidSaveNotification;
extern NSString * const DataManagerDidSaveFailedNotification;

@interface DataManager : NSObject {
}

@property (nonatomic, readonly, strong) NSManagedObjectModel *objectModel;
@property (nonatomic, readonly, strong) NSManagedObjectContext *mainObjectContext;
@property (nonatomic, readonly, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (DataManager*)sharedInstance;
- (BOOL)save;
//- (NSManagedObjectContext*)managedObjectContext;
- (void)saveContext;
- (NSArray *) fetRecordsOfEntity : (NSString *)entityName withSortDescriptors: (NSArray *) sortDescriptors;
- (NSArray *)saveImageToDocument:(NSArray *)imageArray;
@end
