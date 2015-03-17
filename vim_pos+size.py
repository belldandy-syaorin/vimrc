from win32api import GetCursorPos
from win32api import GetSystemMetrics
# from PyQt4 import QtGui
import sys , vim , win32gui

"""
app = QtGui.QApplication([])
resolution_w = QtGui.QDesktopWidget().screenGeometry().width()
resolution_h = QtGui.QDesktopWidget().screenGeometry().height()
"""
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
wincenter = GetCursorPos()
# wincenter = [QtGui.QCursor().pos().x() , QtGui.QCursor().pos().y()]
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
    def position1(self):
        vim_pos(0,smart_y[3],1)
    def position4(self):
        vim_pos(0,center_y,4)
    def position7(self):
        vim_pos(0,0,7)
    def position2(self):
        vim_pos(center_x,smart_y[3],2)
    def position5(self):
        vim_pos(center_x,center_y,5)
    def position8(self):
        vim_pos(center_x,0,8)
    def position3(self):
        vim_pos(smart_x[3],smart_y[3],3)
    def position6(self):
        vim_pos(smart_x[3],center_y,6)
    def position9(self):
        vim_pos(smart_x[3],0,9)

def mode_normal():
    if vim_rect_x != center_x and vim_rect_y != center_y:
        vm.position5()
    elif vim_rect_y == center_y:
        if vim_rect_x == center_x:
            vm.position4()
        elif vim_rect_x == 0:
            vm.position6()
        elif vim_rect_x == smart_x[3]:
            vm.position5()
    elif vim_rect_x == center_x:
        if vim_rect_y == 0 or vim_rect_y == smart_y[3]:
            vm.position5()

def mode_smart():
    if wincenter[0] >= 0 and wincenter[0] <= smart_x[0]:
        if wincenter[1] <= smart_y[0]:
            vm.position7()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.position4()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.position1()
    elif wincenter[0] >= smart_x[0] and wincenter[0] <= smart_x[1]:
        if wincenter[1] <= smart_y[0]:
            vm.position8()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.position5()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.position2()
    elif wincenter[0] >= smart_x[1] and wincenter[0] <= smart_x[2]:
        if wincenter[1] <= smart_y[0]:
            vm.position9()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            vm.position6()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            vm.position3()

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
              'position1': vm.position1,
              'position2': vm.position2,
              'position3': vm.position3,
              'position4': vm.position4,
              'position5': vm.position5,
              'position6': vm.position6,
              'position7': vm.position7,
              'position8': vm.position8,
              'position9': vm.position9,
}
selectmode[sys.argv[0]]()
