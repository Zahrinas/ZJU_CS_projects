#pragma once

#include <string>

//parameters

class TwoStrings
{
public:
	TwoStrings() throw();
	TwoStrings(const TwoStrings& src);
	TwoStrings(TwoStrings&& src);

	TwoStrings& operator=(const TwoStrings& src);
	TwoStrings& operator=(TwoStrings&& src);

	const std::string& get_S1() const throw();
	void set_S1(const std::string& str);
	const std::string& get_S2() const throw();
	void set_S2(const std::string& str);
 
private:
	std::string m_s1;
	std::string m_s2;
};
