#pragma once

#include <list>
#include <vector>
#include <iostream>
#include <exception>
#include <memory>
#include <functional>

using namespace std;

using FileProcessor = function<bool(list<string>)>;
using Notifier = function<void()>;

/**
 * name : class's name
 * attributes : discription of the function
 * components : class's member variable
 * functions : class's memeber function
 */
class Class {
	string name;
	vector<string> attributes;
	vector<string> superclasses;
	vector<string> components;
	vector<string> functions;

public:
	Class(string name = "Not_Defined") : name(name) {}
    void setName(string name_) { name = name_; }
    void addFucntions(string func) { functions.push_back(func); }
    void addAttributes(string attr) { attributes.push_back(attr); }
    void addSuperclasses(string sup) { superclasses.push_back(sup); }
    void addComponents(string com) { components.push_back(com); }
    const string& getName() const { return name; }
    const vector<string>& getSuperclasses() const { return superclasses; }
    const vector<string>& getComponents() const { return components; }
    const vector<string>& getAttributes() const { return attributes; }
    const vector<string>& getFunctions() const { return functions; }
};

/**
 * @brief this exception must be catched, and then use 'e.Information()' 
 * to get the information.
 */
class m_Exception : public std::exception {
public:
	m_Exception() {};
	m_Exception(string info_) : info(info_) {}
    virtual const char* what() const { return " [ exception ] "; }
	string Information() { return info; }
private:
	string info;
};
