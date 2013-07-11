patterns =
#(define-music-function (parser location layer) (number?)
   (set! denominator layer)
   #{
     \time 2/2
     \newExercise 2
     c2 r2  | % 2
     c2[ c2]  | % 3
     \time 3/2
     \newExercise 3
     c2 r2 r2  | % 4
     c2[ r2 c2]  | % 5
     c2[ c2] r2  | % 6
     c2[ c2 c2]  | % 7
     \time 4/2
     \newExercise 4
     c2 r2 r2 r2  | % 8
     c2[ r2 r2 c2]  | % 9
     c2[ r2 c2] r2  | % 10
     c2[ r2 c2 c2]  | % 11
     \newExercise 4
     c2[ c2] r2 r2  | % 12
     c2[ c2 r2 c2]  | % 13
     c2[ c2 c2] r2  | % 14
     c2[ c2 c2 c2]  | % 15
     \time 5/2
     \newExercise 5
     c2 r2 r2 r2 r2  | % 16
     c2[ r2 r2 r2 c2]  | % 17
     c2[ r2 r2 c2] r2  | % 18
     c2[ r2 r2 c2 c2]  | % 19
     \newExercise 5
     c2[ r2 c2] r2 r2  | % 20
     c2[ r2 c2 r2 c2]  | % 21
     c2[ r2 c2 c2] r2  | % 22
     c2[ r2 c2 c2 c2]  | % 23
     \newExercise 5
     c2[ c2] r2 r2 r2  | % 24
     c2[ c2 r2 r2 c2]  | % 25
     c2[ c2 r2 c2] r2  | % 26
     c2[ c2 r2 c2 c2]  | % 27
     \newExercise 5
     c2[ c2 c2] r2 r2  | % 28
     c2[ c2 c2 r2 c2]  | % 29
     c2[ c2 c2 c2] r2  | % 30
     c2[ c2 c2 c2 c2]  | % 31
     \time 6/2
     \newExercise 6
     c2 r2 r2 r2 r2 r2  | % 32
     c2[ r2 r2 r2 r2 c2]  | % 33
     c2[ r2 r2 r2 c2] r2  | % 34
     c2[ r2 r2 r2 c2 c2]  | % 35
     \newExercise 6
     c2[ r2 r2 c2] r2 r2  | % 36
     c2[ r2 r2 c2 r2 c2]  | % 37
     c2[ r2 r2 c2 c2] r2  | % 38
     c2[ r2 r2 c2 c2 c2]  | % 39
     \newExercise 6
     c2[ r2 c2] r2 r2 r2  | % 40
     c2[ r2 c2 r2 r2 c2]  | % 41
     c2[ r2 c2 r2 c2] r2  | % 42
     c2[ r2 c2 r2 c2 c2]  | % 43
     \newExercise 6
     c2[ r2 c2 c2] r2 r2  | % 44
     c2[ r2 c2 c2 r2 c2]  | % 45
     c2[ r2 c2 c2 c2] r2  | % 46
     c2[ r2 c2 c2 c2 c2]  | % 47
     \newExercise 6
     c2[ c2] r2 r2 r2 r2  | % 48
     c2[ c2 r2 r2 r2 c2]  | % 49
     c2[ c2 r2 r2 c2] r2  | % 50
     c2[ c2 r2 r2 c2 c2]  | % 51
     \newExercise 6
     c2[ c2 r2 c2] r2 r2  | % 52
     c2[ c2 r2 c2 r2 c2]  | % 53
     c2[ c2 r2 c2 c2] r2  | % 54
     c2[ c2 r2 c2 c2 c2]  | % 55
     \newExercise 6
     c2[ c2 c2] r2 r2 r2  | % 56
     c2[ c2 c2 r2 r2 c2]  | % 57
     c2[ c2 c2 r2 c2] r2  | % 58
     c2[ c2 c2 r2 c2 c2]  | % 59
     \newExercise 6
     c2[ c2 c2 c2] r2 r2  | % 60
     c2[ c2 c2 c2 r2 c2]  | % 61
     c2[ c2 c2 c2 c2] r2  | % 62
     c2[ c2 c2 c2 c2 c2]  | % 63
     \time 7/2
     \newExercise 7
     c2 r2 r2 r2 r2 r2 r2  | % 64
     c2[ r2 r2 r2 r2 r2 c2]  | % 65
     c2[ r2 r2 r2 r2 c2] r2  | % 66
     c2[ r2 r2 r2 r2 c2 c2]  | % 67
     \newExercise 7
     c2[ r2 r2 r2 c2] r2 r2  | % 68
     c2[ r2 r2 r2 c2 r2 c2]  | % 69
     c2[ r2 r2 r2 c2 c2] r2  | % 70
     c2[ r2 r2 r2 c2 c2 c2]  | % 71
     \newExercise 7
     c2[ r2 r2 c2] r2 r2 r2  | % 72
     c2[ r2 r2 c2 r2 r2 c2]  | % 73
     c2[ r2 r2 c2 r2 c2] r2  | % 74
     c2[ r2 r2 c2 r2 c2 c2]  | % 75
     \newExercise 7
     c2[ r2 r2 c2 c2] r2 r2  | % 76
     c2[ r2 r2 c2 c2 r2 c2]  | % 77
     c2[ r2 r2 c2 c2 c2] r2  | % 78
     c2[ r2 r2 c2 c2 c2 c2]  | % 79
     \newExercise 7
     c2[ r2 c2] r2 r2 r2 r2  | % 80
     c2[ r2 c2 r2 r2 r2 c2]  | % 81
     c2[ r2 c2 r2 r2 c2] r2  | % 82
     c2[ r2 c2 r2 r2 c2 c2]  | % 83
     \newExercise 7
     c2[ r2 c2 r2 c2] r2 r2  | % 84
     c2[ r2 c2 r2 c2 r2 c2]  | % 85
     c2[ r2 c2 r2 c2 c2] r2  | % 86
     c2[ r2 c2 r2 c2 c2 c2]  | % 87
     \newExercise 7
     c2[ r2 c2 c2] r2 r2 r2  | % 88
     c2[ r2 c2 c2 r2 r2 c2]  | % 89
     c2[ r2 c2 c2 r2 c2] r2  | % 90
     c2[ r2 c2 c2 r2 c2 c2]  | % 91
     \newExercise 7
     c2[ r2 c2 c2 c2] r2 r2  | % 92
     c2[ r2 c2 c2 c2 r2 c2]  | % 93
     c2[ r2 c2 c2 c2 c2] r2  | % 94
     c2[ r2 c2 c2 c2 c2 c2]  | % 95
     \newExercise 7
     c2[ c2] r2 r2 r2 r2 r2  | % 96
     c2[ c2 r2 r2 r2 r2 c2]  | % 97
     c2[ c2 r2 r2 r2 c2] r2  | % 98
     c2[ c2 r2 r2 r2 c2 c2]  | % 99
     \newExercise 7
     c2[ c2 r2 r2 c2] r2 r2  | % 100
     c2[ c2 r2 r2 c2 r2 c2]  | % 101
     c2[ c2 r2 r2 c2 c2] r2  | % 102
     c2[ c2 r2 r2 c2 c2 c2]  | % 103
     \newExercise 7
     c2[ c2 r2 c2] r2 r2 r2  | % 104
     c2[ c2 r2 c2 r2 r2 c2]  | % 105
     c2[ c2 r2 c2 r2 c2] r2  | % 106
     c2[ c2 r2 c2 r2 c2 c2]  | % 107
     \newExercise 7
     c2[ c2 r2 c2 c2] r2 r2  | % 108
     c2[ c2 r2 c2 c2 r2 c2]  | % 109
     c2[ c2 r2 c2 c2 c2] r2  | % 110
     c2[ c2 r2 c2 c2 c2 c2]  | % 111
     \newExercise 7
     c2[ c2 c2] r2 r2 r2 r2  | % 112
     c2[ c2 c2 r2 r2 r2 c2]  | % 113
     c2[ c2 c2 r2 r2 c2] r2  | % 114
     c2[ c2 c2 r2 r2 c2 c2]  | % 115
     \newExercise 7
     c2[ c2 c2 r2 c2] r2 r2  | % 116
     c2[ c2 c2 r2 c2 r2 c2]  | % 117
     c2[ c2 c2 r2 c2 c2] r2  | % 118
     c2[ c2 c2 r2 c2 c2 c2]  | % 119
     \newExercise 7
     c2[ c2 c2 c2] r2 r2 r2  | % 120
     c2[ c2 c2 c2 r2 r2 c2]  | % 121
     c2[ c2 c2 c2 r2 c2] r2  | % 122
     c2[ c2 c2 c2 r2 c2 c2]  | % 123
     \newExercise 7
     c2[ c2 c2 c2 c2] r2 r2  | % 124
     c2[ c2 c2 c2 c2 r2 c2]  | % 125
     c2[ c2 c2 c2 c2 c2] r2  | % 126
     c2[ c2 c2 c2 c2 c2 c2]  | % 127
   #})
