I64 find(F64 cr, F64 ci, I64 max_iterations) {
	F64 zr = 0.0;
	F64 zi = 0.0;
	
	I64 i;
	
	while (i < max_iterations && zr * zr + zi * zi < 4.0) {
		F64 t = zr * zr - zi * zi + cr;
		zi = 2.0 * zr * zi + cr;
        zr = t;
        i++;
	}
	return i;
}

I64 mr(I64 x, I64 larghezza, F64 minR, F64 maxR) {
	F64 range = maxR - minR;
	return x * (range / larghezza) + minR;
}

F64 mi(I64 y, I64 lunghezza, F64 minI, F64 maxI) {
	F64 rangeI = maxI - minI;
	return y * (rangeI / lunghezza) + minI;
}

I64 main() {
	U8 *f;
	I64 larghezza, lunghezza, maxN;
	F64 minR, maxR, minI, maxI;
	if (!FileFind(f)) {
		Copy("input.txt");
	}
	st = MStrScan(larghezza, lunghezza, maxN);
	st = MStrScan(minR, maxR, minI, maxI);
	
	st = MStrPrint("P3\n");
	st = MStrPrint(larghezza + " " + lunghezza + "\n");
	st = MStrPrint("255");
	
	for (I64 i = 0; i < lunghezza; i++) {
		for (I64 j = 0; j < larghezza; j++) {
			F64 cr = mr(j, larghezza, minR, maxR);
			F64 ci = mi(i, lunghezza, minI, maxI);
			I64 n = find(cr, ci, maxN);

			I64 r = (n % 256);
			I64 g = (n % 256);
			I64 b = (n % 256);

			st = MStrPrint(r + " " + g + " " + b + " ");
		}
		st = MStrPrint("\n");
	}
	Free(st);
	printf("Fatto!\n");
	return 0;
}
