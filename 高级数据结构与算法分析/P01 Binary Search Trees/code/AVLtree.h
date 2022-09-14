#ifndef _SPLAYTREE_H
#define _SPLAYTREE_H

typedef struct AVLNode *AVLtree;
struct AVLNode {
	int data;
	AVLtree Left;
	AVLtree Right;
	int height;
};

extern int Max(int a, int b);// find the bigger one between a and b
extern int AVL_GetHeight(AVLtree P);// get AVLtree's height
extern void nodefree(AVLtree A);// free the memorise of AVLtree
extern AVLtree AVL_Insert(int X, AVLtree& A);// insert in AVL
extern AVLtree AVL_SingleRotateWithLeft(AVLtree A);// AVL's LL
extern AVLtree AVL_SingleRotateWithRight(AVLtree A);// AVL's RR
extern AVLtree AVL_DoubleRotateWithLeft(AVLtree A);// AVL's LR
extern AVLtree AVL_DoubleRotateWithRight(AVLtree A);// AVL's RL
extern AVLtree AVL_Delete(AVLtree& A, int X);// delete X in AVLtree
extern AVLtree AVL_getMaxNum(AVLtree A);// find the maximum node in AVLtree
extern AVLtree AVL_getMinNum(AVLtree A);// find the minimum node in AVLtree

double Opr_AVL(int k, int n, int* memory);

#endif
