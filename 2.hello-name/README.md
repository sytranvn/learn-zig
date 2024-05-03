# Let's say hello to someone

When we run our program with a name, it should say `"Hello, {name}!"` otherwise
it says `"Hello, World!"`.

# First we reuse previous Hello, World! example

```shell 
cp -r 1.init 2.hello-name 
```

# Make change to the main.zig

To access command arguments, we need `std.process.argsAlloc` from standard lib.
We also use `std.heap.page_allcator` to contain args data. We can learn more
about zig allocators later.

```zig 
// this allow us to access command arguments 
const args = try std.process.argsAlloc(std.heap.page_allocator); 
```

After that, we check if there is a name then we print it out.

```zig 
// after const stdout = bw.writer();
    if (args.len < 2) {
        try stdout.print("Hello, World!\n", .{});
    } else {
        try stdout.print("Hello, {s}!\n", .{args[1]});
    }
```

# Let's run our code

```shell zig build run Hello, World! ```

Perfect! Now to add argument, we can't use `zig build run name`. Instead, we
need to use

```shell zig build run -- Foo Hello, Foo! ```

Or we can also use the built executable

```shell ./zig-out/bin/2.hello-name Foo Hello, Foo! ```

Nice!

# Free allocated memory

Don't forget we allocated some memory for arguments. To let our program exit
cleanly.

```zig
    // after try bw.flush(); // don't forget to flush!
    std.process.argsFree(std.heap.page_allocator, args);
```

To not forget when to free allocated memory, we can use `defer` systax.

```zig
    const args = try std.process.argsAlloc(std.heap.page_allocator); 
    defer std.process.argsFree(std.heap.page_allocator, args);
```

# Q & A

- Why do we need to allocate memory for arguments when C doesn't have that?
- Can we update our code to print all the arguments? For example `zig build run -- Foo Bar`
will print `Hello, Foo Bar!`

