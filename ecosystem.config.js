module.exports = {
  apps: [
    {
      name: 'claude-ui',
      script: 'npm',
      args: 'run dev',
      cwd: '/Users/miya/projects/claudecodeui',
      watch: false,
      env: {
        NODE_ENV: 'development',
        PORT: 3008,
        VITE_PORT: 3009
      },
      error_file: '/Users/miya/projects/claudecodeui/logs/error.log',
      out_file: '/Users/miya/projects/claudecodeui/logs/out.log',
      log_file: '/Users/miya/projects/claudecodeui/logs/combined.log',
      time: true,
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      restart_delay: 4000,
      kill_timeout: 3000
    }
  ]
};