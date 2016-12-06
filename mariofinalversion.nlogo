breed [marios mario]
breed [goombas goomba]
breed [stars star]
breed [mushrooms mushroom]
breed [sunflowers sunflower]
breed [fireballs fireball]
breed [sparks spark]
breed [bricks brick]
breed [grounds ground]
breed [coinboxes coinbox]
breed [manycoinboxes manycoinbox]
breed [starboxes starbox]
breed [powerupboxes powerupbox]
breed [coins coin]
breed [koopas koopa]
breed [shells shell]
breed [bowsers bowser]
breed [bowserfireballs bowserfireball]
breed [mariodeads mariodead]
breed [clouds cloud]
coins-own [cointimer]
bowsers-own [ bowserhp]
manycoinboxes-own [coinsleft]
marios-own [jumpwait hp invincibletimer invincible firepower invuln invulntimer sparktimer walktimer walktimer2 walktimer3 walktimer4 fireballtimer]
fireballs-own [jumpwaitfireball fireballdirection]
shells-own [movement shelltimer]
globals [dist mariox marioy ssize ffirepower hhp level koopatimer bowsertimer fireballseconds score black?]

to setup
  ca
  ask patch -15 5 [
    sprout-marios 1
    ask marios [
      set hp 1
      set firepower 0
      set size 2
      set color white
      set heading 0
      set shape "stillmarioright"
      set invuln 0
      set invincible 0
    ]
  ]
  ask patches [
    if pycor < 4 [
      set pcolor 23.072
    ]
    if pycor >= 4 [
      set pcolor 106 
    ]
  ]
  set level 1
  generaterandomlevel1
  paintworld
end

to revivemario
  if count marios = 0 [ 
    ask patch -4 5 [
      sprout-marios 1
      ask marios [
        set hp 1
        set firepower 0
        set size 2
        set color white
        set heading 0
        set shape "stillmarioright"
        set invuln 0
        set invincible 0
      ]
    ]
  ]
end

to cregbricks
  ask patch -5 8 [
    set pcolor 35.121
    sprout-bricks 1[
      set shape "brick"]
    ]
end

to ccoinbox
  ask patch -3 8 [
    set pcolor 35.122
    sprout-coinboxes 1[
      set shape "brick"]
  ]
end

to ccoinbox2
  ask patch -2 8 [
    set pcolor 45.123
    sprout-powerupboxes 1[
      set shape "questionmark"]
  ]
end

to cmanycoinbox
  ask patch -1 8 [
    set pcolor 35.123
    sprout-manycoinboxes 1[
      set coinsleft 10
      set shape "brick"]
  ]
end
to cpowerupbox
  ask patch 1 8[
    set pcolor 45.121
    sprout-powerupboxes 1[
      set shape "questionmark"]
  ]
end

to cstarbox
  ask patch 3 8 [
    set pcolor 45.122
    sprout-starboxes 1[
      set shape "questionmark"]
  ]
end

to cgoomba
  ask patch 0 7 [
    sprout-goombas 1 [
      set shape "goomba"
      set size 2
      set heading 0
      set color brown
    ]
  ]
end

to ckoopa
  ask patch 0 7 [
    sprout-koopas 1 [
      set shape "koopa"
      set size 2
      set heading 0
      set color yellow
    ]
  ]
end

to cbowser 
  ask patch 0 7 [
    sprout-bowsers 1 [
      set shape "bowserleft"
      set size 4
      set color green
      set bowsertimer timer
      set bowserhp 3
      set fireballseconds 2
    ]
  ]
end

to cmushroom
  ask patch -4 5 [
    sprout-mushrooms 1 [
      set shape "mushroom"
      set size 1
      set heading 0
    ]
  ]
end

to cstar
  ask patch -4 5 [
    sprout-stars 1 [
      set shape "star"
      set size 1
      set heading 0
    ]
  ]
end

to csunflower
  ask patch -4 5 [
    sprout-sunflowers 1 [
      set shape "sunflower"
      set size 1
      set heading 0
    ]
  ]
end

to go
  every .04 [
    ask marios [
      if mouse-inside? and firepower = 0 [
        if xcor > mouse-xcor and [pcolor] of patch-at-heading-and-distance -90 1 = 106 and xcor > -14.5 [
          set xcor xcor - .4
          if shape != "marioleft" and shape != "marioleft2" and shape != "marioleft3" and shape != "marioleft4"[
            set shape "marioleft" 
            set walktimer timer
            ]
          if shape = "marioleft" and timer - walktimer > .2 [
            set shape "marioleft2"
            set walktimer timer
          ]
          if shape = "marioleft2" and timer - walktimer > .2 [
            set shape "marioleft3"
            set walktimer timer
          ]
          if shape = "marioleft3" and timer - walktimer > .2 [
            set shape "marioleft4"
            set walktimer timer
          ]
          if shape = "marioleft4" and timer - walktimer > .2 [
            set shape "marioleft"
            set walktimer timer
          ]
        ]
        if xcor < mouse-xcor and [pcolor] of patch-at-heading-and-distance 90 1 = 106[
          set xcor xcor + .4
          if shape != "marioright" and shape != "marioright2"and shape != "marioright3" and shape != "marioright4"[
            set shape "marioright" 
            set walktimer timer
            ]
          if shape = "marioright" and timer - walktimer > .2 [
            set shape "marioright2"
            set walktimer timer
          ]
          if shape = "marioright2" and timer - walktimer > .2 [
            set shape "marioright3"
            set walktimer timer
          ]
          if shape = "marioright3" and timer - walktimer > .2 [
            set shape "marioright4"
            set walktimer timer
          ]
          if shape = "marioright4" and timer - walktimer > .2 [
            set shape "marioright"
            set walktimer timer
          ]
        ]
      ]
      if mouse-inside? and firepower = 1 [
        if xcor > mouse-xcor and [pcolor] of patch-at-heading-and-distance -90 1 = 106 and xcor > -14.5[
            set xcor xcor - .4
            if shape != "firemarioleft" and shape != "firemarioleft2"and shape != "firemarioleft3" and shape != "firemarioleft4" [
              set shape "firemarioleft" 
              set walktimer timer
            ]
            if shape = "firemarioleft" and timer - walktimer > .2 [
              set shape "firemarioleft2"
              set walktimer timer
            ]
            if shape = "firemarioleft2" and timer - walktimer > .2 [
              set shape "firemarioleft3"
              set walktimer timer
            ]
            if shape = "firemarioleft3" and timer - walktimer > .2 [
              set shape "firemarioleft4"
              set walktimer timer
            ]
            if shape = "firemarioleft4" and timer - walktimer > .2 [
              set shape "firemarioleft"
              set walktimer timer
            ]
        ]
        if xcor < mouse-xcor and [pcolor] of patch-at-heading-and-distance 90 1 = 106[
          set xcor xcor + .4
          if shape != "firemarioright" and shape != "firemarioright2"and shape != "firemarioright3"and shape != "firemarioright4"[
            set shape "firemarioright" 
            set walktimer timer
          ]
          if shape = "firemarioright" and timer - walktimer > .2 [
            set shape "firemarioright2"
            set walktimer timer
          ]
          if shape = "firemarioright2" and timer - walktimer > .2 [
            set shape "firemarioright3"
            set walktimer timer
          ]
          if shape = "firemarioright3" and timer - walktimer > .2 [
            set shape "firemarioright4"
            set walktimer timer
          ]
          if shape = "firemarioright4" and timer - walktimer > .2 [
            set shape "firemarioright"
            set walktimer timer
          ]
        ]
      ]
      if any? mushrooms in-radius 2[
        ask mushrooms in-radius 2 [die]
        if firepower = 0 [
          set hp 2
          set ycor ycor + 1
        ]
      ]
      if any? sunflowers in-radius 2 [
        if hp = 1 [
          set ycor ycor + 1
        ]
        set hp 3
        set firepower 1
        ask sunflowers in-radius 2 [die]
      ]
      if any? stars in-radius 2 [
        ask stars [die]
        set invincible 1
        set invincibletimer timer
      ]
      if hp < 2 [
        if [pcolor] of patch-at 0 -1.5 = 106 [
          set ycor ycor - .5
        ]
      ]
      if hp > 1 [
        if [pcolor] of patch-at 0 -2 = 106 [
          set ycor ycor - .5
        
      ]]
      if invincible = 0 [
        if hp > 0 [
          if invuln = 0 [
            if any? goombas-on patch-at-heading-and-distance 0 0 [set hp hp - 1 set invuln 1 set invulntimer timer]
            if any? koopas-on patch-at-heading-and-distance 0 0 [set hp hp - 1 set invuln 1 set invulntimer timer]
          ]
          if any? goombas-on patch-at-heading-and-distance 0 -1 [
            ask goombas-on patch-at-heading-and-distance 0 -1 [die] set score score + 1]
          if any? goombas-on patch-at-heading-and-distance 45 -1 [
            ask goombas-on patch-at-heading-and-distance 45 -1 [die]set score score + 1]
          if any? goombas-on patch-at-heading-and-distance -45 -1 [
            ask goombas-on patch-at-heading-and-distance -45 -1 [die]set score score + 1]
          if any? koopas-on patch-at-heading-and-distance 0 -1 [
            ask koopas-on patch-at-heading-and-distance 0 -1 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1
            ]
          if any? koopas-on patch-at-heading-and-distance 45 -1 [
            ask koopas-on patch-at-heading-and-distance 45 -1 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1
            ]
          if any? koopas-on patch-at-heading-and-distance -45 -1 [
            ask koopas-on patch-at-heading-and-distance -45 -1 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1
            ]
        ]
        if hp > 1 [
          if invuln = 0 [
            if any? goombas-on patch-at-heading-and-distance 0 0 [set hp hp - 1 set invuln 1 set invulntimer timer]
            if any? koopas-on patch-at-heading-and-distance 0 0 [set hp hp - 1 set invuln 1 set invulntimer timer]
          ]
          if any? goombas-on patch-at-heading-and-distance 0 -2 [
            ask goombas-on patch-at-heading-and-distance 0 -2 [die]set score score + 1]
          if any? goombas-on patch-at-heading-and-distance 45 -2 [
            ask goombas-on patch-at-heading-and-distance 45 -2 [die]set score score + 1]
          if any? goombas-on patch-at-heading-and-distance -45 -2 [
            ask goombas-on patch-at-heading-and-distance -45 -2 [die]set score score + 1]
          if any? koopas-on patch-at-heading-and-distance 0 -2 [
            ask koopas-on patch-at-heading-and-distance 0 -2 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1]
          if any? koopas-on patch-at-heading-and-distance 45 -2 [
            ask koopas-on patch-at-heading-and-distance 45 -2 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1]
          if any? koopas-on patch-at-heading-and-distance -45 -2 [
            ask koopas-on patch-at-heading-and-distance -45 -2 [hatch-shells 1 [
                set shape "shell"
                set color green
                set size 1
                set ycor ycor - .5
                set heading 0
                set shelltimer timer
            ]
            die]
            set score score + 1]
          
        ]
      ]
      if invincible = 1 [
        if any? goombas in-radius 1 [
          ask goombas in-radius 1 [die]
          set score score + 1
        ]
        if any? koopas in-radius 1 [
          ask koopas in-radius 1 [die]
          set score score + 1
        ]
        if timer - invincibletimer > 10 [
          set invincible 0
        ]
        if count sparks = 0 [
          sparkle
          set sparktimer timer
        ]
      ]
      if hp = 1 [set size 2]
      if hp = 2 [set size 3 set firepower 0]
      if hp = 3 [set size 3 set firepower 1]
      if hp = 0 [
        hatch-mariodeads 1
        die]
      if invuln = 1 [
        if timer - invulntimer > 1.5 [
          set invuln 0
        ]
      ]
    ]
    ask fireballs [
      if any? goombas in-radius 1 [
        ask goombas in-radius 1 [die]
        set score score + 1
        die]
      if any? koopas in-radius 1 [
        ask koopas in-radius 1 [die]
        set score score + 1
        die
      ]
    ]
    ask marios [
      if timer - sparktimer > .05 [ask sparks [die]]
    ]
    movegoombas
    movemushrooms
    movestars
    movefireballs
    movekoopas
    moveboweserfireballs
    moveshells
    ask coins [
      if timer - cointimer > .2 [
        ifelse shape = "coin" [
          set shape "coinedge"
        ]
        [
          set shape "coin"
        ]
        set ycor ycor + .1
      ]
      if timer - cointimer > 1 [
        die
      ]
    ]
    ask bowsers [
      if [pcolor] of patch-at 0 -2 = 106 [
      set ycor ycor - .5
      ]
      if any? marios in-radius 1 [
        ask marios in-radius 1 [
          if invincible = 0 [
            if invuln = 0 [
              set hp hp - 1 set invuln 1 set invulntimer timer
            ]
          ]
        ]
      ]
      if timer - bowsertimer > fireballseconds [
        ask marios [
          set mariox xcor
          set marioy ycor
        ]  
        ask patch 0 6 [
          sprout-bowserfireballs 1 [
            facexy mariox marioy 
            set shape "fireball"
            set size 1
          ]
        ]
        set bowsertimer timer
      ]
      ask marios [
        if xcor > 0 [
          ask bowsers [
            set shape "bowserright"
          ]
        ]
        if xcor < 0 [
          ask bowsers [
            set shape "bowserleft"
          ]
        ]
      ]
      if bowserhp = 0 [
        set score score + 10
        die
      ]
    ]
    ask marios [
      set mariox xcor
    ]
    if mariox >= 14 and count bowsers = 0[
      newlevel
    ]
    if count bowsers > 0 [
      if timer - koopatimer > 4 [
        ask patch (random 30 - 15) 15[
          sprout-koopas 1 [
            set size 2
            set shape "koopa"
          ]
        ]
        set koopatimer timer          
      ]
    ]
  ]
  if count marios = 0 [
    ask mariodeads [
      set shape "mariodead"
      set heading 180 
      while [ycor > 0.5]
        [fd .3
          wait 0.05]
    ]
    ask patch 2 10 [
      set plabel "GAME OVER"
    ]
    ask patch 3 9 [
      set plabel "FINAL SCORE:"
    ]
    ask patch 5 9 [
      set plabel score
    ]
    ask bricks [die]
    ask goombas [die]
    ask koopas [die]
    ask bowsers [die]
    ask grounds [die]
    ask powerupboxes [die]
    ask coinboxes [die]
    ask shells [die]
    ask manycoinboxes [die]
    ask clouds [die]
    ask bowserfireballs [die]
    ask patch 20 20
      [set pcolor black]
    ask patch -20 20
      [set pcolor black]
    ask patch -20 0
      [set pcolor black]
    ask patch 20 0
      [set pcolor black]
    ask patches [if any? neighbors with [pcolor = black]
      [set black? true]
    ]
    ask patches[
      if black? [set pcolor black
        wait 0.003]
    ]
  ]  
