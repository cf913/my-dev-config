return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ensure = {
      'bash', 'c', 'css', 'diff', 'html', 'javascript', 'json',
      'lua', 'luadoc', 'luap', 'markdown', 'markdown_inline', 'python',
      'query', 'regex', 'rust', 'scss', 'toml', 'tsx', 'typescript',
      'vim', 'vimdoc', 'yaml',
    }
    require('nvim-treesitter').install(ensure)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end
        if not pcall(vim.treesitter.start, buf, lang) then return end
        if vim.treesitter.query.get(lang, 'indents') then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
