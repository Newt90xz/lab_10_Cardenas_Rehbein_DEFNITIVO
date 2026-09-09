(define (problem goal9)
    (:domain manito)

    (:objects
        greenb blueb
        garra
        xygarra xygreen xydisp1 xydisp2
        zgarra zgreen zdisp1 zdisp2
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (apilado greenb)

        (en blueb xygreen)
        (pisob blueb zgreen)
        (libre blueb)

        (torre greenb blueb)

        (pos garra xygarra)
        (pisog garra zgarra)

        (dismover garra)
        (desocupado garra)

        (libre xydisp1)
        (libre xydisp2)

        (camino xygarra xygreen)
        (camino xygreen xygarra)

        (camino xygreen xydisp1)
        (camino xydisp1 xygreen)

        (camino xygreen xydisp2)
        (camino xydisp2 xygreen)

        (camino xygarra xydisp1)
        (camino xydisp1 xygarra)

        (camino xygarra xydisp2)
        (camino xydisp2 xygarra)

        (camino xydisp1 xydisp2)
        (camino xydisp2 xydisp1)

        (alt zgarra zgreen)
        (alt zgreen zgarra)
        
        (alt zgarra zdisp1)
        (alt zdisp1 zgarra)

        (alt zgarra zdisp2)
        (alt zdisp2 zgarra)
    )

    (:goal
        (and
            (en greenb xydisp1)
            (en blueb xydisp2)
            (pisob greenb zdisp1)
            (pisob blueb zdisp2)
        )
    )
)