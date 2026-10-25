# roc-crc32

CRC32 checksum calculation as used in ZIP, PNG, gzip etc. (ISO 3309 / IEEE 802.3). Other variants like CRC32C (Castagnoli) are not supported.

## Quick start

```roc
app [main!] {
    pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.26.0/GddgvsGjiNXrHFW6au5i5dUDbTs8FinQdrgE2Gqmw53t.tar.zst",
    crc32: "https://github.com/niclas-ahden/roc-crc32/releases/download/2.0.0/Dpu6zTP4s6bYRC2U9jWK7CcNBNGEfViKQbp35xSRC2Cr.tar.zst",
}

import pf.Stdout
import crc32.Crc32

main! = |_args| {
    # Calculate the checksum in one shot given some bytes
    one_shot = Crc32.checksum("My wife is pregnant".to_utf8())
    Stdout.line!("One-shot: ${one_shot.to_str()}")?

    # Or calculate the checksum piece by piece with `empty`, `write`, and
    # `finish`. Useful when you get the data in chunks, e.g. when reading a file.
    chunks = [
        "My wife ".to_utf8(),
        "is ".to_utf8(),
        "pregnant".to_utf8(),
    ]
    streamed = chunks.fold(Crc32.empty(), Crc32.write).finish()
    Stdout.line!("Streaming: ${streamed.to_str()}")?

    # Both of these examples will output the same checksum

    Ok({})
}
```

See [examples](examples/) for a runnable program.

## Documentation

View the brief API documentation at [https://niclas-ahden.github.io/roc-crc32/](https://niclas-ahden.github.io/roc-crc32/).
