Here are the [slides](slides.pdf)!

See the [Makefile](Makefile)! It has a lot of comments.

## How to run

Edit the `Makefile` and replace the EMAIL variable with your RC login. Then
create a file `rawpassword` with your RC password:

```
$ cat > rawpassword
[YOUR PASSWORD HERE]
[Control-D]
```

Then run make with any of the outputs as an argument! For example, to make the
slides:

```
$ make slides.pdf
```

To run the HTTP server:

```
$ make server
```

If you have any thoughts or questions I'd love to hear!
