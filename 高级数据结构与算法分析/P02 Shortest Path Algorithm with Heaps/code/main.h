#pragma once

struct edge {
	int target;
	int weight;
	edge* next;
};