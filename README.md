[![Code Climate](https://codeclimate.com/github/gueils/belugas/badges/gpa.svg)](https://codeclimate.com/github/gueils/belugas)
[![Build Status](https://travis-ci.org/gueils/belugas.svg?branch=master)](https://travis-ci.org/gueils/belugas)

<p align="center">
  <img src="belugas.png" height="300px" alt="Belugas" />
</p>

## Overview

`belugas` is a command line interface for the Project Feature detection analysis platform. It allows you to run feature detector [engines](#belugas-engines) on your local machine inside of Docker containers. 

`Belugas` general architecture was inspired by [Code Climate CLI](https://github.com/codeclimate/codeclimate).

<p align="center">
  <img src="http://i.imgur.com/gMmucQk.gif">
</p>

## Table of contents

- [Why?](#why)
- [Belugas Engines](#belugas-engines)
- [What is a feature?](#what-is-a-feature)
- [Installation](#installation)
- [Contributing](#contributing)
- [Credits](#credits)

## Why?

`belugas` is part of the [Whales](https://github.com/gueils/whales) ecosystem: A set of tools to automatically dockerize your applications.

## Belugas Engines

Belugas has a micro-service oriented architecture conformed by the following engines:

- [Belugas Ruby](https://github.com/gueils/belugas-ruby)
- [Belugas PHP](https://github.com/gueils/belugas)
- [Belugas Python](https://github.com/gueils/belugas-python)
- [Belugas Node](https://github.com/gueils/belugas-node)

Each of these engines is focus to detect multiple [features](#what-is-a-feature) on a project based on a code static analysis.

## What is a feature?

A feature is an application attribute detected during the static analysis. This analysis is the act of derivating data from code such as programming language, frameworks, service dependencies and so on. 

A feature has the following format:

```
{
  "type":"feature",
  "name":"Ruby",
  "version":"2.4",
  "description":"The application uses Ruby code",
  "content":"",
  "categories":["Gemfile","Gemfile.lock","Rakefile", ...],
  "cue_locations":[""],
  "engines":["belugas","belugas-ruby"]
}
```

Where:

- **type**: Will always be a _feature_.
- **name**: This is the name of the language, framework or database that is being used in the application. 
- **version**: The detected version of the feature. This one is optional
- **description**: A string explaining the feature that was detected.
- **content**: A markdown snippet describing the feature, including deeper explanations and links to other resources. This one is optional
- **categories**: Features are associated with one or more categories: Framework, Language, Database, Library & Service.
- **cue_locations**: An array of Location objects representing the places in the source code that provide evidence of the detected feature. This one is optional
- **engines**: An array of engine names that detected the feature, or refined the data detected by the previous engines.

## Installation 

## Prerequisites

The Belugas CLI is distributed and run as a [Docker](https://hub.docker.com/r/icalialabs/belugas/) image, so you only need to have Docker [installed](https://docs.docker.com/engine/installation/) and running on your machine. The engines that perform the actual analyses are also Docker images. 

### Setup

Fire up your terminal and run

```console
docker pull gueils/belugas:development
```

And that's it! 

## Usage

Here's where the magic begins, first of all in your terminal go to the project directory you want to analyze:

```console
cd code/path_to_project/
```

And then just execute the following command:

```console
docker run \
  --interactive --tty --rm \
  --env BELUGAS_CODE="$PWD" \
  --volume "$PWD":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/fdet:/tmp/fdet \
  gueils/belugas analyze . -f json
```

And voilá! The terminal will stream a json output for each of the features detected

## Contributing

Everyone is freely to collaborate, just make sure you follow our [code of conduct](https://github.com/gueils/belugas/blob/master/CODE_OF_CONDUCT.md). Thank you [contributors](https://github.com/gueils/belugas/graphs/contributors)!

### Create an Issue

Find a bug and don't know how to fix it? Have trouble following the documentation or have a question about the project? Then by all means, please [create an issue](https://github.com/gueils/belugas/issues/new).

Just please make sure you check [existing issues](https://github.com/gueils/belugas/issues) to see if what you're running into has been addressed already.

### Submit a Pull Request

That's great! Just follow this steps:

1. Create a separate branch for your edits
2. Make sure your changes doesn't break the project by running your changes against current specs. **We love tests!** so it'll be even better if you create new ones when needed
3. Open your pull request against `master`

Once you've created a pull request, mainteners will chime in to review your proposed changes and to merged it if everything is right :tada:

### I want to contribute but don't know where to start

That's great also! We already have some [open issues](https://github.com/gueils/belugas/issues) for you to dive in.

## Credits

See [LICENSE](LICENSE)

![Icalia Labs](https://raw.githubusercontent.com/icalialabs/kaishi/master/logo.png)

Belugas is maintained by [Icalia Labs](http://www.icalialabs.com/team)
