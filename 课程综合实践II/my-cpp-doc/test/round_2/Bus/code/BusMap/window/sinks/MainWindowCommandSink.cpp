#include "precomp.h"

#include "MainWindowCommandSink.h"

#include "../MainWindow.h"

MainWindowCommandSink::MainWindowCommandSink(MainWindow* pW) throw() : m_pW(pW)
{
}

void MainWindowCommandSink::OnCommandComplete(const std::string& str, bool bOK)
{
	if( str == "query" ) {
		if( !bOK ) {
			AtlMessageBox(NULL, _T("error query"), _T("error"), MB_OK);
		}
	}
}
