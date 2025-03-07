# LibZ.Events
A multithreaded job queue written in zig.

## Features
- Register callbacks based on event type
- Callbacks are called in order
- Able to prevent event propegation

## Installation
build.zig.zon:
```zig
.dependencies = .{
    .events = .{
        .url = "https://github.com/ricknijhuis/LibZ.Events/archive/main.tar.gz",
        // .hash
    },
}
    
```
build.zig: 
```zig
const events_deb = b.dependency("events", .{
    .target = target,
    .optimize = optimize,
});
const jobs_mod = jobs_deb.module("ZLib.Events"); 
// add the import to the module where you need it.
your_mod.addImport("events", jobs_mod);
```
