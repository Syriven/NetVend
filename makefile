CXX = g++
CXXFLAGS = -g -Wall -std=c++0x

INC=-I/usr/local/include -I/home/syriven/develop/c++/common -I./
#LIB=-L/usr/lib/x86_64-linux-gnu/ -L/usr/lib/postgresql/9.4
LIB=-lpqxx -lpq -lboost_system -lpthread -lcryptopp


%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@ $(INC)

all: server client

client: client.o util/crypto.o util/networking.o util/b58check.o util/pack.o netvend/commands.o netvend/packet.o netvend/response.o netvend/exception.o
	$(CXX) $(CXXFLAGS) -o client $^ $(LIB)

server: server.o util/database.o util/crypto.o util/networking.o util/btc.o util/b58check.o util/pack.o netvend/commands.o netvend/packet.o netvend/response.o netvend/exception.o
	$(CXX) $(CXXFLAGS) -o server $^ $(LIB)