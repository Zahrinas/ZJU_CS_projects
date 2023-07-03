#include "parameters.h"

TwoStrings::TwoStrings() throw()
{
}
TwoStrings::TwoStrings(const TwoStrings& src) : m_s1(src.m_s1), m_s2(src.m_s2)
{
}
TwoStrings::TwoStrings(TwoStrings&& src)
{
	m_s1 = static_cast<std::string&&>(src.m_s1);
	m_s2 = static_cast<std::string&&>(src.m_s2);
}

TwoStrings& TwoStrings::operator=(const TwoStrings& src)
{
	if( this != &src ) {
		m_s1 = src.m_s1;
		m_s2 = src.m_s2;
	}
	return *this;
}
TwoStrings& TwoStrings::operator=(TwoStrings&& src)
{
	if( this != &src ) {
		m_s1 = static_cast<std::string&&>(src.m_s1);
		m_s2 = static_cast<std::string&&>(src.m_s2);
	}
	return *this;
}

const std::string& TwoStrings::get_S1() const throw()
{
	return m_s1;
}
void TwoStrings::set_S1(const std::string& str)
{
	m_s1 = str;
}
const std::string& TwoStrings::get_S2() const throw()
{
	return m_s2;
}
void TwoStrings::set_S2(const std::string& str)
{
	m_s2 = str;
}
