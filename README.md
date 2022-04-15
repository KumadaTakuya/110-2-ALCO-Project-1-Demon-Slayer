"# 110-2-ALCO-Project-1-Demon-Slayer" 
Introduction:
This project is about Demon Slayer (鬼滅之刃). The Sun Breathing (日之呼吸) is the first breath which is also the strongest technique against demons (鬼). Tanjiro Kamado (竈門炭治郎), the main character, is the only one who can use Sun Breathing.

In Chapter 192 of the Demon Slayer manga, the thirteenth type of sun breathing is finally ready to appear. The twelve types of sun breathing correspond to twelve o’clock one by one, and every twelve o’clock is a cycle, so it must be repeated. The mysterious thirteenth form (日之呼吸十三之型) is the form by repeating the sun breathing with the twelve forms to form a circle.
In order to predict the strength of the “Upper Moons”, the Demon Slayer Corps (鬼殺隊) recorded the damage formula that Tanjiro could cause by using the breath of the sun, and calculated the damage that could be caused by 
x
 times of use.

To defeat the final boss, a.k.a Muzan Kibutsuji (鬼舞辻無慘), Tanjiro needs to use the sun breathing by 100 times, but he still needs to defeat multiple forces in Infinity Tower (無限城) before he sees Muzan.
Assuming that Tanjiro needs to activate x times of sun breathing to defeat his opponent, the damage caused by Tanjiro’s activation of 
x
 times Sun Breathing to the opponent can be calculated by the following method:

F(x) = 
2 * x + F(x / 5), if x > 20;
F(x - 2) + F(x - 3), if 10 < x <= 20;
F(x - 1) + F(x - 2), if 1 < x <= 10;
5, if x = 1
1, if x = 0
-1, otherwise

Here we assume x is an integer. You are now asked to write a Recursive RISC-V Assembly Programming to calculate the damage of sun breathing. The program must use recursion as described above. It should only print the final value of F(x). The basic range of x is set x ≦ 99 (total 100 times).

For example:
Assume x is 3. By the equation shown above, the condition 1<x ≤10 holds for F(3) and the program has to calculate F(x-1) + F(x-2) = F(2) + F(1). Then the program will recursively calculate F(2) and F(1), respectively. F(2) also satisfy the condition 1<x ≤10 and will be calculated as F(2) = F(1) + F(0) = 5 + 1 = 6. We then obtain F(1) = 5. Finally, the recursive program will give the final result F(3) = F(2) + F(1) = 6 + 5 = 11.