end

to jumps
  ask marios [
    if hp = 1 [
      set dist -2
    ]
    if hp > 1 [
      set dist -2.5
    ]
    if [pcolor] of patch-at 0 dist != 106[
      repeat 12 [
        if [pcolor] of patch-at-heading-and-distance 0 1 = 35.125 [
          stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 35.121 [
          ask patch-at-heading-and-distance 0 1 [
            set pcolor 106
          ]
          ask turtles-on patch-at-heading-and-distance 0 1 [
            die
          ]
          stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 35.122 [
          ask patch-at-heading-and-distance 0 1 [
            set pcolor 35.125
            sprout-coins 1 [
              set size 1
              set shape "coin"
              set ycor ycor + .5
              set cointimer timer
              set score score + 1
            ]
          ]
          ask turtles-on patch-at-heading-and-distance 0 1 [
            die
          ]
          stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 45.123 [
          ask patch-at-heading-and-distance 0 1 [
            set pcolor 35.125
            sprout-coins 1 [
              set size 1
              set shape "coin"
              set ycor ycor + .5
              set cointimer timer
              set score score + 1
            ]
          ]
          ask turtles-on patch-at-heading-and-distance 0 1 [
            die
          ]
          stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 35.123 [
          ask manycoinboxes-on patch-at-heading-and-distance 0 1 [
            if coinsleft > 0 [
              hatch-coins 1 [
                set size 1
                set shape "coin"
                set ycor ycor + .5
                set cointimer timer
                set score score + 1
              ]
              set coinsleft coinsleft - 1
            ]
            if coinsleft = 0 [
              ask patch-here [
                set pcolor 35.125
              ]
              ask turtles-on patch-here [
                die
              ]
            ]
          ]
        stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 45.121 [
          ask marios [
            if hp = 1 [
              ask patch-at-heading-and-distance 0 1 [
                sprout-mushrooms 1 [
                  set ycor ycor + 1
                  set size 1
                  set shape "mushroom"
                ]
              ]
            ]
            if hp > 1 [
              ask patch-at-heading-and-distance 0 1 [
                sprout-sunflowers 1 [
                  set ycor ycor + 1
                  set size 1
                  set shape "sunflower"
                ]
              ]
            ]
            ask patch-at-heading-and-distance 0 1 [
              set pcolor 35.125
            ]
            ask turtles-on patch-at-heading-and-distance 0 1 [
              die
            ]
          ]
        stop
        ]
        if [pcolor] of patch-at-heading-and-distance 0 1 = 45.122 [
          ask patch-at-heading-and-distance 0 1 [
            sprout-stars 1 [
              set ycor ycor + 1
              set size 1
              set shape "star"
            ]
            set pcolor 35.125
          ]
          ask turtles-on patch-at-heading-and-distance 0 1 [
            die
          ]
          stop
        ]
        set ycor ycor + .5
        set jumpwait timer
        while [timer - jumpwait < .03] [
          every .04 [            
            movegoombas
            movemushrooms
            movestars
            movefireballs
            movekoopas
            moveboweserfireballs
            moveshells
            ask bowsers [
              if bowserhp = 0 [
                die
              ]
            ]
            if invincible = 1 [
              if any? goombas in-radius 2 [
                ask goombas in-radius 2 [die]
                set score score + 1
              ]
              if any? koopas in-radius 2 [
                ask koopas in-radius 2 [die]
                set score score + 1
              ]
              if timer - invincibletimer > 15 [
                set invincible 0
              ]
              if count sparks = 0 [
                sparkle
                set sparktimer timer
              ]
            ]
            ask fireballs [
              if any? goombas in-radius 1 [
                ask goombas in-radius 1 [die]
                set score score + 1
                die]
              if any? koopas in-radius 1 [
                ask koopas in-radius 1 [die]
                set score score + 1
                die
              ]
            ]
            ask marios [
              if timer - sparktimer > .05 [ask sparks [die]]
              if mouse-inside? and firepower = 0 [
                if xcor > mouse-xcor and [pcolor] of patch-at-heading-and-distance -90 -1 = 106[
                  set xcor xcor - .3
                  set shape "mariojumpleft"
                ]
                if xcor < mouse-xcor and [pcolor] of patch-at-heading-and-distance 90 -1 = 106[
                  set xcor xcor + .3
                  set shape "mariojumpright"
                ]
              ]
            if mouse-inside? and firepower = 1 [
              if xcor > mouse-xcor and [pcolor] of patch-at-heading-and-distance -90 -1 = 106[
                set xcor xcor - .3
                set shape "firemariojumpleft"
              ]
              if xcor < mouse-xcor and [pcolor] of patch-at-heading-and-distance 90 -1 = 106 [
                set xcor xcor + .3
                set shape "firemariojumpright"
              ]
            ]
            ]
            ask coins [
              if timer - cointimer > .2 [
                ifelse shape = "coin" [
                  set shape "coinedge"
                ]
                [
                  set shape "coin"
                ]
                set ycor ycor + .1
              ]
              if timer - cointimer > 1 [
                die
              ]
            ]
          ]
        ]
      ]
    ]
  ]
end

to movegoombas
  ask goombas [
    if [pcolor] of patch-at 0 -1.5 = 106 [
      set ycor ycor - .5
    ]
    set xcor xcor - .2]
end

to movekoopas
  ask koopas [
    if [pcolor] of patch-at 0 -1.5 = 106 [
      set ycor ycor - .5
    ]
    set xcor xcor - .1]
end

to moveshells 
  ask shells [
      if timer - shelltimer > .5 [
        if any? marios-on patch-at-heading-and-distance 45 1 [
          set movement 1
          set heading -90
        ]
        if any? marios-on patch-at-heading-and-distance -45 1 [
          set movement 1
          set heading 90
        ]
        if any? shells-on patch-at-heading-and-distance 90 1 [
          if [movement] of shells-on patch-at-heading-and-distance 90 1 = 1[
            set movement 1
            set heading -90
          ]
        ]
        if any? shells-on patch-at-heading-and-distance -90 1 [
          if [movement] of shells-on patch-at-heading-and-distance -90 1 = 1[
            set movement 1
            set heading 90
          ]
        ]
      ]
        if movement = 1 [
          fd .5
          if any? koopas in-radius 1 [
            ask koopas in-radius 1[
              die
            ]
            set score score + 1
          ]
          if any? goombas in-radius 1 [
            ask goombas in-radius 1 [
              die
            ]
            set score score + 1
          ]
          if any? bowsers in-radius 1.5 [
            ask bowsers in-radius 1.5 [
              set bowserhp bowserhp - 1
            ]
            die
          ]
        ]
      if xcor <= -14.5 [die]
      if xcor >= 14.5 [die]
    ]
end

to moveboweserfireballs
  ask bowserfireballs [
    fd .4
    if xcor >= 14.5 or xcor < -14.5 [
      die
    ]
    if ycor >= 14.5 or ycor <= 3 [
      die
    ]
    if any? marios in-radius 1 [
      ask marios in-radius 1 [
        if invuln = 0 and invincible = 0 [
          set hp hp - 1
          set invuln 1
          set invulntimer timer
        ]
      ]
    ]
  ]
end

to movemushrooms
  ask mushrooms [
    if [pcolor] of patch-at 0 -1 = 106 [
      set ycor ycor - .5
    ]
    set xcor xcor - .3]
end

to movestars
  ask stars [
    if [pcolor] of patch-at 0 -1 = 106[
      set ycor ycor - .5
    ]
    set xcor xcor - .3]
end

to movesunflowers
  ask sunflowers [
    if [pcolor] of patch-at 0 -1 = 106 [
      set ycor ycor - .5
    ]
    set xcor xcor - .5]
end

to movefireballs
  ask fireballs [
    if fireballdirection = 1 [rt 20 set xcor xcor + .7]
    if fireballdirection = 2 [lt 20 set xcor xcor - .7]
    if [pcolor] of patch-at 0 -1 = 106 [
      set ycor ycor - .5
    ]
    if xcor <= -14.5 or xcor >= 14.5 [die]
  ]
end
  
to throw-fire
  ask marios [
    if firepower = 1 and timer - fireballtimer > .35[
      if shape = "stillfiremarioright" 
      or shape = "firemariojumpright" 
      or shape = "firemarioright"
      or shape = "firemarioright2"
      or shape = "firemarioright3"
      or shape = "firemarioright4" [
        hatch-fireballs 1 [
          set shape "fireball"
          set size 1
          set heading 90
          set color red
          set fireballdirection 1
        ]
      ]
      if shape = "stillfiremarioleft" 
      or shape = "firemariojumpleft" 
      or shape = "firemarioleft"
      or shape = "firemarioleft2"
      or shape = "firemarioleft3"
      or shape = "firemarioleft4" [
        hatch-fireballs 1 [
          set shape "fireball"
          set size 1
          set heading -90
          set color red
          set fireballdirection 2
        ]
      ]
      set fireballtimer timer
    ]
  ]
end

to sparkle
  ask marios [
    hatch-sparks 15
    ask sparks [
      set size .2
      set heading random 360
      set color yellow
      fd random 2 + 1
    ]
  ]
end

to paintgrounds
  ask patches with [pcolor = 23.072][
    sprout-grounds 1[
      set shape "ground"]]
end

to paintregbricks
  ask patches with [pcolor = 35.121][
    sprout-bricks 1[
      set shape "brick"]]
end

to paintcoinbox
  ask patches with [pcolor = 35.122][
    sprout-coinboxes 1[
      set shape "brick"]
  ]
end

to paintcoinbox2
  ask patches with [pcolor = 45.123][
    sprout-powerupboxes 1[
      set shape "questionmark"]
  ]
end

to paintmanycoinbox
  ask patches with [pcolor = 35.123][
    sprout-manycoinboxes 1[
      set shape "brick"]
  ]
end
to paintpowerupbox
  ask patches with [pcolor = 45.121][
    sprout-powerupboxes 1[
      set shape "questionmark"]
  ]
end

to paintstarbox
  ask patches with [pcolor = 45.122][
    sprout-starboxes 1[
      set shape "questionmark"]
  ]
end

to setupgoombas
  ask goombas [
    set shape "goomba"
    set size 2
    set heading 0
    set color brown
  ]
end

to setupkoopas
  ask koopas [
    set shape "koopa"
    set size 2
    set heading 0
    set color yellow
  ]
end

to newlevel
  ask marios [
    set ssize size
    set ffirepower firepower
    set hhp hp
  ]
  ct
  cp
  ask patches [
    if pycor < 4 [
      set pcolor 23.072
    ]
    if pycor >= 4 [
      set pcolor 106 
    ]
  ]
  if level < 5 [
    generaterandomlevel1
  ]
  if level = 5 [
    generaterandomlevel1
    cbowser 
    set koopatimer timer]
  if level > 5 and level < 10 [
    generaterandomlevel2
  ]
  if level = 10 [
    generaterandomlevel2
    cbowser 
    ask bowsers [
      set bowserhp 4
      set color red
      set fireballseconds 1.5
      set koopatimer timer
    ]
  ]
  if level > 10 and level < 15[
    generaterandomlevel3
  ]
  if level = 15 [
    generaterandomlevel3
    cbowser 
    ask bowsers [
      set bowserhp 5
      set color violet
      set fireballseconds 1.25
      set koopatimer timer
    ]
  ]
  if level > 15 and level mod 5 = 0 [
    generaterandomlevel3
    cbowser 
    ask bowsers [
      set bowserhp 6
      set color black
      set fireballseconds 1
      set koopatimer timer
    ]
  ]
  if level > 15 [
    generaterandomlevel4
  ]
  ask patch -15 5 [
    sprout-marios 1
    ask marios [
      set hp hhp
      set firepower ffirepower
      set size ssize
      set color white
      set heading 0
      set shape "stillmarioright"
      set invuln 0
      set invincible 0
      if firepower = 1 [
        set shape "stillfiremarioright"
      ]
    ]
  ]
  set level level + 1
  wait 1
end

to paintworld
  paintregbricks
  paintgrounds
  paintcoinbox
  paintcoinbox2
  paintmanycoinbox
  paintstarbox
  paintpowerupbox
end



to generaterandomlevel1
  create-clouds random 6[
    set shape one-of ["cloud1" "cloud2" "cloud3"]
    setxy random 40 - 20 one-of [17 18]
    set size 5]
  repeat random 5 + 2[
    ask patch ((random 30) - 15) 8 [
      set pcolor 35.121]
  ]
  repeat random 3 + 1[
    ask patch ((random 25) - 10) 8 [
      ifelse pcolor = 106[
        set pcolor 35.122]
      [ask patch ((random 35) - 15) 8 [set pcolor 35.122]
      ]
    ]
  ]
  repeat random 3 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor one-of [45.123 45.121]
      ]
    ]
  ]
  if random 6 = 1 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor 45.122]
      ]
    ]
  repeat random 3 + 1 [
    ask patch ((random 22) - 7) 5 [
      sprout-goombas 1 
    ]
  ]
  repeat random 2 [
    ask patch ((random 22) - 7) 5 [
      if not any? goombas in-radius 1 [
        sprout-koopas 1
      ]
    ]
  ]
  ask patches with [pycor = 13]  [
    if [pcolor] of patch-at-heading-and-distance 0 -5 != 106 [
      ifelse random 6 = 1 
      [set pcolor 35.121] 
      [ifelse random 14 = 1 
        [set pcolor 35.122] 
        [ifelse random 16 = 1
          [set pcolor 45.121]
          [if random 17 = 1 [
            set pcolor 35.123]     
          ]
        ]
      ]
    ]
  ]
  paintworld
  setupgoombas
  setupkoopas
  ask manycoinboxes [
    set coinsleft 5
  ]
