from win32api import GetSystemMetrics
import win32gui
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
if gvimrect_x != center_x and gvimrect_y != center_y:
        vim.command("let g:gvimwinpos_x="+str(center_x))
        vim.command("let g:gvimwinpos_y="+str(center_y))
        vim.command("let g:gvimwinpos_mode='center'")
if gvimrect_x == center_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_left_x))
        vim.command("let g:gvimwinpos_mode='center(left)'")
if gvimrect_x == center_left_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_right_x))
        vim.command("let g:gvimwinpos_mode='center(right)'")
if gvimrect_x == center_right_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_x))
        vim.command("let g:gvimwinpos_mode='center'")
