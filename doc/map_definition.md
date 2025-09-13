# Map definition

A map in grid is a simple text file, where each line represents a new entity on the map. Each line is split into multiple segments. Each segment is separated by a single space character. The first segment of each line is the line type. The line type is followed by one or more segments, which define the parameters of the entity.

## Line types

The following line types are supported:

|type|meaning|
|----|-------|
|ladr|A ladder or staircase that can be traveled vertically (up or down on the y axis).|
|port|A portal which moves the player to a remote position automatically.|
|text|Defines an area where a certain text should be spoken by the screen reader.|
|tile|A tile that can be traveled horizontally (right or left on the x axis).|
|wall|A wall that blocks the path on any axis.|

## Segments

Each segment (except the line type) consists of a 2-character label and a value. The following segments are supported:

|Segment|applies to line types|meaning|possible values|
|-------|---------------------|-------|---------------|
|fx|ladr, port, text, tile, wall|From (or minimum) x position.|Positive integer|
|fy|ladr, port, text, tile, wall|From (or minimum) y position.|Positive integer|
|lv|text|The literal value of the text. Since the literal value can contain spaces, it must be the last segment of the line.||
|ml|ladr, tile, wall|Material (sound) of the ladder, tile or wall.||
|pa|port|Portal activation.|m (= manual activation), u (= automatic activation)|
|pn|port|Portal enter sound.||
|ps|port|Portal travel sound.||
|pt|port|Portal travel time in milliseconds.|Positive integer|
|px|port|Portal exit sound.||
|tx|ladr, port, text, tile, wall|To (or maximum) x position.|Positive integer >= fx|
|ty|ladr, port, text, wall|To (or maximum) y position.|Positive integer >= fy|

## Examples

The following line defines a stone tile, ranging from x 0 to x 10, on ground (y 0):

```
tile fx0 tx10 fy0 mlstone
```

A metal ladder on x 10, ranging from ground up to y 5:

```
ladr fx10 tx10 fy0 ty5 mlmetal
```

A text which reads "This is the entrance.". It will be announced within the first 10 tiles on ground:

```
text fx0 tx10 fy0 ty0 lvThis is the entrance.
```


A manually activated portal which brings the player from x 0, y 0 to x 0, y 10 in 5 seconds, acting as a lift:

```
port fx0 fy0 tx0 ty10 pam pnlift_start pslift_loop pt5000 pxlift_end
```
