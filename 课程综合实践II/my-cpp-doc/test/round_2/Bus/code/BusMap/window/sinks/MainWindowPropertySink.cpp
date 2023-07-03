#include "precomp.h"

#include "MainWindowPropertySink.h"

#include "../MainWindow.h"

MainWindowPropertySink::MainWindowPropertySink(MainWindow* pW) throw() : m_pW(pW)
{
}

void MainWindowPropertySink::OnPropertyChanged(const std::string& str)
{
	if( str == "Stop_Number" ) {
		m_pW->m_lblStopNumber.Update();
	}
	else if( str == "city-name" ) {
		m_pW->m_lblCityName.Update();
	}
}
