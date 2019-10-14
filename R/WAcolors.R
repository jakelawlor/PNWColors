# PNW Color Package
#
# This is a collection of color palettes for Rstudio
# inspired by colors of nature in and around Washington State, USA
#
# We currently have 7 palettes available, with more on the way.
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# 1.Create the color palettes
#::::::::::::::::::::::::::::::::::::::::::::::
pnw_palettes <- list(
  Stars = rbind(c('#24492e', '#015b58', '#2c6184', '#59629b', '#89689d', '#ba7999', '#e69b99'),c(7,4,5,3,1,6,2)),
  Baker = rbind(c('#33271e', '#74677e', '#ac8eab', '#d7b1c5', '#ebbdc8', '#f2cec7', '#f8e3d1', '#fefbe9'),c(2,7,4,6,1,8,5,3)),
  Bay = rbind(c('#00496f', '#0f85a0', '#edd746', '#ed8b00', '#dd4124'),c(4,1,2,5,3)),
  Winter = rbind(c('#2d2926', '#33454e', '#537380', '#81a9ad', '#ececec'),c(1,4,5,2,3)),
  Lake = rbind(c('#362904', '#54450f', '#45681e', '#4a9152', '#64a8a8', '#85b6ce', '#cde5f9', '#eef3ff'),c(4,8,7,2,6,1,3,5)),
  Sunset = rbind(c('#493f57', '#6c5975', '#ab7173', '#ca8977', '#db9d76', '#e6ad7a', '#f9dfa8'),c(3,4,7,5,1,6,2)),
  Baker2 = rbind(c('#5d74a5', '#b0cbe7', '#fef7c7', '#eba07e', '#a8554e'),c(2,4,1,5,3))
)

# 2. Palette builder function
#::::::::::::::::::::::::::::::::::::::::::::::
pnw_palette <- function(name, n, type = c("discrete", "continuous")) {

  if (missing(type)) {
    type <- "continuous"
  }
  type <- match.arg(type)


  pal <- pnw_palettes[[name]]
  if (is.null(pal)){
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal[1,])
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal[1,])(n),
                discrete = pal[1,][pal[2,] %in% c(1:n)],
  )
  structure(out, class = "palette", name = name)

}




# 3. Palette Print Function
#::::::::::::::::::::::::::::::::::::::::
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  text(median(1:n), 1, labels = paste0(attr(x,"name"),", n=",n), cex = 3, family = "sans")
}