end

to generaterandomlevel2
  create-clouds random 6[
    set shape one-of ["cloud1" "cloud2" "cloud3"]
    setxy random 40 - 20 one-of [17 18]
    set size 5]
   repeat random 5 + 2[
    ask patch ((random 30) - 15) 8 [
      set pcolor 35.121]
  ]
  repeat random 5 + 2[
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106 [
        set pcolor 35.122
      ]
    ]
  ]
  repeat random 2 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor one-of [45.123 45.121]
      ]
    ]
  ]
  if random 11 = 1 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor 45.122]
      ]
    ]
  repeat random 4 + 1 [
    ask patch ((random 22) - 7) 5 [
      sprout-goombas 1 
    ]
  ]
  repeat random 2 [
    ask patch ((random 22) - 7) 5 [
      if not any? goombas in-radius 1 [
        sprout-koopas 1
      ]
    ] 
  ]
  ask patches with [pycor = 13]  [
    if [pcolor] of patch-at-heading-and-distance 0 -5 != 106 [
      ifelse random 6 = 1 
      [set pcolor 35.121] 
      [ifelse random 14 = 1 
        [set pcolor 35.122] 
        [ifelse random 16 = 1
          [set pcolor 45.121]
          [if random 17 = 1 [
            set pcolor 35.123]     
          ]
        ]
      ]
    ]
  ]
  paintworld
  setupgoombas
  setupkoopas
  ask manycoinboxes [
    set coinsleft 5
  ]
end

to generaterandomlevel3
  create-clouds random 6[
    set shape one-of ["cloud1" "cloud2" "cloud3"]
    setxy random 40 - 20 one-of [17 18]
    set size 5]
   repeat random 3 + 2[
    ask patch ((random 30) - 15) 8 [
      set pcolor 35.121]
  ]
  repeat random 6 + 2[
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106 [
        set pcolor 35.122
        ]
    ]
  ]
  if random 3 = 1 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor one-of [45.123 45.121]
      ]
    ]
  ]
  if random 11 = 1 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor 45.122]
      ]
    ]
  repeat random 4 + 1 [
    ask patch ((random 22) - 7) 5 [
      sprout-goombas 1 
    ]
  ]
  repeat random 2 [
    ask patch ((random 22) - 7) 5 [
      if not any? goombas in-radius 1 [
        sprout-koopas 1
      ]
    ] 
  ]
  ask patches with [pycor = 13]  [
    if [pcolor] of patch-at-heading-and-distance 0 -5 != 106 [
      ifelse random 9 = 1 
      [set pcolor 35.121] 
      [ifelse random 6 = 1 
        [set pcolor 35.122] 
        [ifelse random 16 = 1
          [set pcolor 45.121]
          [if random 17 = 1 [
            set pcolor 35.123]     
          ]
        ]
      ]
    ]
  ]
  paintworld
  setupgoombas
  setupkoopas
  ask manycoinboxes [
    set coinsleft 5
  ]
end

to generaterandomlevel4
  create-clouds random 6[
    set shape one-of ["cloud1" "cloud2" "cloud3"]
    setxy random 40 - 20 one-of [17 18]
    set size 5]
  repeat random 6 + 4[
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor 35.122]
    ]
  ]
  repeat random 2 + 2 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106 [
        set pcolor 35.123
      ]
    ]
  ]
  if random 11 = 1 [
    ask patch ((random 25) - 10) 8 [
      if pcolor = 106[
        set pcolor 45.122]
      ]
    ]
  repeat random 4 + 2 [
    ask patch ((random 22) - 7) 5 [
      sprout-goombas 1 
    ]
  ]
  repeat random 4 [
    ask patch ((random 22) - 7) 5 [
      if not any? goombas in-radius 1 [
        sprout-koopas 1
      ]
    ] 
  ]
  ask patches with [pycor = 13]  [
    if [pcolor] of patch-at-heading-and-distance 0 -5 != 106 [
      ifelse random 9 = 1 
      [set pcolor 35.121] 
      [if random 6 = 1 
        [set pcolor 35.122] 
      ]
    ]
  ]
  paintworld
  setupgoombas
  setupkoopas
  ask manycoinboxes [
    set coinsleft 5
  ]
end

;ground color will be 23.072

;reg brick color will be 35.121
;single coin brick color will be 35.122
;single coin box 2 color will be 45.123
;multiple coin brick color will be 35.123

;mushroom/flower questionmark box color will be 45.121
;star questionmark box color will be 45.122
@#$#@#$#@
GRAPHICS-WINDOW
261
11
891
462
15
-1
20.0
1
15
1
1
1
0
1
1
1
-15
15
0
20
0
0
1
ticks
30.0

BUTTON
36
97
99
130
NIL
Go
T
1
T
OBSERVER
NIL
E
NIL
NIL
1

BUTTON
36
64
103
97
NIL
Setup
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL
1

BUTTON
35
144
99
177
Jump
jumps
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
34
178
124
211
Fireball
throw-fire
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

MONITOR
126
229
197
290
Score
score
17
1
15

MONITOR
37
223
110
284
Level
Level
17
1
15

TEXTBOX
110
70
260
154
First hit Setup, then Go.\nJump with 'W' and move with the mouse.  Throw fireballs after gaining fire power from a fireflower with 'D'.  Read the Info tab.
11
0.0
1

@#$#@#$#@
# **SUPER MARIO REVISED**

## WHAT IS IT?

A recreation of Mario on NetLogo.

## HOW IT WORKS

The game follows the basic conventions of classic Mario with a slight twist- there is no side scrolling and levels are randomly generated.  The objective of the game is to get through as many levels as possible and obtain as high a score as possible.  Collecting coins and defeating enemies increases the player's score.  Levels get progressively harder, and Bowser appears on every fifth level.

## HOW TO PLAY: THE BASICS

Due to built-in keyboard delay, traditional keyboard controls were abandoned in favor of mouse controls.  Control Mario's horizontal movements with the mouse, and use the "w" key to jump.  Jump on enemies such as goombas and koopas to kill them.  Jump up while standing underneath bricks to obtain coins, mushrooms, fireflowers, and stars.  Mushrooms increase Mario's size and give him an additional health point for a total of 2.  Fireflowers give Mario the ability to shoot fireballs (by hitting the "d" key) and increase his health points to a total of 3.  Stars make Mario invincible for 15 seconds or until the player moves to the next map.

## GAMEPLAY TIPS

- To maximize score, make sure to clear each level of enemies before moving on.
- Jumping on bowser won't damage him, and he's also invulnerable to fireballs.  To hurt him, jump on koopas and knock their shells at him.  A steady supply of koopas will spawn from the sky whenever Bowser appears.
- Not only do levels get progressively harder, but Bowser becomes more powerful with each appearance.  
- Before focusing on Bowser himself, clear the room of any goombas that might cause distractions.
- Try to clear out as many bricks as possible when fighting Bowser.  Staying under bricks makes dodging fireballs more difficult.  If there are too many bricks on the left side, try moving over to the right for better positioning.
- Levels with Bowser cannot be exited until Bowser is killed.
- Powerups become less and less frequent as the game progresses.  Learn to be precise in your movements and avoid getting hit to progress further.
-  Coins become more frequent as the game progresses.
- For precision when jumping, first hit the jump key and then immediately move the mouse to any spot with the same vertical coordinate as the spot you wish to land on.
- Keep the mouse near Mario and always on the same horizontal plane.  Keep movements controlled and tight.

## CREDITS AND REFERENCES

Code and turtle models by Milo Han and Ji En Chen.
Thanks to Sirus Han, Ethan Schwab, and John Lin for bug testing.
Thanks to Eugene Lee for helping fix an early movement bug.

## KNOWN BUGS AND LIMITATIONS

- Clouds appear in front of Mario when jumping off of second layer bricks.
- Mario will sometimes get stuck on bricks when jumping at them from the side.  If this happens, you can't jump but can move off the brick horizontally as a fix.
- Mouse controls feel odd at first and the game could be improved with keyboard controls that have no input delay.
- The original project proposal was to make the game as close to the original Mario as possible.  However, as previously discussed, core game mechanics have been altered.
- Certain enemy types are missing, such as Hammer Bros.
- All levels are above ground and lack scenery.
- There is no sound or background music.  
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

bg2
false
0
Polygon -13840069 true false 46 300 46 195 31 195 30 150 105 150 106 195 91 195 91 300 46 300
Line -16777216 false 30 150 30 195
Line -16777216 false 105 150 30 150
Line -16777216 false 105 150 105 195
Line -16777216 false 45 195 45 300
Line -16777216 false 90 195 90 300
Line -16777216 false 45 300 90 300

bowserleft
false
6
Polygon -10899396 true false 126 19 110 29 104 39 104 51 107 59 132 46 138 63 126 79 139 88 169 66 162 37 151 23
Polygon -1 true false 149 4 148 17 137 21 133 27 121 27 123 20 144 5
Polygon -13840069 true true 156 69 179 72 199 79 222 102 237 125 245 156 250 183 253 222 241 221 197 205 178 181 167 138 165 107 156 111 141 95 168 69
Polygon -1 true false 197 85 196 100 185 93 195 87
Polygon -1 true false 219 105 207 106 212 116 218 105
Polygon -1 true false 232 132 218 134 224 145 231 135
Polygon -1 true false 242 171 230 177 242 187 243 172
Polygon -1 true false 205 156 191 157 202 172 206 155
Polygon -7500403 true false 198 88 205 98 197 102 197 92
Polygon -7500403 true false 207 156 214 166 206 170 206 160
Polygon -7500403 true false 231 133 238 143 230 147 230 137
Polygon -7500403 true false 231 133 238 143 226 145 230 137
Polygon -7500403 true false 245 172 253 183 241 185 244 176
Polygon -7500403 true false 218 103 225 113 213 115 217 107
Polygon -1 true false 103 31 107 44 101 48 98 47 100 42
Polygon -1 true false 110 63 108 72 103 68 109 65
Polygon -1 true false 120 58 119 66 113 63 119 60
Polygon -7500403 true false 161 139 131 159 129 171 124 176 113 176 103 173 97 158 100 150 107 141 114 139 121 139 158 105 162 134
Rectangle -1 true false 127 151 131 155
Rectangle -16777216 true false 124 149 129 154
Rectangle -1 true false 120 146 126 151
Rectangle -16777216 true false 119 143 121 147
Polygon -10899396 true false 132 74 118 81 128 94 139 94 153 98 137 76
Polygon -7500403 true false 129 136 127 144 125 156 120 161 109 161 99 158 93 143 96 135 103 126 110 124 117 124 141 102 156 109
Line -16777216 false 98 161 104 141
Line -16777216 false 121 141 106 141
Line -16777216 false 123 137 120 142
Line -16777216 false 155 108 121 140
Polygon -7500403 true false 224 222 230 238 202 241 206 255 152 255 157 244 164 238 173 234 177 224 201 210 218 220
Polygon -1 true false 157 246 162 255 149 257 154 245
Polygon -1 true false 204 229 193 241 204 240 203 231
Polygon -1 true false 182 230 183 238 169 238 173 233 180 230
Rectangle -1 true false 108 170 114 176
Rectangle -1 true false 93 137 99 143
Rectangle -1 true false 100 161 106 167
Rectangle -1 true false 94 145 100 151
Polygon -10899396 true false 153 141 131 158 135 190 151 219 183 223 201 216 180 186 162 137 151 142
Polygon -1 true false 165 67 142 87 137 94 145 98 158 107 159 119 162 148 166 166 176 192 198 213 219 220 246 226 246 220 214 211 195 202 181 184 173 159 168 131 167 115 163 101 153 93 150 90 173 69 166 69
Polygon -1 true false 120 70 119 78 114 77 119 72
Polygon -7500403 true false 104 42 96 39 91 42 91 54 97 63 104 64 113 64 121 59 125 57 129 55 130 56 130 64 121 74 110 79 117 85 130 77 141 66 134 50 133 46 112 56 109 57 105 52 105 47
Circle -16777216 true false 111 36 10

