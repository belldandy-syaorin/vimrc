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

if sys.argv[0] == "normal":
    if gvimrect_x != center_x and gvimrect_y != center_y:
        vim.command("let g:gvimwinpos_x="+str(center_x))
        vim.command("let g:gvimwinpos_y="+str(center_y))
        vim.command("let g:gvimwinpos_mode='center'")
    if gvimrect_x == center_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_left_x))
        vim.command("let g:gvimwinpos_y="+str(center_y))
        vim.command("let g:gvimwinpos_mode='center(left)'")
    if gvimrect_x == center_left_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_right_x))
        vim.command("let g:gvimwinpos_y="+str(center_y))
        vim.command("let g:gvimwinpos_mode='center(right)'")
    if gvimrect_x == center_right_x and gvimrect_y == center_y:
        vim.command("let g:gvimwinpos_x="+str(center_x))
        vim.command("let g:gvimwinpos_y="+str(center_y))
        vim.command("let g:gvimwinpos_mode='center'")
if sys.argv[0] == "smart":
    if wincenter[0] > 0 and wincenter[0] < smart_x[0]:
        vim.command("let g:gvimwinpos_x=0")
        if wincenter[1] < smart_y[0]:
            vim.command("let g:gvimwinpos_y=0")
            vim.command("let g:gvimwinpos_mode='smart(7)'")
        if wincenter[1] > smart_y[0] and wincenter[1] < smart_y[1]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[0]))
            vim.command("let g:gvimwinpos_mode='smart(4)'")
        if wincenter[1] > smart_y[1] and wincenter[1] < smart_y[2]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[1]))
            vim.command("let g:gvimwinpos_mode='smart(1)'")
    if wincenter[0] > smart_x[0] and wincenter[0] < smart_x[1]:
        vim.command("let g:gvimwinpos_x="+str(resmart_x[0]))
        if wincenter[1] < smart_y[0]:
            vim.command("let g:gvimwinpos_y=0")
            vim.command("let g:gvimwinpos_mode='smart(8)'")
        if wincenter[1] > smart_y[0] and wincenter[1] < smart_y[1]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[0]))
            vim.command("let g:gvimwinpos_mode='smart(5)'")
        if wincenter[1] > smart_y[1] and wincenter[1] < smart_y[2]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[1]))
            vim.command("let g:gvimwinpos_mode='smart(2)'")
    if wincenter[0] > smart_x[1] and wincenter[0] < smart_x[2]:
        vim.command("let g:gvimwinpos_x="+str(resmart_x[1]))
        if wincenter[1] < smart_y[0]:
            vim.command("let g:gvimwinpos_y=0")
            vim.command("let g:gvimwinpos_mode='smart(9)'")
        if wincenter[1] > smart_y[0] and wincenter[1] < smart_y[1]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[0]))
            vim.command("let g:gvimwinpos_mode='smart(6)'")
        if wincenter[1] > smart_y[1] and wincenter[1] < smart_y[2]:
            vim.command("let g:gvimwinpos_y="+str(resmart_y[1]))
            vim.command("let g:gvimwinpos_mode='smart(3)'")
