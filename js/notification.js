$(document).ready(function(){
var ns_notification1 = (function () {
	var body_listener_added = false;
	var notif_listener_added = false;

	var add_body_listener = function () {
		body_listener_added = true;
		remove_notification_listener();
		$("body").on("click", fadeToggle_display);
	};
	var remove_body_listener = function () {
		$("body").off("click", fadeToggle_display);
		body_listener_added = false;
		add_notification_listener();
	};
	var add_notification_listener = function () {
		notif_listener_added = true;
		$("#notification1").on("click", fadeToggle_display);
	};
	var remove_notification_listener = function () {
		$("#notification1").off("click", fadeToggle_display);
		notif_listener_added = false;
	};
	var fadeToggle_display = function () {
		$("#notification1Data").fadeToggle(100, function () {
			(!body_listener_added) ? add_body_listener() : remove_body_listener();
		});
	};
	var init = (function () {
		body_listener_added = false;
		notif_listener_added = false;
		(!notif_listener_added) ? add_notification_listener() : remove_notification_listener();
	})();
})();
var ns_notification2 = (function () {
	var body_listener_added = false;
	var notif_listener_added = false;

	var add_body_listener = function () {
		body_listener_added = true;
		remove_notification_listener();
		$("body").on("click", fadeToggle_display);
	};
	var remove_body_listener = function () {
		$("body").off("click", fadeToggle_display);
		body_listener_added = false;
		add_notification_listener();
	};
	var add_notification_listener = function () {
		notif_listener_added = true;
		$("#notification2").on("click", fadeToggle_display);
	};
	var remove_notification_listener = function () {
		$("#notification2").off("click", fadeToggle_display);
		notif_listener_added = false;
	};
	var fadeToggle_display = function () {
		$("#notification3Data").fadeToggle(100, function () {
			(!body_listener_added) ? add_body_listener() : remove_body_listener();
		});
	};
	var init = (function () {
		body_listener_added = false;
		notif_listener_added = false;
		(!notif_listener_added) ? add_notification_listener() : remove_notification_listener();
	})();
})();
var ns_notification3 = (function () {
	var body_listener_added = false;
	var notif_listener_added = false;

	var add_body_listener = function () {
		body_listener_added = true;
		remove_notification_listener();
		$("body").on("click", fadeToggle_display);
	};
	var remove_body_listener = function () {
		$("body").off("click", fadeToggle_display);
		body_listener_added = false;
		add_notification_listener();
	};
	var add_notification_listener = function () {
		notif_listener_added = true;
		$("#notification3").on("click", fadeToggle_display);
	};
	var remove_notification_listener = function () {
		$("#notification3").off("click", fadeToggle_display);
		notif_listener_added = false;
	};
	var fadeToggle_display = function () {
		$("#notification2Data").fadeToggle(100, function () {
			(!body_listener_added) ? add_body_listener() : remove_body_listener();
		});
	};
	var init = (function () {
		body_listener_added = false;
		notif_listener_added = false;
		(!notif_listener_added) ? add_notification_listener() : remove_notification_listener();
	})();
})();
});