bowserright
false
5
Polygon -10899396 true true 174 19 190 29 196 39 196 51 193 59 168 46 162 63 174 79 161 88 131 66 138 37 149 23
Polygon -1 true false 151 4 152 17 163 21 167 27 179 27 177 20 156 5
Polygon -13840069 true false 144 69 121 72 101 79 78 102 63 125 55 156 50 183 47 222 59 221 103 205 122 181 133 138 135 107 144 111 159 95 132 69
Polygon -1 true false 103 85 104 100 115 93 105 87
Polygon -1 true false 81 105 93 106 88 116 82 105
Polygon -1 true false 68 132 82 134 76 145 69 135
Polygon -1 true false 58 171 70 177 58 187 57 172
Polygon -1 true false 95 156 109 157 98 172 94 155
Polygon -7500403 true false 102 88 95 98 103 102 103 92
Polygon -7500403 true false 93 156 86 166 94 170 94 160
Polygon -7500403 true false 69 133 62 143 70 147 70 137
Polygon -7500403 true false 69 133 62 143 74 145 70 137
Polygon -7500403 true false 55 172 47 183 59 185 56 176
Polygon -7500403 true false 82 103 75 113 87 115 83 107
Polygon -1 true false 197 31 193 44 199 48 202 47 200 42
Polygon -1 true false 190 63 192 72 197 68 191 65
Polygon -1 true false 180 58 181 66 187 63 181 60
Polygon -7500403 true false 139 139 169 159 171 171 176 176 187 176 197 173 203 158 200 150 193 141 186 139 179 139 142 105 138 134
Rectangle -1 true false 169 151 173 155
Rectangle -16777216 true false 171 149 176 154
Rectangle -1 true false 174 146 180 151
Rectangle -16777216 true false 179 143 181 147
Polygon -10899396 true true 168 74 182 81 172 94 161 94 147 98 163 76
Polygon -7500403 true false 171 136 173 144 175 156 180 161 191 161 201 158 207 143 204 135 197 126 190 124 183 124 159 102 144 109
Line -16777216 false 202 161 196 141
Line -16777216 false 179 141 194 141
Line -16777216 false 177 137 180 142
Line -16777216 false 145 108 179 140
Polygon -7500403 true false 76 222 70 238 98 241 94 255 148 255 143 244 136 238 127 234 123 224 99 210 82 220
Polygon -1 true false 143 246 138 255 151 257 146 245
Polygon -1 true false 96 229 107 241 96 240 97 231
Polygon -1 true false 118 230 117 238 131 238 127 233 120 230
Rectangle -1 true false 186 170 192 176
Rectangle -1 true false 201 137 207 143
Rectangle -1 true false 194 161 200 167
Rectangle -1 true false 200 145 206 151
Polygon -10899396 true true 147 141 169 158 165 190 149 219 117 223 99 216 120 186 138 137 149 142
Polygon -1 true false 135 67 158 87 163 94 155 98 142 107 141 119 138 148 134 166 124 192 102 213 81 220 54 226 54 220 86 211 105 202 119 184 127 159 132 131 133 115 137 101 147 93 150 90 127 69 134 69
Polygon -1 true false 180 70 181 78 186 77 181 72
Polygon -7500403 true false 196 42 204 39 209 42 209 54 203 63 196 64 187 64 179 59 175 57 171 55 170 56 170 64 179 74 190 79 183 85 170 77 159 66 166 50 167 46 188 56 191 57 195 52 195 47
Circle -16777216 true false 179 36 10

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

brick
false
0
Line -16777216 false 150 0 150 90
Line -16777216 false 15 90 150 90
Line -16777216 false 150 90 300 90
Line -16777216 false 75 195 75 90
Line -16777216 false 225 195 225 90
Line -16777216 false 15 195 300 195
Line -16777216 false 150 195 150 300

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cloud1
false
0
Polygon -1 true false 38 149 33 139 30 130 34 116 47 104 67 95 84 98 103 105 120 90 146 83 175 93 191 104 221 89 253 98 258 118 249 144 257 165 254 187 239 193 223 196 198 185 182 201 151 207 123 200 105 214 85 214 66 209 53 197 55 180 42 171 37 165 38 154

cloud2
false
0
Polygon -1 true false 30 165 37 139 48 129 68 126 80 123 91 100 105 79 133 72 154 74 167 98 173 109 183 104 193 117 210 127 226 127 232 140 247 146 259 153 257 168 242 182 216 190 205 188 188 187 177 196 162 197 139 184 113 189 96 194 91 194 73 191 44 186 33 178 29 165

cloud3
false
0
Polygon -1 true false 59 173 48 154 58 136 75 116 95 102 119 102 134 115 146 114 153 120 157 136 166 132 173 119 181 108 204 97 223 95 247 120 257 137 269 166 265 177 248 181 231 179 211 178 175 188 141 189 106 174

coin
false
0
Circle -1184463 true false 33 33 234
Circle -16777216 false false 54 54 192
Rectangle -1184463 true false 135 60 165 240
Rectangle -16777216 false false 124 76 174 227

coinedge
false
0
Rectangle -1184463 true false 120 15 180 285

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fireball
true
0
Polygon -2674135 true false 24 68 48 88 51 103 49 135 46 157 45 181 58 236 97 279 146 287 188 282 223 251 241 205 247 174 220 126 195 105 182 96 163 79 139 67 111 58 96 56 71 55 47 61
Circle -1184463 true false 51 96 198
Circle -1 true false 104 144 92
Polygon -1184463 true false 51 199 48 163 68 112 66 86 58 78 82 73 126 78 164 90 191 105 131 145 57 191
Polygon -1 true false 111 173 105 143 92 115 139 126 182 158 125 198

firemariodead
false
0
Polygon -7500403 true true 132 86 122 74 115 60 113 45 116 34 123 28 145 22 171 26 180 37 176 64 173 76 162 88 136 88
Line -2674135 false 147 26 147 13
Line -2674135 false -9 265 -3 272
Line -2674135 false 147 15 147 24
Polygon -2674135 true false 236 256 197 265 161 211 149 184 186 184 224 241
Polygon -2674135 true false 64 256 103 265 139 211 151 184 114 184 76 241
Polygon -6459832 true false 79 288 105 279 100 254 98 233 91 212 81 204 61 206 52 215 52 234 60 257 77 289
Polygon -6459832 true false 220 287 194 278 199 253 201 232 208 211 218 203 238 205 247 214 247 233 239 256 222 288
Polygon -1 true false 128 124 108 113 90 102 73 73 70 58 80 55 90 53 98 70 106 90 128 94 133 87 150 84 168 86 185 87 201 72 208 56 209 47 228 60 223 83 207 104 184 108 169 111 168 132 136 133
Polygon -2674135 true false 114 186 108 119 119 115 118 102 118 89 118 82 131 82 130 90 133 105 141 111 152 110 158 107 162 98 162 78 172 78 171 109 179 112 182 185 116 187
Polygon -1 true false 71 56 63 41 63 32 76 27 85 28 86 51 74 56
Polygon -1 true false 211 46 210 30 220 26 227 29 233 32 237 37 228 58 215 49
Line -16777216 false 134 69 145 62
Line -16777216 false 140 65 155 65
Line -16777216 false 155 66 162 68
Polygon -6459832 true false 132 59 135 69 138 64 145 67 151 63 158 66 162 62 165 59 133 60
Polygon -16777216 true false 166 36 170 42 169 52 163 55 161 40
Polygon -16777216 true false 134 36 130 42 131 52 137 55 139 40
Polygon -1 true false 114 32 112 41 132 32 152 30 174 35 181 40 181 30 182 21 170 15 156 10 141 11 121 14 116 18
Circle -1 true false 143 13 14
Line -2674135 false -9 265 -3 272
Line -2674135 false 146 17 146 26
Line -2674135 false 145 17 149 23
Line -2674135 false 152 17 150 22
Line -2674135 false 152 17 154 27

firemariojumpleft
false
0
Polygon -1 true false 80 10 75 31 81 38 86 36 102 39 104 39 106 34 107 25 108 18 106 17 88 10 79 11
Polygon -2674135 true false 77 56 79 45
Polygon -2674135 true false 171 206 190 219 192 222 176 234 139 216 143 190 137 173 174 172
Polygon -1 true false 168 93 182 108 204 117 214 130 217 142 216 153 214 158 197 154 198 146 193 133 172 126 164 125 156 122 152 116 150 105
Circle -1 true false 142 94 38
Polygon -1 true false 127 80 109 85 105 76 106 50 97 35 77 28 83 61 82 80 90 106 100 120 118 114 119 109 127 106 131 100 133 89
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 192 154 187 175 193 182 198 180 214 183 216 183 218 178 219 169 220 162 217 154 200 154 191 155
Polygon -2674135 true false 174 181 172 131 158 128 150 121 148 108 148 102 157 95 168 94 166 88 154 88 142 92 139 102 139 114 134 122 128 124 119 124 113 118 113 111 116 103 118 92 126 87 120 83 113 87 109 97 105 109 103 120 101 179 168 182
Polygon -1 true false 166 86 143 90 141 99 138 114 134 122 122 126 112 121 115 100 119 91 139 84 162 87
Polygon -7500403 true true 163 90 170 79 173 70 175 53 171 45 165 34 153 34 129 33 114 35 110 44 110 51 100 53 101 63 106 64 114 68 115 78 117 89
Polygon -16777216 true false 130 47 133 58 129 64 123 64 123 54
Polygon -1 true false 173 50 116 46 95 44 98 39 107 37 118 35 121 36 113 35 110 33 102 26 109 20 123 16 148 19 176 33 182 46
Circle -1 true false 121 24 19
Line -1 false 136 39 135 39
Line -2674135 false 137 39 136 27
Line -2674135 false 135 30 131 39
Line -2674135 false 127 30 130 39
Line -2674135 false 126 31 126 38
Polygon -6459832 true false 139 69 101 68 104 77 114 76 117 78 123 79 129 76 137 80 137 73
Circle -1184463 true false 134 128 14
Circle -1184463 true false 108 128 14
Polygon -2674135 true false 163 163 127 200 85 230 75 225 60 225 71 199 99 182 130 162
Polygon -6459832 true false 192 217 215 234 205 250 192 266 175 276 164 267 174 256 193 219
Polygon -6459832 true false 207 231 187 214 172 227 182 241 204 235
Polygon -6459832 true false 88 229 75 240 75 255 60 255 20 220 29 201 38 204 49 220 61 214 69 221

firemariojumpright
false
0
Polygon -1 true false 220 10 225 31 219 38 214 36 198 39 196 39 194 34 193 25 192 18 194 17 212 10 221 11
Polygon -2674135 true false 223 56 221 45
Polygon -2674135 true false 129 206 110 219 108 222 124 234 161 216 157 190 163 173 126 172
Polygon -1 true false 132 93 118 108 96 117 86 130 83 142 84 153 86 158 103 154 102 146 107 133 128 126 136 125 144 122 148 116 150 105
Circle -1 true false 120 94 38
Polygon -1 true false 173 80 191 85 195 76 194 50 203 35 223 28 217 61 218 80 210 106 200 120 182 114 181 109 173 106 169 100 167 89
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 108 154 113 175 107 182 102 180 86 183 84 183 82 178 81 169 80 162 83 154 100 154 109 155
Polygon -2674135 true false 126 181 128 131 142 128 150 121 152 108 152 102 143 95 132 94 134 88 146 88 158 92 161 102 161 114 166 122 172 124 181 124 187 118 187 111 184 103 182 92 174 87 180 83 187 87 191 97 195 109 197 120 199 179 132 182
Polygon -1 true false 134 86 157 90 159 99 162 114 166 122 178 126 188 121 185 100 181 91 161 84 138 87
Polygon -7500403 true true 137 90 130 79 127 70 125 53 129 45 135 34 147 34 171 33 186 35 190 44 190 51 200 53 199 63 194 64 186 68 185 78 183 89
Polygon -16777216 true false 170 47 167 58 171 64 177 64 177 54
Polygon -1 true false 127 50 184 46 205 44 202 39 193 37 182 35 179 36 187 35 190 33 198 26 191 20 177 16 152 19 124 33 118 46
Circle -1 true false 160 24 19
Line -1 false 164 39 165 39
Line -2674135 false 163 39 164 27
Line -2674135 false 165 30 169 39
Line -2674135 false 173 30 170 39
Line -2674135 false 174 31 174 38
Polygon -6459832 true false 161 69 199 68 196 77 186 76 183 78 177 79 171 76 163 80 163 73
Circle -1184463 true false 152 128 14
Circle -1184463 true false 178 128 14
Polygon -2674135 true false 137 163 173 200 215 230 225 225 240 225 229 199 201 182 170 162
Polygon -6459832 true false 108 217 85 234 95 250 108 266 125 276 136 267 126 256 107 219
Polygon -6459832 true false 93 231 113 214 128 227 118 241 96 235
Polygon -6459832 true false 212 229 225 240 225 255 240 255 280 220 271 201 262 204 251 220 239 214 231 221

