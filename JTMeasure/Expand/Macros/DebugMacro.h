
#ifdef DEBUG

#define DebugMethod()           NSLog(@"[DEBUG]%s", __func__)

#define DebugLog(format, ...)   NSLog((@"[DEBUG]%s " format), __PRETTY_FUNCTION__, ##__VA_ARGS__)

#else

#define DebugMethod()

#define DebugLog(...)

#define NSLog(...)

#endif

