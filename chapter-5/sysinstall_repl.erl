c("chapter-4/frequency.erl").
c("chapter-5/custom_tracing_fun.erl").
F = fun custom_tracing_fun:f/3.
frequency:start().
sys:install(frequency, {F, 1}).
frequency:allocate().
frequency:allocate().
frequency:allocate().
frequency:allocate().
frequency:allocate().
frequency:allocate().
frequency:allocate().
sys:remove(frequency, F).