firemarioleft
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -2674135 true false 170 239 189 248 221 260 198 283 138 249 124 225 118 208 155 207
Polygon -1 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -1 true false 143 108 34
Polygon -1 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -2674135 true false 174 196 172 146 158 143 150 136 148 123 148 117 157 110 168 109 166 103 154 103 142 107 139 117 139 129 134 137 128 139 119 139 113 133 113 126 116 118 118 107 126 102 120 98 113 102 109 112 105 124 103 135 105 225 165 225
Polygon -1 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -1 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -1 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -2674135 true false 162 205 118 241 104 252 111 271 86 269 75 240 91 224 133 190
Polygon -6459832 true false 202 253 220 260 191 294 184 299 172 299 163 292 163 282 198 253
Polygon -6459832 true false 109 267 110 269 108 277 100 296 61 285 57 276 59 271 62 263 78 272 86 266
Line -16777216 false 155 209 124 236
Line -16777216 false 133 190 106 212
Line -1 false 120 60 120 45
Line -2674135 false 126 52 127 44
Line -2674135 false 128 46 131 52
Line -2674135 false 133 51 136 45
Line -2674135 false 137 46 137 55

firemarioleft2
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -1 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -1 true false 143 108 34
Polygon -1 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -2674135 true false 174 192 172 142 158 139 150 132 148 119 148 113 157 106 168 105 166 99 154 99 142 103 139 113 139 125 134 133 128 135 119 135 113 129 113 122 116 114 118 103 126 98 120 94 113 98 109 108 105 120 103 131 110 219 165 221
Polygon -1 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -1 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -1 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -2674135 true false 158 203 149 275 136 275 120 273 117 266 118 256 111 237 108 201
Polygon -6459832 true false 144 271 145 273 143 281 141 301 92 300 90 292 91 283 100 279 116 279 121 270
Line -2674135 false 125 54 127 45
Line -2674135 false 128 47 131 54
Line -2674135 false 133 53 136 47
Line -2674135 false 137 46 137 58
Polygon -2674135 true false 169 207 173 242 159 265 152 251 151 209
Line -16777216 false 152 252 152 212
Polygon -6459832 true false 155 265 163 273 164 297 179 300 183 278 188 253 171 244

firemarioleft3
false
0
Polygon -2674135 true false 77 56 79 45
Circle -1 true false 143 108 34
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 166 103 143 107 143 115 141 130 134 139 122 143 107 137 118 118 121 107 139 101 162 104
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -1 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -2674135 false 137 54 136 42
Line -2674135 false 135 45 131 54
Line -2674135 false 127 45 130 54
Line -2674135 false 126 46 120 60
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 109 129 13
Circle -1184463 true false 138 129 13
Polygon -6459832 true false 199 255 209 274 165 299 152 295 149 279 157 270 173 263 195 251
Polygon -6459832 true false 71 246 48 252 56 265 65 272 74 277 90 282 104 282 109 261 81 255
Polygon -1 true false 117 108 102 119 95 143 97 166 97 179 100 200 127 197 120 139 125 108 117 109
Polygon -2674135 true false 175 197 173 147 159 144 151 137 149 124 149 118 158 111 169 110 167 104 155 104 143 108 140 118 140 130 135 138 129 140 120 140 114 134 114 127 117 119 119 108 127 103 121 99 114 103 110 113 106 125 104 136 104 196 169 198
Polygon -1 true false 178 144 180 158 180 169 173 182 151 188 127 180 98 167 100 143 127 153 145 165 151 167 153 163 155 147 153 131 176 127
Polygon -2674135 true false 152 203 130 208 124 220 105 226 103 243 109 266 93 269 81 262 77 239 76 214 94 201 105 189 115 183 148 184
Polygon -1 true false 97 143 96 165 78 165 69 155 71 137 82 133 98 144
Circle -1184463 true false 134 143 8
Circle -1184463 true false 112 142 10
Polygon -2674135 true false 138 196 135 225 155 251 173 266 192 253 182 238 172 227 174 193 143 196
Line -16777216 false 134 211 140 196

firemarioleft4
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -1 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -1 true false 140 105 40
Polygon -1 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -2674135 true false 174 192 172 142 158 139 150 132 148 119 148 113 157 106 168 105 166 99 154 99 142 103 139 113 139 125 134 133 128 135 119 135 113 129 113 122 116 114 118 103 126 98 120 94 113 98 109 108 105 120 103 131 110 219 165 221
Polygon -1 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -1 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -1 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -2674135 true false 158 203 149 275 136 275 120 273 117 266 118 256 111 237 108 201
Polygon -6459832 true false 144 271 145 273 143 281 141 301 92 300 90 292 91 283 100 279 116 279 121 270
Line -2674135 false 125 54 127 45
Line -2674135 false 128 47 131 54
Line -2674135 false 133 53 136 47
Line -2674135 false 137 46 137 58
Polygon -6459832 true false 169 245 191 254 187 298 171 296 162 284 164 271 154 266
Polygon -2674135 true false 162 212 174 245 157 266 147 250 144 214
Line -16777216 false 152 255 129 224
Line -16777216 false 130 225 136 202

firemarioright
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -2674135 true false 130 239 111 248 79 260 102 283 162 249 176 225 182 208 145 207
Polygon -1 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -1 true false 123 108 34
Polygon -1 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -2674135 true false 126 196 128 146 142 143 150 136 152 123 152 117 143 110 132 109 134 103 146 103 158 107 161 117 161 129 166 137 172 139 181 139 187 133 187 126 184 118 182 107 174 102 180 98 187 102 191 112 195 124 197 135 195 225 135 225
Polygon -1 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -1 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -1 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -2674135 true false 138 205 182 241 196 252 189 271 214 269 225 240 209 224 167 190
Polygon -6459832 true false 98 253 80 260 109 294 116 299 128 299 137 292 137 282 102 253
Polygon -6459832 true false 191 267 190 269 192 277 200 296 239 285 243 276 241 271 238 263 222 272 214 266
Line -16777216 false 145 209 176 236
Line -16777216 false 167 190 194 212
Line -1 false 180 60 180 45
Line -2674135 false 174 52 173 44
Line -2674135 false 172 46 169 52
Line -2674135 false 167 51 164 45
Line -2674135 false 163 46 163 55

firemarioright2
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -1 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -1 true false 123 108 34
Polygon -1 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -2674135 true false 126 192 128 142 142 139 150 132 152 119 152 113 143 106 132 105 134 99 146 99 158 103 161 113 161 125 166 133 172 135 181 135 187 129 187 122 184 114 182 103 174 98 180 94 187 98 191 108 195 120 197 131 190 219 135 221
Polygon -1 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -1 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -1 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -2674135 true false 142 203 151 275 164 275 180 273 183 266 182 256 189 237 192 201
Polygon -6459832 true false 156 271 155 273 157 281 159 301 208 300 210 292 209 283 200 279 184 279 179 270
Line -2674135 false 175 54 173 45
Line -2674135 false 172 47 169 54
Line -2674135 false 167 53 164 47
Line -2674135 false 163 46 163 58
Polygon -2674135 true false 131 207 127 242 141 265 148 251 149 209
Line -16777216 false 148 252 148 212
Polygon -6459832 true false 145 265 137 273 136 297 121 300 117 278 112 253 129 244

firemarioright3
false
0
Polygon -2674135 true false 223 56 221 45
Circle -1 true false 123 108 34
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 134 103 157 107 157 115 159 130 166 139 178 143 193 137 182 118 179 107 161 101 138 104
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -1 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -2674135 false 163 54 164 42
Line -2674135 false 165 45 169 54
Line -2674135 false 173 45 170 54
Line -2674135 false 174 46 180 60
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 178 129 13
Circle -1184463 true false 149 129 13
Polygon -6459832 true false 101 255 91 274 135 299 148 295 151 279 143 270 127 263 105 251
Polygon -6459832 true false 229 246 252 252 244 265 235 272 226 277 210 282 196 282 191 261 219 255
Polygon -1 true false 183 108 198 119 205 143 203 166 203 179 200 200 173 197 180 139 175 108 183 109
Polygon -2674135 true false 125 197 127 147 141 144 149 137 151 124 151 118 142 111 131 110 133 104 145 104 157 108 160 118 160 130 165 138 171 140 180 140 186 134 186 127 183 119 181 108 173 103 179 99 186 103 190 113 194 125 196 136 196 196 131 198
Polygon -1 true false 122 144 120 158 120 169 127 182 149 188 173 180 202 167 200 143 173 153 155 165 149 167 147 163 145 147 147 131 124 127
Polygon -2674135 true false 148 203 170 208 176 220 195 226 197 243 191 266 207 269 219 262 223 239 224 214 206 201 195 189 185 183 152 184
Polygon -1 true false 203 143 204 165 222 165 231 155 229 137 218 133 202 144
Circle -1184463 true false 158 143 8
Circle -1184463 true false 178 142 10
Polygon -2674135 true false 162 196 165 225 145 251 127 266 108 253 118 238 128 227 126 193 157 196
Line -16777216 false 166 211 160 196

firemarioright4
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -1 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -1 true false 120 105 40
Polygon -1 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -2674135 true false 126 192 128 142 142 139 150 132 152 119 152 113 143 106 132 105 134 99 146 99 158 103 161 113 161 125 166 133 172 135 181 135 187 129 187 122 184 114 182 103 174 98 180 94 187 98 191 108 195 120 197 131 190 219 135 221
Polygon -1 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -1 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -1 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -2674135 true false 142 203 151 275 164 275 180 273 183 266 182 256 189 237 192 201
Polygon -6459832 true false 156 271 155 273 157 281 159 301 208 300 210 292 209 283 200 279 184 279 179 270
Line -2674135 false 175 54 173 45
Line -2674135 false 172 47 169 54
Line -2674135 false 167 53 164 47
Line -2674135 false 163 46 163 58
Polygon -6459832 true false 131 245 109 254 113 298 129 296 138 284 136 271 146 266
Polygon -2674135 true false 138 212 126 245 143 266 153 250 156 214
Line -16777216 false 148 255 171 224
Line -16777216 false 170 225 164 202

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

goomba
false
0
Polygon -6459832 true false 74 149 69 166 71 180 77 188 84 197 94 203 160 204 190 204 214 201 228 189 225 163 209 133 197 99 182 62 163 49 143 50 115 86 104 107 85 134
Polygon -16777216 true false 136 102 128 90 124 78 119 70 110 71 100 74 97 75 97 68 111 64 128 63 133 78 139 86 143 95 144 103
Polygon -16777216 true false 169 103 177 91 181 79 186 71 195 72 205 75 208 76 208 69 194 65 177 64 172 79 166 87 162 96 161 104
Polygon -1 true false 140 104 133 98 127 92 120 104 119 117 122 129 130 138 139 135 142 129 143 114 143 108 142 108
Polygon -1 true false 160 106 168 100 173 96 179 105 181 119 178 131 170 140 161 137 158 131 157 116 157 110 158 110
Polygon -16777216 true false 141 118 140 113 135 112 134 119 136 122
Polygon -16777216 true false 158 117 159 112 164 111 165 119 162 123
Polygon -16777216 true false 88 181 135 178 179 178 209 182
Polygon -1 true false 98 178 105 159 118 179 103 178
Polygon -1 true false 204 179 197 160 184 180 199 179
Polygon -7500403 true true 123 198 119 216 117 231 124 249 140 259 167 260 185 252 190 243 191 219 185 199
Polygon -6459832 true false 122 245 101 254 89 261 85 273 90 287 106 290 122 285 135 272 146 258
Polygon -6459832 true false 192 245 213 254 225 261 229 273 224 287 208 290 192 285 179 272 168 258

ground
false
0
Line -16777216 false 195 0 194 149
Line -16777216 false 195 75 300 75
Line -16777216 false 0 177 148 222
Line -16777216 false 195 148 150 223
Line -16777216 false 150 223 149 300
Line -16777216 false 0 0 0 300
Line -16777216 false 0 -1 300 -1
Line -16777216 false 300 0 300 300
Line -16777216 false 0 300 330 300
Line -1 false -2 2 193 2
Line -1 false 1 180 150 224
Line -16777216 false 0 175 151 221
Line -1 false 194 77 296 78
Line -16777216 false 195 74 297 76
Line -1 false 194 154 152 225
Line -16777216 false 192 152 151 225
Line -1 false 195 2 301 2

hill1
false
0
Polygon -13840069 true false 149 56 183 70 205 86 219 102 239 126 262 146 283 168 300 181 150 181 150 66
Polygon -13840069 true false 153 56 119 70 97 86 83 102 63 126 40 146 19 168 2 181 152 181 152 66
Polygon -7500403 true true 167 73 173 77 173 84 170 90 164 87 164 79 167 73
Polygon -7500403 true true 177 125 183 129 183 136 180 142 174 137 174 131 177 125
Polygon -7500403 true true 114 107 120 111 120 118 117 124 111 119 111 113 114 107
Polygon -7500403 true true 107 117 102 120 104 126 107 126 107 118
Polygon -7500403 true true 164 131 159 134 161 140 164 140 164 132
Polygon -7500403 true true 160 80 155 83 157 89 160 89 160 81

hill2
false
0
Polygon -10899396 true false 62 208 249 208 252 196 247 183 237 179 230 167 223 154 218 144 216 137 205 131 197 129 187 136 183 154 182 166 176 154 170 142 162 136 157 124 141 118 129 126 120 147 113 167 108 155 106 142 90 132 79 139 72 159 57 175 50 206

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

