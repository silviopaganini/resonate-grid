class Config

    @COLOURS :
        red    : 'rgba(235, 35, 40,1)'
        yellow : 'rgba(255, 255, 40,1)'
        blue   : 'rgba(100, 200, 230,1)'
        green  : 'rgba(95, 185, 80,1)'
        pink   : 'rgba(250, 200, 220,1)'
        black  : 'rgba(0,0,0,1)'
        purple : 'rgba(100, 45, 140,1)'

    @GRADIENTS : [
        [@COLOURS.red, @COLOURS.yellow]
        [@COLOURS.pink, @COLOURS.black]
        [@COLOURS.green, @COLOURS.blue]
        [@COLOURS.purple, @COLOURS.blue]
        [@COLOURS.pink, @COLOURS.purple]
        [@COLOURS.yellow, @COLOURS.green]
        [@COLOURS.red, @COLOURS.pink]
    ]

module.exports = Config