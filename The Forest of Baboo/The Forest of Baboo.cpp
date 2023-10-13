// The Forest of Baboo.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <fstream>
using namespace std;

//functions
int main();

//Start
int main()
{
	//CheckChar();
	int choice;
	system("menu.bat");
	bool gameOn = true;
	while (gameOn != false) {
		cout << "============================================================================================\n";
		cout << "                                     BABOO'S FOREST\n";
		cout << "============================================================================================\n";
		cout << "   \n";
		cout << " [1] Enter Baboo's Forest\n";
		cout << " [2] Credits\n";
		cout << " [3] Help\n";
		cout << " [4] Exit\n";
		cout << "   \n";
		cout << "============================================================================================\n";
		cout << "                        Enter your choice and press enter: \n";
		cout << "============================================================================================\n";
		cout << "   \n";

		cin >> choice;

		switch (choice)
		{
		case 1:
			system("cls");
			cout << "You enter the Forest...\n";
			system("int.cmd");
			gameOn = false;
			break;
		case 2:
			system("cls");
			cout << "<(---) Credits (---)>\n";
			cout << "All this game is made by Leon Latour using c++ and Batch file\n";
			cout << "   \n";
			cout << "<(---) Music (---)>";
			cout << "- Misterious Celesta by Ashot-Danielyan-Composer.\n";
			cout << "- mysterious forest creepy lofi halloween lofi halloween music by SoulProdMusic.\n";
			cout << "- Medieval2 by Scratch.\n";
			cout << "   \n";
			break;
		case 3:
			system("cls");
			cout << "Ahahah, you really think I will help you?\n";
			cout << "To end game sound, run the file close.bat. This file will end all Baboo's sound.\n";
			cout << "   \n";
			break;
		case 4:
			system("cls");
			cout << "End of Program.\n";
			gameOn = false;
			break;
		default:
			system("cls");
			cout << "I'm not sure to understand... \n";
			cout << "What do you want to do?.\n";
			cout << "   \n";
			cin >> choice;
			break;
		}

	}
	return 0;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
