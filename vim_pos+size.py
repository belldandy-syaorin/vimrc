from win32api import GetSystemMetrics
import win32gui
import sys
import vim

resolution_w = GetSystemMetrics(0)
resolution_h = GetSystemMetrics(1)
hwnd = win32gui.GetActiveWindow()
vim_rect = win32gui.GetWindowRect(hwnd)
vim_rect_x = vim_rect[0]
vim_rect_y = vim_rect[1]
vim_rect_w = vim_rect[2] - vim_rect_x
vim_rect_h = vim_rect[3] - vim_rect_y
center_x = (resolution_w - vim_rect_w) / 2
center_y = (resolution_h - vim_rect_h) / 2
smart_x = [resolution_w / 3, resolution_w / 3 * 2, resolution_w, resolution_w - vim_rect_w]
smart_y = [resolution_h / 3, resolution_h / 3 * 2, resolution_h, resolution_h - vim_rect_h]
wincenter = [vim_rect_x + (vim_rect_w / 2), vim_rect_y + (vim_rect_h / 2)]
big = [1024, 768]
large = [1280, 960]

def vim_pos(x,y,z):
    win32gui.SetWindowPos(hwnd, 0, x, y, 0, 0, 0x0001 + 0x0004)
    vim.command("echo 'Vim_Pos ='"+str(z))

def vim_size(x,y):
    a = (resolution_w - x) / 2
    b = (resolution_h - y) / 2
    win32gui.SetWindowPos(hwnd, 0, a, b, x, y, 0x0004)
    vim.command("echo 'Vim_Size ='"+str(x)+" "+str(y))

def vim_top(z):
    win32gui.SetWindowPos(hwnd, z, 0, 0, 0, 0, 0x0001 + 0x0002)
    if z == -1:
        vim.command("echo 'Vim_Top = Enable'")
    elif z == -2:
        vim.command("echo 'Vim_Top = Disable'")

class vim_move:
    def posnum1(self):
        vim_pos(0,smart_y[3],1)
    def posnum4(self):
        vim_pos(0,center_y,4)
    def posnum7(self):
        vim_pos(0,0,7)
    def posnum2(self):
        vim_pos(center_x,smart_y[3],2)
    def posnum5(self):
        vim_pos(center_x,center_y,5)
    def posnum8(self):
        vim_pos(center_x,0,8)
    def posnum3(self):
        vim_pos(smart_x[3],smart_y[3],3)
    def posnum6(self):
        vim_pos(smart_x[3],center_y,6)
    def posnum9(self):
        vim_pos(smart_x[3],0,9)

def mode_normal():
    if vim_rect_x != center_x and vim_rect_y != center_y:
        vm.posnum5()
    elif vim_rect_x == center_x and vim_rect_y == center_y:
        vm.posnum4()
    elif vim_rect_x == 0 and vim_rect_y == center_y:
        vm.posnum6()
    elif vim_rect_x == smart_x[3] and vim_rect_y == center_y:
        vm.posnum5()

def mode_smart():
    if wincenter[0] >= 0 and wincenter[0] <= smart_x[0]:
        if wincenter[1] <= smart_y[0]:
            vm.posnum7()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.posnum4()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.posnum1()
    elif wincenter[0] >= smart_x[0] and wincenter[0] <= smart_x[1]:
        if wincenter[1] <= smart_y[0]:
            vm.posnum8()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.posnum5()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.posnum2()
    elif wincenter[0] >= smart_x[1] and wincenter[0] <= smart_x[2]:
        if wincenter[1] <= smart_y[0]:
            vm.posnum9()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.posnum6()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.posnum3()

def mode_big():
    vim_size(big[0],big[1])

def mode_large():
    vim_size(large[0],large[1])

def mode_default():
    vim.command("set columns=80")
    vim.command("set lines=25")
    vim.command("winpos 0 0")
    vim.command("echo 'Vim_Pos+Size = Default'")

def mode_top():
    vim_top(-1)

def mode_untop():
    vim_top(-2)

vm = vim_move()
selectmode = {'normal': mode_normal,
              'smart': mode_smart,
              'big': mode_big,
              'large': mode_large,
              'default': mode_default,
              'top': mode_top,
              'untop': mode_untop,
              'posnum1': vm.posnum1,
              'posnum2': vm.posnum2,
              'posnum3': vm.posnum3,
              'posnum4': vm.posnum4,
              'posnum5': vm.posnum5,
              'posnum6': vm.posnum6,
              'posnum7': vm.posnum7,
              'posnum8': vm.posnum8,
              'posnum9': vm.posnum9,
}
selectmode[sys.argv[0]]()
