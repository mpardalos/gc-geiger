# gc-geiger mode

Make a click sound when emacs does garbage collection

## Installing 

I use doom emacs, I assume if you are using emacs directly you know how to install packages.

## Doom emacs

In `packages.el`

``` emacs-lisp
(package! gc-geiger
    :recipe (:host github :repo "mparalos/gc-geiger"))
```

In `config.el`

``` emacs-lisp
(use-package! gc-geiger)
```

## Customizing the sound

The variable containing the sound to be played when GC happens is `gc-geiger-sound`, it contains the raw data for the sound, obtained from a wav file.

There might be a better way to do this, but I have done it by embedding a base64 string in the emacs lisp code. To change the sound, first, get a .wav file of the sound you want to play. 
Then, to get the base64 encoding of the wav file, you can use:

``` sh
base64 -w 0 sound.wav
```

Which will give you a (probably long) base64 string.

Finally, in your emacs config, add:

``` emacs-lisp
(setq gc-geiger-sound (base64-decode-string "the string from the previous command"))
```

## Included sound source

The sound included in the package is `click6b.wav` by stijn, on freesound.org.

[Link to original file](https://freesound.org/people/stijn/sounds/43683/)

