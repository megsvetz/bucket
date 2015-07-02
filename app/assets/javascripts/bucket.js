$(document).ready(function(){

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
  $('select#goal_country_code').change(function(event) {
    var country_code, select_wrapper, url;
    select_wrapper = $('#goal_state_code_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    country_code = $(this).val();
    url = "/goal/subregion_options?parent_region=" + country_code;
    console.log(country_code)
    console.log(url)
    console.log(select_wrapper)
    return select_wrapper.load(url);
  });
});

