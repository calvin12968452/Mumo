function add_receive_html(message){
	var today = new Date();
	$( "#message_content" ).append( " \
		<div class=\"row\"\> \
		    \<div class=\"col-1\"\> \
		        \<img class=\"mt-1\" src=\"css/user.png\" alt=\"Smiley face\" height=\"36pt\" width=\"36pt\"> \
		    \</div\> \
		    \<div class=\"col-8\"\> \
		        \<div class=\"card border-primary mt-1 mb-1 pl-2 pb-1 pr-2\" style=\"height: auto; min-height: 30pt\">"+message+"\</div\> \
		    \</div\> \
				\<div class=\"col-8\"\> \
		        \<div>"+today+"\</div\> \
		    \</div\> \
	\</div\>"
	);
};

function chat_logger(role, msg){ // 0 : me ; 1 : friend
	if(!role){
		$( "#message_content" ).append(
			"<div class=\"row\"\> \
		        <div class=\"col-4\"\>\</div\> \
		        \<div class=\"col-8\"\> \
		          \<div class=\"card bg-primary text-white mt-1 mb-1 pl-2 pb-1 pr-2\" style=\"height: auto; min-height: 30pt\"\>"+msg+"\</div\> \
		        \</div\> \
		      \</div\>"
		);
		scroll_to_bottom();
	}else{
		add_receive_html(msg);
		scroll_to_bottom();
	}
}

function add_transmit_html() {
	var text = $( "#text-transmitted").val();
	$("#text-transmitted").val("");
	if(text == ""){
		return;
	}
	$( "#message_content" ).append(
		"<div class=\"row\"\> \
	        <div class=\"col-4\"\>\</div\> \
	        \<div class=\"col-8\"\> \
	          \<div class=\"card bg-primary text-white mt-1 mb-1 pl-2 pb-1 pr-2\" style=\"height: auto; min-height: 30pt\"\>"+text+"\</div\> \
	        \</div\> \
	      \</div\>"
    );

    scroll_to_bottom();
    get_transmit_msg(text);
}

var scroll_to_bottom = function(){
	$( "#text").animate({scrollTop: $("#text")[0].scrollHeight}, 1);
}

function del_user(){
	$("#online-list").empty();
}

function add_user(user, sign){ // sign : secondary and success
	$("#online-list").append(
		"\<li id=\""+user+"\"  \
		class=\"online-user  list-group-item text-" + sign + "\"\>"+user+"\</li\>"
	);

	$( ".online-user" ).unbind('click').click(function(){
		reset_html( "#message_content" );
		console.log(this.id);
		get_userID(this.id);
		replace_friend_name(this.id);
	});
}

function replace_friend_name(id){
	$('#friend_name').text(id);
}

function reset_html(id){
	$(id).html("");
}

function reset_chat(){
	reset_html("#message_content");
}

$( "#text-transmitted" ).keypress(function(e) {
    if(e.which == 13) { add_transmit_html(); }
});

$( "#btn-transmitted" ).click(function(){
	add_transmit_html();
});

$( ".online-user" ).unbind('click').click(function(){
	reset_html("#message_content");
	// console.log(this.id);
	// get_userID(this.id);
	// replace_friend_name(this.id);
});
