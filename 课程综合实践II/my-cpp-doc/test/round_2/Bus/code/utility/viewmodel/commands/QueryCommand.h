#pragma once

#include "etlbase.h"

#include "common/parameters.h"

class BusViewModel;

class QueryCommand : public ICommandBase
{
public:
	QueryCommand(BusViewModel* p) throw();

	virtual void SetParameter(const std::any& param);
	virtual void Exec();

private:
	BusViewModel* m_pVM;

	TwoStrings m_param;
};
