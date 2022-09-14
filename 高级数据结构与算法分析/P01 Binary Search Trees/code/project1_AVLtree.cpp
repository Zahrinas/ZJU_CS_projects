#include "AVLtree.h"
#include<stdio.h>
#include<malloc.h>
#include<math.h>
#include<time.h>

AVLtree AVL_Insert(int X, AVLtree& A)
{
	if (A == NULL) {
		A = (AVLtree)malloc(sizeof(struct AVLNode));
		if (A == NULL) {
			printf("ERROR! Out of space!!!");
		}
		else {
			A->data = X;
			A->Left = NULL;
			A->Right = NULL;
			A->height = 0;
		}
	}
	else if (X < A->data) {
		A->Left = AVL_Insert(X, A->Left);
		if (AVL_GetHeight(A->Left) - AVL_GetHeight(A->Right) == 2) {
			if (X < A->Left->data) A = AVL_SingleRotateWithLeft(A);
			else A = AVL_DoubleRotateWithLeft(A);
		}
	}
	else if (X > A->data) {
		A->Right = AVL_Insert(X, A->Right);
		if (AVL_GetHeight(A->Right) - AVL_GetHeight(A->Left) == 2) {
			if (X > A->Right->data) A = AVL_SingleRotateWithRight(A);
			else A = AVL_DoubleRotateWithRight(A);
		}
	}
	A->height = Max(AVL_GetHeight(A->Left), AVL_GetHeight(A->Right)) + 1;

	return A;
}

int AVL_GetHeight(AVLtree P)
{
	if (P == NULL) return -1;
	else return P->height;
}

AVLtree AVL_SingleRotateWithLeft(AVLtree A)
{
	AVLtree K;
	K = A->Left;
	A->Left = K->Right;
	K->Right = A;
	A->height = Max(AVL_GetHeight(A->Left), AVL_GetHeight(A->Right)) + 1;
	K->height = Max(AVL_GetHeight(K->Left), A->height) + 1;

	return K;
}

AVLtree AVL_SingleRotateWithRight(AVLtree A)
{
	AVLtree K;
	K = A->Right;
	A->Right = K->Left;
	K->Left = A;
	A->height = Max(AVL_GetHeight(A->Left), AVL_GetHeight(A->Right)) + 1;
	K->height = Max(AVL_GetHeight(K->Right), A->height) + 1;

	return K;
}

AVLtree AVL_DoubleRotateWithLeft(AVLtree A)
{
	A->Left = AVL_SingleRotateWithRight(A->Left);
	return AVL_SingleRotateWithLeft(A);
}

AVLtree AVL_DoubleRotateWithRight(AVLtree A)
{
	A->Right = AVL_SingleRotateWithLeft(A->Right);
	return AVL_SingleRotateWithRight(A);
}

int Max(int a, int b)
{
	if (a > b) return a;
	else return b;
}

void nodefree(AVLtree A)
{
	if (A != NULL) {
		nodefree(A->Left);
		nodefree(A->Right);
		free(A);
	}
}

AVLtree AVL_Delete(AVLtree& A, int X)
{
	if (A == NULL) {
		return NULL;
	}
	if (X < A->data) {
		A->Left = AVL_Delete(A->Left, X);
		if (abs(AVL_GetHeight(A->Right) - AVL_GetHeight(A->Left)) == 2) {
			AVLtree P = A->Right;
			if (AVL_GetHeight(P->Left) > AVL_GetHeight(P->Right)) {
				A = AVL_DoubleRotateWithRight(A);
			}
			else {
				A = AVL_SingleRotateWithRight(A);
			}
		}
	}
	else if (X > A->data) {
		A->Right = AVL_Delete(A->Right, X);
		if (abs(AVL_GetHeight(A->Left) - AVL_GetHeight(A->Right)) == 2) {
			AVLtree P = A->Left;
			if (AVL_GetHeight(P->Right) > AVL_GetHeight(P->Left)) {
				A = AVL_DoubleRotateWithLeft(A);
			}
			else {
				A = AVL_SingleRotateWithLeft(A);
			}
		}
	}
	else if (X == A->data)
	{
		if (A->Left && A->Right) {
			if (AVL_GetHeight(A->Left) > AVL_GetHeight(A->Right)) {
				AVLtree max = AVL_getMaxNum(A->Left);
				A->data = max->data;
				A->Left = AVL_Delete(A->Left, max->data);
			}
			else {
				AVLtree min = AVL_getMinNum(A->Right);
				A->data = min->data;
				A->Right = AVL_Delete(A->Right, min->data);
			}
		}
		else {
			A = A->Left ? A->Left : A->Right;
			return A;
		}
	}
	A->height = Max(AVL_GetHeight(A->Left), AVL_GetHeight(A->Right)) + 1;
	return A;
}

AVLtree AVL_getMaxNum(AVLtree A)
{
	if (!A) {
		return NULL;
	}
	while (A->Right) {
		A = A->Right;
	}
	return A;
}

AVLtree AVL_getMinNum(AVLtree A)
{
	if (!A) {
		return NULL;
	}
	while (A->Left) {
		A = A->Left;
	}
	return A;
}

double Opr_AVL(int k, int n, int* memory) {
	AVLtree AVL = 0;

	clock_t start = clock();
	for (int i = 1;i <= k;++i) {
		for (int j = 1;j <= n;++j) AVL_Insert(memory[j], AVL);
		for (int j = 1;j <= n;++j) AVL_Delete(AVL, memory[n + j]);
	}
	clock_t stop = clock();

	return ((double)(stop - start)) / CLK_TCK / k;
}