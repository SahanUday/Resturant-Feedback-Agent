import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { ReviewInputCard, AutoReplyCard } from "./CustomerDashboard.js";
import { pageStyle, contentStyle, cardBaseStyle, SentimentBarChart, StatCard, StatsRow, SummaryCard } from "./AdminDashboard.js";
import { Home } from "./HomePage.js";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
import "./cstyles.css";
import "./adstyles.css";
function Navigation() {
  let isLoggedIn = jacIsLoggedIn();
  let navigate = useNavigate();
  function handleLogout(e) {
    e.preventDefault();
    jacLogout();
    navigate("/");
  }
  if (isLoggedIn) {
    return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "#3b82f6", "color": "#ffffff", "display": "flex", "justifyContent": "space-between"}}, [__jacJsx("div", {"style": {"fontWeight": "600"}}, ["Todo App"]), __jacJsx("div", {"style": {"display": "flex", "gap": "16px"}}, [__jacJsx("button", {"onClick": handleLogout, "style": {"background": "none", "color": "#ffffff", "border": "1px solid #ffffff", "padding": "2px 10px", "borderRadius": "4px", "cursor": "pointer"}}, ["Logout"])])]);
  }
  return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "#3b82f6", "color": "#ffffff", "display": "flex", "justifyContent": "space-between"}}, [__jacJsx("div", {"style": {"fontWeight": "600"}}, ["Todo App"]), __jacJsx("div", {"style": {"display": "flex", "gap": "16px"}}, [__jacJsx(Link, {"to": "/login", "style": {"color": "#ffffff", "textDecoration": "none"}}, ["Login"]), __jacJsx(Link, {"to": "/signup", "style": {"color": "#ffffff", "textDecoration": "none"}}, ["Sign Up"])])]);
}
function CustomerLoginPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleLogin(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let success = await jacLogin(username, password);
    if (success) {
      navigate("/Customer");
    } else {
      setError("Invalid credentials");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#f5f5f5"}}, [__jacJsx("div", {"style": {"background": "#ffffff", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px"}}, ["Login"]), __jacJsx("form", {"onSubmit": handleLogin}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600"}}, ["Login"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Need an account?", __jacJsx(Link, {"to": "/customersignup"}, ["Sign up"])])])]);
}
function AdminLoginPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleLogin(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let success = await jacLogin(username, password);
    if (success) {
      navigate("/Admin");
    } else {
      setError("Invalid credentials");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#f5f5f5"}}, [__jacJsx("div", {"style": {"background": "#ffffff", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px"}}, ["Login"]), __jacJsx("form", {"onSubmit": handleLogin}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600"}}, ["Login"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Need an account?", __jacJsx(Link, {"to": "/adminsignup"}, ["Sign up"])])])]);
}
function CustomerSignupPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleSignup(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let result = await jacSignup(username, password);
    if (result["success"]) {
      navigate("/Customer");
    } else {
      setError(result["error"] ? result["error"] : "Signup failed");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#f5f5f5"}}, [__jacJsx("div", {"style": {"background": "#ffffff", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px"}}, ["Sign Up"]), __jacJsx("form", {"onSubmit": handleSignup}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600"}}, ["Sign Up"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Have an account?", __jacJsx(Link, {"to": "/customerlogin"}, ["Customer Login"])])])]);
}
function AdminSignupPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleSignup(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let result = await jacSignup(username, password);
    if (result["success"]) {
      navigate("/Admin");
    } else {
      setError(result["error"] ? result["error"] : "Signup failed");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#f5f5f5"}}, [__jacJsx("div", {"style": {"background": "#ffffff", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px"}}, ["Sign Up"]), __jacJsx("form", {"onSubmit": handleSignup}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #ddd", "borderRadius": "4px", "boxSizing": "border-box"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600"}}, ["Sign Up"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Have an account?", __jacJsx(Link, {"to": "/adminlogin"}, ["Admin Login"])])])]);
}
function Customer() {
  let [answer, setAnswer] = useState("");
  let [input, setInput] = useState("");
  let [loading, setLoading] = useState(false);
  async function computeAnswer() {
    setLoading(true);
    setAnswer("");
    let response = await __jacSpawn("analyzer", "", {"feedback": input});
    let result = response.reports;
    setAnswer(result);
    setLoading(false);
  }
  return __jacJsx("div", {"className": "app-container"}, [__jacJsx("div", {"className": "app-layout"}, [__jacJsx(ReviewInputCard, {"input": input, "setInput": setInput, "computeAnswer": computeAnswer}, []), __jacJsx(AutoReplyCard, {"answer": answer, "loading": loading}, [])])]);
}
function Admin() {
  let [range, setRange] = useState("Last 3 Days");
  let [positive_count, setPositiveCount] = useState([]);
  let [negative_count, setNegativeCount] = useState([]);
  let [neutral_count, setNeutralCount] = useState([]);
  let [pricing_count, setPricingCount] = useState(null);
  let [food_quality_count, setFoodQualityCount] = useState(null);
  let [delivery_count, setDeliveryCount] = useState(null);
  let [other_count, setOtherCount] = useState(null);
  let [dates, setDates] = useState([]);
  let [data, setData] = useState([]);
  let [summary, setSummary] = useState("");
  let [loading, setLoading] = useState(false);
  let headerRowStyle = {"display": "flex", "justifyContent": "space-between", "alignItems": "center"};
  let titleStyle = {"fontSize": "18px", "fontWeight": "600", "color": "#e5e7eb"};
  let subtitleStyle = {"fontSize": "12px", "color": "#9ca3af"};
  async function get_data(e) {
    setRange(e.target.value);
    let response = await __jacSpawn("grt_counts", "", {"range_option": e.target.value});
    console.log(response);
    let result = response.reports[0];
    setPositiveCount(result["positive_count"]);
    setNegativeCount(result["negative_count"]);
    setNeutralCount(result["neutral_count"]);
    setPricingCount(result["pricing_count"]);
    setFoodQualityCount(result["food_quality_count"]);
    setDeliveryCount(result["delivery_count"]);
    setOtherCount(result["other_count"]);
    setDates(result["dates"]);
    let data_list = [];
    let lent = result["dates"].length;
    console.log("lent", lent);
    let num = 0;
    while (num < lent) {
      console.log("num", num);
      console.log("date", result["dates"][num]);
      let d = {"date": result["dates"][num], "Positive": result["positive_count"][num], "Negative": result["negative_count"][num], "Neutral": result["neutral_count"][num]};
      data_list.push(d);
      num = num + 1;
    }
    setData(data_list);
  }
  async function gen_summary() {
    setLoading(true);
    let summ = await __jacSpawn("summerize", "", {"range_option": range});
    let result = summ.reports[0];
    setSummary(result["summary"]);
    setLoading(false);
  }
  return __jacJsx("div", {"style": pageStyle()}, [__jacJsx("div", {"style": contentStyle()}, [__jacJsx("div", {"style": headerRowStyle}, [__jacJsx("div", {}, [__jacJsx("div", {"style": titleStyle}, ["Comment activity graph"]), __jacJsx("div", {"style": subtitleStyle}, ["Visualise positive, negative and neutral comments over time."])]), __jacJsx("select", {"value": range, "onChange": e => {
    get_data(e);
  }, "style": {"padding": "8px 12px", "borderRadius": "8px", "fontSize": "13px", "fontWeight": "500", "backgroundColor": "#020617", "color": "#e5e7eb", "border": "1px solid #374151", "outline": "none", "cursor": "pointer"}}, [__jacJsx("option", {"value": "Last 3 Days"}, ["Last 3 Days"]), __jacJsx("option", {"value": "Last 7 Days"}, ["Last 7 Days"]), __jacJsx("option", {"value": "Last 30 Days"}, ["Last 30 Days"])])]), __jacJsx("div", {"style": cardBaseStyle()}, [__jacJsx(StatsRow, {"range": range, "foodValue": food_quality_count, "deliveryValue": delivery_count, "pricingValue": pricing_count, "otherValue": other_count}, []), __jacJsx(SentimentBarChart, {"chartdata": data}, [])]), __jacJsx("div", {"style": cardBaseStyle()}, [__jacJsx(SummaryCard, {"summary": summary, "loading": loading}, []), __jacJsx("div", {"className": "button-row"}, [__jacJsx("button", {"onClick": () => {
    gen_summary();
  }, "className": "btn-primary"}, ["Generate Summary"])])])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {"style": {"fontFamily": "system-ui, sans-serif"}}, [__jacJsx(Navigation, {}, []), __jacJsx(Routes, {}, [__jacJsx(Route, {"path": "/", "element": __jacJsx(Home, {}, [])}, []), __jacJsx(Route, {"path": "/customerlogin", "element": __jacJsx(CustomerLoginPage, {}, [])}, []), __jacJsx(Route, {"path": "/adminlogin", "element": __jacJsx(AdminLoginPage, {}, [])}, []), __jacJsx(Route, {"path": "/customersignup", "element": __jacJsx(CustomerSignupPage, {}, [])}, []), __jacJsx(Route, {"path": "/adminsignup", "element": __jacJsx(AdminSignupPage, {}, [])}, []), __jacJsx(Route, {"path": "/Customer", "element": __jacJsx(Customer, {}, [])}, []), __jacJsx(Route, {"path": "/Admin", "element": __jacJsx(Admin, {}, [])}, [])])])]);
}
export { Admin, AdminLoginPage, AdminSignupPage, Customer, CustomerLoginPage, CustomerSignupPage, Navigation, app };