koopa
false
0
Polygon -1184463 true false 103 86 92 78 76 82 63 103 63 121 54 117 34 125 31 141 34 162 46 180 77 190 110 183 121 166 125 151 122 140 117 124 110 111 105 87
Polygon -1 true false 64 84 74 89 78 124 59 130 47 119 46 98 61 86
Polygon -16777216 true false 53 114 57 109 64 109 64 124 55 125
Line -16777216 false 135 141 163 168
Line -16777216 false 163 169 207 169
Line -16777216 false 207 170 219 145
Line -16777216 false 209 170 248 204
Line -16777216 false 129 159 115 174
Line -16777216 false 243 203 212 235
Line -16777216 false 66 160 67 173
Line -16777216 false 68 175 62 184
Polygon -1184463 true false 121 219 109 233 101 257 86 274 79 299 111 303 132 303 149 265 157 231
Line -16777216 false 168 190 215 190
Line -16777216 false 127 158 170 189
Line -16777216 false 162 126 130 158
Polygon -1184463 true false 184 249 206 309 247 305 221 235 189 246
Polygon -1 true false 112 179 97 189 98 226 118 248 167 263 215 262 249 244 257 218 259 207 249 200 244 201 238 224 216 239 157 242 118 210 111 190
Polygon -10899396 true false 109 209 120 231 152 247 174 249 211 247 236 236 246 219 246 181 235 163 219 137 183 128 149 131 138 139 122 158 111 182 108 201
Line -16777216 false 139 139 158 174
Line -16777216 false 212 136 198 174
Line -16777216 false 159 175 198 176
Line -16777216 false 158 174 125 203
Line -16777216 false 198 174 220 204
Line -16777216 false 122 203 148 236
Line -16777216 false 219 205 200 235
Line -16777216 false 150 233 200 234
Line -16777216 false 218 204 248 218

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

mariodead
false
0
Polygon -7500403 true true 132 86 122 74 115 60 113 45 116 34 123 28 145 22 171 26 180 37 176 64 173 76 162 88 136 88
Line -2674135 false 147 26 147 13
Line -2674135 false -9 265 -3 272
Line -2674135 false 147 15 147 24
Polygon -13345367 true false 236 256 197 265 161 211 149 184 186 184 224 241
Polygon -13345367 true false 64 256 103 265 139 211 151 184 114 184 76 241
Polygon -6459832 true false 79 288 105 279 100 254 98 233 91 212 81 204 61 206 52 215 52 234 60 257 77 289
Polygon -6459832 true false 220 287 194 278 199 253 201 232 208 211 218 203 238 205 247 214 247 233 239 256 222 288
Polygon -2674135 true false 128 124 108 113 90 102 73 73 70 58 80 55 90 53 98 70 106 90 128 94 133 87 150 84 168 86 185 87 201 72 208 56 209 47 228 60 223 83 207 104 184 108 169 111 168 132 136 133
Polygon -13345367 true false 114 186 108 119 119 115 118 102 118 89 118 82 131 82 130 90 133 105 141 111 152 110 158 107 162 98 162 78 172 78 171 109 179 112 182 185 116 187
Polygon -1 true false 71 56 63 41 63 32 76 27 85 28 86 51 74 56
Polygon -1 true false 211 46 210 30 220 26 227 29 233 32 237 37 228 58 215 49
Line -16777216 false 134 69 145 62
Line -16777216 false 140 65 155 65
Line -16777216 false 155 66 162 68
Polygon -6459832 true false 132 59 135 69 138 64 145 67 151 63 158 66 162 62 165 59 133 60
Polygon -16777216 true false 166 36 170 42 169 52 163 55 161 40
Polygon -16777216 true false 134 36 130 42 131 52 137 55 139 40
Polygon -2674135 true false 114 32 112 41 132 32 152 30 174 35 181 40 181 30 182 21 170 15 156 10 141 11 121 14 116 18
Circle -1 true false 143 13 14
Line -2674135 false -9 265 -3 272
Line -2674135 false 146 17 146 26
Line -2674135 false 145 17 149 23
Line -2674135 false 150 16 150 22
Line -2674135 false 152 17 152 24

mariojumpleft
false
0
Polygon -1 true false 80 10 75 31 81 38 86 36 102 39 104 39 106 34 107 25 108 18 106 17 88 10 79 11
Polygon -2674135 true false 77 56 79 45
Polygon -13345367 true false 171 206 190 219 192 222 176 234 139 216 143 190 137 173 174 172
Polygon -2674135 true false 168 93 182 108 204 117 214 130 217 142 216 153 214 158 197 154 198 146 193 133 172 126 164 125 156 122 152 116 150 105
Circle -2674135 true false 142 94 38
Polygon -2674135 true false 127 80 109 85 105 76 106 50 97 35 77 28 83 61 82 80 90 106 100 120 118 114 119 109 127 106 131 100 133 89
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 192 154 187 175 193 182 198 180 214 183 216 183 218 178 219 169 220 162 217 154 200 154 191 155
Polygon -13345367 true false 174 181 172 131 158 128 150 121 148 108 148 102 157 95 168 94 166 88 154 88 142 92 139 102 139 114 134 122 128 124 119 124 113 118 113 111 116 103 118 92 126 87 120 83 113 87 109 97 105 109 103 120 101 179 168 182
Polygon -2674135 true false 166 86 143 90 141 99 138 114 134 122 122 126 112 121 115 100 119 91 139 84 162 87
Polygon -7500403 true true 163 90 170 79 173 70 175 53 171 45 165 34 153 34 129 33 114 35 110 44 110 51 100 53 101 63 106 64 114 68 115 78 117 89
Polygon -16777216 true false 130 47 133 58 129 64 123 64 123 54
Polygon -2674135 true false 173 50 116 46 95 44 98 39 107 37 118 35 121 36 113 35 110 33 102 26 109 20 123 16 148 19 176 33 182 46
Circle -1 true false 121 24 19
Line -1 false 136 39 135 39
Line -2674135 false 137 39 136 27
Line -2674135 false 135 30 131 39
Line -2674135 false 127 30 130 39
Line -2674135 false 126 31 126 38
Polygon -6459832 true false 139 69 101 68 104 77 114 76 117 78 123 79 129 76 137 80 137 73
Circle -1184463 true false 134 128 14
Circle -1184463 true false 108 128 14
Polygon -13345367 true false 163 163 127 200 85 230 75 225 60 225 71 199 99 182 130 162
Polygon -6459832 true false 192 217 215 234 205 250 192 266 175 276 164 267 174 256 193 219
Polygon -6459832 true false 207 231 187 214 172 227 182 241 204 235
Polygon -6459832 true false 88 229 71 239 58 243 45 251 20 220 29 201 38 204 49 220 61 214 69 221

mariojumpright
false
0
Polygon -1 true false 220 10 225 31 219 38 214 36 198 39 196 39 194 34 193 25 192 18 194 17 212 10 221 11
Polygon -2674135 true false 223 56 221 45
Polygon -13345367 true false 129 206 110 219 108 222 124 234 161 216 157 190 163 173 126 172
Polygon -2674135 true false 132 93 118 108 96 117 86 130 83 142 84 153 86 158 103 154 102 146 107 133 128 126 136 125 144 122 148 116 150 105
Circle -2674135 true false 120 94 38
Polygon -2674135 true false 173 80 191 85 195 76 194 50 203 35 223 28 217 61 218 80 210 106 200 120 182 114 181 109 173 106 169 100 167 89
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 108 154 113 175 107 182 102 180 86 183 84 183 82 178 81 169 80 162 83 154 100 154 109 155
Polygon -13345367 true false 126 181 128 131 142 128 150 121 152 108 152 102 143 95 132 94 134 88 146 88 158 92 161 102 161 114 166 122 172 124 181 124 187 118 187 111 184 103 182 92 174 87 180 83 187 87 191 97 195 109 197 120 199 179 132 182
Polygon -2674135 true false 134 86 157 90 159 99 162 114 166 122 178 126 188 121 185 100 181 91 161 84 138 87
Polygon -7500403 true true 137 90 130 79 127 70 125 53 129 45 135 34 147 34 171 33 186 35 190 44 190 51 200 53 199 63 194 64 186 68 185 78 183 89
Polygon -16777216 true false 170 47 167 58 171 64 177 64 177 54
Polygon -2674135 true false 127 50 184 46 205 44 202 39 193 37 182 35 179 36 187 35 190 33 198 26 191 20 177 16 152 19 124 33 118 46
Circle -1 true false 160 24 19
Line -1 false 164 39 165 39
Line -2674135 false 163 39 164 27
Line -2674135 false 165 30 169 39
Line -2674135 false 173 30 170 39
Line -2674135 false 174 31 174 38
Polygon -6459832 true false 161 69 199 68 196 77 186 76 183 78 177 79 171 76 163 80 163 73
Circle -1184463 true false 152 128 14
Circle -1184463 true false 178 128 14
Polygon -13345367 true false 137 163 173 200 215 230 225 225 240 225 229 199 201 182 170 162
Polygon -6459832 true false 108 217 85 234 95 250 108 266 125 276 136 267 126 256 107 219
Polygon -6459832 true false 93 231 113 214 128 227 118 241 96 235
Polygon -6459832 true false 212 229 229 239 242 243 255 251 280 220 271 201 262 204 251 220 239 214 231 221

marioleft
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -13345367 true false 170 239 189 248 221 260 198 283 138 249 124 225 118 208 155 207
Polygon -2674135 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -2674135 true false 143 108 34
Polygon -2674135 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -13345367 true false 174 196 172 146 158 143 150 136 148 123 148 117 157 110 168 109 166 103 154 103 142 107 139 117 139 129 134 137 128 139 119 139 113 133 113 126 116 118 118 107 126 102 120 98 113 102 109 112 105 124 103 135 105 225 165 225
Polygon -2674135 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -2674135 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -2674135 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -13345367 true false 162 205 118 241 104 252 111 271 86 269 75 240 91 224 133 190
Polygon -6459832 true false 202 253 220 260 191 294 184 299 172 299 163 292 163 282 198 253
Polygon -6459832 true false 109 267 110 269 108 277 100 296 61 285 57 276 59 271 62 263 78 272 86 266
Line -16777216 false 155 209 124 236
Line -16777216 false 133 190 106 212
Line -2674135 false 120 60 120 45
Line -2674135 false 126 52 127 44
Line -2674135 false 128 46 131 52
Line -2674135 false 133 51 136 45
Line -2674135 false 137 46 137 55

marioleft2
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -2674135 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -2674135 true false 143 108 34
Polygon -2674135 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -13345367 true false 174 192 172 142 158 139 150 132 148 119 148 113 157 106 168 105 166 99 154 99 142 103 139 113 139 125 134 133 128 135 119 135 113 129 113 122 116 114 118 103 126 98 120 94 113 98 109 108 105 120 103 131 110 219 165 221
Polygon -2674135 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -2674135 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -2674135 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -13345367 true false 158 203 149 275 136 275 120 273 117 266 118 256 111 237 108 201
Polygon -6459832 true false 144 271 145 273 143 281 141 301 92 300 90 292 91 283 100 279 116 279 121 270
Line -2674135 false 125 54 127 45
Line -2674135 false 128 47 131 54
Line -2674135 false 133 53 136 47
Line -2674135 false 137 46 137 58
Polygon -13345367 true false 169 207 173 242 159 265 152 251 151 209
Line -16777216 false 152 252 152 212
Polygon -6459832 true false 155 265 163 273 164 297 179 300 183 278 188 253 171 244

marioleft3
false
0
Polygon -2674135 true false 77 56 79 45
Circle -2674135 true false 143 108 34
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -2674135 true false 166 103 143 107 143 115 141 130 134 139 122 143 107 137 118 118 121 107 139 101 162 104
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -2674135 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -2674135 false 137 54 136 42
Line -2674135 false 135 45 131 54
Line -2674135 false 127 45 130 54
Line -2674135 false 126 46 120 60
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 109 129 13
Circle -1184463 true false 138 129 13
Polygon -6459832 true false 199 255 209 274 165 299 152 295 149 279 157 270 173 263 195 251
Polygon -6459832 true false 71 246 48 252 56 265 65 272 74 277 90 282 104 282 109 261 81 255
Polygon -2674135 true false 117 108 102 119 95 143 97 166 97 179 100 200 127 197 120 139 125 108 117 109
Polygon -13345367 true false 175 197 173 147 159 144 151 137 149 124 149 118 158 111 169 110 167 104 155 104 143 108 140 118 140 130 135 138 129 140 120 140 114 134 114 127 117 119 119 108 127 103 121 99 114 103 110 113 106 125 104 136 104 196 169 198
Polygon -2674135 true false 178 144 180 158 180 169 173 182 151 188 127 180 98 167 100 143 127 153 145 165 151 167 153 163 155 147 153 131 176 127
Polygon -13345367 true false 152 203 130 208 124 220 105 226 103 243 109 266 93 269 81 262 77 239 76 214 94 201 105 189 115 183 148 184
Polygon -1 true false 97 143 96 165 78 165 69 155 71 137 82 133 98 144
Circle -1184463 true false 134 143 8
Circle -1184463 true false 112 142 10
Polygon -13345367 true false 138 196 135 225 155 251 173 266 192 253 182 238 172 227 174 193 143 196
Line -16777216 false 134 211 140 196

