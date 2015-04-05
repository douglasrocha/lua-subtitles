# lua-subtitles
A script that allows users to adjust and synchronize srt subtitle files' times.

## Run
- Open the terminal
- Go to 'src/' with cd command
- Type the following command
```sh
lua lua-subtitles.lua {input} {miliseconds} {output} [from] [to]
```
Parameters          | Description
--------------------|----------------------------------------------------
input               | Input file path
miliseconds         | Amount of miliseconds to adjust (can also be negative)
output              | Output file path
from (optional)     | The timestamp you want to start considering (format: hh:mm:ss,xxx)
to (optional)       | The timestamp you want to stop considering (format: hh:mm:ss,xxx)

## Notes
- Only valid srt files can be processed by the script. It doesn't guarantee to fix your invalid srt files.
- If you want to use only the to parameter, make sure to write 'nil' (without escapes) to the from parameter
- Except for the miliseconds parameter, escape every other parameter

## Git Page
- https://github.com/douglasrocha/lua-subtitles
