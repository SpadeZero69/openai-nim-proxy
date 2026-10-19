;===========================================================================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

[Command]
name = "fwd"
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down"
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back"
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up"
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup"
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

[Command]
name = "super_jump"
command = ~D, U
time = 5

[command]
name = "ultimate"
command = ~D,DF,F,D,DF,F,a+b
time = 30

[command]
name = "special_1"
command = ~D,DF,F,a
time = 20

[command]
name = "special_2"
command = ~D,DB,B,a
time = 20

[command]
name = "special_3"
command = ~D,DF,F,b
time = 20

[command]
name = "special_4"
command = ~D,DB,B,b
time = 20

[command]
name = "special_5"
command = ~D,DF,F,c
time = 20

[command]
name = "special_6"
command = ~D,DB,B,c
time = 20

;===========================================================================

[Statedef -1]

[State -1,ai Super Saiyan]
type = ChangeState
value = 800
triggerall = var(8) = 0 && roundstate = 2 &&roundno >2
triggerall = ailevel
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = (random%100) < 50
[State -1]
type = AngleDraw
trigger1 = Vel X != 0 && movetype = H && time > 5 && statetype = A
value = -(atan(Vel Y/Vel X) * (const(size.air.back)*1.5)/PI)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
triggerall = stateno != 100 && stateno != 105 && statetype != A && statetype != C && movetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
value = 100
trigger1 = !AIlevel && command = "FF"
trigger2 = (AIlevel) && ((p2bodydist X > 60) && ((P2movetype = I || P2statetype = L || ((p2bodydist X > 160) && (p2bodydist Y < 30)))) || (P2movetype = H && prevstateno != 100)) && random%20=0

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
triggerall = stateno != 100 && stateno != 105 && statetype != A && statetype != C && movetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
value = 105
trigger1 = !(AIlevel) && (command = "BB")
trigger2 = (AIlevel) && (P2movetype = A) && (p2bodydist X <= 60) && prevstateno != 100 && prevstateno != 105 && random%20=0

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 500
triggerall = power < powermax &&  statetype = S  && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !(AIlevel) && command = "s"
trigger2 = (AIlevel) && p2bodydist X > 80 && P2statetype = L && random < (AIlevel * 100)/3

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 45
triggerall = statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "super_jump"
trigger2 = AIlevel && p2bodydist Y > 50

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 110
triggerall = statetype = A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "FF"
trigger2 = (AIlevel) && ((p2bodydist X > 160) && (p2bodydist Y < 30) && random%20=0)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 115
triggerall = statetype = A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "BB"
trigger2 = (AIlevel) && (P2movetype = A) && (p2bodydist X <= 60) && random%20=0

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 3000
triggerall = teammode = single && power >= 2500 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "ultimate"
trigger2 = AIlevel && ((p2bodydist X <= 40 || var(55))) && P2statetype != A && random < (AIlevel * 100)*3

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1600
triggerall = power >= 500 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_1"
trigger2 = AIlevel && ((p2bodydist X <= 30 || var(55))) && ((p2bodydist Y < 20 || var(55))) && P2statetype != L && random < (AIlevel * 100)/2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1700
triggerall = power >= 1000 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_2"
trigger2 = AIlevel && ((p2bodydist X <= 30 || var(55))) && ((p2bodydist Y < 20 || var(55))) && P2statetype != L && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1800
triggerall = power >= 1000 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_3"
trigger2 = AIlevel && ((p2bodydist X <= 40 || var(55))) && ((p2bodydist Y < 20 || var(55))) && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1500
triggerall = power >= 1000 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_4"
trigger2 = AIlevel && ((p2bodydist X <= 40 || var(55))) && ((p2bodydist Y < 20 || var(55))) && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1200
triggerall = power >= 1500 && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_5"
trigger2 = AIlevel && random < (AIlevel * 100)/4 &&NumHelper(7990) = 0

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1300
triggerall = power >= 1000 && statetype != A && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "special_6"
trigger2 = AIlevel && random < (AIlevel * 100)/2  && P2statetype != L && ((p2bodydist X < 90 || var(55)) || (p2bodydist X > 90 && (p2bodydist Y > 30)))

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 200
triggerall = statetype = S &&  statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "a" && command != "holddown"
trigger2 = AIlevel && (p2bodydist X < 50 || var(55)) && P2movetype != H && ((p2bodydist Y < 40 || var(55))) && P2statetype != L && random < (AIlevel * 100)*2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 300
triggerall = statetype = S &&  statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "b" && command != "holddown"
trigger2 = AIlevel && (p2bodydist X < 50 || var(55)) && P2movetype != H && ((p2bodydist Y < 40 || var(55))) && P2statetype != L && random < (AIlevel * 100)*2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 400
triggerall = power >= 100 && statetype = S && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "c" && command != "holddown"
trigger2 = AIlevel && p2bodydist X >= 100 && random < (AIlevel * 100)/4 && ((p2bodydist Y < 40 || var(55)))

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = cond(var(8) = 0, 800, 801)
triggerall = cond(var(8) = 0, power >= 2000,1) && statetype = S && movetype = I && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "x"

