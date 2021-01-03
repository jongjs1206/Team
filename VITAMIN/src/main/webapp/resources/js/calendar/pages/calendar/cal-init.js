! function($) {
    "use strict";

    var CalendarApp = function() {
        this.$body = $("body")
        this.$calendar = $('#calendar'),
            this.$event = ('#calendar-events div.calendar-events'),
            this.$categoryForm = $('#add-new-event form'),
            this.$extEvents = $('#calendar-events'),
            this.$modal = $('#my-event'),
            this.$saveCategoryBtn = $('.save-category'),
            this.$calendarObj = null
    };


    /* on drop */
    CalendarApp.prototype.onDrop = function(eventObj, date) {
            var $this = this;
            // retrieve the dropped element's stored Event Object
            var originalEventObject = eventObj.data('eventObject');
            var $categoryClass = eventObj.attr('data-class');
            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);
            // assign it the date that was reported
            copiedEventObject.start = date;
            if ($categoryClass)
                copiedEventObject['className'] = [$categoryClass];
            // render the event on the calendar
            $this.$calendar.fullCalendar('renderEvent', copiedEventObject, true);
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                eventObj.remove();
            }
        },
        /* on click on event */
        CalendarApp.prototype.onEventClick = function(calEvent, jsEvent, view) {
            var $this = this;
            if(calEvent.title=="운동"){
	            var form = $("<form></form>");
	            form.append("<label>Change event name</label>");
	            form.append("<div class='input-group'><input class='form-control' type=text value='" + calEvent.title + "' /></div>" +
	            			"<select class='form-control form-white' data-placeholder='Choose...' name='category-color'>" +
	            			"<option value='success'>등운동</option> <option value='danger'>팔운동</option> <option value='info'>다리운동</option> " +
	            			"<option value='primary'>가슴운동</option> <option value='warning'>복근운동</option> <option value='inverse'>유산소</option>" +
	            			"<select class='form-control form-white' data-placeholder='Choose...' name='category-color'> </select> <br>" +
	            			"<label for='exerciseTime' >운동 시작 시간</label> <br/>" +
	            			"<input type='time' name='exerciseTime' id='exerciseTime'> <br/><br/>" +
	            			"<label for='totaltime'>운동 총 시간</label><br/>" +
	            			"<input type='text' id='totaltime' name='totaltime'><br/><br/>" +
	            			"<label for='content'>내용</label><br/>" +
	            			"<textarea id='content' name='content'></textarea><br>" +
	            			"<span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span>");
	            $this.$modal.modal({
	                backdrop: 'static'
	            });
            }else if(calEvent.title == "식사"){
                var form = $("<form></form>");
	            form.append("<label>Change event name</label>");
	            form.append("<div class='input-group'><input class='form-control' type=text value='" + calEvent.title + "' /></div> <br/>" +
	            			"<label for='score'>식단 점수</label><br/>" +
	    					'<div class="stars">' + 
	            		    '<form action="">' +
	            		    '<input class="star star-5" id="star-5" type="radio" name="star"/>' + 
	            		    '<label class="star star-5" for="star-5"></label> ' +
	            		    '<input class="star star-4" id="star-4" type="radio" name="star"/>' +
	            		    '<label class="star star-4" for="star-4"></label>' + 
	            		    '<input class="star star-3" id="star-3" type="radio" name="star"/>' + 
	            		    '<label class="star star-3" for="star-3"></label>' +
	            		    '<input class="star star-2" id="star-2" type="radio" name="star"/>' + 
	            		    '<label class="star star-2" for="star-2"></label>' + 
	            		    '<input class="star star-1" id="star-1" type="radio" name="star"/>' + 
	            		    '<label class="star star-1" for="star-1"></label> </form> </div> <br/> ' + 
	            			'<label for="categorize">분류</label> <br/>' +
	        				'<select id="categorize" name="categorize">'+
	        				'<option value="breakfast">아침</option>'+
	        				'<option value="lunch">점심</option>'+
	        				'<option value="snack">간식</option>'+
	        				'<option value="dinner">저녁</option> </select><br/><br/>' +
	        				'<label for="meal">식사량</label> <br/>'+
	        				'<select id="meal" name="meal">'+
	        				'	<option value="lightly">가볍게</option>'+
	        				'<option value="moderately">적당히</option>'+
	        				'<option value="full">배부르게</option>'+
	        				'<option value="excessively">과하게</option>'+
	        				'	</select><br/><br/>'+
	        				'<label for="foodTime" >시간</label> <br/>'+
	        				'<input type="time" name="foodTime" id="foodTime"> <br/><br/>'+
	        				'<label for="content">메모</label> <br/>'+
	        				'<textarea id="content" name="content"></textarea><br/>'+
							"<span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span>");

	            $this.$modal.modal({
	                backdrop: 'static'
	            });
            }
            $this.$modal.find('.delete-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function() {
                $this.$calendarObj.fullCalendar('removeEvents', function(ev) {
                    return (ev._id == calEvent._id);
                });
                $this.$modal.modal('hide');
            });
            $this.$modal.find('form').on('submit', function() {
                calEvent.title = form.find("input[type=text]").val();
                $this.$calendarObj.fullCalendar('updateEvent', calEvent);
                $this.$modal.modal('hide');
                return false;
            });
        },
        CalendarApp.prototype.enableDrag = function() {
            //init events
            $(this.$event).each(function() {
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            });
        }
    /* Initializing */
    CalendarApp.prototype.init = function() {
            this.enableDrag();
            /*  Initialize the calendar  */
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var form = '';
            var today = new Date($.now());

            var defaultEvents = [
              
            ];

            var $this = this;
            $this.$calendarObj = $this.$calendar.fullCalendar({
                slotDuration: '00:15:00',
                /* If we want to split day time each 15minutes */
                minTime: '08:00:00',
                maxTime: '19:00:00',
                defaultView: 'month',
                handleWindowResize: true,

                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                events: defaultEvents,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                eventLimit: true, // allow "more" link when too many events
                selectable: true,
                drop: function(date) { $this.onDrop($(this), date); },
                select: function(start, end, allDay) { $this.onSelect(start, end, allDay); },
                eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); }

            });

           
        },

        //init CalendarApp
        $.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp

}(window.jQuery),

//initializing CalendarApp
$(window).on('load', function() {

    $.CalendarApp.init()
});