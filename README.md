# PNW Color Palette Package for R

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/sunset.jpg" width="300" ></center>

I am soon moving away from the most beautiful place I will ever live, 
so I did what any nostalgic nature kid / data science nerd would do 
and immortalized it in an R color palette package. Now I (and you!) can have the colors of Washington State and the 
Pacific Northwest live on in our presentation figures forever. 

All photos were taken by me in places that I love. The [Pantone Studio iPhone app](https://apps.apple.com/us/app/pantone-studio/id329515634) 
helped me extract  colors, and 
[Chroma.js Color Palette Helper](https://gka.github.io/palettes/#/9|s|00429d,96ffea,ffffe0|ffffe0,ff005e,93003a|1|1)
helped me adjust values to ensure that all palettes are color-blind safe to be used for attractive and inclusive data viz. Structure of the code was inspired by the [`wesanderson`](https://github.com/karthik/wesanderson) and [`LaCroixColoR`](https://github.com/johannesbjork/LaCroixColoR) packages from GitHub. [See more on twitter!](https://twitter.com/Jake_Lawlor1/status/1192175651358330880)


## Install Package
```r
install.packages("devtools") 
devtools::install_github("jakelawlor/PNWColors") 
```

## Usage


```r
library(PNWColors)

names(pnw_palettes)
 [1] "Starfish" "Shuksan"  "Bay"      "Winter"   "Lake"     "Sunset"   "Shuksan2" 
 [8] "Cascades" "Sailboat" "Moth" "Spring"   "Mushroom" "Sunset2"  "Anemone"    
 ```

## Palettes

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Starfish.jpg">
<ul>
  <li>Low Tide -- San Juan Islands, Washington </li>
  
    
    
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Shuksan.jpg"></center>

<li>Mount Shuksan from Mount Baker Ski Resort -- North Cascades, Washington</li>




<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Bay.jpg"></center>


<li>View from a sunset kayak -- Bellingham Bay, Washington</li>



<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Winter.jpg"></center>

<li>Washington Park snowday -- Anacortes, Washington</li>



<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Lake.jpg"></center>

<li>Whistle Lake, the best place in the world -- Anacortes, Washington</li>



<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Sunset.jpg"></center>

<li>Washington Park sunset -- Anacortes, Washington </li>



<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Shuksan2.jpg"></center>

<li>Mount Shuksan, golden hour -- North Cascades, Washington</li>


<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Cascades.jpg"></center>

<li>Watson Lake Trail End -- North Cascades, Washington</li>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Moth.jpg"></center>

<li>Moth -- Vendovi Island, Washington</li>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Sailboat.jpg"></center>

<li>Funky Dory Sailboat -- Anacortes, Washington</li>


<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Sunset2.jpg"></center>

<li>Oyster Dome Sunset -- Chuckanut, Washington</li>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Spring.jpg"></center>

<li>Cherry Blossoms -- Anacortes, Washington</li>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Anemone.jpg"></center>

<li>Anchor Cove -- Anacortes, Washington</li>

<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WAcolors.Mushroom.jpg"></center>

<li>Mushroom Hunting -- Orcas Island, Washington</li>

</ul>


## Building Palettes 

Use the `pnw_palette()` function to build and view palettes. Inputs are 'name', 'n', and 'type' (continuous or discrete). 'Name' is required. If 'n' is blank, function will assume n is equal to the number of colors in the palette (5-8), but if n > palette length, it will automatically interpolate colors between. If 'type' is missing, the function will assume "discrete" if n < palette length, and "continuous" if n > palette length. 

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


```r
pnw_palette("Moth",12)
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Moth.12.png"></center>


## Example Plots

Palettes can be easily integrated into Base R imaging or `ggplot2`. 

```r
pal <- pnw_palette("Shuksan",100)
image(volcano, col = pal)
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Volcano.Shuksan.png"></center>


```r
pal=pnw_palette("Lake",5, type = "discrete")
ggplot(diamonds, aes(carat, fill = cut)) +
  geom_density(position = "stack") +
  scale_fill_manual(values=pal)  +
  theme_classic()
```  
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Diamonds.Lake.png"></center>


```r
pal=pnw_palette("Shuksan2",100)
ggplot(data.frame(x = rnorm(1e4), y = rnorm(1e4)), aes(x = x, y = y)) +
  geom_hex() +
  coord_fixed() +
  scale_fill_gradientn(colours = pal) +
  theme_classic()
  
  # Or, to switch the order, use rev(), see below
  scale_fill_gradientn(colours = rev(pal))
```


<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Hex.Shuksan2.png"></center>
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Hex.Shuksan2.Rev.png"></center>



```r
ggplot(data = iris,aes(x=Petal.Length,y=Petal.Width,color=Species))+
  geom_point(size=2)+
  scale_color_manual(values=pnw_palette("Spring",3))+
  theme_classic()
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Spring.Iris.png"></center>


 ```r
pal <- pnw_palette("Anemone",3)
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + 
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")+
  scale_fill_manual(values=pal)+
  theme_classic()
```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/Anemone.violins.png"></center>


 ```r
library(tidyverse)
library(urbanmapr)
pal <- pnw_palette("Winter",100)
countydata %>%
  left_join(counties, by = "county_fips") %>%
  filter(state_name =="Washington") %>%
  ggplot(mapping=aes(long,lat,group = group, fill = horate)) +
  geom_polygon(color="black",size=.25) +
  scale_fill_gradientn(colours = pal) +
  coord_map(projection="albers",lat0=39,lat1=45) +
  theme(legend.title = element_text(),
        legend.key.width = unit(.5,"in")) +
  labs(fill="Homeownership rate") +
  theme(axis.text = element_blank(), axis.ticks = element_blank(), 
        axis.title = element_blank(), panel.grid = element_blank(),
        axis.line = element_blank(), panel.background = element_blank())

```
<center><img src="https://github.com/jakelawlor/PNWColors/blob/master/ReadMeFigures/WA.homes.winter.png"></center>

### Contact
Used the palettes in your paper and care to share? (please do!) \
Love the palettes and want to [share on twitter?](https://twitter.com/Jake_Lawlor1/status/1192175651358330880)  \
Reach me at <lawlorj@wwu.edu> or 
[@Jake_Lawlor1](https://twitter.com/Jake_Lawlor1) 

###### This work was supported by NSF grant #1538626