[State -1]
type = ChangeState
value = 800
triggerall = ailevel
triggerall = power >= 2500
trigger1 = statetype = S
trigger1 = Var(8) = 0
trigger1 = ctrl
trigger1 = (random%100) < 10

[State -1, forma2]
type = ChangeState
value =800
triggerall = alive && ailevel
trigger1 = life <= lifemax*0.15
trigger1 = Var(8) = 0
trigger1 = statetype = S||statetype = A 
trigger1 = ctrl

;SSJ Trans AI
[State -1]
type = ChangeState
value = 800
triggerall = alive && ailevel
triggerall = var(8) = 0
triggerall = power >= 300
trigger1 = statetype = S||statetype = A 
trigger1 = ctrl
trigger1 = life <= lifemax*0.1
trigger1 = random <= 100
trigger2 = life <= lifemax*0.1
trigger2 = movetype = H && gethitvar(hitcount)
trigger2 = random <= 15

;SSJ Trans AI
[State -1]
type = ChangeState
value = 800
triggerall = alive && ailevel
triggerall = var(8) = 0
triggerall = power >= 1500
trigger1 = statetype = S||statetype = A 
trigger1 = ctrl
trigger1 = life <= lifemax*0.1
trigger1 = random <= 100
trigger2 = life <= lifemax*0.1
trigger2 = movetype = H && gethitvar(hitcount)
trigger2 = random <= 15

[State -1, Super Saiyan 2 Desde Super Saiyan]
type = changestate
triggerall = var(8) = 0
triggerall = power >= 1500&&life <= lifemax* 0.4 &&life > lifemax* 0.15||power >= 300 &&life <= lifemax* 0.15
triggerall = RoundState = 2 &&  AILevel
triggerall = (p2statetype = S) || (p2statetype = C)|| (p2statetype = A)
trigger1 = Ctrl
trigger1 = Random < 500
value = 800

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 750
triggerall = power >= 500 && prevstateno != 750 && statetype != C && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "y"
trigger2 = (AIlevel) && p2bodydist X > 40 && p2bodydist Y > 60 && ((p2bodydist X > 80&&statetype!=A)||statetype=A) && random < (AIlevel * 100)/3

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1400
triggerall = power >= 500 && prevstateno != 1400 && statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "a" && command = "holddown" && statetype = C
trigger2 = AIlevel && (p2bodydist X <= 30 || var(55)) && ((p2bodydist Y <= 20 || var(55))) && P2statetype != L && random < (AIlevel * 100)*2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1400
triggerall = power >= 500 && statetype = A && prevstateno != 1400 && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "a" && command = "holddown"
trigger2 = AIlevel && (p2bodydist X <= 30 || var(55)) && ((p2bodydist Y <= 20 || var(55))) && P2statetype != L && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 350
triggerall = statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "b" && command = "holddown" && statetype = C
trigger2 = AIlevel && (p2bodydist X < 90 || var(55)) && P2statetype != A && random < (AIlevel * 100)/2 && P2statetype != L

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 230
triggerall = statetype = A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "a" && command != "holddown"
trigger2 = AIlevel && (p2bodydist X < 40 || var(55)) && (p2bodydist Y < 10 || var(55)) && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 240
triggerall = statetype = A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "b" && command != "holddown"
trigger2 = AIlevel && (p2bodydist X < 40 || var(55))  && (p2bodydist Y < 10 || var(55)) && random < (AIlevel * 100)

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 620
triggerall = statetype = A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = !AIlevel && command = "c" && command != "holddown"
trigger2 = AIlevel && (p2bodydist X < 40 || var(55)) && (p2bodydist Y < 10 || var(55)) && random < (AIlevel * 100)/2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 610
triggerall = power >= 250 && statetype = A && Pos Y < -50 && movetype != H && (roundstate=2) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = !AIlevel && command = "b" && command = "holddown"
trigger2 = AIlevel && p2bodydist X > 60 && (p2bodydist X < 160 || var(55)) && P2statetype != A && random < (AIlevel * 100)/2

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1100
triggerall = power >= 750 && statetype = A && movetype != H && (roundstate=2) && (prevstateno != 1100) && (alive) && (ctrl||numhelper(9999)>0)
trigger1 = command = "c" && command = "holddown"
trigger2 = AIlevel && random < (AIlevel * 100)/2 && (p2bodydist X <= 90 || var(55)) && p2movetype != A

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1000
triggerall = power >= 500 && statetype != A && movetype != H && (roundstate=2) && (alive) && ctrl
trigger1 = command = "c" && command = "holddown"
trigger2 = AIlevel && random < (AIlevel * 100)/2 && p2bodydist X >= 80 && cond(numenemy > 0, (enemynear,pos Y < -40),0)

