# A Pacific Northwest Color Palatte Package
#
# This is a collection of color palettes for Rstudio
# inspired by colors of nature in and around Washington State, USA.
#
#
#
#



# 1.Create the color palettes
#::::::::::::::::::::::::::::::::::::::::::::::
#' Complete list of palettes
#'
#' Use \code{names(pnw_palettes)} to view list of palette names.
#' Currently:  "Starfish" "Shuksan"  "Bay"      "Winter"   "Lake"     "Sunset"   "Shuksan2"
#' "Cascades" "Sailboat" "Moth"     "Spring"   "Mushroom" "Sunset2"  "Anemone"
#'
#' @export
pnw_palettes <- list(
  Starfish = rbind(c('#24492e', '#015b58', '#2c6184', '#59629b', '#89689d', '#ba7999', '#e69b99'),c(7,4,5,3,1,6,2)),
  Shuksan = rbind(c('#33271e', '#74677e', '#ac8eab', '#d7b1c5', '#ebbdc8', '#f2cec7', '#f8e3d1', '#fefbe9'),c(7,2,4,1,6,3,5,8)),
  Bay = rbind(c('#00496f', '#0f85a0', '#edd746', '#ed8b00', '#dd4124'),c(4,1,3,5,2)),
  Winter = rbind(c('#2d2926', '#33454e', '#537380', '#81a9ad', '#ececec'),c(1,4,5,2,3)),
  Lake = rbind(c('#362904', '#54450f', '#45681e', '#4a9152', '#64a8a8', '#85b6ce', '#cde5f9', '#eef3ff'),c(4,8,7,2,6,1,3,5)),
  Sunset = rbind(c('#41476b', '#675478', '#9e6374', '#c67b6f', '#de9b71', '#efbc82', '#fbdfa2'),c(3,5,1,7,4,6,2)),
  Shuksan2 = rbind(c('#5d74a5', '#b0cbe7', '#fef7c7', '#eba07e', '#a8554e'),c(2,4,1,5,3)),
  Cascades = rbind(c("#2d4030","#516823","#dec000","#e2e260","#677e8e","#88a2b9"),c(4,1,5,2,6,3)),
  Sailboat = rbind(c('#6e7cb9', '#7bbcd5', '#d0e2af', '#f5db99', '#e89c81', '#d2848d'),c(1,4,6,2,5,3)),
  Moth = rbind(c('#4a3a3b', '#984136', '#c26a7a', '#ecc0a1', '#f0f0e4'),c(4,1,2,3,5)),
  Spring = rbind(c('#d8aedd', '#bf9bdd', '#cb74ad', '#e69e9c', '#ffc3a3', '#fbe4c6'),c(1,5,2,4,3,6)),
  Mushroom = rbind(c('#4f412b', '#865a3c', '#ba783e', '#e69c4c', '#fbcc74', '#fffbda'),c(6,1,4,2,3,5)),
  Sunset2 = rbind(c('#1d457f', '#61599d', '#c36377', '#eb7f54', '#f2af4a'),c(5,1,2,4,3)),
  Anemone = rbind(c("#009474" ,"#11c2b5" ,"#72e1e1", "#f1f4ee" ,"#efddcf", "#dcbe9b" ,"#b0986c"),c(3, 5, 1 ,7, 2, 6, 4))
)


# 2. Palette builder function
#::::::::::::::::::::::::::::::::::::::::::::::

#' PNW Palette Generator.
#'
#' This function builds palettes based on natural scenes in the Pacific Northwest. Each palette is inspired by the author's nature photography
#' of the region, and checked for color blind safety using \href{https://gka.github.io/palettes/#/9|s|00429d,96ffea,ffffe0|ffffe0,ff005e,93003a|1|1}{Chroma.js Color Palette Helper}.
#' View photos for each palette \href{https://github.com/jakelawlor/PNWColors}{On Github}.
#'
#' @param name Name of the color palette. Options are \code{Starfish}, \code{Shuksan}, \code{Bay},
#' \code{Winter}, \code{Lake}, \code{Sunset}, \code{Shuksan2}, \code{Cascades}, \code{Sailboat}, \code{Moth}, \code{Spring}, \code{Mushroom}, \code{Sunset2}, \code{Anemone}
#' @param n Number of colors in the palette. Palletes include 5-8 colors, which can be used discretely,
#' or if more are desired, used as a gradient. If omitted, n = length of palette.
#' @param type Usage of palette as "continuous" or "discrete". Continuous usage interpolates between colors to create
#' a scale of values. If omitted, function assumes continuous if n > length of palette, and discrete if n < length of palette.
#'
#' @export
#'
#' @examples
#' pnw_palette("Winter",n=100,type="continuous")
#' pnw_palette("Bay",3)
#' pnw_palette("Starfish, 50)
pnw_palette <- function(name, n, type = c("discrete", "continuous")) {

  pal <- pnw_palettes[[name]]


  if (is.null(pal)){
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal[1,])
  }

  if (missing(type)) {
    if(n > length(pal[1,])){type <- "continuous"}
    else{ type <- "discrete"}
  }
  type <- match.arg(type)


  if (type == "discrete" && n > length(pal[1,])) {
    stop("Number of requested colors greater than what discrete palette can offer, \n  use as continuous instead.")
  }


  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal[1,])(n),
                discrete = pal[1,][pal[2,] %in% c(1:n)],
  )
  structure(out, class = "palette", name = name)

}

#' @export



# 3. Palette Print Function
#::::::::::::::::::::::::::::::::::::::::
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @importFrom stats median
print.palette <- function(x, ...) {
  pallength <- length(x)

  on.exit(par(mar=c(0.25,0.25,0.25,0.25)))

  image(1:pallength, 1,
        as.matrix(1:pallength),
        col = x,
        axes=FALSE)

  text(median(1:pallength), 1,
       labels = paste0(attr(x,"name"),", n=",pallength),
       cex = 3, family = "sans")
}





