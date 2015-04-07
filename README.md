# Resonate.io Grid 

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
    console.log(e.keyCode);
    switch(e.keyCode)
    {
        case 71: resGrid.toggleGrid();
        case 80: resGrid.togglePlay();
    }
}

window.addEventListener('keyup', onKeyUp, false);
```