;===========================================================================

[Statedef -2]

;==========================[Armor]============================
[State -2, HandsOff]
type = NotHitBy
triggerall=(stateno!=[120,155])
triggerall=stateno!=[5000,5150]
triggerall=movetype!=H&&var(13)<2*fvar(19)&&var(52)
trigger1 = var(52)
trigger1=time
value=  SCA,AA,NA,SA,HA,AP,NP,SP,HP,AT,NT,ST,HT
time=1
IgnoreHitPause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = ailevel
trigger1 = var(13)<2*fvar(19)&&var(52)
trigger1 = var(52)
flag = nostandguard
flag2 = noairguard
flag3 = nocrouchguard
ignorehitpause = 1


[State -2, Armor]
type = Helper
trigger1=!NumHelper(60001)
trigger1 = fvar(19)&&var(52)
trigger1=Alive
name="Armor"
ID=60001
StateNo=60001
PauseMoveTime=9999999
SuperMoveTime=9999999


[State -2, VarSet]
type=VarSet
trigger1=stateno=[5000,5150]
trigger1=!animtime
var(13)=0
[State -2, VarSet]
type=VarSet
trigger1=var(42)
trigger2=var(13)=2*fvar(19)&&var(52)
var(6)=0

[State -2, juggle]
type = AssertSpecial
triggerall = life >= 50
trigger1 = movetype = H
flag = noko
ignorehitpause = 1

[State -2, Damage]
type = LifeAdd
trigger1=var(42)&&StateNo!=[120,155]
value=-var(42)
[State -2, Armor Reset]
type = VarSet
trigger1 = 1
var(42)=0

[State 0, PowerAdd]
type = attackmulset
trigger1 = fvar(19)
value = fvar(19)

[State -2, juggle]
type = AssertSpecial
triggerall = life >= 50
trigger1 = movetype = H
flag = noko
ignorehitpause = 1

; DURABILITY (changed): damage taken is divided by 2 * fvar(19) (twice the
; scaling multiplier), and the armor helper 60001 holds 2 * fvar(19) hits
; before it breaks, so both grow twice as fast as the level.
[State 0, DefenceMulSet]
type = DefenceMulSet
trigger1 = fvar(19)
onhit = 0
multype = 1
ignorehitpause = 1
value = 2 * fvar(19)


;---------------------------------------------------------------------------
; MATCH CLOCK (changed). The scaling level var(52) goes up by 1 every second
; of fighting (it was every 10 seconds): 1 at the start, 61 at one minute,
; 121 at two minutes, with no limit. Fighting time is the time in
; RoundState 2, pauses included; it carries over between rounds.
;   var(53): GameTime + 1 at the last tick (0 = not set yet)
;   var(54): clock levels given so far
;   var(55): 1 from one minute of fighting on (ONE-MINUTE MODE below)
;   var(56): fighting time in ticks (60 ticks = 1 second)
[State -2, Match clock: fighting time]
type = VarAdd
trigger1 = !IsHelper && RoundState = 2 && var(53) > 0
v = 56
value = GameTime + 1 - var(53)
ignorehitpause = 1

[State -2, Match clock: last tick]
type = VarSet
trigger1 = !IsHelper
var(53) = GameTime + 1
ignorehitpause = 1

[State -2, Match clock: level up]
type = VarAdd
trigger1 = !IsHelper && var(56) / 60 + 1 > var(54)
v = 52
value = var(56) / 60 + 1 - var(54)
ignorehitpause = 1

