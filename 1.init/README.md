# Init the zig project template

```shell
zig init
```

# Run the code

```shell
zig build run
```

# main.zig

Open the `main.zig` file and read the sample code. Let's change the evil message to
friendly "Hello, World!".

```zig

const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Hello, World\n", .{});
    std.

    try bw.flush(); // don't forget to flush!
}
```

# Run new code

```shell
zig build run
```

Q & A: What is the different between `std.debug.print` and `stdout.print`?

Try: `zig build run > /dev/null` and `zig build run 2> /dev/null`.
