# vision-exim

[![Build Status](https://travis-ci.org/vision-it/vision-exim.svg?branch=production)](https://travis-ci.org/vision-it/vision-exim)

## Parameters

##### String `vision_exim::catch_all_email`
Mail address

##### String `vision_exim::mailserver`
Name of mailserver

## Usage

Include in the *Puppetfile*:

```
mod vision_exim:
    :git => 'https://github.com/vision-it/vision-exim.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
contain ::vision_exim
```

