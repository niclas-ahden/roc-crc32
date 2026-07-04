app [main!] {
	pf: platform "https://github.com/lukewilliamboswell/roc-platform-template-zig/releases/download/0.9/8GdFEvQYS3TeAZxKvTzCLVdQiomweGtXcdZkXNDEeABq.tar.zst",
	crc32: "../package/main.roc",
}

import pf.Stdout
import crc32.Crc32

main! = |_args| {
	Stdout.line!("=== Crc32 Package Demo ===")

	# Standard test vector: "123456789" -> 0xCBF43926
	Stdout.line!("checksum(\"123456789\"): ${Crc32.checksum("123456789".to_utf8()).to_str()}")

	# Hello, World!
	hello = "Hello, World!".to_utf8()
	Stdout.line!("checksum(\"Hello, World!\"): ${Crc32.checksum(hello).to_str()}")

	# Raw bytes
	Stdout.line!("checksum([0x00]): ${Crc32.checksum([0x00]).to_str()}")

	# Empty input
	Stdout.line!("checksum([]): ${Crc32.checksum([]).to_str()}")

	Ok({})
}
