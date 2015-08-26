function submitIdea(event) {
    event.preventDefault();
    postIdeaData();
}

function ideaData() {
    return {
        idea: {
            title: $("#idea-title").val(),
            body: $("#idea-body").val()
        }
    };
}

function postIdeaData() {
    $.post("/ideas", ideaData(), function(data){
        $("#ideas").prepend(data);
        $ideaDiv = $(data);
        $('#ideas').last().click(deleteIdea);
    });
    $("#new_idea")[0].reset();
}

function deleteIdea() {
  $('body').on('click', '.remove-idea',function(event){
    event.preventDefault();
    var idea = $(this).closest('.panel');
    var ideaId = $(this).closest('.panel').data().id;

    $.ajax({
      method: "DELETE",
      url: "/ideas/" + ideaId,
      data: { id: ideaId },
      success: function () {
        idea.remove();
      },
      error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.status);
      }
    });
  });
}

$(document).ready(function () {
    $("#new_idea").submit(submitIdea);
    deleteIdea();
});
