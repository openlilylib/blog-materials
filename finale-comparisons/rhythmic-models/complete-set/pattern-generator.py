# This file isn't intended to be run
# but to inserted as a Frescobaldi Snippet

-*- python; indent: yes;

def pattern(index):
    """Generate a pattern from the
       binary representation of index"""
    res = ''
    pat = bin(index)[2:]
    # generate the beams
    first = pat.find('1')
    last = pat.rfind('1')
    notes = { '1': 'c2', '0': 'r2' }
    beams = { first: '[ ', last: '] ' }
    if (first == -1) or (first == last):
        first = last = -1
    for i in range(len(pat)):
        res += notes[pat[i]]
        res += beams.get(i, ' ')
    return res, str(len(pat))

content = ''
cnt = 0
for i in range(2, 128):
    pat, length = pattern(i)
    isNewTime = (i & (i - 1)) == 0 # a power of two
    isFourBars = cnt % 4 == 0
    
    # insert a line break after four bars
    if cnt != 0 and isFourBars:
       content += '\\break\n'
    # insert a exercise number after four bars or a time change
    if isNewTime or isFourBars:
        content += '\\mark \\default\n'
    # insert a time change when the length of the patterns changes
    if cnt != 0 and isNewTime:
        # optionally insert a break when there isn't already one
        if not (cnt == 0 or isFourBars):
           content += '\\break\n'
           cnt = 0
        content += '\\time ' + length + '/2\n'
    # collate the pattern
    content += pat  + ' | % ' + str(i) + '\n'
    cnt += 1

start = 'patterns = {\n'
end = '}'

text = 'patterns = {\n' + content + '}'