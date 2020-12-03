# vision-exim

[![Build Status](https://travis-ci.com/vision-it/vision-exim.svg?branch=production)](https://travis-ci.com/vision-it/vision-exim)

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

