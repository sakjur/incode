#include <iostream>
#include <string>

using namespace std;

class hello { 
	private:
	public:
		static string str;
		static void test() {
			cout << hello::str << endl;
		}
};

string hello::str = string("hello");

int main(int argc, char** argv) {
	hello::test();
}

