#pragma once

#include "etlbase.h"

class BusLabel : public ATL::CWindowImpl<BusLabel, CStatic, ATL::CControlWinTraits>
{
private:
	typedef ATL::CWindowImpl<BusLabel, CStatic, ATL::CControlWinTraits>  baseClass;

public:
	DECLARE_WND_CLASS(NULL)

//------------------------------------------------------------------------------
public:
	void set_Name(const std::shared_ptr<std::string>& sp) throw();

	void Update();

private:
	std::shared_ptr<std::string> m_Name;

public:
//------------------------------------------------------------------------------
//message handler
	BEGIN_MSG_MAP(BusLabel)
	END_MSG_MAP()
};
