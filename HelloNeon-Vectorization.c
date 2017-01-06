/**
 * @file	HelloNeon-Vectorization.c
 * @author	Alija Sabic, es16m016, MES1B
 * @date	January 2017
 * @brief	TODO
 */


int accumulate(int * c, int len) {
	int i, retval;

	// indicate len is always multiple of 4
	for(i = 0, retval = 0; i < (len & ~3); i++) {
		retval = retval + c[i];
	}
	return retval;
}


int accumulate2(char * c, char * d, char * restrict e, int len) {
	int i;

	for (i = 0; i < (len & ~3); i++) {
		e[i] = d[i] + c[i];
	}

	return i;
}


unsigned int vector_add_of_n(unsigned int* ptr, unsigned int items) {
	unsigned int result=0;
	unsigned int i;

	for (i=0; i<(items*4); i+=1) {
		result+=ptr[i];
	}

	return result;
}




int main (void) {

	return 0;
}
