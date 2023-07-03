#pragma once

#include "view/BusLabel.h"

#include "sinks/MainWindowPropertySink.h"
#include "sinks/MainWindowCommandSink.h"

class MainWindow : public CWindowImpl<MainWindow, WTL::CWindowEx, CFrameWinTraits>
{
public:
	DECLARE_WND_CLASS(_T("BusMap Window Class"))

//------------------------------------------------------------------------------
	enum { IDC_EDIT_START = 10, IDC_EDIT_STOP, IDC_BTN_QUERY,
		IDC_LABEL_CITYNAME, IDC_LABEL_STOPNUMBER };

	CEditT<WTL::CWindowEx> m_editStart;
	CEditT<WTL::CWindowEx> m_editStop;
	CButton  m_btnQuery;
	BusLabel m_lblCityName;
	BusLabel m_lblStopNumber;

//------------------------------------------------------------------------------
public:
	MainWindow();
	void set_QueryCommand(const std::shared_ptr<ICommandBase>& cmd) throw();
	std::shared_ptr<IPropertyNotification> get_PropertySink() throw();
	std::shared_ptr<ICommandNotification> get_CommandSink() throw();

private:
	std::shared_ptr<ICommandBase> m_cmdQuery;
	std::shared_ptr<MainWindowPropertySink> m_sinkProperty;
	std::shared_ptr<MainWindowCommandSink> m_sinkCommand;

public:
//------------------------------------------------------------------------------
//message handler
	BEGIN_MSG_MAP(MainWindow)
		MESSAGE_HANDLER(WM_CREATE, OnCreate)
		MESSAGE_HANDLER(WM_DESTROY, OnDestroy)
		MESSAGE_HANDLER(WM_ERASEBKGND, OnEraseBkgnd)
		MESSAGE_HANDLER(WM_SIZE, OnSize)
//------------------------------------------------------------------------------
		COMMAND_HANDLER(IDC_BTN_QUERY, BN_CLICKED, OnBtnQueryClicked)
//------------------------------------------------------------------------------
	END_MSG_MAP()

	LRESULT OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled);
	LRESULT OnDestroy(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled);
	LRESULT OnEraseBkgnd(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled);
	LRESULT OnSize(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled);
	//--------------------------------------------------------------------------
	LRESULT OnBtnQueryClicked(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& /*bHandled*/);
	//--------------------------------------------------------------------------
};
