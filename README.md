# dartSassR
Latest Sass Representation in R

visit this webpage for more infor - https://sass-lang.com/dart-sass. Dart Sass is now the official implementation of SASS and all others have been deprecated including libsas.

I think it's time we should bring it to R. I created a single function which can run Sass directly from R. But it would need Dart Sass to be installed on your machine. which is 
easily available for all the OS. and should be hard to achieve.

Then you can run code like this along with packages like shiny.

```
sass_run(
    asset_input_path = "app/styles/",
    asset_output_path = "app/static/css/",
    compressed = TRUE,
    watch = FALSE
)
```
