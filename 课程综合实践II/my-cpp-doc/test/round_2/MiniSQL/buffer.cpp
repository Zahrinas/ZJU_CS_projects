#include<ios>
#include<ctime>
#include<fstream>
#include<iostream>

#include"buffer.h"
using namespace std;

BufferManager Buffer;

buffer::buffer() {
	isWritten = 0;
	isValid = 0;
	blockOffset = 0;
	recent_time = clock();
	FILENAME = "";

	fill(values, values + BlockSize, '#');
	values[BlockSize] = '\0';
}

buffer::~buffer() {
}

string buffer::substring(int startp, int endp) {
	string ret = "";
	for (int i = max(0, startp);i < min(BlockSize, endp);++i) ret += values[i];
	return ret;
}

char buffer::charAt(int pos) {
	if (0 <= pos && pos < BlockSize) return values[pos];
	return 0;
}

BufferManager::BufferManager() {

}

BufferManager::~BufferManager() {
	for (int i = 0; i < MaxBlockNumber; ++i) writeBack(i);
}

int BufferManager::createNewBlock(string FILENAME, int BlockOffset) {
	int No = getEmptyBuffer();
	Blocks[No] = buffer();
	Blocks[No].FILENAME = FILENAME;
	Blocks[No].blockOffset = BlockOffset;
	Blocks[No].isValid = 1;
	setWritten(No);

	fstream fout(Blocks[No].FILENAME, ios::out | ios::app | ios::binary);
	fout.seekp(BlockSize*Blocks[No].blockOffset, fout.beg);
	fout.write(Blocks[No].values, BlockSize);
	fout.close();

	return No;
}

void BufferManager::writeBack(int Number) {
	if (!Blocks[Number].isWritten) return;

	FILE *fp = fopen(Blocks[Number].FILENAME.c_str(), "r+b");
	if (fp == NULL) throw("Cannot find the file.");
	fseek(fp, BlockSize * Blocks[Number].blockOffset, SEEK_SET);
	fwrite(Blocks[Number].values, BlockSize, 1, fp);
	fclose(fp);
	Blocks[Number] = buffer();
}

void BufferManager::writeFile(string FILENAME) {
	for (int i = 0;i < MaxBlockNumber;++i) if (Blocks[i].FILENAME == FILENAME) {
		writeBack(i);
	}
}

int BufferManager::idInBuffer(string FILENAME, int blockOffset) {
	for (int i = 0; i < MaxBlockNumber; ++i)
		if (Blocks[i].FILENAME == FILENAME && Blocks[i].blockOffset == blockOffset) return i;
	return -1;
}

int BufferManager::getEmptyBuffer() {
	int LRBnum = 0;
	for (int i = 0; i < MaxBlockNumber; ++i) {
		if (!Blocks[i].isValid) {
			Blocks[i] = buffer();
			return i;
		}
		else if (Blocks[LRBnum].recent_time > Blocks[i].recent_time)
			LRBnum = i;
	}
	writeBack(LRBnum);
	return LRBnum;
}

int BufferManager::getEmptyBufferExcept(string FILENAME) {
	int LRBnum = 0;
	for (int i = 0; i < MaxBlockNumber; ++i) {
		if (!Blocks[i].isValid) {
			Blocks[i] = buffer();
			return i;
		}
		else if (Blocks[LRBnum].recent_time > Blocks[i].recent_time && Blocks[i].FILENAME != FILENAME)
			LRBnum = i;
	}
	writeBack(LRBnum);
	return LRBnum;
}

int BufferManager::getBufferNum(string FILENAME, int blockOffset) {
	int bufferNum = idInBuffer(FILENAME, blockOffset);
	if (bufferNum == -1) {
		bufferNum = getEmptyBufferExcept(FILENAME);
		readBlock(FILENAME, blockOffset, bufferNum);
	}
	return bufferNum;
}

void BufferManager::readBlock(string FILE, int blockOffset, int bufferNum) {
	Blocks[bufferNum].isValid = 1;
	Blocks[bufferNum].isWritten = 0;
	Blocks[bufferNum].blockOffset = blockOffset;
	Blocks[bufferNum].recent_time = clock();
	Blocks[bufferNum].FILENAME = FILE;

	fstream fin(FILE, ios::in | ios::binary);
	if (!fin.is_open()) throw("Cannot find the file");
	fin.seekp(BlockSize*blockOffset, ios::beg);
	fin.read(Blocks[bufferNum].values, BlockSize);
	fin.close();
}

void BufferManager::useBlock(int bufferNum) {
	Blocks[bufferNum].recent_time = clock();
}

void BufferManager::setWritten(int bufferNum) {
	useBlock(bufferNum);
	Blocks[bufferNum].isWritten = 1;
}

where BufferManager::whereToInsert(string FILENAME, int size, int& BlockCnt) {
	if (BlockCnt == 0) {
		Blocks[createNewBlock(FILENAME, ++BlockCnt)].values[0] = '\0';
		return where(FILENAME, BlockCnt, 0);
	}
	int No = getBufferNum(FILENAME, BlockCnt);
	int CAP = BlockSize / size;
	for (int num = 0;num < CAP;++num) {
		if (Blocks[No].values[num*size] == '#') {
			Blocks[No].values[num*size] = '\0';
			return where(FILENAME, BlockCnt, num*size);
		}
	}
	Blocks[createNewBlock(FILENAME, ++BlockCnt)].values[0] = '\0';
	return where(FILENAME, BlockCnt, 0);
}

void BufferManager::insertTo(where pos, vector<char> str) {
	int No = getBufferNum(pos.FILENAME, pos.Block);
	int len = str.size();
	for (int i = 0;i < len;++i) Blocks[No].values[pos.Location + i] = str[i];
	setWritten(No);
}