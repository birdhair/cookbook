import os
import random
from tkinter import *
from tkinter import ttk
import tkinter as tk
from tkinter import Menu

random = ['a', 'b', 'c', 'd', 'e']

karagge = [ '1lb chicken, 2 tablespoon sake, 2 tablespoon soy sauce, 1 clove garlic grated, 2 tablespoon ginger, 1 tablespoon rice vineger, cut chicken into 1 inch cubes, add the ginger, garlic, soy sauce, sake and sugar to a bowl and whisk to combine, Add the chicken, coat evenly.'
]

braised = [ ' 2lb beef cheeks, olive oil, for frying, 1 onion, peeled and finely chopped, 4 garlic cloves crushed, 1 & 1/2 cups red wine, 1 can chopped tomato, 2 cups beef stock, dried pappardelle, handful of parsley, finely chopped, sea salt & cracked black pepper '
]

beef = [ 'for the filling:, 1 ⅓ cups roughly chopped scallions, 2/3 cup diced white onion, 4 teaspoons fresh thyme leaves, 4 teaspoons paprika'
'2 teaspoons garlic powder, 2 teaspoons onion powder, 2 teaspoons ground allspice (pimento berries), 1 garlic clove, minced',
'1 scotch bonnet pepper (depends on how hot the pepper is), stemmed and thinly sliced',
'1 (3/4-inch) piece peeled ginger',
'2 teaspoons olive oil'
'2 pounds ground beef'
'2/3 cup fresh breadcrumbs',
'2/3 cup beef stock'
'2 tablespoons browning (burnt brown sugar)',
'2 teaspoons kosher salt',
'1/2 teaspoon ground black pepper',
'4 3/4 teaspoons instant unflavored gelatin',

'for the crust:, 4 cups all-purpose flour, 7 teaspoons granulated sugar, 5 teaspoons ground turmeric, 1 1/2 teaspoons curry powder, 1 1/2 teaspoons kosher salt',
'¼ teaspoon baking powder',
'1/2 cup|95 grams cold shortening',
'1 1/2 cups|345 grams cold beef suet',
'1 tablespoon white vinegar',
'1 large egg'
]
def get_random_reciepe():
    global Random
    label.insert(random.choice(random))

def get_reciepe():
    Reciepe = entry.get()
    global karagge
    global braised
    global beef

    if Reciepe == 'karagge':
        label.insert(END, karagge, ' \n')

    elif Reciepe == 'braised beef':
        label.insert(END, braised)

    elif Reciepe == 'beef patty':
        label.insert(END, beef)

    elif Reciepe != 'karagge, braised, beef':
        label.insert(END, "you cant beat me lauren"'\n')

HEIGHT = 900
WIDTH = 700
root = tk.Tk()
#////////////////////////////////////
root.title("Welcome to reciepe app")
menu = Menu(root)
new_item = Menu(menu)
new_item.add_command(label='Menu', command=lambda : create_window(menu))
new_item.add_command(label='random', command=lambda : create_window(random))
menu.add_cascade(label='File', menu=new_item)
root.config(menu=menu)

def create_window(menu):
        t = Toplevel(menu)
        #t2 = Toplevel(random)
        t.wm_title("Menu")
        l = tk.Label(t, text="karagge"'\n'"braised beef" '\n' "beef patty")
        l.pack(side="top", fill="both", expand=True, padx=100, pady=100)
        dismissbutton = Button(t, text="dismiss", command=t.destroy).pack()
#////////////////////////////////////
canvas = tk.Canvas(root, height=HEIGHT, width=WIDTH)
canvas.pack()

background_image = tk.PhotoImage(file='background.png')
background_label = tk.Label(root, image=background_image)
background_label.place(relheight=1, relwidth=1)

frame = tk.Frame(root, bg='#80c1ff', bd=5)
frame.place(relx=0.5, rely=0.1, relwidth=0.75, relheight=0.1, anchor='n')

entry = tk.Entry(frame, font=40)
entry.place(relwidth=0.65, relheight=1)

button = tk.Button(frame, text="Get Reciepe", font=40, command=lambda : clear_widget_text(label))
button.place(relx=0.7, relheight=1, relwidth=0.3)
button.config(command=get_reciepe)

lower_frame = tk.Frame(root, bg='#80c1ff', bd=10)
lower_frame.place(relx=0.5, rely=0.25, relwidth=0.75, relheight=0.6, anchor='n')

button2 = tk.Button(lower_frame, text="Get Random Reciepe", font=40, command=lambda : clear_widget_text(label))
button2.pack()
button2.config(command=get_random_reciepe)


#label = tk.Label(lower_frame)
label = Text(lower_frame)
label.place(relwidth=1, relheight=1)

header = tk.Label(root, text='kevins reciepe book', font=40, bg='black')
header.pack()

root.mainloop()
