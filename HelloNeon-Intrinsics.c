/**
 * @file	HellNeon-Intrinsics.c
 * @author	Alija Sabic, es16m016, MES1B
 * @date	January 2017
 * @brief	TODO
 */

#include <arm_neon.h>

uint32x4_t double_elements(uint32x4_t input) {
	return (vaddq_u32(input,input));
}


int main(void) {

	return 0;
}

