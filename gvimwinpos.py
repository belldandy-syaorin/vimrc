from win32api import GetSystemMetrics
import win32gui
import sys
import vim

resolution_w = GetSystemMetrics(0)
resolution_h = GetSystemMetrics(1)
hwnd = win32gui.GetActiveWindow()
gvimrect = win32gui.GetWindowRect(hwnd)
gvimrect_x = gvimrect[0]
gvimrect_y = gvimrect[1]
gvimrect_w = gvimrect[2] - gvimrect_x
gvimrect_h = gvimrect[3] - gvimrect_y
center_x = (resolution_w - gvimrect_w) / 2
center_y = (resolution_h - gvimrect_h) / 2
center_left_x = 0
center_right_x = (resolution_w - gvimrect_w)
smart_x = [resolution_w / 3, resolution_w / 3 * 2, resolution_w]
smart_y = [resolution_h / 3, resolution_h / 3 * 2, resolution_h]
wincenter = [gvimrect_x + (gvimrect_w / 2), gvimrect_y + (gvimrect_h / 2)]
resmart_x = [(resolution_w - gvimrect_w) / 2,resolution_w - gvimrect_w]
resmart_y = [(resolution_h - gvimrect_h) / 2,resolution_h - gvimrect_h]
big_x = 1024
big_y = 768
large_x = 1280
large_y = 960

def vimargument(x,y,z):
    vim.command("let g:gvimwinpos_x="+str(x))
    vim.command("let g:gvimwinpos_y="+str(y))
    vim.command("let g:gvimwinpos_mode="+str(z))

def vimsize(x,y):
    a = (resolution_w - x) / 2
    b = (resolution_h - y) / 2
    win32gui.SetWindowPos(hwnd, 0, a, b, x, y, 0x0004)
    vim.command("let g:gvimwinsize_x="+str(x))
    vim.command("let g:gvimwinsize_y="+str(y))

def mode_normal():
    if gvimrect_x != center_x and gvimrect_y != center_y:
        vimargument(center_x,center_y,5)
    elif gvimrect_x == center_x and gvimrect_y == center_y:
        vimargument(center_left_x,center_y,4)
    elif gvimrect_x == center_left_x and gvimrect_y == center_y:
        vimargument(center_right_x,center_y,6)
    elif gvimrect_x == center_right_x and gvimrect_y == center_y:
        vimargument(center_x,center_y,5)

def mode_smart():
   if wincenter[0] >= 0 and wincenter[0] <= smart_x[0]:
       if wincenter[1] <= smart_y[0]:
           vimargument(0,0,7)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vimargument(0,resmart_y[0],4)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vimargument(0,resmart_y[1],1)
   elif wincenter[0] >= smart_x[0] and wincenter[0] <= smart_x[1]:
       if wincenter[1] <= smart_y[0]:
           vimargument(resmart_x[0],0,8)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vimargument(resmart_x[0],resmart_y[0],5)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vimargument(resmart_x[0],resmart_y[1],2)
   elif wincenter[0] >= smart_x[1] and wincenter[0] <= smart_x[2]:
       if wincenter[1] <= smart_y[0]:
           vimargument(resmart_x[1],0,9)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vimargument(resmart_x[1],resmart_y[0],6)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vimargument(resmart_x[1],resmart_y[1],3)

def mode_big():
    vimsize(big_x,big_y)

def mode_large():
    vimsize(large_x,large_y)

selectmode = {'normal': mode_normal,
              'smart': mode_smart,
              'big': mode_big,
              'large': mode_large,
}
selectmode[sys.argv[0]]()
