#pragma once

#include <string>
#include <vector>

class Station
{
public:
    Station() throw();
	Station(const Station& s);
	Station(Station&& s);

	Station& operator=(const Station& s);
	Station& operator=(Station&& s);

	void set_Name(const std::string& name);
	const std::string& get_Name() const throw();
	void set_x(double x) throw();
	double get_x() const throw();
	void set_y(double y) throw();
	double get_y() const throw();

private:
	std::string m_name;
	double m_x;
	double m_y;
};

class BusRoute
{
public:
	BusRoute() throw();
	BusRoute(const BusRoute& b);
    BusRoute(BusRoute&& b);

	BusRoute& operator=(const BusRoute& b);
	BusRoute& operator=(BusRoute&& b);

	std::vector<Station>& get_BusRoute() throw();
	const std::vector<Station>& get_BusRoute() const throw();

	void Clear() throw();
    void Add(const Station& s);

private:
	int m_Number;
	std::vector<Station> m_BusStops;
};

class RouteSet
{
public:
    RouteSet() throw();
	RouteSet(const RouteSet& r);
	RouteSet(RouteSet&& r);

	RouteSet& operator=(const RouteSet& r);
	RouteSet& operator=(RouteSet&& r);

	std::vector<BusRoute>& get_BusLine() throw();
	const std::vector<BusRoute>& get_BusLine() const throw();

	void Clear() throw();
    void Add(const BusRoute& b);

private:
	int m_Number;
	std::vector<BusRoute> m_BusLines;
};
