import { Navigate, useRoutes } from 'react-router-dom'
// layouts
import DashboardLayout from './layouts/dashboard'
import LogoOnlyLayout from './layouts/LogoOnlyLayout'
//
import Login from './pages/Login'
import Register from './pages/Register'
import DashboardApp from './pages/DashboardApp'
import Staff from './pages/Staff'
import Service from './pages/Service'
import NotFound from './pages/Page404'
import Order from './pages/Order'

// ----------------------------------------------------------------------

export default function Router() {
  return useRoutes([
    {
      path: '/dashboard',
      element: <DashboardLayout />,
      children: [
        { element: <Navigate to="/dashboard/order" replace /> },
        // { path: 'app', element: <DashboardApp /> },
        { path: 'service', element: <Service /> },
        { path: 'staff', element: <Staff /> },
        { path: 'order', element: <Order /> }
      ]
    },
    {
      path: '/',
      element: <LogoOnlyLayout />,
      children: [
        { path: 'login', element: <Login /> },
        { path: 'register', element: <Register /> },
        { path: '404', element: <NotFound /> },
        { path: '/', element: <Navigate to="/dashboard" /> },
        { path: '*', element: <Navigate to="/404" /> }
      ]
    },
    { path: '*', element: <Navigate to="/404" replace /> }
  ])
}
