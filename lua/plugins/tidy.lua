-- TIDY-specific configurations
-- Custom projections for non-standard project structures

return {
  {
    'tpope/vim-rails',
    config = function()
      -- Custom projections for TIDY projects
      vim.g.rails_projections = {
        -- Samantha gem
        ['lib/samantha/samantha/*.rb'] = {
          test = { 'spec/samantha/{}_spec.rb' },
        },
        ['spec/samantha/*_spec.rb'] = {
          alternate = { 'lib/samantha/samantha/{}.rb' },
        },

        -- Nigel gem
        ['lib/nigel/*.rb'] = {
          test = { 'spec/nigel/{}_spec.rb' },
        },
        ['spec/nigel/*_spec.rb'] = {
          alternate = { 'lib/nigel/{}.rb' },
        },

        -- GoTidy API
        ['app/api/gotidy_api/*.rb'] = {
          test = { 'spec/api/{}_spec.rb' },
        },
        ['app/controllers/api/*.rb'] = {
          test = { 'spec/api/{}_spec.rb' },
        },
        ['spec/api/*_spec.rb'] = {
          alternate = {
            'app/api/{}.rb',
            'app/controllers/api/{}.rb',
            'app/api/gotidy_api/{}.rb',
          },
        },
      }
    end,
  },
}
