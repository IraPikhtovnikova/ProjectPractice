<?php
namespace App\Http\Controllers;
use App\Answer;
use App\Question;
use App\Test;
use Illuminate\Http\Request;
class APIController extends Controller
{
    public function test(Request $request)
    {
        $testname = $request->input('name');
        $questions = $request->input('questions');
        $test = new Test([
            'name' => $testname,
        ]);
        $test->save();
        foreach ($questions as $question) {
            if ($question['text'] != '') {
                $qstn = new Question(
                    [
                        'text' => $question['text'],
                    ]
                );
                $test->questions()->save($qstn);
                foreach ($question['answers'] as $answer) {
                    if ($answer['text'] != '') {
                        $correct = $answer['correct'] == 'true' ? 1 : 0;
                        $answr = new Answer([
                            'text' => $answer['text'],
                            'correct' => $correct,
                        ]);
                        $qstn->answers()->save($answr);
                    }
                    unset($answr);
                }
                unset($qstn);
            }
        }
        return response()->json([
            'data' => $test->id,
        ], 201);
    }
}