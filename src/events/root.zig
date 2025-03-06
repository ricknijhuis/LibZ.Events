pub const Events = @import("events.zig").Events;

test {
    @import("std").testing.refAllDeclsRecursive(@This());
}
