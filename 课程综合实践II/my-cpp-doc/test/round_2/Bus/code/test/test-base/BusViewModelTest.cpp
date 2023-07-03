
#include "BusViewModelTest.h"

#include "etlbase.h"
#include "viewmodel/BusViewModel.h"

bool BusViewModel_Test() throw()
{
	try {
		std::shared_ptr<BusDataModel> model(std::make_shared<BusDataModel>());
		std::shared_ptr<BusViewModel> vmdl(std::make_shared<BusViewModel>());
		vmdl->SetModel(model);
		//case 1
		vmdl->SetStopNumber(20);
		if (!(*(vmdl->get_StopNumber()) == "20"))
			throw int(1);
		//case 2
		bool bRet = vmdl->Query("12", "13");
		if( !bRet )
			throw int(2);
		//case 3
		if (!(*(vmdl->get_CityName()) == "XXX"))
			throw int(3);
	}
	catch (int& v) {
		printf("case %d error\n", v);
		return false;
	}
	catch (...) {
		printf("exception\n");
		return false;
	}
	return true;
}
