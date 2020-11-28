all: main main-static main-pie main-pie-static main-noplt main-noplt-static main-nopic main-nopic-static main-nopic-noplt-static main-nopic-noplt-nopie main-nopic-noplt-nopie-static

main: main.c
	gcc -ggdb -m32 -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-static: main.c
	gcc -ggdb -m32 -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

main-pie: main.c
	gcc -ggdb -m32 -fPIE -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-pie-static: main.c
	gcc -ggdb -m32 -fPIE -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

main-noplt: main.c
	gcc -ggdb -m32 -fno-plt -o $@ $<	
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-noplt-static: main.c
	gcc -ggdb -m32 -fno-plt -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

main-nopic: main.c
	gcc -ggdb -m32 -fno-pic -o $@ $<	
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-nopic-static: main.c
	gcc -ggdb -m32  -fno-pic -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

# printf@plt error
main-nopic-noplt: main.c
	gcc -ggdb -m32 -fno-plt -fno-pic -o $@ $<	
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-nopic-noplt-static: main.c
	gcc -ggdb -m32 -fno-plt -fno-pic -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

main-nopic-noplt-nopie: main.c
	gcc -ggdb -m32 -fno-plt -no-pie -fno-pic -o $@ $<	
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt
main-nopic-noplt-nopie-static: main.c
	gcc -ggdb -m32 -fno-plt -fno-pie -fno-pic -static -o $@ $<
	readelf -a $@ > readelf-$@.txt
	objdump -M intel -D $@ > objdump-$@.txt

clean:
	rm -rf main main-* *.txt *.o
