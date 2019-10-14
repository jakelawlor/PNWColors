# PNW Color Palette Package for R

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/sunset.jpg" width="300" ></center>

I am soon moving away from the most beautiful place I will ever live, 
so I did what any nostalgic nature kid / data science nerd would do, 
and immortalized it in an R color palette package. Now I (and you!) can have the colors of Washington State and the 
Pacific Northwest live on in our presentation figures forever. 

All photos were taken by me in places that I love. The [Pantone Studio iPhone app](https://apps.apple.com/us/app/pantone-studio/id329515634) 
helped me extract  colors, and
[Chroma.js Color Palette Helper](https://gka.github.io/palettes/#/9|s|00429d,96ffea,ffffe0|ffffe0,ff005e,93003a|1|1)
helped me  ensure that all palettes are color-blind safe to use for pretty and inclusive data viz. 


## Install Package
```r
install.packages("devtools") 
devtools::install_github("jakelawlor/PNWColors") 
```

## Usage


```r
library(PNWColors)

names(pnw_palettes)
[1] "Starfish" "Baker"    "Bay"      "Winter"   "Lake"     "Sunset"   "Baker2"  
```

## Palettes

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Starfish.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.baker.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Bay.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Winter.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Lake.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Sunset.jpg"></center>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Baker2.jpg"></center>


## Building Palettes 

Use the pnw_palette() function to view palettes. 

```r
pnw_palette(name="Starfish",n=7,type="discrete")
```

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Starfish.7.png"></center>


```r
pnw_palette("Winter",100)
```

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Winter.100.png"></center>

```r
pnw_palette("Bay",8,type="continuous")
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Bay.8.png"></center>


## Example Plots

Palettes can be easily integrated into Base R imaging or ggplot2. 

```r
pal <- pnw_palette(name,100)
image(volcano, col = pal)
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Volcano.Baker.png"></center>


```r
pal=pnw_palette("Lake",5, type = "discrete")
ggplot(diamonds, aes(carat, fill = cut)) +
  geom_density(position = "stack") +
  scale_fill_manual(values=pal)  +
  theme_classic()
```  
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Diamonds.Lake.png"></center>


```r
pal=pnw_palette("Baker2",100)
ggplot(data.frame(x = rnorm(1e4), y = rnorm(1e4)), aes(x = x, y = y)) +
  geom_hex() +
  coord_fixed() +
  scale_fill_gradientn(colours = pal) +
  theme_classic()
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Hex.Baker2.png"></center>

```r
library(tidyverse)
library(urbnmapr)
pal <- pnw_palette("Bay", 100,type = "continuous")
countydata %>%
  left_join(counties, by = "county_fips") %>%
  filter(state_name =="Washington") %>%
  ggplot(mapping = aes(long, lat, group = group, fill = horate)) +
  geom_polygon(color = "black", size = .25) +
  scale_fill_gradientn(colours = pal) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  theme(legend.title = element_text(),
        legend.key.width = unit(.5, "in")) +
  labs(fill = "Homeownership rate") +
  theme(axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),    panel.grid = element_blank(),
        axis.line =element_blank(),panel.background = element_blank())
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Washington.Bay.png"></center>



