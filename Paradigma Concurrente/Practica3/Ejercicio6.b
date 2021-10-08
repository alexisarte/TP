programa ejercicio6.a
procesos
  proceso juntarFlores
  comenzar
    mientras(HayFlorEnLaEsquina)
      tomarFlor  
  fin
  
  proceso juntarPapeles
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
  fin

  
  proceso juntarObjetos
  comenzar
    juntarFlores
    juntarPapeles
  fin

  
  proceso ladoFlor(E n: numero)
  comenzar
    repetir n
      juntarFlores
      mover
  fin

  proceso ladoObjetos(E n: numero)
  comenzar
    repetir n
      juntarObjetos
      mover
  fin
  proceso ladoPapeles(E n: numero)
  comenzar
    repetir n
      juntarPapeles
      mover
  fin

  
  proceso areaObjet
  comenzar
    mover
    juntarObjetos
    mover
  fin
  
  proceso areaFlower
  comenzar
    mover
    juntarFlores
    mover
  fin
  
  proceso areaPaper
  comenzar
    mover
    juntarPapeles
    mover
  fin
  
  proceso recorrerCuadradoFlores
  comenzar
    ladoFlor(6)
    derecha
    ladoFlor(2)   
    juntarFlores
    BloquearEsquina(PosAv + 1, PosCa)
    areaFlower
    LiberarEsquina(PosAv - 1, PosCa)
    ladoFlor(2)    
    derecha
    ladoFlor(2)
    juntarFlores
    BloquearEsquina(PosAv, PosCa - 1)    
    areaFlower
    LiberarEsquina(PosAv, PosCa + 1)    
    ladoFlor(2)  
    derecha
    ladoFlor(6)
    derecha
  fin

  proceso recorrerCuadradoObjetos  
  comenzar
    ladoObjetos(2)  
    juntarObjetos
    BloquearEsquina(PosAv, PosCa + 1)
    areaObjet
    LiberarEsquina(PosAv, PosCa - 1)
    ladoObjetos(6)    
    derecha
    ladoObjetos(3)
    juntarObjetos
    BloquearEsquina(PosAv + 1, PosCa)    
    areaObjet 
    LiberarEsquina(PosAv, PosCa + 1)    
    ladoObjetos(5)    
    derecha
    ladoObjetos(5)
    juntarObjetos
    BloquearEsquina(PosAv, PosCa - 1)    
    areaObjet
    LiberarEsquina(PosAv, PosCa + 1)    
    ladoObjetos(3)
    derecha
    ladoObjetos(6)
    juntarObjetos
    BloquearEsquina(PosAv + 1, PosCa)    
    areaObjet
    LiberarEsquina(PosAv - 1, PosCa)
    ladoObjetos(2)   
    derecha
  fin
  
  proceso recorrerCuadradoPapeles
  comenzar
    ladoPapeles(5)  
    juntarPapeles
    BloquearEsquina(PosAv, PosCa + 1)
    areaPaper
    LiberarEsquina(PosAv, PosCa - 1)
    derecha
    ladoPapeles(7)  
    derecha
    ladoPapeles(7)    
    derecha
    juntarPapeles
    BloquearEsquina(PosAv - 1, PosCa)
    areaPaper
    LiberarEsquina(PosAv + 1, PosCa) 
    ladoPapeles(5)    
    derecha
  fin

areas
  zona0: AreaP(1,1,1,1)
  zona1: AreaP(2,2,4,8)  
  zona2: AreaP(5,2,8,4)
  zona3: AreaPC(5,5,8,8)
  zona4: AreaP(9,5,15,8)
  zona5: AreaP(5,9,8,15)
  zona6: AreaPC(9,9,15,15)
  zona7: AreaP(9,16,16,16)
  zona8: AreaP(16,9,16,16)
  zona9: AreaPC(20,1,22,100)
  
robots
  robot tipo1
  variables
    ID, posAv: numero   
  comenzar
    RecibirMensaje(ID, padre)
    recorrerCuadradoFlores
    EnviarMensaje(ID, padre)
    RecibirMensaje(posAv, padre)
    Pos(posAv, 1)
    mientras(PosCa < 100 &  HayFlorEnLaBolsa)
      si(HayFlorEnLaBolsa)
        depositarFlor
        mover
  fin
  
  robot tipo2
  variables 
    ID, posAv: numero   
  comenzar
    RecibirMensaje(ID, padre)
    recorrerCuadradoObjetos
    EnviarMensaje(ID, padre)
    RecibirMensaje(posAv, padre)
    Pos(posAv, 1)
    mientras((PosCa < 100  &  HayFlorEnLaBolsa) | (PosCa < 100  &  HayPapelEnLaBolsa))
      si(HayFlorEnLaBolsa)
        depositarFlor
      si(HayPapelEnLaBolsa)
        depositarPapel
      mover
  fin

  robot tipo3
  variables
    ID, posAv: numero   
  comenzar
    RecibirMensaje(ID, padre)
    recorrerCuadradoPapeles
    EnviarMensaje(ID, padre)
    RecibirMensaje(posAv, padre)
    Pos(posAv , 1)
    mientras(PosCa < 100 &  HayPapelEnLaBolsa)
      si(HayPapelEnLaBolsa)
        depositarPapel
        mover
  fin
  
  robot tipo0
  variables
    ID, posAv, av1,av2,av3: numero
  comenzar
    EnviarMensaje(1, bee1)
    EnviarMensaje(2, bee2)
    EnviarMensaje(3, bee3)
    posAv:= 20
    repetir 3
      RecibirMensaje(ID, *)
      si(ID = 1)
        av1:= posAv
      sino 
        si(ID = 2)
          av2:= posAv
        sino 
          av3:= posAv
      posAv:= posAv + 1
    EnviarMensaje(av1, bee1) 
    EnviarMensaje(av2, bee2) 
    EnviarMensaje(av3, bee3) 
  fin

variables
  bee1: tipo1 
  bee2: tipo2   
  bee3: tipo3
  padre: tipo0
  
comenzar
  AsignarArea(padre, zona0)
  AsignarArea(bee1, zona1)
  AsignarArea(bee1, zona2)
  AsignarArea(bee1, zona3)
  AsignarArea(bee1, zona9)
  
  AsignarArea(bee2, zona3)
  AsignarArea(bee2, zona4)
  AsignarArea(bee2, zona5)
  AsignarArea(bee2, zona6)
  AsignarArea(bee2, zona9)
  
  AsignarArea(bee3, zona6)
  AsignarArea(bee3, zona7)
  AsignarArea(bee3, zona8)
  AsignarArea(bee3, zona9)
  
  Iniciar(padre, 1,1)
  Iniciar(bee1, 2,2)
  Iniciar(bee2, 5,5)
  Iniciar(bee3, 9,9)
fin


