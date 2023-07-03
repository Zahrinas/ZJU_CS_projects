#include "precomp.h"

#include "CommandParameter_ref.h"

void TwoStringParameter::set_S1(const std::string& str)
{
	m_s1 = str;
}
const std::string& TwoStringParameter::get_S1() const throw()
{
	return m_s1;
}
void TwoStringParameter::set_S2(const std::string& str)
{
	m_s2 = str;
}
const std::string& TwoStringParameter::get_S2() const throw()
{
	return m_s2;
}
