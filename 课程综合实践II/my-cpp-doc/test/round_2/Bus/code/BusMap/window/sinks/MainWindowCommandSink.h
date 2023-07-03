#pragma once

#include "etlbase.h"

class MainWindow;

class MainWindowCommandSink : public ICommandNotification
{
public:
	MainWindowCommandSink(MainWindow* pW) throw();

	virtual void OnCommandComplete(const std::string& str, bool bOK);

private:
	MainWindow* m_pW;
};
