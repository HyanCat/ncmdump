default:
	@echo "Please choose a platform: linux, macos, win32"

linux:
	g++ main.cpp cJSON.cpp aes.cpp ncmcrypt.cpp -o ncmdump -ltag
	strip ncmdump

macos:
	export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$(brew --prefix)/include"
	export LIBRARY_PATH=$(brew --prefix)/lib
	clang++ main.cpp cJSON.cpp aes.cpp ncmcrypt.cpp -o ncmdump -ltag
	strip ncmdump

win32:
	g++ main.cpp cJSON.cpp aes.cpp ncmcrypt.cpp -o ncmdump -ltag -Ltaglib/lib -Itaglib/include -static -O
	strip ncmdump.exe

clean:
	rm -f ncmdump ncmdump.exe