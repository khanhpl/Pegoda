/*!
=========================================================
* Muse Ant Design Dashboard - v1.0.0
=========================================================
* Product Page: https://www.creative-tim.com/product/muse-ant-design-dashboard
* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/muse-ant-design-dashboard/blob/main/LICENSE.md)
* Coded by Creative Tim
=========================================================
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
*/
import { Switch, Route, Redirect } from "react-router-dom"
import Home from "./pages/Home"
import Billing from "./pages/Billing"
import Rtl from "./pages/Rtl"
import Profile from "./pages/Profile"
import SignUp from "./pages/SignUp"
import SignIn from "./pages/SignIn"
import Main from "./components/layout/Main"
import "antd/dist/antd.css"
import "./assets/styles/main.css"
import "./assets/styles/responsive.css"
import Staff from "./pages/Staff"
import Center from "./pages/Center"
import Admin from "./pages/Admin"
import ServiceType from "./pages/ServiceType"

function App() {
  return (
    <div className="App">
      <Switch>
        <Route path="/sign-in" exact component={SignUp} />
        <Route path="/sign-up" exact component={SignIn} />
        <Main>
          {/* <Route exact path="/dashboard" component={Home} /> */}
          <Route exact path="/center" component={Center} />
          <Route exact path="/staff" component={Staff} />
          <Route exact path="/billing" component={Billing} />
          <Route exact path="/rtl" component={Rtl} />
          <Route exact path="/profile" component={Profile} />
          <Route exact path="/admin" component={Admin} />
          <Route exact path="/serviceType" component={ServiceType} />
          <Redirect from="*" to="/center" />
        </Main>
      </Switch>
    </div>
  )
}

export default App
