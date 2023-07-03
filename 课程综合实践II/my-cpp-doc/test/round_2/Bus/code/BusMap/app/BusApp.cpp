#include "precomp.h"

#include "BusApp.h"

BusApp::BusApp()
{
}

BusApp::~BusApp() throw()
{
}

bool BusApp::Init()
{
	if( m_wndMain.Create(NULL, CWindow::rcDefault, _T("Bus Map")) == NULL ) {
		return false;
	}

	//objects
	std::shared_ptr<BusDataModel> spModel(std::make_shared<BusDataModel>());
	m_spViewModel = std::make_shared<BusViewModel>();
	m_spViewModel->SetModel(spModel);
	//binding
	// properties
	m_wndMain.m_lblStopNumber.set_Name(m_spViewModel->get_StopNumber());
	m_wndMain.m_lblCityName.set_Name(m_spViewModel->get_CityName());
	// commands
	m_wndMain.set_QueryCommand(m_spViewModel->get_QueryCommand());
	// notifications
	m_spViewModel->AddPropertyNotification(m_wndMain.get_PropertySink());
	m_spViewModel->AddCommandNotification(m_wndMain.get_CommandSink());

	return true;
}

void BusApp::Show(int nCmdShow)
{
	m_wndMain.ShowWindow(nCmdShow);
}
