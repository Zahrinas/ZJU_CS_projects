#pragma once

#include "etlbase.h"

#include "common/BusInfo.h"

class BusDataModel : public Proxy_PropertyNotification<BusDataModel>
{
public:
	BusDataModel();

	std::shared_ptr<std::string> get_CityName() throw();
	int GetStopNumber() const throw();

    bool Query(const std::string& ss, const std::string& es);

private:
	RouteSet m_RouteSet;

	std::shared_ptr<std::string> m_CityName;
	int m_StopNumber;
};
