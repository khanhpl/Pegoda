import './Login.css';
import logo from "./image/Pegoda.png";
import React from 'react';
import GoogleButton from 'react-google-button'


// function Login() {
  // return (
  //   <div className="main">
  //     <div className="submain">
  //       <div>
  //         <div className='img'>
  //           <div className='container-img'>
  //             <img src={logo} alt='logo' className='logo' />
  //           </div>
  //           </div>
  //           <h1>Google Login</h1>
  //           <button>Sign in with Google</button>
  //         </div>
  //       </div>
  //     </div>
  //     );}
      const Login = () => {
        return(
        <div className='main'>
          <div className='sub-main'>
            <div>
              <div className='img'>
                <div className='container-img'>
                  <img src="{logo}" alt='logo' className='logo'/>
                </div>
              </div>
              <h1>Google Login</h1>
              <GoogleButton
                onClick={() => { console.log('Google button clicked') }}
              />
            </div>
          </div>
        </div>);
      }
      
export default Login;
