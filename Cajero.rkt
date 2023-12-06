#lang racket/gui

(define dinero 1250000)
(define logo (make-object bitmap% "logo.png"))

;VentanaPrincipal
(define principal (new frame% [label "Principal"] [width 1400] [height 800]))

(define (abrir-retiro)
  (send retiro show #t)
  (send principal show #f))

(define (abrir-deposito)
  (send deposito show #t)
  (send principal show #f))

(define (abrir-saldo)
  (send saldo show #t)
  (send principal show #f))

(define (click-retiro-volver x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 400)
       (<= y (+ 400 75))))

(define (click-deposito x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 500)
       (<= y (+ 500 75))))

(define (click-saldo x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 600)
       (<= y (+ 600 75))))

(define lienzo-principal%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (abrir-retiro)]
        [(and (eq? type 'left-down) (click-deposito x y))
         (abrir-deposito)]
        [(and (eq? type 'left-down) (click-saldo x y))
         (abrir-saldo)]
        ))
    ))

(define lienzo-principal (new lienzo-principal% [parent principal]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send principal get-height)) (send principal get-width) (* 0.75 (send principal get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text "SELECCIONE LA OPERACIÓN A REALIZAR" 365 (* 0.33 (send principal get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "RETIRAR" 1140 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     (send dc draw-text "DEPOSITAR" 1095 515)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 500 75 75)
                                     (send dc draw-text "CONSULTAR SALDO" 965 615)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 600 75 75))]))

;VentanaRetiro
(define retiro (new frame% [label "Retiro"] [width 1400] [height 800]))

(define (abrir-20)
  (send 20k show #t)
  (send retiro show #f))

(define (abrir-50)
  (send 50k show #t)
  (send retiro show #f))

(define (abrir-100)
  (send 100k show #t)
  (send retiro show #f))

(define (abrir-200)
  (send 200k show #t)
  (send retiro show #f))

(define (abrir-500)
  (send 500k show #t)
  (send retiro show #f))

(define (abrir-1000)
  (send 1000k show #t)
  (send retiro show #f))

(define (click-20 x y)
  (and (>= x 140)
       (<= x (+ 140 75))
       (>= y 335)
       (<= y (+ 335 75))))

(define (click-50 x y)
  (and (>= x 140)
       (<= x (+ 140 75))
       (>= y 480)
       (<= y (+ 480 75))))

(define (click-100 x y)
  (and (>= x 160)
       (<= x (+ 160 75))
       (>= y 630)
       (<= y (+ 630 75))))

(define (click-200 x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 335)
       (<= y (+ 335 75))))

(define (click-500 x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 480)
       (<= y (+ 480 75))))

(define (click-1000 x y)
  (and (>= x 1300)
       (<= x (+ 1300 75))
       (>= y 630)
       (<= y (+ 630 75))))

(define lienzo-retiro%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-20 x y))
         (abrir-20)]
        [(and (eq? type 'left-down) (click-50 x y))
         (abrir-50)]
        [(and (eq? type 'left-down) (click-100 x y))
         (abrir-100)]
        [(and (eq? type 'left-down) (click-200 x y))
         (abrir-200)]
        [(and (eq? type 'left-down) (click-500 x y))
         (abrir-500)]
        [(and (eq? type 'left-down) (click-1000 x y))
         (abrir-1000)]
        ))
    ))

(define lienzo-retiro (new lienzo-retiro% [parent retiro]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send retiro get-height)) (send retiro get-width) (* 0.75 (send retiro get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text "SELECCIONE EL MONTO A RETIRAR" 365 (* 0.33 (send retiro get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "20.000" 20 350)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 140 335 75 75)
                                     (send dc draw-text "50.000" 20 500)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 140 480 75 75)
                                     (send dc draw-text "100.000" 20 650)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 160 630 75 75)
                                     (send dc draw-text "200.000" 1150 350)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 335 75 75)
                                     (send dc draw-text "500.000" 1150 500)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 480 75 75)
                                     (send dc draw-text "1'000.000" 1125 650)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 630 75 75))]))

;VentanaDeposito
(define deposito (new frame% [label "Depósito"] [width 1400] [height 800]))

(define (abrir-20d)
  (send 20kd show #t)
  (send deposito show #f))

(define (abrir-50d)
  (send 50kd show #t)
  (send deposito show #f))

(define (abrir-100d)
  (send 100kd show #t)
  (send deposito show #f))

(define (abrir-200d)
  (send 200kd show #t)
  (send deposito show #f))

(define (abrir-500d)
  (send 500kd show #t)
  (send deposito show #f))

(define (abrir-1000d)
  (send 1000kd show #t)
  (send deposito show #f))

(define lienzo-deposito%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-20 x y))
         (abrir-20d)]
        [(and (eq? type 'left-down) (click-50 x y))
         (abrir-50d)]
        [(and (eq? type 'left-down) (click-100 x y))
         (abrir-100d)]
        [(and (eq? type 'left-down) (click-200 x y))
         (abrir-200d)]
        [(and (eq? type 'left-down) (click-500 x y))
         (abrir-500d)]
        [(and (eq? type 'left-down) (click-1000 x y))
         (abrir-1000d)]
        ))
    ))

(define lienzo-deposito (new lienzo-deposito% [parent deposito]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send deposito get-height)) (send deposito get-width) (* 0.75 (send deposito get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text "SELECCIONE EL MONTO A DEPOSITAR" 365 (* 0.33 (send deposito get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "20.000" 20 350)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 140 335 75 75)
                                     (send dc draw-text "50.000" 20 500)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 140 480 75 75)
                                     (send dc draw-text "100.000" 20 650)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 160 630 75 75)
                                     (send dc draw-text "200.000" 1150 350)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 335 75 75)
                                     (send dc draw-text "500.000" 1150 500)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 480 75 75)
                                     (send dc draw-text "1'000.000" 1125 650)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 630 75 75))]))

;VentanaSaldo
(define saldo (new frame% [label "Saldo"] [width 1400] [height 800]))

(define (abrir-principal)
  (send principal show #t)
  (send saldo show #f))

(define lienzo-saldo%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (abrir-principal)]
        [else
         (void)]
        ))
    ))

(define lienzo-saldo (new lienzo-saldo% [parent saldo]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send saldo get-height)) (send saldo get-width) (* 0.75 (send saldo get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SU SALDO ES DE ~a" dinero) 500 (* 0.33 (send saldo get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "VOLVER" 1140 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))

;VentanaFinalRetiro
(define 20k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar20)
  (send 20k show #f))

(define lienzo-20%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar20)]
        [else
         (void)]
        ))
    ))

(define lienzo-20 (new lienzo-20% [parent 20k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 20k get-height)) (send 20k get-width) (* 0.75 (send 20k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")                                     
                                     (if (>= dinero 20000)
                                         (begin
                                           (send dc draw-text "SE ENTREGA 1 BILLETE DE 20.000" 400 (* 0.33 (send 20k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 20000)) 465 (* 0.4 (send 20k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;------------------------------------------------------------------------
(define 50k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar50)
  (send 50k show #f))

(define lienzo-50%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar50)]
        [else
         (void)]
        ))
    ))

(define lienzo-50 (new lienzo-50% [parent 50k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 50k get-height)) (send 50k get-width) (* 0.75 (send 50k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (if (>= dinero 50000)
                                         (begin
                                           (send dc draw-text "SE ENTREGAN 2 BILLETES DE 20.000, 1 DE 10.000" 300 (* 0.33 (send 50k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 50000)) 465 (* 0.4 (send 50k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;----------------------------------------------------------------------
(define 100k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar100)
  (send 100k show #f))

(define lienzo-100%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar100)]
        [else
         (void)]
        ))
    ))

(define lienzo-100 (new lienzo-100% [parent 100k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 100k get-height)) (send 100k get-width) (* 0.75 (send 100k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (if (>= dinero 100000)
                                         (begin
                                           (send dc draw-text "SE ENTREGA 1 BILLETE DE 50.000, 2 DE 20.000, 1 DE 10.000" 225 (* 0.33 (send 100k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 100000)) 465 (* 0.4 (send 100k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;----------------------------------------------------------------------
(define 200k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar200)
  (send 200k show #f))

(define lienzo-200%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar200)]
        [else
         (void)]
        ))
    ))

(define lienzo-200 (new lienzo-200% [parent 200k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 200k get-height)) (send 200k get-width) (* 0.75 (send 200k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (if (>= dinero 200000)
                                         (begin
                                           (send dc draw-text "SE ENTREGA 1 BILLETE DE 100.000, 1 DE 50.000, 2 DE 20.000, 1 DE 10.000 " 100 (* 0.33 (send 200k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 200000)) 465 (* 0.4 (send 200k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;-------------------------------------------------------------------------
(define 500k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar500)
  (send 500k show #f))

(define lienzo-500%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar500)]
        [else
         (void)]
        ))
    ))

(define lienzo-500 (new lienzo-500% [parent 500k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 500k get-height)) (send 500k get-width) (* 0.75 (send 500k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (if (>= dinero 500000)
                                         (begin
                                           (send dc draw-text "SE ENTREGAN 5 BILLETES DE 100.000" 360 (* 0.33 (send 500k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 500000)) 465 (* 0.4 (send 500k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;-----------------------------------------------------------------------------
(define 1000k (new frame% [label "FinalRetiro"] [width 1400] [height 800]))

(define (cerrar1000)
  (send 1000k show #f))

(define lienzo-1000%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar1000)]
        [else
         (void)]
        ))
    ))

(define lienzo-1000 (new lienzo-1000% [parent 1000k]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 1000k get-height)) (send 1000k get-width) (* 0.75 (send 1000k get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (if (>= dinero 1000000)
                                         (begin
                                           (send dc draw-text "SE ENTREGAN 10 BILLETES DE 100.000" 350 (* 0.33 (send 1000k get-height)))
                                           (send dc draw-text (format "SALDO TOTAL: ~a" (- dinero 1000000)) 465 (* 0.4 (send 1000k get-height))))
                                         (send dc draw-text "SALDO INSUFICIENTE" 465 (* 0.33 (send 20k get-height))))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))

;VentanaFinalDepósito
(define 20kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar20d)
  (send 20kd show #f))

(define lienzo-20d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar20d)]
        [else
         (void)]
        ))
    ))

(define lienzo-20d (new lienzo-20d% [parent 20kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 20kd get-height)) (send 20kd get-width) (* 0.75 (send 20kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 20000)) 465 (* 0.33 (send 20kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;------------------------------------------------------------------------
(define 50kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar50d)
  (send 50kd show #f))

(define lienzo-50d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar50d)]
        [else
         (void)]
        ))
    ))

(define lienzo-50d (new lienzo-50d% [parent 50kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 50kd get-height)) (send 50kd get-width) (* 0.75 (send 50kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 50000)) 465 (* 0.4 (send 50kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;----------------------------------------------------------------------
(define 100kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar100d)
  (send 100kd show #f))

(define lienzo-100d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar100d)]
        [else
         (void)]
        ))
    ))

(define lienzo-100d (new lienzo-100d% [parent 100kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 100kd get-height)) (send 100kd get-width) (* 0.75 (send 100kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 100000)) 465 (* 0.4 (send 100kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;----------------------------------------------------------------------
(define 200kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar200d)
  (send 200kd show #f))

(define lienzo-200d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar200d)]
        [else
         (void)]
        ))
    ))

(define lienzo-200d (new lienzo-200d% [parent 200kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 200kd get-height)) (send 200kd get-width) (* 0.75 (send 200kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 200000)) 465 (* 0.4 (send 200kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;-------------------------------------------------------------------------
(define 500kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar500d)
  (send 500kd show #f))

(define lienzo-500d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar500d)]
        [else
         (void)]
        ))
    ))

(define lienzo-500d (new lienzo-500d% [parent 500kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 500kd get-height)) (send 500kd get-width) (* 0.75 (send 500kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 500000)) 465 (* 0.4 (send 500kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))
;------------------------------------------------------------------------
(define 1000kd (new frame% [label "FinalDeposito"] [width 1400] [height 800]))

(define (cerrar1000d)
  (send 1000kd show #f))

(define lienzo-1000d%
  (class canvas%
    (define/override (on-event event)
      (handle-mouse-event event))
    (super-new)
    (define (handle-mouse-event event)
      (define x (send event get-x))
      (define y (send event get-y))
      (define type (send event get-event-type))
      (cond
        [(and (eq? type 'left-down) (click-retiro-volver x y))
         (cerrar1000d)]
        [else
         (void)]
        ))
    ))

(define lienzo-1000d (new lienzo-1000d% [parent 1000kd]
                                  [stretchable-width #t]
                                  [stretchable-height #t]
                                  [paint-callback
                                   (lambda (canvas dc)
                                     (send dc set-brush "red" 'solid)
                                     (send dc draw-rectangle 0 (* 0.25 (send 1000kd get-height)) (send 1000kd get-width) (* 0.75 (send 1000kd get-height)))
                                     (send dc set-font (make-object font% 24 'default 'normal 'bold))
                                     (send dc set-text-foreground "white")
                                     (send dc draw-text (format "SALDO TOTAL: ~a" (+ dinero 1000000)) 465 (* 0.4 (send 1000kd get-height)))
                                     (send dc draw-bitmap logo 450 50)
                                     (send dc draw-text "TERMINAR" 1115 415)
                                     (send dc set-brush "white" 'solid)
                                     (send dc draw-rectangle 1300 400 75 75)
                                     )]))

(send principal show #t)