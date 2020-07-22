---

theme: "beige"
transition: "convex"
highlight : "default"
title: "5 Mins Hugp"
header: Part 1 Introduction
marp: true
themeOptions: "default, simple, sky, beige, serif, solarized, blood, moon, night, black, league, white"
transitionOptions:  "default, tango, pygments, kate, monochrome, espresso, zenburn, haddock"

---

# 5 Mins Hugo

### Part 1 - Introduction

By

Joy George Kunjikkuru 

`A passionate software engineer to solve problems regardless of tools & technologies`

[https://joymononline.in](joymononline.in)
[https://joymonscode.blogspot.com/](https://joymonscode.blogspot.com/)

---

## How it is organized

- Limiting to 5 mins {.fragment}
- One or two concepts in one episode. {.fragment}
- Method {.fragment}
  - Not a live hands on coding session. Code may be copy pasted from working version. {.fragment}
  - Repetitive things will be fast forwarded. {.fragment}

--

## How it is organized
- Coverage
  - Doing this series as part of converting my own personal web site.
  - Not an detailed series touching everything in Hugo.
  - Main intention is to smooth the learning curve to explore yourself.
  - Not much blogging related features of Hugo.

---

## What is JAM Stack and Static Site Generator

- No runtime HTML rendering at server
- Serves via CDN
- Dynamism is at generation.
- Consumes API
- Security
- It can be hand coded, SSG
  - Jekyll or  Hugo or Gatsby
- Its for techies. You should learn markdown. 
---

## What is covered in this series

- Introduction
- Getting started
  - CLI, dev server, adding pages & theme
- Menu system
- Short codes
- Home page template & Data
- Accessing data
- Partial pages
- Accessing Web APIs
- Custom Theme creation
- CI/CD using GitHub actions

---

## Introduction to Hugo

- Written in Go language. 
  - But don't need to install 'Go' language tools to work with Hugo.
- Command line
- Themes are available
- Development server
- Single content folder
- Convention based

--

## Pros of Hugo

- Fast
- Supports data formats YAML, TOML & JSON
- Web API calls during generation.
- Pipes in template

--

### Cons of Hugo

- Really big learning curve
- Data
  - Data format don't have CSV or XML
  - Web API support only URL based authentication. No OAuth
- No plug-ins
- No default theme & highly theme dependent.
  - If the theme is faulty, things will not work
  - Some theme expect specific parameters
  - Mostly ends up learning theme internal
  - Also will end up creating own theme

---

## Architecture of JoymonOnline.in

### Existing
### New

<aside class="notes">
		Describe about both architectures
	</aside>
---