[State -2, Match clock: levels given]
type = VarSet
trigger1 = !IsHelper && var(56) / 60 + 1 > var(54)
var(54) = var(56) / 60 + 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; ONE-MINUTE MODE (added). From one minute of fighting on, the attacks of
; Broly and his helpers hit anywhere on the screen and can't be avoided:
; - every HitDef has a copy that takes over from then on. Its attr has no
;   state type (S, C or A), so NotHitBy invincibility, HitOverride parries
;   and ReversalDef counters never match it; it has no guardflag, so it
;   can't be blocked; and hitflag = MAFD hits opponents standing, crouching,
;   in the air, falling or lying down.
; - at the end of every attack state the animation is swapped for a copy
;   (action number + 20000) whose attack boxes cover the whole screen.
; - the AI attacks from any distance.
; To change when it starts, change the 3600 below (60 ticks = 1 second).
[State -2, One-minute mode: on]
type = VarSet
trigger1 = !IsHelper && var(55) = 0 && var(56) >= 3600
var(55) = 1
ignorehitpause = 1

[State -2, Combo]
type = VarSet
trigger1 = NumHelper(6990) = 0
fvar(19) = var(52)
ignorehitpause = 1

[State -2, Combo]
type = VarSet
trigger1 = !var(52)&&NumHelper(6990) = 0
fvar(19) = 1
ignorehitpause = 1

[State -2, Combo]
type = VarSet
trigger1 = !var(52)&&NumHelper(6990) = 1
fvar(19) = 8
ignorehitpause = 1

[State -2, Combo]
type = VarSet
trigger1 = NumHelper(6990) = 1
fvar(19) = var(52)*8
ignorehitpause = 1

;---------------------------------------------------------------------------
; REGENERATION (added). Broly heals all the time during a round, faster the
; longer the match goes on, with no limit. It uses the scaling level var(52)
; (+1 every second of fighting, kept between rounds): per second he heals
; level x 4/1000 of his max life, so 0.4% at the start, 24.4% at one
; minute, 48.4% at two minutes, and so on.
; To change the speed, change the 4 at the start of "value" below
; (bigger = faster, 0 = no regeneration).
[State -2, Regeneration: build up]
type = VarAdd
trigger1 = !IsHelper
trigger1 = (RoundState = 2) && Alive && (Life < LifeMax)
fv = 38
value = 4 * var(52) * (LifeMax / 60000.0)
ignorehitpause = 1

[State -2, Regeneration: heal]
type = LifeAdd
trigger1 = !IsHelper
trigger1 = fvar(38) >= 1
value = floor(fvar(38))
absolute = 1
ignorehitpause = 1

[State -2, Regeneration: keep the rest]
type = VarAdd
trigger1 = !IsHelper
trigger1 = fvar(38) >= 1
fv = 38
value = -floor(fvar(38))
ignorehitpause = 1


;---------------------------------------------------------------------------

[State -2]
type = null
trigger1 = (stateno = 5900) && (time <= 2)
trigger1 = var(51) := 0
trigger2 = var(51) < 3
trigger2 = var(51) := var(51) + 1
ignorehitpause = 1

[State -2]
type = assertspecial
trigger1 = var(51) = 1
flag = noko
ignorehitpause = 1

[State -2]
type = lifeset
trigger1 = var(51) <= 2
value = (lifemax) * ((var(51) = 2))
ignorehitpause = 1

[State -2]
type = null
trigger1 = var(51) = 1
trigger1 = var(50) := life
ignorehitpause = 1

[State -2]
type = helper
trigger1 = ((var(50) = 1) && ((!AIlevel) && (alive) && (numhelper(9900) = 0)))
stateno = 9900
id = 9900
pos = 0, 0
postype = p1
ownpal = 1
ignorehitpause = 1

[state -3]
trigger1 = var(8) = 1 
trigger1 = NumHelper(6990) = 0 ;This is so it will only spawn if the helper doesn't already exist.
trigger1 = alive ;This is so it will only spawn if you're not dead.
type = Helper
stateno = 6990
id = 6990
name = "Super Armor"
keyctrl = 0
ownpal = 1

;---------------------------------------------------------------------------

