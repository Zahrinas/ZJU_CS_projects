
#pragma once

#include "etlbase.h"

#include "StateDef.h"

class PopupState : public IStateBase
{
public:
	//IStateBase methods
	virtual int Process(unsigned int uEvent, const std::any& param);
};
