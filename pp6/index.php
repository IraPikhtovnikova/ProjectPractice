<?php session_start(); ?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> Создать тест </title>
</head>

<body>
	<form action="" type="GET" enctype="multipart/form-data" id="form_login">
		<p> Логин <input type="text" id="txt_login">
<!--         <p> Пароль <input type="password" id="txt_password"> -->
		<p> <input type="submit" value="Вход" id="bt_login">
	</form>

    <div id="form_test_name" class="nonvisible">
        <p> Название теста <input type="text" id="txt_test_name">
        <p> <input type="submit" value="Добавить" id="bt_test_name">
    </div>

<p> <input type="submit" value="Добавить вопрос" id="bt_add_question" class="nonvisible">
    <!-- <p class="nonvisible num_que"> 1 -->
    <div class="nonvisible form_questions">
        <p> Вопрос <input type="text" class="txt_question" id="1"> <input type="submit" value="+" class="bt_answer_add"> <input type="submit" value="Х" class="bt_question_delete">
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>        
    </div>
	<div class="ajax-respond"></div>
    <div id="new_question" class="form_questions" hidden>
        <p> Вопрос <input type="text" class="txt_question" id="1"> <input type="submit" value="Х" class="bt_question_delete">
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>
            <div class="div_answer"> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>        
    </div>

    <div class="div_answer" id="ex_ans" hidden> <input type="checkbox" class="check_right"> Ответ <input type="text" class="txt_answer_name"> </div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
var id_question = 2;
var username = "anon";
var test_name = "test";
var result_array = [];

	$('#bt_login').click(function( event ){
    event.stopPropagation(); // Остановка происходящего
    event.preventDefault();  // Полная остановка происходящего
        
        username = $('#txt_test_name').val();
        $('#form_login').addClass('nonvisible');
        $('#form_test_name').removeClass('nonvisible');
    } 
	);

    $('#bt_test_name').click(function( event ){
    event.stopPropagation(); // Остановка происходящего
    event.preventDefault();  // Полная остановка происходящего
 
        test_name = $('#txt_login').val();
        $('#form_test_name').addClass('nonvisible');
        $('.form_questions').removeClass('nonvisible');
        $('#bt_add_question').removeClass('nonvisible');
        // $('.num_que').removeClass('nonvisible');
    } 
    );

    // $('#bt_question_delete').click(function( event ){
    // event.stopPropagation(); // Остановка происходящего
    // event.preventDefault();  // Полная остановка происходящего
 
    //     $('#form_test_name').addClass('nonvisible');
    //     $('.form_questions').removeClass('nonvisible');
    // } 
    // );

    $('body').on('click', '.bt_question_delete', function(e) {
        $(this).closest('.form_questions').remove();
    });

    $('#bt_add_question').click(function( event ){
    event.stopPropagation(); // Остановка происходящего
    event.preventDefault();  // Полная остановка происходящего
        
        // var div_question = $('#new_question').last().html();
        //div_question = div_question.addClass('.form_questions').html();
        // console.log()
        // $('body').append("<p>" + id_question)
        $('body').append($('.form_questions').first().clone());
        // id_question = id_question + 1;
        // $('body').last().html(div_question);

    } 
    );

    $('.bt_answer_add').click(function( event ){
    event.stopPropagation(); // Остановка происходящего
    event.preventDefault();  // Полная остановка происходящего
        
        // var div_question = $('#new_question').last().html();
        //div_question = div_question.addClass('.form_questions').html();
        // console.log()
        // $('body').append("<p>" + id_question)
        // $(this).parent().append($('.form_questions').children('.div_answer').first().clone());
        $(this).parent().append($('#ex_ans').first().clone());
        // id_question = id_question + 1;
        // $('body').last().html(div_question);

    } 
    );


	// 	$('.db').click(function( event ){
 //    event.stopPropagation(); // Остановка происходящего
 //    event.preventDefault();  // Полная остановка происходящего

 //    var text_area = $('#txt_area').val();

 // 	$.ajax({
 //        url: './tf_idf_show.php',
 //        type: 'POST',
 //        data: {id: id, txt: text_area},
 //        dataType: 'text',
 //        success: function( respond, textStatus, jqXHR ){

 //            if( typeof respond.error === 'undefined' ){
 //            	console.log(respond);
 //            	var par = $.parseJSON(respond);
 //                console.log(par.files);

 //                $('.table_show').html(par.files);
 //            }
 //            else{
 //                console.log('ОШИБКИ ОТВЕТА сервера: ' + respond.error );
 //            }
 //        },
 //        error: function( jqXHR, textStatus, errorThrown ){
 //            console.log('ОШИБКИ AJAX запроса: ' + textStatus );
 //    }});
 // });

</script>

	<style>
table {
	   	border-collapse: collapse;
	   }
	   table td {
	   	border: 1px solid black;
	   	padding: 3px;
	   }

       #txt_area {
        width: 400px;
        height: 300px;
       }

       .visible{
            display: block;

        }
        .nonvisible{
            display: none;
        }
        .div_answer{
            padding: 10px;
        }
        .form_questions{
            border: solid 1px #eee;
            width: 450px;
        }
        input[type="text"]{
            width: 300px;
        }
	</style>
</html>