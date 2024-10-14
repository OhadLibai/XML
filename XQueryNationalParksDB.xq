<?xml version="1.0" encoding="UTF-8"?>

---
<!-- Q1:
List all the animals that can be found in the national parks
        and mention their classification --> 


<!--
for $a_n in distinct-values(//Animal/@name)
return <Animal name = "{$a_n}">
         <Classification>
         {let $class:= distinct-values(//Animal[@name=$a_n]/Classification)
         return $class
         }
         </Classification>
        </Animal>
 -->

<Animal name="Birdy Wingy">
<Classification> Bird </Classification>
</Animal>

<Animal name="Xior">
<Classification> Mammal </Classification>
</Animal>

<Animal name="Liobel Tips">
<Classification> Reptile </Classification>
</Animal>

<Animal name="Yoo Jack">
<Classification> Mammal </Classification>
</Animal>

<Animal name="Crosslif">
<Classification> Mammal </Classification>
</Animal>

<Animal name="Chiefly">
<Classification> Reptile </Classification>
</Animal>

<Animal name="Kusba">
<Classification> Fish </Classification>
</Animal>

---
<!-- Q2:
Which flora has the largest abundancy -->

<!--
let $max_ub := max( for $fl in //Flora/*/child::*[Ubiquity]
					return <cnt> {fn:tokenize($fl/Ubiquity, ' ')[1]} </cnt>
                    )
for $fl in //Flora/*/child::*[Ubiquity]
where decimal(fn:tokenize($fl/Ubiquity,' ')[1]) = $max_ub
return $fl
-->

<Flower name="Nibvros">
        <Color>Red</Color>
        <Seasonal>No</Seasonal>
        <Ubiquity>80000 units</Ubiquity>
        <Protected>No</Protected>
</Flower>

---
<!-- Q3:
Give the animal with lowest population of all the 
                fauna from each national park -->

<!--
for $N in //NationalPark
let $min_pop:= min( for $a in $N//Animal[Ubiquity]
					return <cnt> {fn:tokenize($a/Ubiquity,' ')[1]} </cnt>
                    )
return   for $a in $N//Animal
		 where decimal(fn:tokenize($a/Ubiquity,' ')[1]) = $min_pop
         return $a
-->

<Animal name="Xior">
        <Classification>Mammal</Classification>
        <Ubiquity>100 units</Ubiquity>    
        <Endangered>Yes</Endangered>
</Animal>

<Animal name="Crosslif">
        <Classification>Mammal</Classification>
        <Ubiquity>150 units</Ubiquity>    
        <Endangered>No</Endangered>
</Animal>

---
<!-- Q4:
List all the animal classes in all the national parks -->

<!--
for $class in distinct-values(//Animal/Classification)
return <Classification> {$class} </Classification>
-->

<Classification> Bird </Classification>
<Classification> Mammal </Classification>
<Classification> Reptile </Classification>
<Classification> Fish </Classification>

---
<!-- Q5:
List all the animals that can be found in more than one national park -->

<!-- 
for $a_n in distinct-values(//Animal/@name)
where count(//Animal[ @name= $a_n ]) > 1
return <Animal name = "{$a_n}"> </Animal>
-->

<Animal name="Birdy Wingy"> </Animal>

---
<!-- Q6:
What is the most dominant color of all the national parks -->

<!--
let $sh_t:= for $c in //Flora/*/child::*/color
                return <flora>
                        {$c}
                        <cnt> {count(//Flora/*/child::*[Color=$c])} </cnt>        
                        </flora>
             
let $max_cnt := max($sh_t//cnt)

return <Color> {distinct-values($sh_t[cnt = $max_cnt]/color)} </Color>
-->

<Color> Red </Color>

---

<!-- Q7:
Name all the parks which their popularity is not high -->

<!--
for $NP in //NationalPark
where $NP/Publicity[Popularity != 'High']
return   <NationalPark id="{$NP/@id}" name="{$NP/@name}" size="{$NP/@size}"> </NationalPark>
-->

<NationalPark id="002" name="LoviLoper" size="25000"> </NationalPark>

---
<!-- Q8:
Give national parks which their rating is above average -->

<!--
let $demo_tree:= for $NP in //NationalPark
				 return <Rating>
                 		{fn:tokenize($NP//Rating,' ')[1]}
                        </Rating>
let $avg:= avg($demo_tree)
for $NP in //NationalPark
where decimal(fn:tokenize($NP//Rating,' ')[1]) > $avg   
return <NationalPark id="{$NP/@id}" name="{$NP/@name}" size="{$NP/@size}"> </NationalPark>
-->

<NationalPark id="001" name="PortHorizon" size="10000"> </NationalPark>

---
<!-- Q9:
Which park has the highest maintenance expenses -->

<!--
let $max_exp:= max(//AnnualCost)
for $N in //NationalPark
where $N//*[AnnualCost = $max_exp]
return <NationalPark id="{$N/@id}" name="{$N/@name}" size="{$N/@size}"> </NationalPark>
-->

<NationalPark id="001" name="PortHorizon" size="10000"> </NationalPark>

---

<!-- Q10:
List the attractions suggested by each park and the popularity of the park -->

<!--
for $N in //NationalPark
return
<NationalPark id="{$N/@id}" name="{$N/@name}" size="{$N/@size}"> 
{$N//Popularity}
{$N//Attractions}
</NationalPark>
-->

<NationalPark id="001" name="PortHorizon" size="10000"> 
        <Popularity>High</Popularity>
        <Attractions>
                <Attraction>Dobi&apos;s Pet-Sallon</Attraction>
        </Attractions>
</NationalPark>

<NationalPark id="002" name="LoviLoper" size="25000"> 
        <Popularity>Medium</Popularity>
</NationalPark>

---
<!-- Q11:
For each park, give its reccomended season to visit -->

<!--
for $N in //NationalPark
return
<NationalPark id="{$N/@id}" name="{$N/@name}" size="{$N/@size}"> 
{$N//ReccomendedSeason}
</NationalPark>
-->

<NationalPark id="001" name="PortHorizon" size="10000"> 
        <ReccomendedSeason>Spring</ReccomendedSeason>
</NationalPark>

<NationalPark id="002" name="LoviLoper" size="25000"> 
        <ReccomendedSeason>Winter</ReccomendedSeason>
</NationalPark>
---

<!-- Q12:
For each park, give its annual visitors and its number of employees -->

<!--
for $N in //NationalPark
return
<NationalPark id="{$N/@id}" name="{$N/@name}" size="{$N/@size}"> 
{$N//AnnualVisitors}
{$N//Employees}
</NationalPark>
-->

<NationalPark id="001" name="PortHorizon" size="10000"> 
        <AnnualVisitors>500000</AnnualVisitors>
        <Employees>4</Employees>
</NationalPark>

<NationalPark id="002" name="LoviLoper" size="25000"> 
        <AnnualVisitors>250000</AnnualVisitors>
        <Employees>3</Employees>
</NationalPark>
---
