#pragma once
#include<vector>

#include"types.h"
using namespace std;

const int BlockSize = 4096;
const int MaxBlockNumber = 100;

struct buffer {
	bool isWritten;
	bool isValid;
	int blockOffset;
	int recent_time;
	string FILENAME;
	char values[BlockSize + 1];

	buffer();
	~buffer();
	string substring(int startp, int endp);
	char charAt(int pos);
};

struct BufferManager {
	buffer Blocks[MaxBlockNumber];

	BufferManager();
	~BufferManager();

	void useBlock(int bufferNum);
	void writeBack(int bufferNum);
	void writeFile(string FILENAME);
	void setWritten(int bufferNum);

	int getEmptyBuffer();
	int getEmptyBufferExcept(string filename);
	int idInBuffer(string filename, int blockOffset);
	int getBufferNum(string filename, int blockOffset);
	int createNewBlock(string FILENAME, int BlockOffset);

	void readBlock(string filename, int blockOffset, int bufferNum);
	where whereToInsert(string FILENAME, int size, int& BlockCnt);
	void insertTo(where pos, vector<char> str);
};
