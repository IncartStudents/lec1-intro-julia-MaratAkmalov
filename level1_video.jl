# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции



#  
println("Задание №1")

123
456;


my_answer = 42
typeof(my_answer)

my_pi = 3.14159
typeof(my_pi)

my_name = "Marat"
typeof(my_name)

my_answer = my_name
typeof(my_answer)

# комментарий
#=
комментарий
=#

# Синтаксиси баз. математика
sum = 3+7
dif = 10-3
prod = 3*3
dev = 12/3
power = 2^2
modules = 101%2

# Работа со строками
s1 = " Я строка."
s2 = """Я тоже  строка."""   

#"Тут вывод с "ошибкой""
s3 = """ Вывод без "ошибки" """


typeof('a') # символ - char
typeof("a") # string

# Sring inerpolition
name = "Marat"
age = 22
weight = 77.2


println("Привет, меня зовут $name ")
println("Мой возраст $age года и вес $weight кг.")
println("Два умнодить на два равно $(2*2)")

string("Сколько сейчас времени", "в Москве?")
string("Я не знаю, но примерно ", 12, " часов дня")

# В julia можно использовать * для интерпритации строка
s3 = "Сколько стоит ";
s4 = " 10 кг мороженного"

s3*s4
"$s3$s4"

# Стуктуры данных
    #=
    1. Массив
    2. Кортеж - группа элементов: - неизменные
    3. Словари - оссиоцитивные массив - хранит "ключ - значения"
    =#

# Dictionaries

mybook = Dict("My" => "8(999)474-05-66", "Ivan" => "8(999)555-44-33")
mybook["mom"] = "8(999)111-11-11" # Добавляем в словрь новый ключ - значение
mybook # проверяем что записано в словарь - должно быть три ключа - три значени
# В данном примере строка строка
mybook["My"]    # Вывод номера указанного в ключе 

# pop! - удаляет из словаря ключ-значение
pop!(mybook, "Ivan")
mybook      # Проверяем, что в словере нет ключа-Ivan
#mybook[1]   #Если словраь строка-строка образение по индуксу не вомзожно


#кортежи - tuples
myanimals = ("Кот", "Собака", "Слон")
myanimals[2]
#myanimals[1] = "Черепаха"   # Ошибка кортежим - неизменны

# Массивы - arrays
# Массив -строки
myfreinds = ["maksim","Ivan", "Vika"] # Вектор из строка
a = [1, 2, 3, 4]
b = [1.0, 2, 3, 5]
c = [1.0, 2, "Hi"]
b[2]
#b[3] = "Maksim"  # Будет ошибка
c[1]
c[2]
typeof(c[2])
c[2] = "Ivam"
typeof(c[2])

push!(c, 21, a) #Добавили
pop!(c)     #Удалили посл.
c   #Вывод результат

# Массив-Массив
fav = [["eggs", "apples", "carrot"],["ten", "five"]]
num = [[1,2,3],[123],[12,3]]

rand(4,3)
rand(4,3,2)

# Loops 

n = 0
while n<10
    n+=1
    println(n)
end

for n in 1:10
    println(n)
end

m,n = 5,4
A = zeros(m,n)

for i in 1:m
    for j in 1:n
        A[i,j] = i+j
    end
end
B = zeros(m,n)
for i in 1:m, j in 1:n
    B[i,j] = i+j-1
end
C = [i+j for  i in 1:m, j in 1:n]

for n in 1:10
    Aa =  [i+j-1 for  i in 1:n, j in 1:n]
    display(Aa)
end


# Conditionals
x = rand()
y = 0.1

println("Test: X><=Y ?")
if x>y
    println("Answer: X > Y")
elseif y<x
    println("Answer: Y < X")
else
    println("Answer: X = Y")
end

(x>y) ? x : y

(x>y) && println("$x large than $y")
(x<y) && println("$x large than $y")

#Functions
function add(a, b)
    a+b
end
add(2,3)
add2(a,b) = a+b;
add2(3, 6)
add3 = (a, b) -> a+b
add3(3,2)
sayhi = name -> ("Hi, $name")
sayhi("Maria")
sayhi(111)
A = rand(2,2)
B = rand(1,2)
add(A, A)
#add2(A, B)  # Ошиька

# mutating и non-mutating   
    # Пояснение 
    #=
        c ! - мутирующие, то есть изменяют содержимое аргументов или аргумента
        без ! - немутирующие - не изменяют свои аргументы
    =#

v = [3,2,5]
sort(v)
display(v)
sort!(v)
display(v)

# Brodcasting - 
A = [i + 3*j for j in 0:2, i in 1:3]
f = a -> a*a
f(A)
B = f.(A)

# Packages - Pkg
using Pkg
#Pkg.add("Example")
using Example
hello("Anna")

#Pkg.add("Colors")
using Colors
palette = distinguishable_colors(100)
rand(palette,3,3)

# Plots
#Pkg.add("Plots")
using Plots

fs = 1e3
f = 10
ts= 1/fs

t = 0:ts:2
y = cos.(2*pi*f.*t)

gr()        # статический график
plot(t,y,
    label="Sin",
    xlabel="time, sec",
    ylabel="y(t), V",
    xlims=(0, 0.05))
scatter!(t,y,
    label="samples")

#Pkg.add("PlotlyJS")
#plotlyjs()  # динамические график
plot(t,y,
    label="Sin",
    xlabel="time, sec",
    ylabel="y(t), V",
    xlims=(0, 1))
scatter!(t,y,
    label="samples")


p1 = plot(t,y)
p2 = plot(t,2*y)

plot(p1,p2,layout=(2,1),legend=false)
    