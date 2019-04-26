# docker-crunchyroll-dl
Docker version of https://github.com/simplymemes/crunchyroll-dl 

# crunchyroll-dl

<div>
  <a href="https://npmjs.org/package/crunchyroll-dl">
    <img src="https://badgen.now.sh/npm/v/crunchyroll-dl" alt="version" />
  </a>
  <a href="https://npmjs.org/package/crunchyroll-dl">
    <img src="https://badgen.now.sh/npm/dm/crunchyroll-dl" alt="downloads" />
  </a>
</div>

A fast, modern, and beautiful Crunchyroll downloader.

Downloads the Crunchyroll videos with the subtitles hardcoded/hardsubbed, and the outputted files will be in `.mp4`.

## Features
- Download an entire series or just a single episode
  - Specify which seasons to download from a series (or download them all)
  - Specify which episodes to download
- Use the USA library of Crunchyroll (unblock)
- Specify download resolution
- Custom output of file names
- Colourful user interface

### Requirements
- Docker

### Installation
`sudo docker pull juezfenix/crunchyroll-dl`

## CLI Options
**Authentication**
- `--username`, `-u` username/email
- `--password`, `-p` password

**Downloading**
- `--input`, `-i` (required) the episode/series to download
- `--language`, `-l` the language to download (default: `enUS`, see below for other options)
- `--quality`, `-q` the quality/resolution to download (default: `auto`)
- `--download-all`, `-a` download all collections (no dialog)
- `--episodes`, `-e` episode ranges
  - examples
    - `--episodes 1-2,12-15,18-20`
    - `-e 1,3,5,7`
- `--output`, `-o` the output file name (default: `:name Episode :ep [:resolution]`)
  - can use components to customize
    - `:name` name of collection
    - `:epname` name of episode
    - `:resolution` resolution of the video
    - `:ep` the episode number
    - `:series` the series name

## Examples
`docker run --rm -it -v /path/to/downloads/:/downloads juezfenix/crunchyroll-dl -i https://www.crunchyroll.com/my-hero-academia/episode-1-izuku-midoriya-origin-730707 -u username -p password --unblocked -o ":epname [:resolution]"`

`docker run --rm -it -v /path/to/downloads/:/downloads juezfenix/crunchyroll-dl -i https://www.crunchyroll.com/my-hero-academia`

`docker run --rm -it -v /path/to/downloads/:/downloads juezfenix/crunchyroll-dl -i https://www.crunchyroll.com/rezero-starting-life-in-another-world- --ignore-dubs --download-all --episodes 1A,1B,2-15`

### Languages
The possible languages are as follows, the default is `enUS`

`enUS` - English (US)\
`enGB` - English (UK)\
`esLA` - Español\
`esES` - Español (España)\
`ptBR` - Português (Brasil)\
`ptPT` - Português (Portugal)\
`frFR` - Français (France)\
`deDE` - Deutsch\
`itIT` - Italiano\
`ruRU` - Русский\
`arME` - العربية
