# mallocz
malloc/realloc/free & new/delete wrapper for c/c++ that aborts on failure, implemented in zig  

original idea from [zig-gamedev](https://github.com/michal-z/zig-gamedev)  

## Usage
You must call `mallocz.init()` before using any of the functions.  
```zig
const ma = @import("mallocz.zig");
ma.init();
defer ma.deinit();
```


