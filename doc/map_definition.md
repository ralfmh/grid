# Map definition

A map in grid is a simple text file, where each line represents a new entity on the map. Each line is split into multiple segments. Each segment is separated by a single space character. The first segment of each line is the line type. The line type is followed by one or more segments, which define the parameters of the entity.

## Line types

The following line types are supported:

|type|meaning|
|----|-------|
|ladr|A ladder or staircase that can be traveled vertically (up or down on the y axis).|
|text|Defines an area where a certain text should be spoken by the screen reader.|
|tile|A tile that can be traveled horizontally (right or left on the x axis).|
|wall|A wall that blocks the path on any axis.|

## Segments

Each segment (except the line type) consists of a 2-character label and a value. The following segments are supported:

|Segment|applies to line types|meaning|
|-------|---------------------|-------|
|fx|ladr, text, tile, wall|From (or minimum) x position.|
|fy|ladr, text, tile, wall|From (or minimum) y position.|
|lv|text|The literal value of the text. Since the literal value can contain spaces, it must be the last segment of the line.|
|ml|ladr, tile, wall|Material (sound) of the ladder, tile or wall.|
|tx|ladr, text, tile, wall|To (or maximum) x position.|
|ty|ladr, text, wall|To (or maximum) y position.|

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
