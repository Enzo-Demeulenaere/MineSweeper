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

Once loaded, add a `ZnZincServerAdaptor` in the Seaside Control Panel and
go to [http://localhost:8080/minesweeper](http://localhost:8080/minesweeper).

# Development note
I use GitFileTree to manage this repository from Pharo, if you want to contribute
please use it as well.
