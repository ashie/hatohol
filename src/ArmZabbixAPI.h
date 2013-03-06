/* Asura
   Copyright (C) 2013 MIRACLE LINUX CORPORATION
 
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef ArmZabbixAPI_h
#define ArmZabbixAPI_h

#include <libsoup/soup.h>
#include "ArmBase.h"
#include "ItemTablePtr.h"
#include "JsonParserAgent.h"

class ArmZabbixAPI : public ArmBase
{
public:
	ArmZabbixAPI(const char *server = "localhost");
	ItemTablePtr getTrigger(void);

protected:
	string getInitialJsonRequest(void);
	bool parseInitialResponse(SoupMessage *msg);
	bool mainThreadOneProc(void);
	void startObject(JsonParserAgent &parser, const string &name);
	void startElement(JsonParserAgent &parser, int index);
	void getString(JsonParserAgent &parser, const string &name,
	               string &value);

	void pushInt   (JsonParserAgent &parser, ItemGroup *itemGroup,
	                const string &name, ItemId itemId);
	void pushUint64(JsonParserAgent &parser, ItemGroup *itemGroup,
	                const string &name, ItemId itemId);
	void pushString(JsonParserAgent &parser, ItemGroup *itemGroup,
	                const string &name, ItemId itemId);

	void parseAndPushTriggerData(JsonParserAgent &parser,
	                             ItemTablePtr &tablePtr, int index);

	// virtual methods
	gpointer mainThread(AsuraThreadArg *arg);

private:
	string m_server;
	string m_auth_token;
	string m_uri;
	int    m_server_port;
	int    m_retry_interval;	// in sec
	int    m_repeat_interval;	// in sec;
};

#endif // ArmZabbixAPI_h