marioleft4
false
0
Polygon -1 true false 30 105 30 120 30 135 45 135 50 135 52 135 54 130 55 121 56 114 54 113 45 105 27 107
Polygon -2674135 true false 77 56 79 45
Polygon -2674135 true false 171 114 185 129 195 144 197 158 200 175 206 196 191 198 182 199 178 187 176 166 168 151 167 146 159 143 155 137 153 126
Circle -2674135 true false 143 108 34
Polygon -2674135 true false 127 124 109 129 94 141 75 135 60 120 56 115 47 136 60 150 90 169 100 164 118 158 119 153 127 150 131 144 133 133
Circle -1184463 true false 132 141 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 183 196 178 217 184 224 189 222 205 225 207 225 209 220 210 211 211 204 208 196 191 196 182 197
Polygon -13345367 true false 174 192 172 142 158 139 150 132 148 119 148 113 157 106 168 105 166 99 154 99 142 103 139 113 139 125 134 133 128 135 119 135 113 129 113 122 116 114 118 103 126 98 120 94 113 98 109 108 105 120 103 131 110 219 165 221
Polygon -2674135 true false 166 101 143 105 141 114 138 129 134 137 122 141 112 136 115 115 119 106 139 99 162 102
Polygon -7500403 true true 163 105 170 94 173 85 175 68 171 60 165 49 153 49 129 48 114 50 110 59 110 66 100 68 101 78 106 79 114 83 115 93 117 104
Polygon -16777216 true false 130 62 133 73 129 79 123 79 123 69
Polygon -2674135 true false 173 65 116 61 95 59 98 54 107 52 118 50 121 51 113 50 110 48 102 41 109 35 123 31 148 34 176 48 182 61
Circle -1 true false 121 39 19
Line -1 false 136 39 135 39
Line -2674135 false 120 45 126 38
Polygon -6459832 true false 139 84 101 83 104 92 114 91 117 93 123 94 129 91 137 95 137 88
Circle -1184463 true false 134 143 14
Circle -1184463 true false 108 143 14
Polygon -13345367 true false 158 203 149 275 136 275 120 273 117 266 118 256 111 237 108 201
Polygon -6459832 true false 144 271 145 273 143 281 141 301 92 300 90 292 91 283 100 279 116 279 121 270
Line -2674135 false 125 54 127 45
Line -2674135 false 128 47 131 54
Line -2674135 false 133 53 136 47
Line -2674135 false 137 46 137 58
Polygon -6459832 true false 169 245 191 254 187 298 171 296 162 284 164 271 154 266
Polygon -13345367 true false 162 212 174 245 157 266 147 250 144 214
Line -16777216 false 152 255 129 224
Line -16777216 false 130 225 136 202

marioright
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -13345367 true false 130 239 111 248 79 260 102 283 162 249 176 225 182 208 145 207
Polygon -2674135 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -2674135 true false 123 108 34
Polygon -2674135 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -13345367 true false 126 196 128 146 142 143 150 136 152 123 152 117 143 110 132 109 134 103 146 103 158 107 161 117 161 129 166 137 172 139 181 139 187 133 187 126 184 118 182 107 174 102 180 98 187 102 191 112 195 124 197 135 195 225 135 225
Polygon -2674135 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -2674135 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -2674135 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -13345367 true false 138 205 182 241 196 252 189 271 214 269 225 240 209 224 167 190
Polygon -6459832 true false 98 253 80 260 109 294 116 299 128 299 137 292 137 282 102 253
Polygon -6459832 true false 191 267 190 269 192 277 200 296 239 285 243 276 241 271 238 263 222 272 214 266
Line -16777216 false 145 209 176 236
Line -16777216 false 167 190 194 212
Line -2674135 false 180 60 180 45
Line -2674135 false 174 52 173 44
Line -2674135 false 172 46 169 52
Line -2674135 false 167 51 164 45
Line -2674135 false 163 46 163 55

marioright2
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -2674135 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -2674135 true false 123 108 34
Polygon -2674135 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -13345367 true false 126 192 128 142 142 139 150 132 152 119 152 113 143 106 132 105 134 99 146 99 158 103 161 113 161 125 166 133 172 135 181 135 187 129 187 122 184 114 182 103 174 98 180 94 187 98 191 108 195 120 197 131 190 219 135 221
Polygon -2674135 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -2674135 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -2674135 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -13345367 true false 142 203 151 275 164 275 180 273 183 266 182 256 189 237 192 201
Polygon -6459832 true false 156 271 155 273 157 281 159 301 208 300 210 292 209 283 200 279 184 279 179 270
Line -2674135 false 175 54 173 45
Line -2674135 false 172 47 169 54
Line -2674135 false 167 53 164 47
Line -2674135 false 163 46 163 58
Polygon -13345367 true false 131 207 127 242 141 265 148 251 149 209
Line -16777216 false 148 252 148 212
Polygon -6459832 true false 145 265 137 273 136 297 121 300 117 278 112 253 129 244

marioright3
false
0
Polygon -2674135 true false 223 56 221 45
Circle -2674135 true false 123 108 34
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -2674135 true false 134 103 157 107 157 115 159 130 166 139 178 143 193 137 182 118 179 107 161 101 138 104
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -2674135 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -2674135 false 163 54 164 42
Line -2674135 false 165 45 169 54
Line -2674135 false 173 45 170 54
Line -2674135 false 174 46 180 60
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 178 129 13
Circle -1184463 true false 149 129 13
Polygon -6459832 true false 101 255 91 274 135 299 148 295 151 279 143 270 127 263 105 251
Polygon -6459832 true false 229 246 252 252 244 265 235 272 226 277 210 282 196 282 191 261 219 255
Polygon -2674135 true false 183 108 198 119 205 143 203 166 203 179 200 200 173 197 180 139 175 108 183 109
Polygon -13345367 true false 125 197 127 147 141 144 149 137 151 124 151 118 142 111 131 110 133 104 145 104 157 108 160 118 160 130 165 138 171 140 180 140 186 134 186 127 183 119 181 108 173 103 179 99 186 103 190 113 194 125 196 136 196 196 131 198
Polygon -2674135 true false 122 144 120 158 120 169 127 182 149 188 173 180 202 167 200 143 173 153 155 165 149 167 147 163 145 147 147 131 124 127
Polygon -13345367 true false 148 203 170 208 176 220 195 226 197 243 191 266 207 269 219 262 223 239 224 214 206 201 195 189 185 183 152 184
Polygon -1 true false 203 143 204 165 222 165 231 155 229 137 218 133 202 144
Circle -1184463 true false 158 143 8
Circle -1184463 true false 178 142 10
Polygon -13345367 true false 162 196 165 225 145 251 127 266 108 253 118 238 128 227 126 193 157 196
Line -16777216 false 166 211 160 196

marioright4
false
0
Polygon -1 true false 270 105 270 120 270 135 255 135 250 135 248 135 246 130 245 121 244 114 246 113 255 105 273 107
Polygon -2674135 true false 223 56 221 45
Polygon -2674135 true false 129 114 115 129 105 144 103 158 100 175 94 196 109 198 118 199 122 187 124 166 132 151 133 146 141 143 145 137 147 126
Circle -2674135 true false 123 108 34
Polygon -2674135 true false 173 124 191 129 206 141 225 135 240 120 244 115 253 136 240 150 210 169 200 164 182 158 181 153 173 150 169 144 167 133
Circle -1184463 true false 153 141 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 117 196 122 217 116 224 111 222 95 225 93 225 91 220 90 211 89 204 92 196 109 196 118 197
Polygon -13345367 true false 126 192 128 142 142 139 150 132 152 119 152 113 143 106 132 105 134 99 146 99 158 103 161 113 161 125 166 133 172 135 181 135 187 129 187 122 184 114 182 103 174 98 180 94 187 98 191 108 195 120 197 131 190 219 135 221
Polygon -2674135 true false 134 101 157 105 159 114 162 129 166 137 178 141 188 136 185 115 181 106 161 99 138 102
Polygon -7500403 true true 137 105 130 94 127 85 125 68 129 60 135 49 147 49 171 48 186 50 190 59 190 66 200 68 199 78 194 79 186 83 185 93 183 104
Polygon -16777216 true false 170 62 167 73 171 79 177 79 177 69
Polygon -2674135 true false 127 65 184 61 205 59 202 54 193 52 182 50 179 51 187 50 190 48 198 41 191 35 177 31 152 34 124 48 118 61
Circle -1 true false 160 39 19
Line -1 false 164 39 165 39
Line -2674135 false 180 45 174 38
Polygon -6459832 true false 161 84 199 83 196 92 186 91 183 93 177 94 171 91 163 95 163 88
Circle -1184463 true false 152 143 14
Circle -1184463 true false 178 143 14
Polygon -13345367 true false 142 203 151 275 164 275 180 273 183 266 182 256 189 237 192 201
Polygon -6459832 true false 156 271 155 273 157 281 159 301 208 300 210 292 209 283 200 279 184 279 179 270
Line -2674135 false 175 54 173 45
Line -2674135 false 172 47 169 54
Line -2674135 false 167 53 164 47
Line -2674135 false 163 46 163 58
Polygon -6459832 true false 131 245 109 254 113 298 129 296 138 284 136 271 146 266
Polygon -13345367 true false 138 212 126 245 143 266 153 250 156 214
Line -16777216 false 148 255 171 224
Line -16777216 false 170 225 164 202

mushroom
false
0
Polygon -2674135 true false 33 197 31 194 19 182 16 164 14 141 16 124 23 108 43 74 57 63 74 46 94 34 115 24 132 22 150 19 181 21 204 30 227 44 246 70 262 93 276 121 273 160 271 176 261 196 254 203 250 208 240 215 225 215 232 207 230 179 200 161 169 161 137 163 111 163 81 165 65 171 65 178 65 190 62 200 66 211 56 210 52 207 46 205 40 202
Polygon -2674135 true false 35 197 46 205 50 205 56 204
Polygon -2674135 true false 175 153 239 161 235 143 183 133 149 134
Polygon -2674135 true false 183 148 227 163 173 148 50 168 66 138 158 128 211 133 220 147 234 150
Polygon -1 true false 67 166 65 201 70 220 84 251 100 269 124 274 156 272 196 272 214 266 222 252 230 238 231 211 235 174 217 162 187 160 133 161 102 159 65 165
Polygon -2674135 true false 240 203 242 188 239 161 233 157 156 159 99 159 119 146 190 148 240 157 256 188 237 206 234 192 235 167
Rectangle -2674135 true false 236 165 253 197
Rectangle -2674135 true false 230 160 249 207
Circle -1 true false 105 49 93
Polygon -2674135 true false 22 127 33 89 47 72 58 62 80 49 46 107
Polygon -1 true false 32 93 35 96 36 103 38 115 35 137 27 151 19 163 17 165 15 144 15 127 20 114 31 94
Polygon -1 true false 256 88 253 91 252 98 250 110 253 132 261 146 269 158 271 160 273 139 273 122 268 109 257 89
Polygon -16777216 true false 125 177 117 180 114 211 116 224 125 222 130 212 133 190 133 182 127 178 126 178
Polygon -16777216 true false 180 179 172 182 169 213 171 226 180 224 185 214 188 192 188 184 182 180 181 180

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

pipe
false
0
Polygon -10899396 true false 75 15 75 105 105 105 105 300 210 300 210 105 240 105 240 15 75 15
Line -16777216 false 75 105 240 105
Line -16777216 false 75 15 75 105
Line -16777216 false 240 15 240 105
Line -16777216 false 75 15 240 15

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

questionmark
false
0
Polygon -2674135 true false 73 120 106 121 106 90 193 90 196 121 196 136 175 147 158 159 148 162 136 166 136 226 166 226 166 181 188 170 204 162 222 153 220 81 208 68 196 61 106 61 91 68 76 76 70 83 72 92 72 115
Polygon -2674135 true false 135 240 135 270 165 270 165 240 136 239

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

shell
false
0
Polygon -10899396 true false 45 150 22 47
Circle -10899396 true false 47 50 202
Polygon -7500403 true true 53 159 49 177 75 152 105 155 122 163 143 164 155 171 171 173 189 188 212 178 231 173 248 180 234 209 216 230 165 253 133 253 117 247 73 223 55 193
Polygon -16777216 true false 92 156 89 182 74 190 64 183 60 167 76 152
Polygon -1 true false 42 140 70 129 95 132 122 134 147 146 174 158 245 153 253 162 248 178 205 188 172 184 141 173 118 161 92 157 67 161 46 172 41 150
Polygon -16777216 true false 129 185 130 191 140 199 158 196 160 183 126 168 127 179
Line -16777216 false 101 162 95 186
Line -16777216 false 94 189 75 199
Line -16777216 false 73 200 58 192
Line -16777216 false 138 198 122 229
Line -16777216 false 123 229 102 243
Line -16777216 false 185 190 171 225
Line -16777216 false 170 227 147 250
Line -16777216 false 219 188 210 216
Line -16777216 false 210 218 198 241

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -1184463 true false 7 111 108 95 150 7 196 97 296 114 226 183 242 283 153 237 58 287 80 188 6 113
Polygon -16777216 true false 119 118 112 116 111 146 116 151 125 151 125 120 123 117 118 115 113 118
Polygon -16777216 true false 120 120 120 150 120 120
Polygon -16777216 true false 171 114 173 147 181 153 185 149 187 119 181 112 175 115
Polygon -16777216 true false 112 118 112 113 121 112 123 114
Polygon -16777216 true false 123 114 127 115 127 122 127 128 116 125 114 117 117 117
Rectangle -16777216 true false 115 112 125 152
Rectangle -16777216 true false 174 111 187 120
Rectangle -16777216 true false 120 124 124 151
Rectangle -16777216 true false 122 130 126 153
Rectangle -16777216 true false 123 122 126 138

