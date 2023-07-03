#include "../view_model/cppFileContent.h"
#include <sstream>
#include <assert.h>
#include <vector>
#include <fstream>
using namespace std;

void CppFileContent::Init() {
    name2class.clear();
}

enum TOKEN {
    COLON_,
    DOUBLE_COLON_,
    SEMICOLON_,
    COMMA_,
    BACKWARD_SLASH_,
    BACKWARD_SLASH_WITH_CHARACTOR_,
    DIVIDE_,
    MULTIPLY_,
    SINGLE_QUOTE_,
    DOUBLE_QUOTE_,
    LEFT_BRACE_,
    RIGHT_BRACE_,
    QUESTION_MARK_,
    LEFT_COMMENT_,
    RIGHT_COMMENT_,
    LOGICAL_AND_,
    ARITHMATIC_AND_,
    LOGICAL_OR_,
    ARITHMATIC_OR_,
    LESS_,
    SINGLE_EQUAL_,
    DOUBLE_EQUAL_,
    LESS_EQUAL_,
    LEFT_PARENTHESES_,
    RIGHT_PARENTHESES_,
    GREATER_,
    GREATER_EQUAL_,
    ADD_SIGN_,
    MINUS_SIGN_,
    AT_SIGN_,
    NUMBER_,
    CLASS_,
    STRUCT_,
    PUBLIC_,
    PRIVATE_,
    PROTECTED_,
    TEMPLATE_,
    EOF_,
    CONST_,
    OPERATOR_,
    THROW_,
    TYPE_INT_,
    TYPE_DOUBLE_,
    TYPE_FLOAT_,
    TYPE_CHAR_,
    TYPE_VOID_,
    TYPE_UNSIGNED_,
    TYPE_LONG_,
    TYPE_STRING_,
    UNKNOWN_WORD_,
    UNKNOWN_SYMBOL_,
};


TOKEN getReserved(string s) {
	if (s == "class") return CLASS_;
	else if (s == "struct") return STRUCT_;
	else if (s == "public") return PUBLIC_;
	else if (s == "private") return PRIVATE_;
	else if (s == "protected") return PROTECTED_;
	else if (s == "template") return TEMPLATE_;
	else if (s == "const") return CONST_;
	else if (s == "operator") return OPERATOR_;
	else if (s == "int") return TYPE_INT_;
	else if (s == "double") return TYPE_DOUBLE_;
	else if (s == "float") return TYPE_FLOAT_;
	else if (s == "char") return TYPE_CHAR_;
	else if (s == "void") return TYPE_VOID_;
	else if (s == "unsigned") return TYPE_UNSIGNED_;
	else if (s == "long") return TYPE_LONG_;
	else if (s == "string") return TYPE_STRING_;
    else if (s == "throw") return THROW_;
    else return UNKNOWN_WORD_;
}


fstream db_err("Model_ErrorLog.txt", fstream::out);
fstream db_out("Model_Output.txt", fstream::out);

using vts = vector<pair<TOKEN, string> >;
using vts_cit = vts::const_iterator;

static bool isOverloadable(char ch) {
	switch (ch) {
	case '+': case '-': case '*': case '/': case '%':
	case '|': case '&': case '~':
	case '^': case '<': case '>': case '=': case '!':
		return 1;
    default:
        return 0;
    }
}

