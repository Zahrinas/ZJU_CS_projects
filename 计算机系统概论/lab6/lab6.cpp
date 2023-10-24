#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;
#define lop(i,n) for(int i=1;i<=(n);++i)
#define loop(i,n) for(int i=0;i<(n);++i)
#define inf 0x3f3f3f3f

#include<map>
#include<bitset>
using namespace std;

struct LC3{
	short val;
	LC3(short v = 0x7777):val(v){
	}
	friend bool operator<(const LC3& a, const LC3& b){
		return a.val < b.val;
	}
	friend istream& operator>>(istream& in, LC3& t){
		string str;
		in >> str;
		t.val = bitset<16>(str).to_ulong();
		return in;
	}
	short trunc(int a, int b){
		short ret = val, trk = val;
		loop(i, a) trk >>= 1;
		trk <<= a - b;
		loop(i, b) ret >>= 1;
		return ret - trk;
	}
	short sigext(int a, int b){
		short ret = trunc(a, b);
		if(a - b == 11 && trunc(11, 10)) ret |= 0xf800;
		if(a - b == 9 && trunc(9, 8)) ret |= 0xfe00;
		if(a - b == 6 && trunc(6, 5)) ret |= 0xffc0;
		if(a - b == 5 && trunc(5, 4)) ret |= 0xffe0;
		return ret;
	}
	LC3 operator++(int){
		return this->val++;
	}
}addr, inst, ip, pc, nzp, reg[8];
map<LC3, LC3> memory;
void run(){
	while(1){
		inst = memory[ip];
		pc = ip.val + 1;
		short opcode = inst.trunc(16, 12);
		int dr = inst.trunc(12, 9);
		int sr1 = inst.trunc(9, 6);
		int usi = inst.trunc(6, 5);
		int sr2 = inst.trunc(3, 0);
		int brn = inst.trunc(12, 11);
		int brz = inst.trunc(11, 10);
		int brp = inst.trunc(10, 9);
		short imm11 = inst.sigext(11, 0);
		short imm9 = inst.sigext(9, 0);
		short imm6 = inst.sigext(6, 0);
		short imm5 = inst.sigext(5, 0);
		switch(opcode){
			case 0:{
				if(brn && nzp.val < 0) pc = pc.val + imm9;
				else if(brz && nzp.val == 0) pc = pc.val + imm9;
				else if(brp && nzp.val > 0) pc = pc.val + imm9;
				break;
			}//BR
			case 1:{
				if(usi) reg[dr] = reg[sr1].val + imm5;
				else reg[dr] = reg[sr1].val + reg[sr2].val;
				nzp = reg[dr];
				break;
			}//ADD
			case 2:{
				reg[dr] = memory[pc.val + imm9];
				nzp = reg[dr];
				break;
			}//LD
			case 3:{
				memory[pc.val + imm9] = reg[dr];
				break;
			}//ST
			case 4:{
				reg[7] = pc;
				if(brn) pc = pc.val + imm11;
				else pc = reg[sr1].val;
				break;
			}//JSR
			case 5:{
				if(usi) reg[dr] = reg[sr1].val & imm5;
				else reg[dr] = reg[sr1].val & reg[sr2].val;
				nzp = reg[dr];
				break;
			}//AND
			case 6:{
				reg[dr] = memory[reg[sr1].val + imm6];
				nzp = reg[dr];
				break;
			}//LDR
			case 7:{
				memory[reg[sr1].val + imm6] = reg[dr].val;
				break;
			}//STR
			case 9:{
				reg[dr] = ~reg[sr1].val;
				nzp = reg[dr];
				break;
			}//NOT
			case 10:{
				reg[dr] = memory[memory[pc.val + imm9]];
				nzp = reg[dr];
				break;
			}//LDI
			case 11:{
				memory[memory[pc.val + imm9]] = reg[dr].val;
				break;
			}//STI
			case 12:{
				pc = reg[sr1];
				break;
			}//JMP
			case 14:{
				reg[dr] = pc.val + imm9;
				break;
			}//LEA
			case 15:{
				return;
			}//TRAP
		}
		ip = pc;
	}
}
signed main(signed, char**, char**){
	cin >> ip;
	addr = ip;
	while(cin >> inst, !cin.eof()){
		memory[addr++] = inst;
	}
	run();
	loop(i, 8) printf("R%d = x%04hX\n", i, reg[i].val);
}