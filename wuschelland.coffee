if Meteor.isClient

  Session.set("CLVcount", 0)
  Session.set("WUScount", 0)
  Session.set("RZcount", 5)
  Session.set("CZcount", 5)
  Template.CLV.showCLV = ->
    i = 0
    CLVcount = Session.get("CLVcount")

    toPrint = ""
    while i < CLVcount
      console.log "blink"
      toPrint += "CLV ";
      i++
    return toPrint

  Template.WUS.showWUS = ->
    i = 0
    WUScount = Session.get("WUScount")

    toPrint = ""
    while i < WUScount
      console.log "blink"
      toPrint += "WUS ";
      i++
    return toPrint

  Template.CZ.showCZ = ->
    i = 0
    CZcount = Session.get("CZcount")

    toPrint = ""
    while i < CZcount
      console.log "blink"
      toPrint += "CZ ";
      i++
    return toPrint

  Template.RZ.showRZ = ->
    i = 0
    RZcount = Session.get("RZcount")

    toPrint = ""
    while i < RZcount
      console.log "blink"
      toPrint += "RZ ";
      i++
    return toPrint

  Template.BUTTONS.events

    'click #rule1': ->
      RZcount = Session.get("RZcount")
      WUScount = Session.get("WUScount")

      Session.set("WUScount", 2*RZcount + WUScount)

    'click #rule2': ->

      CLVcount = Session.get("CLVcount")

      CLVcount = CLVcount - (CLVcount % 10)
      newWUS = Session.get("WUScount") - CLVcount / 10
      if newWUS < 0 then newWUS = 0

      Session.set("WUScount",newWUS)
      Session.set("CLVcount",0)

    'click #rule3': ->

      WUScount = Session.get("WUScount")
      CZcount = Session.get("CZcount")

      Session.set("CLVcount", WUScount * CZcount)

    'click #rule4': ->

      WUScount = Session.get("WUScount")
      newCZ = (WUScount - (WUScount % 2) ) / 2

      CZcount = Session.get("CZcount")
      Session.set("CZcount", CZcount + newCZ)

      Session.set("WUScount",0)

    'click #rule5': ->

      CZcount = Session.get("CZcount")
      Session.set("CZcount", CZcount - 2)
