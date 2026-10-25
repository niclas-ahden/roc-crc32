app [main!] {
	pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.26.0/GddgvsGjiNXrHFW6au5i5dUDbTs8FinQdrgE2Gqmw53t.tar.zst",
	crc32: "../package/main.roc",
}

import pf.Stdout
import crc32.Crc32

main! = |_args| {
	# Calculate the checksum in one shot given some bytes
	one_shot = Crc32.checksum("My wife is pregnant".to_utf8())
	Stdout.line!("One-shot: ${one_shot.to_str()}")?

	# Or calculate the checksum piece by piece with `begin`, `update`, and
	# `finish`. Useful when you get the data in chunks, e.g. when reading a file.
	chunks = [
		"My wife ".to_utf8(),
		"is ".to_utf8(),
		"pregnant".to_utf8(),
	]
	streamed = chunks.fold(Crc32.begin(), Crc32.update).finish()
	Stdout.line!("Streaming: ${streamed.to_str()}")?

	# Both of these examples will output the same checksum

	Ok({})
}
