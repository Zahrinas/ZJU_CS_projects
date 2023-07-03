
#include "BusInfo.h"

//---------------------------------------------------------------
//Station

Station::Station() throw() : m_x(0.0), m_y(0.0)
{
}
Station::Station(const Station& s) : m_name(s.m_name), m_x(s.m_x), m_y(s.m_y)
{
}
Station::Station(Station&& s)
{
	m_name = static_cast<std::string&&>(s.m_name);
	m_x = s.m_x;
	m_y = s.m_y;
}

Station& Station::operator=(const Station& s)
{
	if(this != &s) {
		m_name = s.m_name;
		m_x = s.m_x;
		m_y = s.m_y;
	}
	return *this;
}
Station& Station::operator=(Station&& s)
{
	if(this != &s) {
		m_name = static_cast<std::string&&>(s.m_name);
		m_x = s.m_x;
		m_y = s.m_y;
	}
	return *this;
}

void Station::set_Name(const std::string& name)
{
	this->m_name = name;
}
const std::string& Station::get_Name() const throw()
{
	return m_name;
}
void Station::set_x(double x) throw()
{
	this->m_x = x;
}
double Station::get_x() const throw()
{
	return m_x;
}
void Station::set_y(double y) throw()
{
	this->m_y = y;
}
double Station::get_y() const throw()
{
	return m_y;
}

//---------------------------------------------------------------
//BusRoute

BusRoute::BusRoute() throw() : m_Number(0)
{
}
BusRoute::BusRoute(const BusRoute& b)
{
	m_Number = b.m_Number;
	m_BusStops = b.m_BusStops;
}
BusRoute::BusRoute(BusRoute&& b)
{
	m_Number = b.m_Number;
	m_BusStops = static_cast<std::vector<Station>&&>(b.m_BusStops);
}

BusRoute& BusRoute::operator=(const BusRoute& b)
{
	if(this != &b) {
		m_Number = b.m_Number;
		m_BusStops = b.m_BusStops;
	}
	return *this;
}
BusRoute& BusRoute::operator=(BusRoute&& b)
{
	if(this != &b) {
		m_Number = b.m_Number;
		m_BusStops = static_cast<std::vector<Station>&&>(b.m_BusStops);
	}
	return *this;
}

std::vector<Station>& BusRoute::get_BusRoute() throw()
{
	return this->m_BusStops;
}
const std::vector<Station>& BusRoute::get_BusRoute() const throw()
{
	return this->m_BusStops;
}

void BusRoute::Clear() throw()
{
	m_BusStops.clear();
	m_Number = 0;
}
void BusRoute::Add(const Station& s)
{
	m_BusStops.push_back(s);
	++m_Number;
}

//---------------------------------------------------------------
//RouteSet

RouteSet::RouteSet() throw() : m_Number(0)
{
}
RouteSet::RouteSet(const RouteSet& r)
{
	m_Number = r.m_Number;
	m_BusLines = r.m_BusLines;
}
RouteSet::RouteSet(RouteSet&& r)
{
	m_Number = r.m_Number;
	m_BusLines = static_cast<std::vector<BusRoute>&&>(r.m_BusLines);
}

RouteSet& RouteSet::operator=(const RouteSet& r)
{
	if(this != &r) {
		m_Number = r.m_Number;
		m_BusLines = r.m_BusLines;
	}
	return *this;
}
RouteSet& RouteSet::operator=(RouteSet&& r)
{
	if(this != &r) {
		m_Number = r.m_Number;
		m_BusLines = static_cast<std::vector<BusRoute>&&>(r.m_BusLines);
	}
	return *this;
}

std::vector<BusRoute>& RouteSet::get_BusLine() throw()
{
	return this->m_BusLines;
}
const std::vector<BusRoute>& RouteSet::get_BusLine() const throw()
{
	return this->m_BusLines;
}

void RouteSet::Clear() throw()
{
	m_BusLines.clear();
	m_Number = 0;
}
void RouteSet::Add(const BusRoute& b)
{
	m_BusLines.push_back(b);
	++m_Number;
}
