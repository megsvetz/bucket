$(document).ready(function(){
  // $('.private-check').click(function(){
  //   if($(this).prop)
  // });

  $('#completed_goal_modal').on('hidden.bs.modal', function () {
    removeTwitterError();
  });

  $(".completed_check").click(function(e){
    if($(this).prop("checked")){
      $("#completed_goal_modal").modal({backdrop: 'static', keyboard: false});
    } else {
      completedCheck(false, false);
    }
  });

  $("#no_thanks_button").click(function(){
    completedCheck(true, false);
  });

  $("#share_button").click(function(){
    if($.trim($("#twitter_body").val())) {
      removeTwitterError();
      completedCheck(true, true);
      $("#completed_goal_modal").modal("close");
    }else {
      $("#twitter-error").removeClass("hidden");
      $("#twitter_body").addClass("highlight-red");     ;
    }  
  });

  function removeTwitterError(){
    $("#twitter-error").addClass("hidden");
    $("#twitter_body").removeClass("highlight-red"); 
  }

  function completedCheck(checked, postToTwitter){
    $completedCheck = $(".completed_check")
    var goalId = $completedCheck.data("goal-id");
    $.ajax("/completed_goal",{
      type: "POST",
      data: {"goal_id": goalId, "checked": checked, "post_to_twitter": postToTwitter, "twitter_body": $("#twitter_body").text() },

      success: function(data){
        if(checked){
          $completedCheck.prop("checked", checked);
        } else {
          $completedCheck.removeAttr('checked');
        }
      },
      error: function(data){
        alert(data.message);
      }
    });
  }
});

