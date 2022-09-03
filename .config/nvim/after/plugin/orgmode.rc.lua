local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end

orgmode.setup({
	org_agenda_files = { "~/Documents/notes/home/*", "~/Documents/notes/work/*" },
	org_default_notes_file = "~/Documents/notes/org/refile.org",
})

--[[
https://github.com/akinsho/org-bullets.nvim
Conceal-based alternative
  A simpler conceal based alternative is:

  syntax match OrgHeadlineStar1 /^\*\ze\s/me=e-1 conceal cchar=◉ containedin=OrgHeadlineLevel1 contained
  syntax match OrgHeadlineStar2 /^\*\{2}\ze\s/me=e-1 conceal cchar=○ containedin=OrgHeadlineLevel2 contained
  syntax match OrgHeadlineStar3 /^\*\{3}\ze\s/me=e-1 conceal cchar=✸ containedin=OrgHeadlineLevel3 contained
  syntax match OrgHeadlineStar4 /^\*{4}\ze\s/me=e-1 conceal cchar=✿ containedin=OrgHeadlineLevel4 contained
]]