[State -2]
type = PowerAdd
triggerall = (roundstate=2) && movetype = H && statetype != L
trigger1 = 1
value = cond(var(8) = 0,8,10)

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall = numhelper(9999)=0
trigger1 = (stateno=200) && (animelemtime(8)>=0)
trigger2 = (stateno=230) && (animelemtime(4)>=0)
trigger3 = (stateno=240) && (animelemtime(4)>=0)
trigger4 = (stateno=600) && (animelemtime(6)>=0)
trigger5 = (stateno=300) && (animelemtime(8)>=0)
trigger6 = (stateno=310) && (animelemtime(35)>=0)
trigger7 = (stateno=320) && (animelemtime(35)>=0)
trigger8 = (stateno=330) && (animelemtime(35)>=0)
trigger9 = (stateno=340) && (animelemtime(35)>=0)
trigger10 = (stateno=350) && (animelemtime(25)>=0)
stateno = 9999
ID = 9999
postype = p1
pos = 9999,9999

;---------------------------------------------------------------------------

[State -2]
type = VarSet
trigger1 = (var(49) != 0)
var(47) = 0

[State -2]
type = VarSet
triggerall = statetype != L && cond(movetype=H,((stateno=[139,159])||(stateno=[4999,5100])),1) && (roundstate=2) && numexplod(900)=0 && ((p2bodydist X < 60 && cond(numenemy > 0, enemynear, backedgebodydist > 60,0)) || (p2bodydist X > 60 && cond(numenemy > 0, enemynear, backedgebodydist < 60, 0)) || (p2bodydist X > 60 && cond(numenemy > 0,enemynear, backedgebodydist > 60,0)))
trigger1 = !AIlevel && command = "z" && movetype != A && var(49)=0
trigger2 = AIlevel && (var(49) = 0) && (p2bodydist X < 90) && (P2statetype != A) && (backedgebodydist < 15)
var(47) = 1

[State -2]
type = PlaySnd
triggerall = (roundstate=2) && (alive)
trigger1 = var(47) = 1
value = 950,0

[State -2]
type = Explod
triggerall = numexplod(100)= 0 && (roundstate=2) && (alive)
trigger1 = var(47) = 1
anim = 7059
ID = 100
pos = 0,-35
postype = p1
facing = -1
bindtime = -1
removetime = -2
pausemovetime = 999
supermovetime = 999
scale = .25,.25
sprpriority = 2
ownpal = 1
remappal = 3,cond(var(59)=4, 6, cond(var(59)=5, 7, cond(var(59)=6, 4, 1)))

[State -2]
type = Explod
triggerall = numexplod(100)= 0 && (roundstate=2) && (alive)
trigger1 = var(47) = 1
anim = 7059
ID = 100
pos = 0,-35
postype = p1
facing = -1
bindtime = -1
removetime = -2
pausemovetime = 999
supermovetime = 999
scale = .25,.25
sprpriority = -5
ownpal = 1
remappal = 3,0
trans = sub

[State -2]
type = Helper
triggerall = (roundstate=2) && (alive)
trigger1 = var(47) = 1
helpertype = normal
ID = 2000
stateno = 2000
pos = 50,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1

[State -2]
type = VarSet
triggerall = (roundstate=2) && (alive)
trigger1 = var(47) = 1
v = 48
value = 0

[State -2]
type = VarSet
triggerall = (roundstate=2) && (alive)
trigger1 = var(47) = 1
v = 49
value = 1

;---------------------------------------------------------------------------

[State -2]
type = Explod
trigger1 = var(48) = 15 && var(49) = 1 && numexplod(900)=0 && (roundstate=2) && (alive) && statetype != L
anim = 7061
ID = 900
pos = 0,-30
postype = p1
facing = -1
bindtime = -1
removetime = -2
pausemovetime = 999
supermovetime = 999
scale = .25,.25
sprpriority = -1
ownpal = 1
remappal = 3,0

;---------------------------------------------------------------------------

[State -2]
type = PlaySnd
trigger1 = var(49) = 1 && numexplod(900)=1 && (roundstate=2) && (alive) && statetype != L 
value = 950,1
volumescale = 150

;---------------------------------------------------------------------------

[State -2]
type = PalFX
trigger1 = var(49) = 1 && numexplod(900)=1 && (roundstate=2) && (alive) && statetype != L
time = 5
add = 128,128,128

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall = numhelper(6340) = 0
trigger1 = p2stateno = 6631
helpertype = normal
ID = 6340
stateno = 6340
pos = 0,-30
postype = p2
facing = 1
keyctrl = 0
ownpal = 1

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall = numhelper(6808) = 0
trigger1 = p2stateno = 6806
helpertype = normal
ID = 6808
stateno = 6808
pos = 0,-30
postype = p2
facing = 1
keyctrl = 0
ownpal = 1

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall= numhelper(6809)=0
trigger1 = p2stateno = [6805,6807]
helpertype = normal
ID = 6809
stateno = 6809
pos=0,0
postype=p1
facing=1
keyctrl=0
ownpal=1

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall = numhelper(6950) = 0
trigger1 = stateno = 3000
helpertype = normal
ID = 6950
stateno = 6950
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