static bool isType(TOKEN  t) {
	switch (t) {
	case TYPE_INT_: case TYPE_CHAR_: case TYPE_VOID_: case TYPE_FLOAT_: case TYPE_DOUBLE_:
	case TYPE_UNSIGNED_: case TYPE_LONG_: case TYPE_STRING_:
		return 1;
    default:
        return 0;
    }
}
namespace Automan {
	void SingleQuote(vts_cit &cur) {
		while ((cur++)->first != SINGLE_QUOTE_);
	}
	void DoubleQuote(vts_cit &cur) {
		while ((cur++)->first != DOUBLE_QUOTE_);
	}
	inline void Comment_PushAfterTrim(vector<string> &vec, string &st) {
		while (st.size() && st.back() == ' ') st.pop_back();
		if (st.size()) vec.emplace_back(st);
		st.clear();
	}
	vector<string>& Comment(vts_cit &cur) {
		static vector<string> vec; vec.clear();
		string st;
		while (cur->first != RIGHT_COMMENT_) {
			if (cur->first == MULTIPLY_) Comment_PushAfterTrim(vec, st);
			else st += cur->second + " ";
			++cur;
		}
		Comment_PushAfterTrim(vec, st);
		++cur;
		return vec;
	}
	string& TemplateDiscription(vts_cit &cur) {
		/*
		template<class T, int N> class A 
		=>
		A<class T, int N>
		*/
		static string st; st = "<";
		while (cur->first != GREATER_) {
			if (cur->first == COMMA_) st.pop_back();
			st += (cur++)->second + " ";
		}
		++cur;
		st.back() = '>';
		return st;
	}
	/* read < ... > */
	void ReadAngleBrackets(vts_cit &cur) {
		while ((cur++)->first != GREATER_);
	}

	void ReadUntil(vts_cit &cur, TOKEN ed) {
		while ((cur++)->first != ed);
	}

	/* read { ... } */
	void ReadBraceBody(vts_cit &cur) {
		while (cur->first != RIGHT_BRACE_) {
			if (cur->first == SINGLE_QUOTE_) SingleQuote(++cur);
			else if (cur->first == DOUBLE_QUOTE_) DoubleQuote(++cur);
			else if (cur->first == LEFT_COMMENT_) Comment(++cur);
			else if (cur->first == LEFT_BRACE_) ReadBraceBody(++cur);
			else ++cur;
		}
		++cur;
	}
	void ClassBody(vts_cit &cur, shared_ptr<Class> class_ptr, int pri0pro1pub2) {
		string last_name;
		int last_name_fid = -2;
		string last_type;
		int last_type_fid = -3;
		int fid = 0;
		while (cur->first != RIGHT_BRACE_) {
			++fid;
			if (cur->first == PRIVATE_) {
				pri0pro1pub2 = 0;
				++cur;
			}
			if (cur->first == PROTECTED_) {
				pri0pro1pub2 = 1;
				++cur;
			}
			if (cur->first == PUBLIC_) {
				pri0pro1pub2 = 2;
				++cur;
			}
			else if (cur->first == COMMA_ || cur->first == SEMICOLON_) {
				if (last_name_fid + 1 == fid) {
					string comp = string(1, "-#+"[pri0pro1pub2]) + " " + last_name;
					if (last_type_fid == fid - 2) comp += " " + last_type, fid -= 2;
					class_ptr->addComponents(comp);
				}
				++cur;
			}
			else if (cur->first == LEFT_PARENTHESES_) {
				string func = string(1, "-#+"[pri0pro1pub2]) + " " + last_name + "()";
				if (last_name_fid + 1 == fid && last_name != class_ptr->getName()) class_ptr->addFucntions(func);
				ReadUntil(++cur, RIGHT_PARENTHESES_);
			}
			else if (cur->first == LEFT_BRACE_) ReadBraceBody(++cur);
			else if (cur->first == UNKNOWN_WORD_) {
				last_name = cur->second;
				last_name_fid = fid;
				++cur;
			}
			else if (isType(cur->first)) {
				last_type = cur->second;
				last_type_fid = fid;
				++cur;
			}
			else ++cur;
		}
		++cur;
	}
	shared_ptr<Class> ClassAll(vts_cit &cur, map<string, shared_ptr<Class> > &name2class, bool is_default_public) {
		/*
		template <class T>
		class UCPointer : public A {
			
		};
		*/
		assert(cur->first == UNKNOWN_WORD_);
		string class_name = cur->second;
		if (!name2class.count(class_name)) name2class.emplace(class_name, make_shared<Class>(class_name));
		shared_ptr<Class> class_ptr = name2class[class_name];
		++cur;
		if (cur->first == SEMICOLON_) return class_ptr;
		if (cur->first == LEFT_BRACE_) {
			ClassBody(++cur, class_ptr, is_default_public ? 2 : 0);
			return class_ptr;
		}
		assert(cur->first == COLON_);
		++cur;
		while (1) {
			if (cur->first == LEFT_BRACE_) {
				ClassBody(++cur, class_ptr, is_default_public ? 2 : 0); 
				return class_ptr;
			}
			else if (cur->first == LESS_) ReadAngleBrackets(++cur);
			else if (cur->first == PUBLIC_ || cur->first == PROTECTED_ || cur->first == PRIVATE_) ++cur;
			else if (cur->first == COMMA_) ++cur;
			else if (cur->first == UNKNOWN_WORD_) {
				string supp_name = cur->second;
				if (!name2class.count(supp_name)) name2class.emplace(supp_name, make_shared<Class>(supp_name));
				class_ptr->addSuperclasses(supp_name);
				++cur;
			}
			else if (cur->first == DOUBLE_COLON_) ++cur;
			else assert(0);
		}
	}
	void File(vts_cit &cur, vts_cit ed, map<string, shared_ptr<Class> > &name2class) {
		vector<string> last_comment;
		int last_comment_id = -2;
		string template_disc;
		int template_disc_id = -2;
		int fid = 0;
		bool class0struct1;
		shared_ptr<Class> class_ptr;
		while (cur != ed) {
			++fid;
			switch (cur->first) {
			case SINGLE_QUOTE_: SingleQuote(++cur); break;
			case DOUBLE_QUOTE_: DoubleQuote(++cur); break;
			case LEFT_COMMENT_: last_comment = move(Comment(++cur)); last_comment_id = fid; break;
			case TEMPLATE_: template_disc = move(TemplateDiscription(++(++cur))); template_disc_id = fid; break;
			case CLASS_:
			case STRUCT_:
				class0struct1 = cur->first == STRUCT_;
				class_ptr = ClassAll(++cur, name2class, class0struct1);
				if (template_disc_id == fid - 1) class_ptr->addAttributes(class_ptr->getName() + template_disc);
				if (last_comment_id + (template_disc_id == fid - 1) == fid - 1)
					for (auto &str : last_comment) class_ptr->addAttributes(str);
				break;
			default:
				++cur;
			}
		}
	}
}

