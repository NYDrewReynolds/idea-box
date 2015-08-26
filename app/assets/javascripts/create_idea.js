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
        $("#ideas").append(data);
    });
    $("#new_idea")[0].reset();
}

$(document).ready(function () {
    $("#new_idea").submit(submitIdea);
});
