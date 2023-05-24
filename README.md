# MineSweeper 
A Mine Sweeper game implementation in Pharo.

# How to install

To install the core of the game and the unit tests:
```
Metacello new
    baseline:'MineSweeper';
    repository: 'github://Enzo-Demeulenaere/MineSweeper:master/repository';
    load: 'core'
```

# How to play 

## Rules 

The rules of this game are very simple, clear all the field without discovering any bomb.

To achieve this goal you can left-click on a cell to uncover it and see how many bombs are around. 
If you think one cell hides a bomb, you can right-click this cell to flag it and avoid clicking on it by mistake (right-click again to unflag it).
If a cell claims having **n** bombs around and you have flagged n cells around this cell, you can click on it to uncover all unflagged neighbours.

## Launch a game

To launch a game you can execute in a Playground, any of these commands depending on the size of the window you want to display.

> For now, only 5x5 grids are available.

```
MFieldElement launchSmall
```

```
MFieldElement launchRegular
```

```
MFieldElement launchLarge
```

```
MFieldElement launchVeryLarge
