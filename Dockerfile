<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Media Server Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .sidebar {
            transition: all 0.3s ease;
        }
        .sidebar.collapsed {
            width: 70px;
        }
        .sidebar.collapsed .nav-text {
            display: none;
        }
        .sidebar.collapsed .logo-text {
            display: none;
        }
        .content {
            transition: margin-left 0.3s ease;
        }
        .dark-mode {
            background-color: #1a202c;
            color: #f7fafc;
        }
        .dark-mode .sidebar {
            background-color: #2d3748;
        }
        .dark-mode .card {
            background-color: #2d3748;
            border-color: #4a5568;
        }
        .chart-container {
            height: 300px;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <div class="flex h-screen overflow-hidden">
        <!-- Sidebar -->
        <div class="sidebar bg-blue-800 text-white w-64 flex flex-col">
            <div class="p-4 flex items-center">
                <i class="fas fa-server text-2xl mr-3"></i>
                <span class="logo-text text-xl font-bold">MediaAdmin</span>
                <button id="toggleSidebar" class="ml-auto text-white focus:outline-none">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <div class="flex-1 overflow-y-auto">
                <nav class="mt-6">
                    <div class="px-4 py-2">
                        <div class="text-xs uppercase font-bold text-blue-200 mb-2 nav-text">Main</div>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white bg-blue-700 rounded-lg">
                            <i class="fas fa-tachometer-alt mr-3"></i>
                            <span class="nav-text">Dashboard</span>
                        </a>
                    </div>
                    <div class="px-4 py-2">
                        <div class="text-xs uppercase font-bold text-blue-200 mb-2 nav-text">Management</div>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-users mr-3"></i>
                            <span class="nav-text">Users</span>
                        </a>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-server mr-3"></i>
                            <span class="nav-text">Servers</span>
                        </a>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-film mr-3"></i>
                            <span class="nav-text">Content Packages</span>
                        </a>
                    </div>
                    <div class="px-4 py-2">
                        <div class="text-xs uppercase font-bold text-blue-200 mb-2 nav-text">Tools</div>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-envelope mr-3"></i>
                            <span class="nav-text">Invitations</span>
                        </a>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-chart-line mr-3"></i>
                            <span class="nav-text">Analytics</span>
                        </a>
                        <a href="#" class="nav-item flex items-center px-4 py-3 text-white hover:bg-blue-700 rounded-lg">
                            <i class="fas fa-cog mr-3"></i>
                            <span class="nav-text">Settings</span>
                        </a>
                    </div>
                </nav>
            </div>
            <div class="p-4 border-t border-blue-700">
                <div class="flex items-center">
                    <img src="https://via.placeholder.com/40" alt="User" class="rounded-full w-10 h-10">
                    <div class="ml-3 nav-text">
                        <div class="font-medium">Admin User</div>
                        <div class="text-xs text-blue-200">Super Admin</div>
                    </div>
                    <button id="darkModeToggle" class="ml-auto text-white focus:outline-none">
                        <i class="fas fa-moon"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="content flex-1 overflow-auto">
            <!-- Top Navigation -->
            <header class="bg-white shadow-sm">
                <div class="px-6 py-4 flex items-center justify-between">
                    <h1 class="text-2xl font-bold text-gray-800">Dashboard</h1>
                    <div class="flex items-center space-x-4">
                        <div class="relative">
                            <input type="text" placeholder="Search..." class="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                        </div>
                        <button class="text-gray-600 hover:text-gray-800">
                            <i class="fas fa-bell text-xl"></i>
                        </button>
                    </div>
                </div>
            </header>

            <!-- Dashboard Content -->
            <main class="p-6">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                                <i class="fas fa-users text-xl"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-gray-500">Total Users</h3>
                                <p class="text-2xl font-bold">1,248</p>
                            </div>
                        </div>
                        <div class="mt-4 text-sm text-green-500">
                            <i class="fas fa-arrow-up mr-1"></i> 12% from last month
                        </div>
                    </div>
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-green-100 text-green-600">
                                <i class="fas fa-server text-xl"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-gray-500">Active Servers</h3>
                                <p class="text-2xl font-bold">24</p>
                            </div>
                        </div>
                        <div class="mt-4 text-sm text-green-500">
                            <i class="fas fa-arrow-up mr-1"></i> 3 new this month
                        </div>
                    </div>
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-purple-100 text-purple-600">
                                <i class="fas fa-film text-xl"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-gray-500">Content Packages</h3>
                                <p class="text-2xl font-bold">56</p>
                            </div>
                        </div>
                        <div class="mt-4 text-sm text-red-500">
                            <i class="fas fa-arrow-down mr-1"></i> 2 removed
                        </div>
                    </div>
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-yellow-100 text-yellow-600">
                                <i class="fas fa-envelope text-xl"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-gray-500">Pending Invites</h3>
                                <p class="text-2xl font-bold">18</p>
                            </div>
                        </div>
                        <div class="mt-4 text-sm text-green-500">
                            <i class="fas fa-arrow-up mr-1"></i> 5 new today
                        </div>
                    </div>
                </div>

                <!-- Charts and Activity -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
                    <!-- User Growth Chart -->
                    <div class="card bg-white p-6 rounded-lg shadow lg:col-span-2">
                        <div class="flex justify-between items-center mb-4">
                            <h2 class="text-lg font-semibold">User Growth</h2>
                            <div class="flex space-x-2">
                                <button class="px-3 py-1 text-xs bg-blue-100 text-blue-600 rounded">Month</button>
                                <button class="px-3 py-1 text-xs bg-gray-100 text-gray-600 rounded">Year</button>
                            </div>
                        </div>
                        <div class="chart-container">
                            <canvas id="userGrowthChart"></canvas>
                        </div>
                    </div>

                    <!-- Server Distribution -->
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <h2 class="text-lg font-semibold mb-4">Server Distribution</h2>
                        <div class="chart-container">
                            <canvas id="serverDistributionChart"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity and Quick Actions -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Recent Activity -->
                    <div class="card bg-white p-6 rounded-lg shadow lg:col-span-2">
                        <h2 class="text-lg font-semibold mb-4">Recent Activity</h2>
                        <div class="space-y-4">
                            <div class="flex items-start">
                                <div class="p-2 bg-blue-100 text-blue-600 rounded-full mr-3">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                <div>
                                    <p class="font-medium">New user registered</p>
                                    <p class="text-sm text-gray-500">John Doe joined 2 hours ago</p>
                                </div>
                                <span class="ml-auto text-sm text-gray-500">2h ago</span>
                            </div>
                            <div class="flex items-start">
                                <div class="p-2 bg-green-100 text-green-600 rounded-full mr-3">
                                    <i class="fas fa-server"></i>
                                </div>
                                <div>
                                    <p class="font-medium">New server added</p>
                                    <p class="text-sm text-gray-500">Plex server "MediaHub" was connected</p>
                                </div>
                                <span class="ml-auto text-sm text-gray-500">5h ago</span>
                            </div>
                            <div class="flex items-start">
                                <div class="p-2 bg-purple-100 text-purple-600 rounded-full mr-3">
                                    <i class="fas fa-film"></i>
                                </div>
                                <div>
                                    <p class="font-medium">Content package updated</p>
                                    <p class="text-sm text-gray-500">"Kids Movies" package was modified</p>
                                </div>
                                <span class="ml-auto text-sm text-gray-500">1d ago</span>
                            </div>
                            <div class="flex items-start">
                                <div class="p-2 bg-yellow-100 text-yellow-600 rounded-full mr-3">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div>
                                    <p class="font-medium">Invitation sent</p>
                                    <p class="text-sm text-gray-500">Invite sent to jane@example.com</p>
                                </div>
                                <span class="ml-auto text-sm text-gray-500">2d ago</span>
                            </div>
                        </div>
                        <button class="mt-4 text-blue-600 hover:text-blue-800 text-sm font-medium">
                            View all activity <i class="fas fa-arrow-right ml-1"></i>
                        </button>
                    </div>

                    <!-- Quick Actions -->
                    <div class="card bg-white p-6 rounded-lg shadow">
                        <h2 class="text-lg font-semibold mb-4">Quick Actions</h2>
                        <div class="space-y-3">
                            <button class="w-full flex items-center px-4 py-3 bg-blue-50 text-blue-600 rounded-lg hover:bg-blue-100">
                                <i class="fas fa-user-plus mr-3"></i>
                                <span>Add New User</span>
                            </button>
                            <button class="w-full flex items-center px-4 py-3 bg-green-50 text-green-600 rounded-lg hover:bg-green-100">
                                <i class="fas fa-server mr-3"></i>
                                <span>Connect Server</span>
                            </button>
                            <button class="w-full flex items-center px-4 py-3 bg-purple-50 text-purple-600 rounded-lg hover:bg-purple-100">
                                <i class="fas fa-film mr-3"></i>
                                <span>Create Package</span>
                            </button>
                            <button class="w-full flex items-center px-4 py-3 bg-yellow-50 text-yellow-600 rounded-lg hover:bg-yellow-100">
                                <i class="fas fa-envelope mr-3"></i>
                                <span>Send Invitation</span>
                            </button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Toggle sidebar
        document.getElementById('toggleSidebar').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('collapsed');
            document.querySelector('.content').classList.toggle('ml-64');
            document.querySelector('.content').classList.toggle('ml-20');
        });
        // Dark mode toggle
        document.getElementById('darkModeToggle').addEventListener('click', function() {
            document.body.classList.toggle('dark-mode');
            const icon = this.querySelector('i');
            if (document.body.classList.contains('dark-mode')) {
                icon.classList.remove('fa-moon');
                icon.classList.add('fa-sun');
            } else {
                icon.classList.remove('fa-sun');
                icon.classList.add('fa-moon');
            }
        });
        // Initialize charts
        document.addEventListener('DOMContentLoaded', function() {
            // User Growth Chart
            const userGrowthCtx = document.getElementById('userGrowthChart').getContext('2d');
            const userGrowthChart = new Chart(userGrowthCtx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Total Users',
                        data: [850, 920, 1000, 1050, 1120, 1180, 1248],
                        borderColor: '#3B82F6',
                        backgroundColor: 'rgba(59, 130, 246, 0.1)',
                        borderWidth: 2,
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: false,
                            grid: {
                                drawBorder: false
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });
            // Server Distribution Chart
            const serverDistributionCtx = document.getElementById('serverDistributionChart').getContext('2d');
            const serverDistributionChart = new Chart(serverDistributionCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Plex', 'Emby', 'Jellyfin'],
                    datasets: [{
                        data: [14, 6, 4],
                        backgroundColor: [
                            '#3B82F6',
                            '#10B981',
                            '#8B5CF6'
                        ],
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    },
                    cutout: '70%'
                }
            });
        });
    </script>
<p style="border-radius: 8px; text-align: center; font-size: 12px; color: #fff; margin-top: 16px;position: fixed; left: 8px; bottom: 8px; z-index: 10; background: rgba(0, 0, 0, 0.8); padding: 4px 8px;">Made with <img src="https://enzostvs-deepsite.hf.space/logo.svg" alt="DeepSite Logo" style="width: 16px; height: 16px; vertical-align: middle;display:inline-block;margin-right:3px;filter:brightness(0) invert(1);"><a href="https://enzostvs-deepsite.hf.space" style="color: #fff;text-decoration: underline;" target="_blank" >DeepSite</a> - 🧬 <a href="https://enzostvs-deepsite.hf.space?remix=solidchristian/panel-multimedia-plex" style="color: #fff;text-decoration: underline;" target="_blank" >Remix</a></p></body>
</html>
