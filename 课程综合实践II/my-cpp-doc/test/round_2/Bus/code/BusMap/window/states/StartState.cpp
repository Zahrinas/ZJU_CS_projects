#include "precomp.h"

#include "StartState.h"

int StartState::Process(unsigned int uEvent, const std::any& param)
{
	if( uEvent == EVT_LEFT_MOUSE ) {
		return STATE_CAPTURE;
	}
	return STATE_START;
}
