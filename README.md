# roc-crc32

CRC32 checksum calculation as used in ZIP, PNG, gzip etc. (ISO 3309 / IEEE 802.3). Other variants like CRC32C (Castagnoli) are not supported.

## Quick start

```roc
app [main!] {
    pf: platform "https://github.com/lukewilliamboswell/roc-platform-template-zig/releases/download/0.9/8GdFEvQYS3TeAZxKvTzCLVdQiomweGtXcdZkXNDEeABq.tar.zst",
    crc32: "package/main.roc",
}

import pf.Stdout
import crc32.Crc32

main! = |_args| {
    checksum = Crc32.checksum("Hello, World!".to_utf8())
    Stdout.line!("CRC32: ${checksum.to_str()}")
    Ok({})
}
```

## Documentation

View the brief API documentation at [https://niclas-ahden.github.io/roc-crc32/](https://niclas-ahden.github.io/roc-crc32/).
