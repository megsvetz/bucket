$(document).ready(function(){

  $(".completed_check").click(function(e){
    e.preventDefault();
    if($(this).attr("checked")){
      completedCheck(false);
    } else {
      $("#completed_goal_modal").modal("show");
      completedCheck(true);
    }
  });

  $("#no_thanks_button").click(function(){
    completedCheck(true);
  });

  function completedCheck(checked){
    var goalId = $(".completed_check").data("goal-id");
    $.ajax("/completed_goal",{
      type: "POST",
      data: {"goal_id": goalId, "checked": checked },

      success: function(data){
        $(".completed_check").prop("checked", checked)
      },
      error: function(data){
        alert(data.message);
      }


    });

  }
});

