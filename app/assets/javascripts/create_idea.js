// $(document).ready(function () {
//     createIdea();
// });
//
// function createIdea() {
//     $('#create-idea').on('click', function () {
//         $('#ideas').prepend(
//             "<li><div class='panel panel-default'><div class='panel-heading'><h3 class='panel-title'>"
//             + $('#idea-title').val() + "<span class='label label-primary'>swill</span><span class='remove-idea pull-right'><i class='fa fa-times fa-lg'</i></span>"
//             + "</h3></div><div class='panel-body'>"
//             + $('#idea-body').val() + "</div><div class='panel-footer'>"
//             + "<span class='upvote'><i class='fa fa-thumbs-up fa-lg'</i></span>"
//             + "<span class='downvote pull-right'><i class='fa fa-thumbs-down fa-lg'</i></span>"
//             + "</div></div></li>"
//         );
//         $('#new_idea')[0].reset();
//     });
//
// }

function submitIdea(event) {
    event.preventDefault();
    console.log("hi, you submitted an idea");
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
