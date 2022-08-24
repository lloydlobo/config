local status_ok, db = pcall(require, "dashboard")

if (not status_ok) then
    return
end

-- https://github.com/folke/dot/blob/master/config/nvim/lua/config/dashboard.lua
local logo = {
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

logo = [[
                                                        *                  
     *                                                          *          
                                  *                  *        .--.         
      \/ \/  \/  \/                                        ./   /=*        
        \/     \/      *            *                ...  (_____)          
         \ ^ ^/                                       \ \_((^o^))-.     *  
         (o)(O)--)--------\.                           \   (   ) \  \._.   
         |    |  ||================((~~~~~~~~~~~~~~~~~))|   ( )   |     \  
          \__/             ,|        \. * * * * * * ./  (~~~~~~~~~~~)    \ 
   *        ||^||\.____./|| |          \___________/     ~||~~~~|~'\____/ *
            || ||     || || A            ||    ||          ||    |   jurcy 
     *      <> <>     <> <>          (___||____||_____)   ((~~~~~|   *     
]]

logo = [[
                               _                         
                           ,--.\`-. __                   
                         _,.`. \:/,"  `-._               
                     ,-*" _,.-;-*`-.+"*._ )              
                    ( ,."* ,-" / `.  \.  `.              
                   ,"   ,;"  ,"\../\  \:   \             
                  (   ,"/   / \.,' :   ))  /             
                   \  |/   / \.,'  /  // ,'              
                    \_)\ ,' \.,'  (  / )/                
                        `  \._,'   `"                    
                           \../                          
                           \../                          
                 ~        ~\../           ~~             
          ~~          ~~   \../   ~~   ~      ~~         
     ~~    ~   ~~  __...---\../-...__ ~~~     ~~         
       ~~~~  ~_,--'        \../      `--.__ ~~    ~~     
   ~~~  __,--'              `"             `--.__   ~~~  
~~  ,--'                                         `--.    
   '------......______             ______......------` ~~
 ~~~   ~    ~~      ~ `````---"""""  ~~   ~     ~~       
        ~~~~    ~~  ~~~~       ~~~~~~  ~ ~~   ~~ ~~~  ~  
     ~~   ~   ~~~     ~~~ ~         ~~       ~~   SSt    
              ~        ~~       ~~~       ~              
]]

local lines = {}
for line in logo:gmatch("[^\n]+") do
  table.insert(lines, line)
end

db.custom_header = lines

vim.g.dashboard_custom_header = lines

vim.g.dashboard_custom_shortcut = {
  ["last_session"] = "SPC s l",
  ["find_history"] = "SPC f r",
  ["find_file"] = "SPC spc",
  ["new_file"] = "SPC f n",
  ["change_colorscheme"] = "SPC h c",
  ["find_word"] = "SPC f g",
  ["book_marks"] = "SPC f b",
}

-- local api = vim.api
-- local db = require('dashboard')
-- 
-- local dashboard_start = api.nvim_create_augroup('dashboard_start', { clear = true })
-- 
-- api.nvim_create_autocmd('Vimenter', {
--   group = dashboard_start,
--   nested = true,
--   callback = function()
--     if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 and not db.disable_at_vimenter then
--       db:instance(true)
--     end
--   end,
-- })
-- 
-- api.nvim_create_autocmd('FileType', {
--   group = dashboard_start,
--   pattern = 'dashboard',
--   callback = function()
--     if db.hide_statusline then
--       vim.opt.laststatus = 0
--     end
-- 
--     if db.hide_tabline then
--       vim.opt.showtabline = 0
--     end
--   end,
-- })
-- 
-- api.nvim_create_user_command('Dashboard', function()
--   require('dashboard'):instance(false)
-- end, {})
-- 
-- api.nvim_create_user_command('DashboardNewFile', function()
--   require('dashboard').new_file()
-- end, {})
-- 
-- api.nvim_create_user_command('SessionSave', function()
--   require('dashboard.session').session_save()
-- end, {
--   nargs = '?',
--   complete = require('dashboard.session').session_list,
-- })
-- 
-- api.nvim_create_user_command('SessionLoad', function()
--   require('dashboard.session').session_load()
-- end, {
--   nargs = '?',
--   complete = require('dashboard.session').session_list,
-- })
-- 
-- https://github.com/glepnir/dashboard-nvim
-- lolcat ascii dashboard
-- local home = os.getenv('HOME')
-- -- macos
-- db.preview_command = 'cat | lolcat -F 0.3'
-- -- linux
-- db.preview_command = 'ueberzug'
-- --
-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
-- db.preview_file_height = 12
-- db.preview_file_width = 80
-- db.custom_center = {
--     {icon = '  ',
--     desc = 'Recently latest session                  ',
--     shortcut = 'SPC s l',
--     action ='SessionLoad'},
--     {icon = '  ',
--     desc = 'Recently opened files                   ',
--     action =  'DashboardFindHistory',
--     shortcut = 'SPC f h'},
--     {icon = '  ',
--     desc = 'Find  File                              ',
--     action = 'Telescope find_files find_command=rg,--hidden,--files',
--     shortcut = 'SPC f f'},
--     {icon = '  ',
--     desc ='File Browser                            ',
--     action =  'Telescope file_browser',
--     shortcut = 'SPC f b'},
--     {icon = '  ',
--     desc = 'Find  word                              ',
--     action = 'Telescope live_grep',
--     shortcut = 'SPC f w'},
--     {icon = '  ',
--     desc = 'Open Personal dotfiles                  ',
--     action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
--     shortcut = 'SPC f d'},
--   }
