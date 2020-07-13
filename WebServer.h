#pragma once

#include "TcpListener.h"

class WebServer : public TcpListener
{
public:

	WebServer(const char* ipAddress, int port) :
		TcpListener(ipAddress, port) {}

protected:

	virtual void onClientConnected(int clientSocket);
	virtual void onClientDisconnected(int clientSocket);
	virtual void onMessageRecieved(int clientSocket, const char* msg, int length);

};