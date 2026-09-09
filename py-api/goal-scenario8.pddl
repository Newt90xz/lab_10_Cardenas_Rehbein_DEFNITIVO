(define (problem goal8)
    (:domain manito)

    (:objects
        greenb blueb whiteb
        garra
        xygarra xygreen xywhite xydisp1
        zgarra zgreen zwhite zdisp1
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (apilado greenb)

        (en blueb xygreen)
        (pisob blueb zgreen)
        (libre blueb)

        (torre greenb blueb)

        (en whiteb xywhite)
        (pisob whiteb zwhite)
        (libre whiteb)

        (pos garra xygarra)
        (pisog garra zgarra)

        (dismover garra)
        (desocupado garra)

        (libre xydisp1)

        (camino xygarra xygreen)
        (camino xygreen xygarra)

        (camino xygarra xywhite)
        (camino xywhite xygarra)

        (camino xygreen xydisp1)
        (camino xydisp1 xygreen)

        (camino xywhite xygreen)
        (camino xygreen xywhite)
        
        (camino xywhite xydisp1)
        (camino xydisp1 xywhite)

        (alt zgarra zgreen)
        (alt zgreen zgarra)

        (alt zgarra zwhite)
        (alt zwhite zgarra)

        (alt zgarra zdisp1)
        (alt zdisp1 zgarra)
    )

    (:goal
        (and
            (en blueb xydisp1)
            (pisob blueb zdisp1)
            (torre whiteb greenb)
        )
    )
)