<!--
 * @Author: ZhangXiaolu
 * @Date: 2022-11-03 10:12:38
 * @LastEditTime: 2022-07-29 10:12:38
 * @LastEditors: ZhangXiaolu
 * @FilePath: personal-workstation\README.md
-->


# PWMS_PC

Presonal Workstation Management System For PC

## Personal bookkeeping-workstation PWMS system [V4]

```
[+] Add [-] Delete [^] Upgrade [#] Fix [*] Reconstruction Optimization
Rc: Not released version.
Internal: Develop the internal version. A version that has never been released.
Feature: addition or deletion of functionality
Fix：Bug fix
Upgrade: an upgrade of a component or a third-party dependency.
Enhancement: code refactoring or optimization or formatting, etc.
-:It means not at present.
```

## 1、environment configuration

| Tools | Version | Function |
| :----------------: | :-----: | :--------------: |
| visual studio Code | Stable | Compiler |
| Navicat Premium | 16 | Database Visualizer |
| phpstudy | Latest | MySQL Service Tools |
| Vue.js | 2 | Customer Framework |
| Koa.js | 2 | Server Framework |
| Node.js | 14.16.x | Development environment |
|        工具        |  版本   |       作用       |
| :----------------: | :-----: | :--------------: |
| visual studio Code | Stable  |      Compiler      |
|  Navicat Premium   |   16    | Database Visualizer |
|      phpstudy      |  Latest   |  MySQL Service Tools  |
|       Vue.js       |    2    |     Customer Framework     |
|       Koa.js       |    2    |    Server Framework    |
|      Node.js       | 14.16.x |     Development environment     |

## 2、project startup

### Please remember to switch branches! important

```
Start MySQL service
Import the bookkeeping table "Create Database First"
--npm i
(Do other operations after the dependent package is installed)
Modify your SQL configuration in backend\db.
Manually configure users in the user table.
--npm start
(both the client and the server are start commands)
```

## 3、project introduction

```
1. Because I am relatively poor, I need a bookkeeping book to manage and check my usual expenses. Originally, I wanted to be a hand-held party and take a ready-made one directly, but I couldn't find one that met my own needs, so I had no choice but to make one myself. The front and rear ends were all built based on js, and there was no threshold and no fancy technology. It was purely for quick and simple use as a notepad, with simple addition, deletion, change and check. Although there are still many problems, it is harmless and does not affect the use. If you need it, you can help yourself to use it at will, or help me upgrade and improve the function or fix the BUG. I am even more grateful ~

2. This project is developed by agile method, and iterated step by step by MVP method. Sometimes, in order to achieve the effect, you have to bear technical debts. Please don't take it to heart, just use it as a black box. Thank you ~

3. I am currently a graduate student in education at Yanbian University (so I am a computer white), holding PMP qualification certificate, AWS cloud qualification certificate, Microsoft PL-900 and MB-330 qualification certificate; There are friends from the same school who can contact and communicate ~ thank you ~

If there is a good job opportunity, please write to me directly, and I will accompany you first!
```

## 4、contact information

If you have better suggestions or need to explain what you don't understand, please write privately.

## 5、development log
```
V1_20220323：
1.[+] Home Page: Show the financial statistics of this month and last month.
2.[+] Bookkeeping list: Bookkeeping list (some contents are written in blank, for single use only)
3.[+] Login
```
! [login](assets/V1_20220323/login.jpeg)
! [homePage](assets/V1_20220323/homePage.jpeg)
! [list](assets/V1_20220323/list.jpeg)
! [details](assets/V1_20220323/details.jpeg)

```
V2_20230406：
1. [^] Home Page: The home billboard added the percentage compared with last month's expenditure, which is convenient for better control of consumption.
2.[+] Home Page: Added suspended description to facilitate classification during bookkeeping.
3. [^] Bookkeeping List: You can pull the custom dictionary value.
4.[+] added dictionary configuration.
```

```
V3_20230506：
Overall UI upgrade
1. [^] The homepage kanban is changed into a card panel, the consumption is controlled as a percentage, and it is equipped with a notepad function. Compared with last month's financial comparison, this function is still under development, and it is expected to go online in one or two iterations.
2. [^] The bookkeeping list makes up for the technical debt and optimizes the query.
3. [^] The dictionary can be enabled and disabled.
4.[+] User management function has been added, and this version has started to support multiple users!
5.[+] You can log out.
```

```
V4_20230712：
1. [^] The classified bookkeeping function of the home page and the comparison function of last month are turned on, but it is still written dead. At present, this problem has been recorded in the problem log and has the highest priority in the to-do list. The next version will fix it.
2.[+] The calendar function has been added, and the calendar can be added.
```