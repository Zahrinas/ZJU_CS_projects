#pragma once

#include "etlbase.h"

class MainWindow;

class MainWindowPropertySink : public IPropertyNotification
{
public:
	MainWindowPropertySink(MainWindow* pW) throw();

	virtual void OnPropertyChanged(const std::string& str);

private:
	MainWindow* m_pW;
};