stillfiremarioleft
false
0
Polygon -1 true false 81 172 76 193 82 200 87 198 103 201 105 201 107 196 108 187 109 180 106 172 89 172 80 173
Polygon -2674135 true false 142 243 145 269 97 262 102 240 102 213 100 197 101 178 136 179
Polygon -2674135 true false 77 56 79 45
Polygon -6459832 true false 150 298 93 297 83 297 77 288 74 279 77 269 87 262 102 262 120 264 132 269 137 271 147 271 149 290 148 295
Polygon -6459832 true false 178 298 122 297 112 298 104 293 101 280 110 272 125 262 142 261 158 266 167 268 172 270 180 269 180 282 181 292
Line -16777216 false 119 296 112 283
Line -16777216 false 118 267 111 282
Line -16777216 false 129 263 119 267
Polygon -2674135 true false 179 243 179 271 134 260 139 241 139 214 137 198 136 180 173 180
Line -16777216 false 136 182 138 216
Line -16777216 false 138 216 136 243
Line -16777216 false 136 244 132 263
Polygon -1 true false 171 99 185 114 195 129 197 143 200 160 200 182 187 182 173 182 172 170 172 149 168 136 167 131 159 128 155 122 153 111
Circle -1 true false 143 93 34
Polygon -1 true false 122 92 104 97 91 112 84 133 81 150 81 172 94 172 108 172 109 160 109 139 113 126 114 121 122 118 126 112 128 101
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 175 180 170 201 176 208 181 206 197 209 199 209 201 204 202 195 203 188 200 180 183 180 174 181
Line -16777216 false 194 198 192 211
Line -16777216 false 186 197 184 209
Line -16777216 false 179 200 177 209
Polygon -2674135 true false 174 182 172 132 158 129 150 122 148 109 148 103 157 96 168 95 166 89 154 89 142 93 139 103 139 115 134 123 128 125 119 125 113 119 113 112 116 104 118 93 126 88 120 84 113 88 109 98 105 110 103 121 101 180 168 183
Polygon -1 true false 167 86 144 90 139 97 139 114 135 122 123 126 113 121 119 101 122 90 140 84 163 87
Polygon -7500403 true true 163 90 170 79 173 70 175 53 171 45 165 34 153 34 129 33 114 35 110 44 110 51 100 53 101 63 106 64 114 68 115 78 117 89
Polygon -16777216 true false 130 47 133 58 129 64 123 64 123 54
Polygon -1 true false 173 50 116 46 95 44 98 39 107 37 118 35 121 36 113 35 110 33 102 26 109 20 123 16 148 19 176 33 182 46
Circle -1 true false 121 24 19
Line -1 false 136 39 135 39
Line -2674135 false 137 39 136 27
Line -2674135 false 135 30 131 39
Line -2674135 false 127 30 130 39
Line -2674135 false 126 31 126 38
Polygon -6459832 true false 139 69 101 68 104 77 114 76 117 78 123 79 129 76 137 80 137 73
Circle -1184463 true false 108 127 13
Circle -1184463 true false 132 127 14
Line -16777216 false 87 189 87 198
Line -16777216 false 93 189 93 199

stillfiremarioright
false
0
Polygon -1 true false 219 172 224 193 218 200 213 198 197 201 195 201 193 196 192 187 191 180 194 172 211 172 220 173
Polygon -2674135 true false 158 243 155 269 203 262 198 240 198 213 200 197 199 178 164 179
Polygon -2674135 true false 223 56 221 45
Polygon -6459832 true false 150 298 207 297 217 297 223 288 226 279 223 269 213 262 198 262 180 264 168 269 163 271 153 271 151 290 152 295
Polygon -6459832 true false 122 298 178 297 188 298 196 293 199 280 190 272 175 262 158 261 142 266 133 268 128 270 120 269 120 282 119 292
Line -16777216 false 181 296 188 283
Line -16777216 false 182 267 189 282
Line -16777216 false 171 263 181 267
Polygon -2674135 true false 121 243 121 271 166 260 161 241 161 214 163 198 164 180 127 180
Line -16777216 false 164 182 162 216
Line -16777216 false 162 216 164 243
Line -16777216 false 164 244 168 263
Polygon -1 true false 129 99 115 114 105 129 103 143 100 160 100 182 113 182 127 182 128 170 128 149 132 136 133 131 141 128 145 122 147 111
Circle -1 true false 123 93 34
Polygon -1 true false 180 92 198 97 211 112 218 133 221 150 221 172 208 172 194 172 193 160 193 139 189 126 188 121 180 118 176 112 174 101
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 125 181 130 202 124 209 119 207 103 210 101 210 99 205 98 196 97 189 100 181 117 181 126 182
Line -16777216 false 105 198 108 211
Line -16777216 false 112 198 115 209
Line -16777216 false 120 195 123 209
Polygon -2674135 true false 126 182 128 132 142 129 150 122 152 109 152 103 143 96 132 95 134 89 146 89 158 93 161 103 161 115 166 123 172 125 181 125 187 119 187 112 184 104 182 93 174 88 180 84 187 88 191 98 195 110 197 121 199 180 132 183
Polygon -1 true false 134 86 157 90 162 97 162 114 166 122 178 126 188 121 182 101 179 90 161 84 138 87
Polygon -7500403 true true 137 90 130 79 127 70 125 53 129 45 135 34 147 34 171 33 186 35 190 44 190 51 200 53 199 63 194 64 186 68 185 78 183 89
Polygon -16777216 true false 170 47 167 58 171 64 177 64 177 54
Polygon -1 true false 127 50 184 46 205 44 202 39 193 37 182 35 179 36 187 35 190 33 198 26 191 20 177 16 152 19 124 33 118 46
Circle -1 true false 160 24 19
Line -1 false 164 39 165 39
Line -2674135 false 163 39 164 27
Line -2674135 false 165 30 169 39
Line -2674135 false 173 30 170 39
Line -2674135 false 174 31 174 38
Polygon -6459832 true false 161 69 199 68 196 77 186 76 183 78 177 79 171 76 163 80 163 73
Circle -1184463 true false 179 127 13
Circle -1184463 true false 154 127 14
Line -16777216 false 213 187 213 198
Line -16777216 false 207 189 207 199

stillmarioleft
false
0
Polygon -1 true false 81 172 76 193 82 200 87 198 103 201 105 201 107 196 108 187 109 180 106 172 89 172 80 173
Polygon -13345367 true false 142 243 145 269 97 262 102 240 102 213 100 197 101 178 136 179
Polygon -2674135 true false 77 56 79 45
Polygon -6459832 true false 150 298 93 297 83 297 77 288 74 279 77 269 87 262 102 262 120 264 132 269 137 271 147 271 149 290 148 295
Polygon -6459832 true false 178 298 122 297 112 298 104 293 101 280 110 272 125 262 142 261 158 266 167 268 172 270 180 269 180 282 181 292
Line -16777216 false 119 296 112 283
Line -16777216 false 118 267 111 282
Line -16777216 false 129 263 119 267
Polygon -13345367 true false 179 243 179 271 134 260 139 241 139 214 137 198 136 180 173 180
Line -16777216 false 136 182 138 216
Line -16777216 false 138 216 136 243
Line -16777216 false 136 244 132 263
Polygon -2674135 true false 171 99 185 114 195 129 197 143 200 160 200 182 187 182 173 182 172 170 172 149 168 136 167 131 159 128 155 122 153 111
Circle -2674135 true false 143 93 34
Polygon -2674135 true false 120 92 102 97 89 112 82 133 79 150 79 172 92 172 106 172 107 160 107 139 111 126 112 121 120 118 124 112 126 101
Circle -1184463 true false 132 126 15
Circle -1184463 true false 108 129 14
Polygon -1 true false 175 181 170 202 176 209 181 207 197 210 199 210 201 205 202 196 203 189 200 181 183 181 174 182
Line -16777216 false 195 195 192 211
Line -16777216 false 188 194 184 209
Line -16777216 false 180 195 177 209
Polygon -13345367 true false 174 182 172 132 158 129 150 122 148 109 148 103 157 96 168 95 166 89 154 89 142 93 139 103 139 115 134 123 128 125 119 125 113 119 113 112 116 104 118 93 126 88 120 84 113 88 109 98 105 110 103 121 101 180 168 183
Polygon -2674135 true false 166 86 143 90 138 97 138 114 134 122 122 126 112 121 118 101 121 90 139 84 162 87
Polygon -7500403 true true 163 90 170 79 173 70 175 53 171 45 165 34 153 34 129 33 114 35 110 44 110 51 100 53 101 63 106 64 114 68 115 78 117 89
Polygon -16777216 true false 130 47 133 58 129 64 123 64 123 54
Polygon -2674135 true false 173 50 116 46 95 44 98 39 107 37 118 35 121 36 113 35 110 33 102 26 109 20 123 16 148 19 176 33 182 46
Circle -1 true false 121 24 19
Line -1 false 136 39 135 39
Line -2674135 false 137 39 136 27
Line -2674135 false 135 30 131 39
Line -2674135 false 127 30 130 39
Line -2674135 false 126 31 126 38
Polygon -6459832 true false 139 69 101 68 104 77 114 76 117 78 123 79 129 76 137 80 137 73
Circle -1184463 true false 109 129 13
Circle -1184463 true false 138 129 13
Line -16777216 false 85 183 83 196
Line -16777216 false 93 185 93 199

stillmarioright
false
0
Polygon -1 true false 219 172 224 193 218 200 213 198 197 201 195 201 193 196 192 187 191 180 194 172 211 172 220 173
Polygon -13345367 true false 158 243 155 269 203 262 198 240 198 213 200 197 199 178 164 179
Polygon -2674135 true false 223 56 221 45
Polygon -6459832 true false 150 298 207 297 217 297 223 288 226 279 223 269 213 262 198 262 180 264 168 269 163 271 153 271 151 290 152 295
Polygon -6459832 true false 122 298 178 297 188 298 196 293 199 280 190 272 175 262 158 261 142 266 133 268 128 270 120 269 120 282 119 292
Line -16777216 false 181 296 188 283
Line -16777216 false 182 267 189 282
Line -16777216 false 171 263 181 267
Polygon -13345367 true false 121 243 121 271 166 260 161 241 161 214 163 198 164 180 127 180
Line -16777216 false 164 182 162 216
Line -16777216 false 162 216 164 243
Line -16777216 false 164 244 168 263
Polygon -2674135 true false 129 99 115 114 105 129 103 143 100 160 100 182 113 182 127 182 128 170 128 149 132 136 133 131 141 128 145 122 147 111
Circle -2674135 true false 123 93 34
Polygon -2674135 true false 180 92 198 97 211 112 218 133 221 150 221 172 208 172 194 172 193 160 193 139 189 126 188 121 180 118 176 112 174 101
Circle -1184463 true false 153 126 15
Circle -1184463 true false 178 129 14
Polygon -1 true false 125 181 130 202 124 209 119 207 103 210 101 210 99 205 98 196 97 189 100 181 117 181 126 182
Line -16777216 false 105 195 108 211
Line -16777216 false 112 194 116 209
Line -16777216 false 120 195 123 209
Polygon -13345367 true false 126 182 128 132 142 129 150 122 152 109 152 103 143 96 132 95 134 89 146 89 158 93 161 103 161 115 166 123 172 125 181 125 187 119 187 112 184 104 182 93 174 88 180 84 187 88 191 98 195 110 197 121 199 180 132 183
Polygon -2674135 true false 134 86 157 90 162 97 162 114 166 122 178 126 188 121 182 101 179 90 161 84 138 87
Polygon -7500403 true true 137 90 130 79 127 70 125 53 129 45 135 34 147 34 171 33 186 35 190 44 190 51 200 53 199 63 194 64 186 68 185 78 183 89
Polygon -16777216 true false 170 47 167 58 171 64 177 64 177 54
Polygon -2674135 true false 127 50 184 46 205 44 202 39 193 37 182 35 179 36 187 35 190 33 198 26 191 20 177 16 152 19 124 33 118 46
Circle -1 true false 160 24 19
Line -1 false 164 39 165 39
Line -2674135 false 163 39 164 27
Line -2674135 false 165 30 169 39
Line -2674135 false 173 30 170 39
Line -2674135 false 174 31 174 38
Polygon -6459832 true false 161 69 199 68 196 77 186 76 183 78 177 79 171 76 163 80 163 73
Circle -1184463 true false 152 128 14
Circle -1184463 true false 178 128 14

sunflower
false
0
Polygon -14835848 true false 154 152 132 149 129 247 107 218 80 206 48 210 72 241 93 253 117 271 151 272 153 224
Polygon -14835848 true false 148 152 170 149 173 247 195 218 222 206 254 210 230 241 209 253 185 271 151 272 149 224
Circle -955883 true false 68 5 160
Circle -1184463 true false 87 24 122
Circle -1 true false 112 48 72
Polygon -16777216 true false 161 76 161 75 162 74 162 86 157 87 157 76 158 73
Polygon -16777216 true false 134 76 134 75 133 74 133 86 138 87 138 76 137 73

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
