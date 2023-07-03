#include "BusDataModel.h"

BusDataModel::BusDataModel() : m_StopNumber(0),
							m_CityName(std::make_shared<std::string>())
{
}

std::shared_ptr<std::string> BusDataModel::get_CityName() throw()
{
	return m_CityName;
}
int BusDataModel::GetStopNumber() const throw()
{
	return m_StopNumber;
}

bool BusDataModel::Query(const std::string& ss, const std::string& es)
{
	if( ss.length() == 0 )
		return false;
	m_StopNumber = 1;
	Fire_OnPropertyChanged("Stop_Number");
	*m_CityName = "XXX";
	Fire_OnPropertyChanged("city-name");
	return true;     
}
