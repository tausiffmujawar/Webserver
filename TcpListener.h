#pragma once

#include <WS2tcpip.h>
#include <string>

class TcpListener {

public:

	TcpListener(const char* ipAddress, int port) :
		m_ipAddress(ipAddress), m_port(port) {}

	int init();
	int run();

protected:

	virtual void onClientConnected(int clientSocket);
	virtual void onClientDisconnected(int clientSocket);
	virtual void onMessageRecieved(int clientSocket, const char* msg,int length);
	void sendToClient(int clientSocket, const char* msg, int length);
	void broadcastToClients(int sendingClient, const char* msg, int length);

private:
	 
	const char* m_ipAddress;
	int			m_port;
	int			m_socket;
	fd_set		m_master;
	std::string m_uri;
	std::string m_method;
};
