#define _CRT_SECURE_NO_WARNINGS 
#include"greedysnake.h"
 
void SetPos(int x, int y) {
 
	HANDLE houtput = NULL;
	houtput = GetStdHandle(STD_OUTPUT_HANDLE);
 
	COORD pos = { x, y };
	SetConsoleCursorPosition(houtput, pos);
 
}
void WelcomeToGame() {
	SetPos(36, 13);
	printf("欢迎来到星纭的贪吃蛇小游戏");
	SetPos(40, 25);
	system("pause");
	system("cls");
	SetPos(15, 10);
	printf("游戏规则介绍：");
	SetPos(24, 13);
	wprintf(L"用 ↑. ↓ . ← . → 来控制蛇的移动，按F3加速，F4减速\n");
	SetPos(36, 16);
	printf("加速可以获得更更高的分数");
	SetPos(40, 25);
	system("pause");
	system("cls");
}
void CreateMap() {
 
	int i = 0;
	//上面的墙
	for (i = 0; i < 60; i += 2) {
		wprintf(L"%lc", WALL);
	}
	//左边的墙
	for (i = 1; i <= 30; i++) {
		SetPos(0, i);
		wprintf(L"%lc", WALL);
	}
	//右边的墙
	for (i = 1; i <= 30; i++) {
		SetPos(58, i);
		wprintf(L"%lc", WALL);
	}
	//下面的墙
	for (i = 2; i < 57; i += 2) {
		SetPos(i, 30);
		wprintf(L"%lc", WALL);
	}
 
 
}
void InitSnake(pGSnake ps) {
 
	//创建五个蛇节点，并完成头插
	pSnakeNode cur = NULL;
	int i = 0;
	for (i = 0; i < 5; i++)
	{
		cur = (pSnakeNode)malloc(sizeof(SnakeNode));
		cur->next = NULL;
		cur->x = POS_X + i * 2;
		cur->y = POS_Y;
		if (ps->_pSnake == NULL) {
			ps->_pSnake = cur;
		}
		else {
			cur->next = ps->_pSnake;
			ps->_pSnake = cur;
		}
	}
	//打印蛇
	cur = ps->_pSnake;
	while (cur) {
		SetPos(cur->x, cur->y);
		wprintf(L"%lc", BODY);
		cur = cur->next;
	}
	//初始化游戏
	ps->_SleepTime = 200;
	ps->_Score = 0;
	ps->_Dir = RIGHT;
	ps->_Status = OK;
	ps->_FoodWeight = 10;
}
