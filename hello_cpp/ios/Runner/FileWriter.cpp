//
//  FileWriter.cpp
//  Runner

#include "FileWriter.h"
#include <fstream>
#include <sstream>

std::string writeHelloWorldCpp(int count) {
  std::ostringstream oss;
  oss << "hello world " << count;

  std::string path = std::string(getenv("HOME")) + "/Documents/hello.txt";

  std::ofstream file(path, std::ios::app);
  if (file.is_open()) {
    file << oss.str() << "\n";
    file.close();
  }

  return oss.str();
}
