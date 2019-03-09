# polish www resources
Documentation for generating and managing `polish` www resources.

<br>

## Font-Awesome Icons
Font-awesome icon css can be accessed in two main ways, listed below. We used #2 and included the font-awesome source as part of this package. This is loaded in `./inst/www/libs/fontawesome-free-5.7.2-web`. We removed all the unnecessary directories and content to save a bit of space.
  
  1. dynamically via a web css link: https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css
  2. locally by downloading the entire css source from here: http://fontawesome.io/get-started/

<br>

## Polish CSS
Custom css uses Bootstrap 3.4 and was generated using the wonderful website [bootstrap-live-customizer](https://www.bootstrap-live-customizer.com), which allows you to pick a starting Bootstrap theme and interactively make edits to the styling. We started with the "[Simplex](https://bootswatch.com/simplex/)" theme and edited the `@brand-primary` color. After configuring all the style elements, you can download the `theme.css` as the primary output to be used. You can also download the two configuration input files used to generate this `.css`, which are `theme.less` and `variables.less`. Later on, you can reload these `.less` files into the web tool to make further edits and generate a new `.css` file. The generated `.css` file is included at `css/polish.theme.css`.

Bootstrap css uses [Glyphicons](https://getbootstrap.com/docs/3.4/components/) for icons. These are loaded by default from the folder `../fonts` relative to the `.css` file. The font files (found [here](https://github.com/twbs/bootstrap-sass/tree/master/assets/fonts/bootstrap)) are included in the `fonts` directory here. 
