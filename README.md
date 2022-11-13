# mallocz

**Experimental**  
malloc/realloc/free & new/delete wrapper for c/c++ that aborts on failure, implemented in zig  

original idea from [zig-gamedev](https://github.com/michal-z/zig-gamedev)  

## Motivation
I'd like to manage c/c++ memory allocation/free by zig's allocators.  
When we use `testing.allocator` in zig, you can detect memory leak.  
When we use `std.heap.ArenaAllocator` in zig, the allocated memory access tends to be faster(need sources...)  

## Usage
You must call `mallocz.init()` before using any of the functions.  
```zig
const ma = @import("mallocz.zig");
ma.init();
defer ma.deinit();
```


