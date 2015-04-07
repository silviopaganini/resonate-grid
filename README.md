# Resonate.io Grid 

[![Build Status](https://travis-ci.org/silviopaganini/resonate-grid.svg?branch=master)](https://travis-ci.org/silviopaganini/resonate-grid)

[![NPM](https://nodei.co/npm/resonate-grid.png)](https://nodei.co/npm/resonate-grid/) 

### Install

`npm install resonate-grid`

### JS Dependencies 

* TweenMax.js 
* Pixi.js
* raf

## How to use 

#### Browserify Module 

```
ResGrid = require('resonate-grid');

var resGrid = new ResGrid(true)
resGrid.resize();
document.body.appendChild(resGrid.view);

function onKeyUp(e)
{
    e.preventDefault();
    switch(e.keyCode)
    {
        case 71: resGrid.toggleGrid();
        case 80: resGrid.togglePlay();
    }
}

window.addEventListener('keyup', onKeyUp, false);
```