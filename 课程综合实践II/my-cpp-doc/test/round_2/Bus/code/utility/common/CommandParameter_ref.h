#pragma once

class TwoStringParameter : public ICommandParameter
{
public:
	void set_S1(const std::string& str);
	const std::string& get_S1() const throw();
	void set_S2(const std::string& str);
	const std::string& get_S2() const throw();

private:
	std::string m_s1;
	std::string m_s2;
};
