#include "precomp.h"

#include "BusLabel.h"

void BusLabel::set_Name(const std::shared_ptr<std::string>& sp) throw()
{
	m_Name = sp;
}

void BusLabel::Update()
{
	::SetWindowTextA(m_hWnd, m_Name->c_str());
}
