Paloma.controller('Travels', {

  new: ->
    # departure datetime

    current_date = new Date().timeNow()

    flatpickr_config = {
      # dateFormat: "j F Y - H:i",
      altFormat: "j F Y - H:i",
      minDate: current_date,
      defaultDate: current_date,
      enableTime: true,
      time_24hr: true,
      locale:'it',
      onChange: (selectedDates, dateStr, instance) ->
        setBackDepartureDatetimePicker(selectedDates[0])
    }
    document.getElementById("departure_datetime").flatpickr(flatpickr_config)

    # back_departure_datetime
    back_departure_datetime_picker = null

    setBackDepartureDatetimePicker = (departure_datetime) ->
      back_departure_datetime_picker.destroy() if back_departure_datetime_picker

      if departure_datetime
        min_date = departure_datetime
      else
        min_date = current_date

      flatpickr_config = {
        # dateFormat: "j F Y - H:i"
        altFormat: "j F Y - H:i",
        minDate: new Date(min_date - 60000),
        defaultDate: min_date,
        enableTime: true,
        time_24hr: true,
        locale:'it'
      }
      back_departure_datetime_picker = document.getElementById("back_departure_datetime").flatpickr(flatpickr_config)

    setBackDepartureDatetimePicker()

    # towards_room checkbox
    towards_room_check = document.querySelector('.towards_room_check')
    towards_room_check.addEventListener 'change', (ev) ->
      if ev.srcElement.checked
        document.querySelector('.towards_room_label_text').innerHTML = 'Verso'
        document.querySelector('.desired_address_label_text').innerHTML = 'Indirizzo di Partenza'
      else
        document.querySelector('.towards_room_label_text').innerHTML = 'Da'
        document.querySelector('.desired_address_label_text').innerHTML = 'Indirizzo di Destinazione'

    # back_departure_datetime checkbox
    back_departure_datetime_check = document.querySelector('.back_departure_datetime_check')
    back_departure_datetime_check.addEventListener 'change', (ev) ->
      if ev.srcElement.checked
        document.querySelector('.back_departure_datetime_block').style.display = 'block'
      else
        document.querySelector('.back_departure_datetime_block').style.display = 'none'

    # is_recursive checkbox
    is_recursive_check = document.querySelector('.is_recursive_check')
    is_recursive_check.addEventListener 'change', (ev) ->
      if ev.srcElement.checked
        document.querySelector('.is_recursive_block').style.display = 'block'
      else
        document.querySelector('.is_recursive_block').style.display = 'none'
    
      

})