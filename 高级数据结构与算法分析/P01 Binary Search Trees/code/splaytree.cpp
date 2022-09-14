//
// Created by Once on 2019/7/11.
//

#include "splaytree.h"
#include <string.h>
#include <stdlib.h>
#include <time.h>

SplayTree *splaytree_init(){
    SplayTree *splaytree = (SplayTree*)malloc(sizeof(SplayTree));
    if(!splaytree){
        perror("init splay tree error.");
        return NULL;
    }
    splaytree->root = NULL;
    splaytree->size = 0;
    return splaytree;
}

int splaytree_is_full(SplayTree *splaytree){
    SplayNode *node = (SplayNode*)malloc(sizeof(SplayNode));
    if(!node)
        return 1;
    free(node);
    return 0;
}

int splaytree_is_empty(SplayTree *splaytree){
    if(splaytree == NULL)
        return 1;
    return splaytree->size == 0;
}

// 鍗曟棆杞細鍙湁鐖剁粨鐐癸紙鏍圭粨鐐癸�?

// 涔嬪瓧褰㈡棆杞紝鍙屾棆�?// LL
static SplayNode *rotate_left_single(SplayNode *root){
    SplayNode *node = root->left;
    root->left = node->right;
    node->right = root;
    return node;
}

// RR
static SplayNode *rotate_right_single(SplayNode *root){
    SplayNode *node = root->right;
    root->right = node->left;
    node->left = root;
    return node;
}

// LR
static SplayNode *rotate_left_double(SplayNode *root){
    root->left = rotate_right_single(root->left);
    return rotate_left_single(root);
}

// RL
static SplayNode *rotate_right_double(SplayNode *root){
    root->right = rotate_left_single(root->right);
    return rotate_right_single(root);
}

// 涓€瀛楀舰鏃嬭浆
static SplayNode *rotate_zig_zig_left(SplayNode *root){
    SplayNode *son = root->left->left;
    SplayNode *parent = root->left;
    parent->left = son->right;
    root->left = parent->right;
    son->right = parent;
    parent->right = root;
    return son;
}

static SplayNode *rotate_zig_zig_right(SplayNode *root){
    SplayNode *son = root->right->right;
    SplayNode *parent = root->right;
    parent->right = son->left;
    root->right = parent->left;
    son->left = parent;
    parent->left = root;
    return son;
}

static SplayNode *add_node(SplayTree *splaytree, SplayNode *root, int element){
    if(!root){
        root = (SplayNode*)malloc(sizeof(SplayNode));
        if(!root){
            perror("init splay node error.");
            return NULL;
        }
        root->left = root->right = NULL;
        root->element = element;
        splaytree->size++;
        return root;
    }
    else if(root->element > element){
        root->left = add_node(splaytree, root->left, element);
        if(splaytree->root == root && root->left->element == element)
            root = rotate_left_single(root);
        else if(root->left->left && root->left->left->element == element)
            root = rotate_zig_zig_left(root);
        else if(root->left->right && root->left->right->element == element)
            root = rotate_left_double(root);
        return root;
    }
    else if(root->element < element){
        root->right = add_node(splaytree, root->right, element);
        if(splaytree->root == root && root->right->element == element)
            root = rotate_right_single(root);
        else if(root->right->right && root->right->right->element == element)
            root = rotate_zig_zig_right(root);
        else if(root->right->left && root->right->left->element == element)
            root = rotate_right_double(root);
        return root;
    }
    else{
        return root;
    }
}

int splaytree_add(SplayTree *splaytree, int element){
    if(splaytree == NULL)
        return 0;
    splaytree->root = add_node(splaytree, splaytree->root, element);
    return 1;
}

static SplayNode *find_max(SplayNode *root){
    if(root->right)
        return find_max(root->right);
    else
        return root;
}

static SplayNode *node_rotate_to_root(SplayNode *tree_root, SplayNode *root, unsigned int id){
    if(!root)
        return NULL;
    if(root->element == id){
        return root;
    }
    else if(root->element > id){
        root->left = node_rotate_to_root(tree_root, root->left, id);
        if(tree_root == root && root->left->element == id)
            root = rotate_left_single(root);
        else if(root->left->left && root->left->left->element == id)
            root = rotate_zig_zig_left(root);
        else if(root->left->right && root->left->right->element == id)
            root = rotate_left_double(root);
    }
    else{
        root->right = node_rotate_to_root(tree_root, root->right, id);
        if(tree_root == root && root->right->element == id)
            root = rotate_right_single(root);
        else if(root->right->right && root->right->right->element == id)
            root = rotate_zig_zig_right(root);
        else if(root->right->left && root->right->left->element == id)
            root = rotate_right_double(root);
    }
    return root;
}

int splaytree_delete_by_id(SplayTree *splaytree, unsigned int id){
    if(splaytree == NULL || splaytree->size == 0)
        return 0;
    SplayNode *root = node_rotate_to_root(splaytree->root, splaytree->root, id);
    if(!root)
        return 0;
    SplayNode *left = root->left;
    SplayNode *right = root->right;
    free(root);
    if(left){
        SplayNode *max = find_max(left);
        SplayNode *left_node = node_rotate_to_root(left, left, max->element);
        left_node->right = right;
        splaytree->root = left_node;
    }
    else
        splaytree->root = right;
    splaytree->size--;
    return 1;
}

SplayNode *splaytree_get_by_id(SplayTree *splaytree, unsigned int id){
    if(splaytree == NULL || splaytree->size == 0)
        return NULL;
    splaytree->root = node_rotate_to_root(splaytree->root, splaytree->root, id);
    return splaytree->root;
}

static void traverse_tree(SplayNode *root, void (*traverse)(SplayNode*)){
    if(!root)
        return;
    traverse_tree(root->left, traverse);
    traverse(root);
    traverse_tree(root->right, traverse);
}

void splaytree_traverse(SplayTree *splaytree, void (*traverse)(SplayNode*)){
    if(splaytree == NULL || splaytree->size == 0 || traverse == NULL)
        return;
    traverse_tree(splaytree->root, traverse);
}

static int clear_node(SplayNode *root){
    if(!root)
        return 0;
    clear_node(root->left);
    clear_node(root->right);
    free(root);
    return 1;
}

int splaytree_clear(SplayTree *splaytree){
    if(splaytree == NULL)
        return 0;
    clear_node(splaytree->root);
    free(splaytree);
    return 1;
}

double Opr_SPL(int k, int n, int* memory) {
	SplayTree *splaytree = splaytree_init();

	clock_t start = clock();
	for (int i = 1;i <= k;++i) {
		for (int j = 1;j <= n;++j) splaytree_add(splaytree, memory[j]);
		for (int j = 1;j <= n;++j) splaytree_delete_by_id(splaytree, memory[n + j]);
	}
	clock_t stop = clock();

	return ((double)(stop - start)) / CLK_TCK / k;
}