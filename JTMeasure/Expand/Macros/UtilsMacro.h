
// 弱引用对象
#define _weekSelf(weakSelf)               __weak __typeof(&*self)weakSelf = self

#define _weekObj(weakObj,variableObj)     __weak __typeof(&*variableObj)weakObj = variableObj

// 沙箱路径
#define DocumentPath              NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

#define LibraryPath               NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]

#define LibraryPreferencePath     [LibraryPath stringByAppendingString:@"/Preferences"]

#define LibraryCachesPath         NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]

#define TempPath                  NSTemporaryDirectory()