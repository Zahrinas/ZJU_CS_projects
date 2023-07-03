#include "precomp.h"

#include "app/BusApp.h"

////////////////////////////////////////////////////////////////////////////////

CAppModule _Module;

////////////////////////////////////////////////////////////////////////////////

int WINAPI _tWinMain(HINSTANCE hInstance, HINSTANCE /*hPrevInstance*/, LPTSTR lpstrCmdLine, int nCmdShow)
{
	INITCOMMONCONTROLSEX iccx;
	iccx.dwSize = sizeof(iccx);
	iccx.dwICC = ICC_COOL_CLASSES | ICC_BAR_CLASSES;
	BOOL bRet = ::InitCommonControlsEx(&iccx);
	bRet;
	ATLASSERT(bRet);

	CMessageLoop theLoop;
	HRESULT hRes = _Module.Init(NULL, hInstance);
	_Module.AddMessageLoop(&theLoop);

	//----------------------------------------------------
	//my app class
	BusApp app;
	bool b = app.Init();
	assert(b);
	app.Show();
	//----------------------------------------------------

	int nRet = theLoop.Run();
	_Module.RemoveMessageLoop();

	_Module.Term();

	return nRet;
}
