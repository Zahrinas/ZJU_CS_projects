#include "BusViewModel.h"

BusViewModel::BusViewModel() : m_StopNumber(std::make_shared<std::string>()),
								m_cmdQuery(std::make_shared<QueryCommand>(this)),
								m_sink(std::make_shared<BusViewModelSink>(this))
{
}

void BusViewModel::SetModel(const std::shared_ptr<BusDataModel>& model)
{
	m_BusModel = model;
	m_BusModel->AddPropertyNotification(std::static_pointer_cast<IPropertyNotification>(m_sink));
}

std::shared_ptr<std::string> BusViewModel::get_StopNumber() throw()
{
	return m_StopNumber;
}

std::shared_ptr<std::string> BusViewModel::get_CityName() throw()
{
	return m_BusModel->get_CityName();
}

std::shared_ptr<ICommandBase> BusViewModel::get_QueryCommand() throw()
{
	return std::static_pointer_cast<ICommandBase>(m_cmdQuery);
}

BusDataModel& BusViewModel::GetModel() throw()
{
	return *m_BusModel;
}
void BusViewModel::SetStopNumber(int number)
{
	*m_StopNumber = std::to_string(number);
}
bool BusViewModel::Query(const std::string& ss, const std::string& es)
{
	return m_BusModel->Query(ss, es);
}
