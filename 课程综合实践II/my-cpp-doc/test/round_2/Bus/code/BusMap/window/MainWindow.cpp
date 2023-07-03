#include "precomp.h"

#include "rc/resource.h"

#include "common/parameters.h"

#include "MainWindow.h"

MainWindow::MainWindow() : m_sinkProperty(std::make_shared<MainWindowPropertySink>(this)),
							m_sinkCommand(std::make_shared<MainWindowCommandSink>(this))
{
}

void MainWindow::set_QueryCommand(const std::shared_ptr<ICommandBase>& cmd) throw()
{
	m_cmdQuery = cmd;
}

std::shared_ptr<IPropertyNotification> MainWindow::get_PropertySink() throw()
{
	return std::static_pointer_cast<IPropertyNotification>(m_sinkProperty);
}
std::shared_ptr<ICommandNotification> MainWindow::get_CommandSink() throw()
{
	return std::static_pointer_cast<ICommandNotification>(m_sinkCommand);
}

LRESULT MainWindow::OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
	//----------------------------------------------------------------------
	m_editStart.Create(m_hWnd, rcDefault, _T(""),
						WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0,
						IDC_EDIT_START);
	m_editStop.Create(m_hWnd, rcDefault, _T(""),
						WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0,
						IDC_EDIT_STOP);
	m_btnQuery.Create(m_hWnd, rcDefault, _T("Query"),
						WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0,
						IDC_BTN_QUERY);
	m_lblStopNumber.Create(m_hWnd, rcDefault, _T("0"),
						WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0,
						IDC_LABEL_STOPNUMBER);
	m_lblCityName.Create(m_hWnd, rcDefault, _T(""),
						WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, 0,
						IDC_LABEL_CITYNAME);

	// set icons
	HICON hIcon = AtlLoadIconImage(IDR_MAINFRAME, LR_DEFAULTCOLOR, ::GetSystemMetrics(SM_CXICON), ::GetSystemMetrics(SM_CYICON));
	SetIcon(hIcon, TRUE);
	HICON hIconSmall = AtlLoadIconImage(IDR_MAINFRAME, LR_DEFAULTCOLOR, ::GetSystemMetrics(SM_CXSMICON), ::GetSystemMetrics(SM_CYSMICON));
	SetIcon(hIconSmall, FALSE);
	//----------------------------------------------------------------------
	return 0;
}
LRESULT MainWindow::OnDestroy(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
	::PostQuitMessage(0);
	return 0;
}
LRESULT MainWindow::OnEraseBkgnd(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
	CDCHandle dc((HDC)wParam);
	RECT rcClient;
	GetClientRect(&rcClient);
	CBrush bsh;
	bsh.CreateSolidBrush(RGB(64, 224, 225));
	dc.FillRect(&rcClient, bsh);
	return 1;
}
LRESULT MainWindow::OnSize(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
	//----------------------------------------------------------------------
	if( wParam != SIZE_MINIMIZED ) {
		int w = LOWORD(lParam);
		int h = HIWORD(lParam);
		int x = 10;
		int y = 10;
		m_editStart.SetWindowPos(NULL, x, y, 60, 40, SWP_NOACTIVATE | SWP_NOZORDER);
		x += (60 + 10);
		m_editStop.SetWindowPos(NULL, x, y, 60, 40, SWP_NOACTIVATE | SWP_NOZORDER);
		x += (60 + 10);
		m_btnQuery.SetWindowPos(NULL, x, y, 60, 40, SWP_NOACTIVATE | SWP_NOZORDER);
		x = 10;
		y += (40 + 10);
		m_lblStopNumber.SetWindowPos(NULL, x, y, 60, 40, SWP_NOACTIVATE | SWP_NOZORDER);
		x += (60 + 10);
		m_lblCityName.SetWindowPos(NULL, x, y, 60, 40, SWP_NOACTIVATE | SWP_NOZORDER);
	}
	//----------------------------------------------------------------------
	bHandled = FALSE;
	return 1;
}
//--------------------------------------------------------------------------
LRESULT MainWindow::OnBtnQueryClicked(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& /*bHandled*/)
{
	CWaitCursor wac;
	CString str1, str2;
	m_editStart.GetWindowText(str1);
	m_editStop.GetWindowText(str2);
	USES_CONVERSION;
	std::any param(std::make_any<TwoStrings>());
	TwoStrings& ts = std::any_cast<TwoStrings&>(param);
	ts.set_S1(std::string(T2A(str1)));
	ts.set_S2(std::string(T2A(str2)));
	m_cmdQuery->SetParameter(param);
	m_cmdQuery->Exec();
	return 0;
}
