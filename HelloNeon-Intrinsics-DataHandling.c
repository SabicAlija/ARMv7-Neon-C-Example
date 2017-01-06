/**
 * @file	HelloNeon-Intrinsics-DataHandling.c
 * @author	Alija Sabic, es16m016, MES1B
 * @date	January 2017
 * @brief	TODO
 */

#include <arm_neon.h>

unsigned short int A[] = {1,2,3,4}; // array with 4 elements

int main (void) {

	// declare a vector with four 16-Bit lanes
	uint16x4_t v;


	// load the array from  memory into a vector
	v = vld1_u16(A);

	// double  each element in the vector
	v = vadd_u16(v,v);

	// store the vector back to the memory
	vst1_u16(A, v);

	return 0;
}

