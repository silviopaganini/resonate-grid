ResGrid = require('resonate-grid');

var resGrid = new ResGrid(true)
resGrid.resize();
document.body.appendChild(resGrid.view);

function onKeyUp(e)
{
    e.preventDefault();
    switch(e.keyCode)
    {
        case 71: 
            resGrid.toggleGrid();
            break;
        case 80: 
            resGrid.togglePlay();
            break;
    }
}

window.addEventListener('keyup', onKeyUp, false);