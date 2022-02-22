import { initializeApp } from "firebase/app"
import { getAuth } from 'firebase/auth'
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDuwWIr_3jGeUwh5f3qswTCxyS852CJRdg",
    authDomain: "pegoda-6de8a.firebaseapp.com",
    projectId: "pegoda-6de8a",
    storageBucket: "pegoda-6de8a.appspot.com",
    messagingSenderId: "639727765666",
    appId: "1:639727765666:web:e53cdf123487719f22effb",
    measurementId: "G-HS8YSDCFED"
}

// Initialize Firebase
const app = initializeApp(firebaseConfig)

const auth = getAuth(app)

export { auth }