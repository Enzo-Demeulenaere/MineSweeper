# MineSweeper
A Mine Sweeper game implementation in Pharo.

# How to install
## Minimal installation
To install only the core of the game and the unit tests:
```
Metacello new
    baseline:'MineSweeper';
    repository: 'github://juliendelplanque/MineSweeper:master/repository';
    load: 'core'
```

## Seaside (minimal) frontend
To install the game with its minimal web-frontend:
```
Metacello new
    baseline:'MineSweeper';
    repository: 'github://juliendelplanque/MineSweeper:master/repository';
    load: 'seaside'
```
