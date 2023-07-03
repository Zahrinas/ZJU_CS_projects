#pragma once

#include "commands/QueryCommand.h"
#include "sinks/BusViewModelSink.h"

#include "model/BusDataModel.h"

class BusViewModel : public Proxy_PropertyNotification<BusViewModel>,
					public Proxy_CommandNotification<BusViewModel>
{
public:
	BusViewModel();

	void SetModel(const std::shared_ptr<BusDataModel>& model);

	std::shared_ptr<std::string> get_StopNumber() throw();
	std::shared_ptr<std::string> get_CityName() throw();

	std::shared_ptr<ICommandBase> get_QueryCommand() throw();

	BusDataModel& GetModel() throw();
	void SetStopNumber(int number);
	bool Query(const std::string& ss, const std::string& es);

private:
	std::shared_ptr<BusDataModel> m_BusModel;

	std::shared_ptr<std::string> m_StopNumber;

	std::shared_ptr<QueryCommand> m_cmdQuery;

	std::shared_ptr<BusViewModelSink> m_sink;
};
