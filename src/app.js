import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { ReviewInputCard, AutoReplyCard } from "./CustomerDashboard.js";
import { pageStyle, contentStyle, cardBaseStyle, SentimentBarChart, StatCard, StatsRow, SummaryCard } from "./AdminDashboard.js";
import { Home } from "./HomePage.js";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
import "./cstyles.css";
import "./adstyles.css";
import "./homestyle.css";
function Navigation() {
  let isLoggedIn = jacIsLoggedIn();
  let navigate = useNavigate();
  function handleLogout(e) {
    e.preventDefault();
    jacLogout();
    navigate("/");
  }
  if (isLoggedIn) {
    return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "linear-gradient(90deg,#020617,#0b1120,#020617)", "color": "#ffffff", "display": "flex", "justifyContent": "space-between"}}, [__jacJsx("div", {"style": {"fontWeight": "600"}}, ["KAMRA "]), __jacJsx("div", {"style": {"display": "flex", "gap": "16px"}}, [__jacJsx("button", {"onClick": handleLogout, "style": {"background": "none", "color": "#ffffff", "border": "1px solid #ffffff", "padding": "2px 10px", "borderRadius": "4px", "cursor": "pointer"}}, ["Logout"])])]);
  }
  return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "linear-gradient(90deg,#020617,#0b1120,#020617)", "color": "#ffffff", "display": "flex", "justifyContent": "space-between"}}, [__jacJsx("div", {"style": {"fontWeight": "600"}}, ["KAMRA"]), __jacJsx("div", {}, [])]);
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
    let customerUsername = `cust:${username}`;
    let success = await jacLogin(customerUsername, password);
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
    errorDisplay = __jacJsx("div", {"style": {"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)", "padding": "24px"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "32px 28px", "borderRadius": "18px", "width": "320px", "boxShadow": "0 20px 45px rgba(15,23,42,0.9)", "border": "1px solid #1f2937", "color": "#e5e7eb", "boxSizing": "border-box"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}, ["Login"]), __jacJsx("form", {"onSubmit": handleLogin}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "10px", "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)", "color": "#f9fafb", "border": "none", "borderRadius": "999px", "cursor": "pointer", "fontWeight": "600", "fontSize": "14px", "marginTop": "4px", "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"}}, ["Login"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "16px", "fontSize": "13px", "color": "#9ca3af"}}, ["Need an account?", " ", __jacJsx(Link, {"to": "/customersignup", "style": {"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}, ["Sign up"])])])]);
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
    let adminUsername = `admin:${username}`;
    let success = await jacLogin(adminUsername, password);
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
    errorDisplay = __jacJsx("div", {"style": {"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)", "padding": "24px"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "32px 28px", "borderRadius": "18px", "width": "320px", "boxShadow": "0 20px 45px rgba(15,23,42,0.9)", "border": "1px solid #1f2937", "color": "#e5e7eb", "boxSizing": "border-box"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}, ["Login"]), __jacJsx("form", {"onSubmit": handleLogin}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "10px", "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)", "color": "#f9fafb", "border": "none", "borderRadius": "999px", "cursor": "pointer", "fontWeight": "600", "fontSize": "14px", "marginTop": "4px", "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"}}, ["Login"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "16px", "fontSize": "13px", "color": "#9ca3af"}}, ["Need an account?", " ", __jacJsx(Link, {"to": "/adminsignup", "style": {"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}, ["Sign up"])])])]);
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
    let customerUsername = `cust:${username}`;
    let result = await jacSignup(customerUsername, password);
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
    errorDisplay = __jacJsx("div", {"style": {"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)", "padding": "24px"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "32px 28px", "borderRadius": "18px", "width": "320px", "boxShadow": "0 20px 45px rgba(15,23,42,0.9)", "border": "1px solid #1f2937", "color": "#e5e7eb", "boxSizing": "border-box"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}, ["Sign Up"]), __jacJsx("form", {"onSubmit": handleSignup}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "10px", "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)", "color": "#f9fafb", "border": "none", "borderRadius": "999px", "cursor": "pointer", "fontWeight": "600", "fontSize": "14px", "marginTop": "4px", "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"}}, ["Sign Up"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "16px", "fontSize": "13px", "color": "#9ca3af"}}, ["Have an account?", " ", __jacJsx(Link, {"to": "/customerlogin", "style": {"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}, ["Customer Login"])])])]);
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
    let adminUsername = `admin:${username}`;
    let result = await jacSignup(adminUsername, password);
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
    errorDisplay = __jacJsx("div", {"style": {"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)", "padding": "24px"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "32px 28px", "borderRadius": "18px", "width": "320px", "boxShadow": "0 20px 45px rgba(15,23,42,0.9)", "border": "1px solid #1f2937", "color": "#e5e7eb", "boxSizing": "border-box"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}, ["Sign Up"]), __jacJsx("form", {"onSubmit": handleSignup}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "10px", "marginBottom": "10px", "border": "1px solid #374151", "borderRadius": "8px", "boxSizing": "border-box", "backgroundColor": "#020617", "color": "#e5e7eb", "fontSize": "14px"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "10px", "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)", "color": "#f9fafb", "border": "none", "borderRadius": "999px", "cursor": "pointer", "fontWeight": "600", "fontSize": "14px", "marginTop": "4px", "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"}}, ["Sign Up"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "16px", "fontSize": "13px", "color": "#9ca3af"}}, ["Have an account?", " ", __jacJsx(Link, {"to": "/adminlogin", "style": {"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}, ["Admin Login"])])])]);
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
  return __jacJsx("div", {"className": "customer-page"}, [__jacJsx("div", {"className": "customer-column"}, [__jacJsx(ReviewInputCard, {"input": input, "setInput": setInput, "computeAnswer": computeAnswer}, []), __jacJsx(AutoReplyCard, {"answer": answer, "loading": loading}, [])])]);
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
  return __jacJsx("div", {"className": "pageC"}, [__jacJsx("div", {"className": "contentC"}, [__jacJsx("div", {"className": "header-rowNew", "style": {"marginBottom": "16px"}}, [__jacJsx("div", {}, [__jacJsx("div", {"className": "header-titleNew"}, ["Comment activity graph"]), __jacJsx("div", {"className": "header-subtitleNew"}, ["Visualise positive, negative and neutral comments over time."])]), __jacJsx("select", {"value": range, "onChange": e => {
    get_data(e);
  }, "className": "range-select"}, [__jacJsx("option", {"value": "Last 3 Days"}, ["Last 3 Days"]), __jacJsx("option", {"value": "Last 7 Days"}, ["Last 7 Days"]), __jacJsx("option", {"value": "Last 30 Days"}, ["Last 30 Days"])])]), __jacJsx("div", {"className": "card-base"}, [__jacJsx(StatsRow, {"range": range, "foodValue": food_quality_count, "deliveryValue": delivery_count, "pricingValue": pricing_count, "otherValue": other_count}, []), __jacJsx(SentimentBarChart, {"chartdata": data}, [])]), __jacJsx("div", {"className": "card-base"}, [__jacJsx(SummaryCard, {"summary": summary, "loading": loading}, []), __jacJsx("div", {"className": "button-row"}, [__jacJsx("button", {"onClick": () => {
    gen_summary();
  }, "className": "btn-primary"}, ["Generate Summary"])])])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {"style": {"fontFamily": "system-ui, sans-serif"}}, [__jacJsx(Navigation, {}, []), __jacJsx(Routes, {}, [__jacJsx(Route, {"path": "/", "element": __jacJsx(Home, {}, [])}, []), __jacJsx(Route, {"path": "/customerlogin", "element": __jacJsx(CustomerLoginPage, {}, [])}, []), __jacJsx(Route, {"path": "/adminlogin", "element": __jacJsx(AdminLoginPage, {}, [])}, []), __jacJsx(Route, {"path": "/customersignup", "element": __jacJsx(CustomerSignupPage, {}, [])}, []), __jacJsx(Route, {"path": "/adminsignup", "element": __jacJsx(AdminSignupPage, {}, [])}, []), __jacJsx(Route, {"path": "/Customer", "element": __jacJsx(Customer, {}, [])}, []), __jacJsx(Route, {"path": "/Admin", "element": __jacJsx(Admin, {}, [])}, [])])])]);
}
export { Admin, AdminLoginPage, AdminSignupPage, Customer, CustomerLoginPage, CustomerSignupPage, Navigation, app };