;---------------------------------------------------------------------------

[State -2]
type = RemapPal
trigger1 = var(8)=0 && stateno != 5900 && stateno != 1200 && stateno != 1700 && stateno != 1701 && stateno != 3000 && stateno != 3001
source = 1,1
dest = 1,cond(var(59)!=0,var(59),palno)

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

[State -2]
type = StopSnd
trigger1 = stateno != 500
channel = 10
ignorehitpause = 1

;---------------------------------------------------------------------------

[State -2]
type = StopSnd
trigger1 = stateno != 500
channel = 12
ignorehitpause = 1

;---------------------------------------------------------------------------

[State -2]
type = StopSnd
trigger1 = stateno != 190 && stateno != 191
channel = 19
ignorehitpause = 1

;---------------------------------------------------------------------------

[State -2]
type = VarSet
trigger1 = var(1) > 0
trigger1 = stateno != 400
v = 1
value = 0

;---------------------------------------------------------------------------

[State -2]
type = VarSet
trigger1 = var(49) = 1 && var(48) = 15 && statetype != L && movetype != A && (roundstate=2) && (alive)
v = 49
value = 0

;---------------------------------------------------------------------------

[State -2]
type = VarAdd
trigger1 = (gametime%30 = 0) && (var(48) < 15) && (var(49)=1) && movetype != A && statetype != L && (roundstate=2) && (alive)
v = 48
value = 1

;---------------------------------------------------------------------------

[State -2]
type = Helper
triggerall = numhelper(7010) = 0
trigger1 = (stateno!=[190,191]) && (stateno!=3001) && (stateno!=[5000,5999]) && (movetype != H)
helpertype = normal
ID = 7010
stateno = 7010
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 3000 && stateno != 3001
id = 3300

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 3000 && stateno != 3001
id = 7900

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 210 && stateno != 1000
id = 211

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 210 && stateno != 1000
id = 212

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 220
id = 220

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 220
id = 221

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 600
id = 601

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 625
id = 625

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 500
trigger1 = stateno != 501
trigger1 = stateno != 220
id = 7009

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 500
trigger1 = stateno != 501
trigger1 = stateno != 220
id = 7010

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 500
trigger1 = stateno != 501
trigger1 = stateno != 220
id = 7015

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 500
trigger1 = stateno != 501
trigger1 = stateno != 220
id = 7017

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 500
trigger1 = stateno != 501
trigger1 = stateno != 220
id = 7018

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 400
id = 7019

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 191
trigger2 = stateno = 191 && time > 132
id = 7021

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 191
trigger2 = stateno = 191 && time > 132
id = 7022

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 191
trigger2 = stateno = 191 && time > 132
id = 7023

;---------------------------------------------------------------------------

[State -2]
type=RemoveExplod
trigger1=StateNo!=750
trigger2=AnimElem=3
id=7044
ignorehitpause = 1

;---------------------------------------------------------------------------

[State -2]
type=RemoveExplod
trigger1=StateNo!=750
id=750
ignorehitpause = 1

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 191
trigger2 = stateno = 191 && time > 128
id = 192

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 1700 && stateno != 1701
id = 7700

;---------------------------------------------------------------------------

[State -2]
type = RemoveExplod
trigger1 = stateno != 1700 && stateno != 1701
id = 7701

;===========================================================================

[statedef 6990]
type    = S
movetype= H
physics = S
ctrl = 0
velset = 0,0
anim = 9999

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 3305]
Type = NotHitBy
Trigger1 = 1
Value = SAC, NT, ST, HT ,NA, SA, HA ,NP, SP, HP
Time = 1

[State 64579, 5]
type = destroyself
trigger1 = parent,var(8) != 1

[statedef 7990]
type    = S
movetype= H
physics = S
ctrl = 0
velset = 0,0
anim = 9999

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 3305]
Type = NotHitBy
Trigger1 = 1
Value = SAC, NT, ST, HT ,NA, SA, HA ,NP, SP, HP
Time = 1

[State 64579, 5]
type = destroyself
trigger1 = time >= 1500