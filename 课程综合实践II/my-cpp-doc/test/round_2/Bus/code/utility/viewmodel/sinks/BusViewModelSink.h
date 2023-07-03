#pragma once

#include "etlbase.h"

class BusViewModel;

class BusViewModelSink : public IPropertyNotification
{
public:
	BusViewModelSink(BusViewModel* p) throw();

	virtual void OnPropertyChanged(const std::string& str);

private:
	BusViewModel* m_pVM;
};
