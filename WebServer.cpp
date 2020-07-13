#include<string>
#include<iostream>
#include<sstream>
#include<fstream>
#include<istream>
#include<streambuf>
#include<iterator>
#include<vector>
#include "WebServer.h"
#include <httpserv.h>

#pragma comment(lib,"ws2_32.lib")

void WebServer::onClientConnected(int clientSocket) {
}
void WebServer::onClientDisconnected(int clientSocket) {}
void WebServer::onMessageRecieved(int clientSocket, const char* msg, int length) {

	std::istringstream iss(msg);
	std::vector<std::string> parsed((std::istream_iterator<std::string>(iss)), std::istream_iterator<std::string>());

	std::string content = "<h1>404 Not Found</h1>";
	int size = 0;
	int errorCode = 404;

	if (parsed.size() >= 3 && parsed[0] == "GET") {
		std::ifstream f(".\\wwwroot" + parsed[1]);
		if (f.good())
		{
			std::string str((std::istreambuf_iterator<char>(f)), std::istreambuf_iterator<char>());
			content = str;
			errorCode = 200;
		}
		f.close();
	}

	std::ostringstream oss;
	oss << "HTTP/1.1 " << errorCode << " OK\r\n";
	oss << "Cache-Control: no-cache, private\r\n";
	oss << "Content-Type : text/html\r\n";
	oss << "Content-Length: " << content.size() << "\r\n";
	oss << "\r\n";
	oss << content;

	std::string output = oss.str();
	size = output.size() + 1;

	

	sendToClient(clientSocket, output.c_str(), size);
}