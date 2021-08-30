---

theme: "beige"
transition: "convex"
highlight : "default"
title: "Kubernetes"
header: Running simple ASP.Net Web API in Kubernetes on Docker Desktop
marp: true
themeOptions: "default, simple, sky, beige, serif, solarized, blood, moon, night, black, league, white"
transitionOptions:  "default, tango, pygments, kate, monochrome, espresso, zenburn, haddock"

---

# Kubernetes Series

### Running simple ASP.Net Web API in Kubernetes on Docker Desktop

By

Joy George Kunjikkuru 

`A passionate software engineer to solve problems regardless of tools & technologies`

[https://joymononline.in](joymononline.in)
[https://joymonscode.blogspot.com/](https://joymonscode.blogspot.com/)

---

## How it is organized

- Included
    - Demo of hosting a simple ASP.Net Web API into Kubernetes cluster
    - Some internals
- Not included
    - Environment setup walk through
- Expecting basic idea about Containers, Kubernetes
--

## Environment
- Docker Desktop on Windows 10
- Visual Studio 2019 with ASP.Net and Docker tools installed.
- Containers used are Linux containers
- Details in blog post
    - https://joymonscode.blogspot.com/2019/10/gettting-started-with-docker-desktop.html

---

## Demo Source code

- Download from 
    - https://github.com/joymon/dotnet-demos/tree/master/web/webapi/simple-k8s-hosting/SimpleK8sHosting
- Note - This is not a production ready demo. But gives some idea to the developers on hosting into Kubernetes 

<aside class="notes">
		Describe about both architectures
	</aside>
---