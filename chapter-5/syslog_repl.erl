compile("chapter-4/frequency.erl").
frequency:start().
sys:trace(frequency, true).
frequency:allocate().
frequency:allocate().
sys:trace(frequency, false).
sys:log(frequency, true).
frequency:allocate().
frequency:allocate().
sys:log(frequency, print).
sys:log(frequency, get).