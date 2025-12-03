# roc-crc32

CRC32 checksum calculation as used in ZIP, PNG, gzip etc. (ISO 3309 / IEEE 802.3). Other variants like CRC32C (Castagnoli) are not supported.

View the brief API documentation at [https://niclas-ahden.github.io/roc-crc32/](https://niclas-ahden.github.io/roc-crc32/).

## Quick start

```roc
app [main!] {
    pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.20.0/X73hGh05nNTkDHU06FHC0YfFaQB1pimX7gncRcao5mU.tar.br",
    crc32: "https://github.com/niclas-ahden/roc-crc32/releases/download/0.1.0/Cog8JfLXfq1eR01U9vju-HviCDKl-Ir6IYFKlb6m6uE.tar.br",
}

import pf.Stdout
import crc32.Crc32

main! = |_args|
    data = Str.to_utf8("Hello, World!")
    checksum = Crc32.checksum(data)
    Stdout.line!("CRC32: ${Num.to_str(checksum)}")
```

## API

### `checksum : List U8 -> U32`

Calculate CRC32 checksum for a byte array.

```roc
Crc32.checksum([0x48, 0x65, 0x6C, 0x6C, 0x6F])  # "Hello" -> 4157704578
Crc32.checksum(Str.to_utf8("123456789"))        # -> 0xCBF43926 (standard test vector)
Crc32.checksum([])                              # -> 0
```

## Status

`roc-crc32` is using the Rust version of the Roc compiler. It'll be rewritten to use the Zig version in the future.

## Documentation

View the brief API documentation at [https://niclas-ahden.github.io/roc-crc32/](https://niclas-ahden.github.io/roc-crc32/).

### Generating documentation locally

```bash
./docs.sh 0.1.0
```

This will generate HTML documentation and place it in `www/0.1.0/`.
