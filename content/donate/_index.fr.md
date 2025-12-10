---
title: "♥ Faire un don"
description: "Participer à la pérennisation de FreeCAD"
date: 2024-05-22T08:04:23+12:00
authors: FreeCAD
menus:
  main:
    weight: 7
    params:
      style: button
  footer:
    weight: 7
params:
  donate:
    once:
      label: "Don ponctuel"
      messages:
        default: "Choisir le montant du don ponctuel"
        choice: "Faire un don ponctuel maintenant"
        error: "Choisir un nombre naturel d'au moins 5"
    monthly:
      label: "Don mensuel"
      tiers:
        - type: normal
          message: "Devenir un sponsor"
        - type: bronze
          message: "Devenir un sponsor Bronze"
        - type: silver
          message: "Devenir un sponsor Argent"
        - type: gold
          message: "Devenir un sponsor Or"
      messages:
        default: "Choisir le montant du don mensuel"
  grantsLink: https://github.com/FreeCAD/FPA-grant-proposals/issues
  grantsTitle: Projets soutenus par un grant
---

[comment]: # (Please do not add content in this Donate _index file. The layout of the Donate page is generated from template rules by the theme.)