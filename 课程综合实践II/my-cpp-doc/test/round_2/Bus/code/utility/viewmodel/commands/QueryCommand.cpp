#include "QueryCommand.h"

#include "../BusViewModel.h"

QueryCommand::QueryCommand(BusViewModel* p) throw() : m_pVM(p)
{
}

void QueryCommand::SetParameter(const std::any& param)
{
	m_param = std::any_cast<TwoStrings>(param);
}

void QueryCommand::Exec()
{
	bool bResult = m_pVM->Query(m_param.get_S1(), m_param.get_S2());
	m_pVM->Fire_OnCommandComplete("query", bResult);
}
