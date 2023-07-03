#pragma once

#include "window/MainWindow.h"
#include "viewmodel/BusViewModel.h"

class BusApp
{
public:
	BusApp();
	~BusApp() throw();

	bool Init();
	void Show(int nCmdShow = SW_SHOWDEFAULT);

private:
	MainWindow  m_wndMain;
	std::shared_ptr<BusViewModel>  m_spViewModel;
};