void CppFileContent::pushBack(string file_content) {
    stringstream s_in(file_content + string(1, EOF), ios_base::in);
	char ch;
	s_in.get(ch);
	db_err << "---- Init CppFileContent::pushBack ----" << endl;
	vts items;
	while (1) {
		while (isspace(ch)) s_in.get(ch);
		if (ch == ':') {
			s_in.get(ch);
			if (ch == ':') {
				items.emplace_back(DOUBLE_COLON_, "::");
				s_in.get(ch);
			}
			else items.emplace_back(COLON_, ":");
		}
		else if (ch == '\'') items.emplace_back(SINGLE_QUOTE_, "'"), s_in.get(ch);
		else if (ch == '"') items.emplace_back(DOUBLE_QUOTE_, "\""), s_in.get(ch);
		else if (ch == '{') items.emplace_back(LEFT_BRACE_, "{"), s_in.get(ch);
		else if (ch == '}') items.emplace_back(RIGHT_BRACE_, "}"), s_in.get(ch);
		else if (ch == ',') items.emplace_back(COMMA_, ","), s_in.get(ch);
		else if (ch == '?') items.emplace_back(QUESTION_MARK_, "?"), s_in.get(ch);
		else if (ch == ';') items.emplace_back(SEMICOLON_, ";"), s_in.get(ch);
		else if (ch == '(') items.emplace_back(LEFT_PARENTHESES_, "("), s_in.get(ch);
		else if (ch == ')') items.emplace_back(RIGHT_PARENTHESES_, ")"), s_in.get(ch);
		else if (ch == '+') items.emplace_back(ADD_SIGN_, "+"), s_in.get(ch);
		else if (ch == '-') items.emplace_back(ADD_SIGN_, "-"), s_in.get(ch);
		else if (ch == '@') items.emplace_back(AT_SIGN_, "@"), s_in.get(ch);
		else if (ch == '=') {
			s_in.get(ch);
			if (ch == '=') {
				items.emplace_back(DOUBLE_EQUAL_, "==");
				s_in.get(ch);
			}
			else {
				items.emplace_back(SINGLE_EQUAL_, "=");
			}
		}
		else if (ch == '<') {
			s_in.get(ch);
			if (ch == '=') {
				items.emplace_back(LESS_EQUAL_, "<=");
				s_in.get(ch);
			}
			else {
				items.emplace_back(LESS_, "<");
			}
		}
		else if (ch == '>') {
			s_in.get(ch);
			if (ch == '=') {
				items.emplace_back(GREATER_EQUAL_, ">=");
				s_in.get(ch);
			}
			else {
				items.emplace_back(GREATER_, ">");
			}
		}
		else if (ch == '\\') {
			s_in.get(ch);
			if (isalpha(ch) || ch == '\'' || ch == '"') {
				items.emplace_back(BACKWARD_SLASH_WITH_CHARACTOR_, string({ '\\', ch }));
				s_in.get(ch);
			}
			else {
				items.emplace_back(BACKWARD_SLASH_, "\\");
			}
 		}
		else if (ch == '&') {
			s_in.get(ch);
			if (ch == '&') {
				items.emplace_back(LOGICAL_AND_, "&&");
				s_in.get(ch);
			}
			else {
				items.emplace_back(ARITHMATIC_AND_, "&");
			}
		}
		else if (ch == '|') {
			s_in.get(ch);
			if (ch == '|') {
				items.emplace_back(LOGICAL_OR_, "||");
				s_in.get(ch);
			}
			else {
				items.emplace_back(ARITHMATIC_OR_, "|");
			}
		}
		else if (ch == '/') {
			s_in.get(ch);
			if (ch == '*') {
				items.emplace_back(LEFT_COMMENT_, "/*");
				s_in.get(ch);
			}
			else {
				items.emplace_back(DIVIDE_, "/");
			}
		}
		else if (ch == '*') {
			s_in.get(ch);
			if (ch == '/') {
				items.emplace_back(RIGHT_COMMENT_, "*/");
				s_in.get(ch);
			} 
			else {
				items.emplace_back(MULTIPLY_, "*");
			}
		}
		else if (isdigit(ch)) {
			while (isdigit(ch)) s_in.get(ch);
			if (ch == '.') {
				s_in.get(ch);
				while (isdigit(ch)) s_in.get(ch);
			}
			items.emplace_back(NUMBER_, "number");
		}
		else if (isalpha(ch) || ch == '_') {
			string symbo;
			while (isalpha(ch) || ch == '_' || isdigit(ch)) symbo.push_back(ch), s_in.get(ch);
			TOKEN tmp = getReserved(symbo);
			if (tmp == OPERATOR_) {
				if (ch == '(') {
					s_in.get(ch); s_in.get(ch);
					symbo.push_back('(');
					symbo.push_back(')');
				}
				while (isOverloadable(ch)) symbo.push_back(ch), s_in.get(ch);
				tmp = UNKNOWN_WORD_;
			}
			items.emplace_back(tmp, symbo);
		}
		else if (ch == EOF) break;
		else {
			items.emplace_back(UNKNOWN_SYMBOL_, "< " + string(1, ch) + " >");
			s_in.get(ch);
		}
	}
	vts_cit it = items.cbegin();
	for (auto item : items) db_err << item.second << endl;
	Automan::File(it, items.cend(), name2class);
}


void CppFileContent::toClasses(list<shared_ptr<Class>>& classes) {
    classes.clear();
    for (const auto &item : name2class) classes.emplace_back(item.second);
    db_out << classes.size() << endl;
    for (auto item : classes) {
		db_out << item->getName() << ": " << endl;
		db_out << "  super class : ";
		for (auto sup : item->getSuperclasses())
			db_out << sup << ", ";
		db_out << endl;
		db_out << "  attributes : ";
		for (auto attr : item->getAttributes())
			db_out << attr << ", ";
		db_out << endl;
		db_out << "  Components : ";
		for (auto comp : item->getComponents())
			db_out << comp << ", ";
		db_out << endl;
		db_out << "  Functions : ";
		for (auto func : item->getFunctions())
			db_out << func << ", ";
		db_out << endl;
    }
}
