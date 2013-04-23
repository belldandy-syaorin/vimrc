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
center = [(resolution_w - gvimrect_w) / 2, 0, resolution_w - gvimrect_w]
center_y = (resolution_h - gvimrect_h) / 2
smart_x = [resolution_w / 3, resolution_w / 3 * 2, resolution_w]
smart_y = [resolution_h / 3, resolution_h / 3 * 2, resolution_h]
wincenter = [gvimrect_x + (gvimrect_w / 2), gvimrect_y + (gvimrect_h / 2)]
resmart_x = [(resolution_w - gvimrect_w) / 2,resolution_w - gvimrect_w]
resmart_y = [(resolution_h - gvimrect_h) / 2,resolution_h - gvimrect_h]
big = [1024, 768]
large = [1280, 960]

def vim_pos(x,y,z):
    vim.command("let g:vim_pos_x="+str(x))
    vim.command("let g:vim_pos_y="+str(y))
    vim.command("let g:vim_pos_mode="+str(z))

def vim_size(x,y):
    a = (resolution_w - x) / 2
    b = (resolution_h - y) / 2
    win32gui.SetWindowPos(hwnd, 0, a, b, x, y, 0x0004)
    vim.command("let g:vim_size_x="+str(x))
    vim.command("let g:vim_size_y="+str(y))

def mode_normal():
    if gvimrect_x != center[0] and gvimrect_y != center_y:
        vim_pos(center[0],center_y,5)
    elif gvimrect_x == center[0] and gvimrect_y == center_y:
        vim_pos(center[1],center_y,4)
    elif gvimrect_x == center[1] and gvimrect_y == center_y:
        vim_pos(center[2],center_y,6)
    elif gvimrect_x == center[2] and gvimrect_y == center_y:
        vim_pos(center[0],center_y,5)

def mode_smart():
   if wincenter[0] >= 0 and wincenter[0] <= smart_x[0]:
       if wincenter[1] <= smart_y[0]:
           vim_pos(0,0,7)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vim_pos(0,resmart_y[0],4)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vim_pos(0,resmart_y[1],1)
   elif wincenter[0] >= smart_x[0] and wincenter[0] <= smart_x[1]:
       if wincenter[1] <= smart_y[0]:
           vim_pos(resmart_x[0],0,8)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vim_pos(resmart_x[0],resmart_y[0],5)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vim_pos(resmart_x[0],resmart_y[1],2)
   elif wincenter[0] >= smart_x[1] and wincenter[0] <= smart_x[2]:
       if wincenter[1] <= smart_y[0]:
           vim_pos(resmart_x[1],0,9)
       elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
           vim_pos(resmart_x[1],resmart_y[0],6)
       elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
           vim_pos(resmart_x[1],resmart_y[1],3)

def mode_big():
    vim_size(big[0],big[1])

def mode_large():
    vim_size(large[0],large[1])

selectmode = {'normal': mode_normal,
              'smart': mode_smart,
              'big': mode_big,
              'large': mode_large,
}
selectmode[sys.argv[0]]()
