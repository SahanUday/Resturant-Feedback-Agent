function _regenerator() { /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/babel/babel/blob/main/packages/babel-helpers/LICENSE */ var e, t, r = "function" == typeof Symbol ? Symbol : {}, n = r.iterator || "@@iterator", o = r.toStringTag || "@@toStringTag"; function i(r, n, o, i) { var c = n && n.prototype instanceof Generator ? n : Generator, u = Object.create(c.prototype); return _regeneratorDefine2(u, "_invoke", function (r, n, o) { var i, c, u, f = 0, p = o || [], y = !1, G = { p: 0, n: 0, v: e, a: d, f: d.bind(e, 4), d: function d(t, r) { return i = t, c = 0, u = e, G.n = r, a; } }; function d(r, n) { for (c = r, u = n, t = 0; !y && f && !o && t < p.length; t++) { var o, i = p[t], d = G.p, l = i[2]; r > 3 ? (o = l === n) && (u = i[(c = i[4]) ? 5 : (c = 3, 3)], i[4] = i[5] = e) : i[0] <= d && ((o = r < 2 && d < i[1]) ? (c = 0, G.v = n, G.n = i[1]) : d < l && (o = r < 3 || i[0] > n || n > l) && (i[4] = r, i[5] = n, G.n = l, c = 0)); } if (o || r > 1) return a; throw y = !0, n; } return function (o, p, l) { if (f > 1) throw TypeError("Generator is already running"); for (y && 1 === p && d(p, l), c = p, u = l; (t = c < 2 ? e : u) || !y;) { i || (c ? c < 3 ? (c > 1 && (G.n = -1), d(c, u)) : G.n = u : G.v = u); try { if (f = 2, i) { if (c || (o = "next"), t = i[o]) { if (!(t = t.call(i, u))) throw TypeError("iterator result is not an object"); if (!t.done) return t; u = t.value, c < 2 && (c = 0); } else 1 === c && (t = i["return"]) && t.call(i), c < 2 && (u = TypeError("The iterator does not provide a '" + o + "' method"), c = 1); i = e; } else if ((t = (y = G.n < 0) ? u : r.call(n, G)) !== a) break; } catch (t) { i = e, c = 1, u = t; } finally { f = 1; } } return { value: t, done: y }; }; }(r, o, i), !0), u; } var a = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} t = Object.getPrototypeOf; var c = [][n] ? t(t([][n]())) : (_regeneratorDefine2(t = {}, n, function () { return this; }), t), u = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(c); function f(e) { return Object.setPrototypeOf ? Object.setPrototypeOf(e, GeneratorFunctionPrototype) : (e.__proto__ = GeneratorFunctionPrototype, _regeneratorDefine2(e, o, "GeneratorFunction")), e.prototype = Object.create(u), e; } return GeneratorFunction.prototype = GeneratorFunctionPrototype, _regeneratorDefine2(u, "constructor", GeneratorFunctionPrototype), _regeneratorDefine2(GeneratorFunctionPrototype, "constructor", GeneratorFunction), GeneratorFunction.displayName = "GeneratorFunction", _regeneratorDefine2(GeneratorFunctionPrototype, o, "GeneratorFunction"), _regeneratorDefine2(u), _regeneratorDefine2(u, o, "Generator"), _regeneratorDefine2(u, n, function () { return this; }), _regeneratorDefine2(u, "toString", function () { return "[object Generator]"; }), (_regenerator = function _regenerator() { return { w: i, m: f }; })(); }
function _regeneratorDefine2(e, r, n, t) { var i = Object.defineProperty; try { i({}, "", {}); } catch (e) { i = 0; } _regeneratorDefine2 = function _regeneratorDefine(e, r, n, t) { function o(r, n) { _regeneratorDefine2(e, r, function (e) { return this._invoke(r, n, e); }); } r ? i ? i(e, r, { value: n, enumerable: !t, configurable: !t, writable: !t }) : e[r] = n : (o("next", 0), o("throw", 1), o("return", 2)); }, _regeneratorDefine2(e, r, n, t); }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { ReviewInputCard, AutoReplyCard } from "./CustomerDashboard.js";
import { pageStyle, contentStyle, cardBaseStyle, SentimentBarChart, StatCard, StatsRow, SummaryCard } from "./AdminDashboard.js";
import { Home } from "./HomePage.js";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
import "./cstyles.css";
import "./adstyles.css";
import "./homestyle.css";
function Navigation() {
  var isLoggedIn = jacIsLoggedIn();
  var navigate = useNavigate();
  function handleLogout(e) {
    e.preventDefault();
    jacLogout();
    navigate("/");
  }
  if (isLoggedIn) {
    return __jacJsx("nav", {
      "style": {
        "padding": "12px 24px",
        "background": "linear-gradient(90deg,#020617,#0b1120,#020617)",
        "color": "#ffffff",
        "display": "flex",
        "justifyContent": "space-between"
      }
    }, [__jacJsx("div", {
      "style": {
        "fontWeight": "600"
      }
    }, ["KAMRA "]), __jacJsx("div", {
      "style": {
        "display": "flex",
        "gap": "16px"
      }
    }, [__jacJsx("button", {
      "onClick": handleLogout,
      "style": {
        "background": "none",
        "color": "#ffffff",
        "border": "1px solid #ffffff",
        "padding": "2px 10px",
        "borderRadius": "4px",
        "cursor": "pointer"
      }
    }, ["Logout"])])]);
  }
  return __jacJsx("nav", {
    "style": {
      "padding": "12px 24px",
      "background": "linear-gradient(90deg,#020617,#0b1120,#020617)",
      "color": "#ffffff",
      "display": "flex",
      "justifyContent": "space-between"
    }
  }, [__jacJsx("div", {
    "style": {
      "fontWeight": "600"
    }
  }, ["KAMRA"]), __jacJsx("div", {}, [])]);
}
function CustomerLoginPage() {
  var _useState = useState(""),
    _useState2 = _slicedToArray(_useState, 2),
    username = _useState2[0],
    setUsername = _useState2[1];
  var _useState3 = useState(""),
    _useState4 = _slicedToArray(_useState3, 2),
    password = _useState4[0],
    setPassword = _useState4[1];
  var _useState5 = useState(""),
    _useState6 = _slicedToArray(_useState5, 2),
    error = _useState6[0],
    setError = _useState6[1];
  var navigate = useNavigate();
  function handleLogin(_x) {
    return _handleLogin.apply(this, arguments);
  }
  function _handleLogin() {
    _handleLogin = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee(e) {
      var customerUsername, success;
      return _regenerator().w(function (_context) {
        while (1) switch (_context.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context.a(2);
          case 1:
            customerUsername = "cust:".concat(username);
            _context.n = 2;
            return jacLogin(customerUsername, password);
          case 2:
            success = _context.v;
            if (success) {
              navigate("/Customer");
            } else {
              setError("Invalid credentials");
            }
          case 3:
            return _context.a(2);
        }
      }, _callee);
    }));
    return _handleLogin.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#fca5a5",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
      "padding": "24px"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "32px 28px",
      "borderRadius": "18px",
      "width": "320px",
      "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
      "border": "1px solid #1f2937",
      "color": "#e5e7eb",
      "boxSizing": "border-box"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "fontSize": "22px",
      "fontWeight": "700"
    }
  }, ["Login"]), __jacJsx("form", {
    "onSubmit": handleLogin
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "10px",
      "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
      "color": "#f9fafb",
      "border": "none",
      "borderRadius": "999px",
      "cursor": "pointer",
      "fontWeight": "600",
      "fontSize": "14px",
      "marginTop": "4px",
      "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"
    }
  }, ["Login"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "16px",
      "fontSize": "13px",
      "color": "#9ca3af"
    }
  }, ["Need an account?", " ", __jacJsx(Link, {
    "to": "/customersignup",
    "style": {
      "color": "#38bdf8",
      "textDecoration": "none",
      "fontWeight": "500"
    }
  }, ["Sign up"])])])]);
}
function AdminLoginPage() {
  var _useState7 = useState(""),
    _useState8 = _slicedToArray(_useState7, 2),
    username = _useState8[0],
    setUsername = _useState8[1];
  var _useState9 = useState(""),
    _useState0 = _slicedToArray(_useState9, 2),
    password = _useState0[0],
    setPassword = _useState0[1];
  var _useState1 = useState(""),
    _useState10 = _slicedToArray(_useState1, 2),
    error = _useState10[0],
    setError = _useState10[1];
  var navigate = useNavigate();
  function handleLogin(_x2) {
    return _handleLogin2.apply(this, arguments);
  }
  function _handleLogin2() {
    _handleLogin2 = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee2(e) {
      var adminUsername, success;
      return _regenerator().w(function (_context2) {
        while (1) switch (_context2.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context2.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context2.a(2);
          case 1:
            adminUsername = "admin:".concat(username);
            _context2.n = 2;
            return jacLogin(adminUsername, password);
          case 2:
            success = _context2.v;
            if (success) {
              navigate("/Admin");
            } else {
              setError("Invalid credentials");
            }
          case 3:
            return _context2.a(2);
        }
      }, _callee2);
    }));
    return _handleLogin2.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#fca5a5",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
      "padding": "24px"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "32px 28px",
      "borderRadius": "18px",
      "width": "320px",
      "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
      "border": "1px solid #1f2937",
      "color": "#e5e7eb",
      "boxSizing": "border-box"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "fontSize": "22px",
      "fontWeight": "700"
    }
  }, ["Login"]), __jacJsx("form", {
    "onSubmit": handleLogin
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "10px",
      "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
      "color": "#f9fafb",
      "border": "none",
      "borderRadius": "999px",
      "cursor": "pointer",
      "fontWeight": "600",
      "fontSize": "14px",
      "marginTop": "4px",
      "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"
    }
  }, ["Login"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "16px",
      "fontSize": "13px",
      "color": "#9ca3af"
    }
  }, ["Need an account?", " ", __jacJsx(Link, {
    "to": "/adminsignup",
    "style": {
      "color": "#38bdf8",
      "textDecoration": "none",
      "fontWeight": "500"
    }
  }, ["Sign up"])])])]);
}
function CustomerSignupPage() {
  var _useState11 = useState(""),
    _useState12 = _slicedToArray(_useState11, 2),
    username = _useState12[0],
    setUsername = _useState12[1];
  var _useState13 = useState(""),
    _useState14 = _slicedToArray(_useState13, 2),
    password = _useState14[0],
    setPassword = _useState14[1];
  var _useState15 = useState(""),
    _useState16 = _slicedToArray(_useState15, 2),
    error = _useState16[0],
    setError = _useState16[1];
  var navigate = useNavigate();
  function handleSignup(_x3) {
    return _handleSignup.apply(this, arguments);
  }
  function _handleSignup() {
    _handleSignup = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee3(e) {
      var customerUsername, result;
      return _regenerator().w(function (_context3) {
        while (1) switch (_context3.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context3.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context3.a(2);
          case 1:
            customerUsername = "cust:".concat(username);
            _context3.n = 2;
            return jacSignup(customerUsername, password);
          case 2:
            result = _context3.v;
            if (result["success"]) {
              navigate("/Customer");
            } else {
              setError(result["error"] ? result["error"] : "Signup failed");
            }
          case 3:
            return _context3.a(2);
        }
      }, _callee3);
    }));
    return _handleSignup.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#fca5a5",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
      "padding": "24px"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "32px 28px",
      "borderRadius": "18px",
      "width": "320px",
      "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
      "border": "1px solid #1f2937",
      "color": "#e5e7eb",
      "boxSizing": "border-box"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "fontSize": "22px",
      "fontWeight": "700"
    }
  }, ["Sign Up"]), __jacJsx("form", {
    "onSubmit": handleSignup
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "10px",
      "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
      "color": "#f9fafb",
      "border": "none",
      "borderRadius": "999px",
      "cursor": "pointer",
      "fontWeight": "600",
      "fontSize": "14px",
      "marginTop": "4px",
      "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"
    }
  }, ["Sign Up"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "16px",
      "fontSize": "13px",
      "color": "#9ca3af"
    }
  }, ["Have an account?", " ", __jacJsx(Link, {
    "to": "/customerlogin",
    "style": {
      "color": "#38bdf8",
      "textDecoration": "none",
      "fontWeight": "500"
    }
  }, ["Customer Login"])])])]);
}
function AdminSignupPage() {
  var _useState17 = useState(""),
    _useState18 = _slicedToArray(_useState17, 2),
    username = _useState18[0],
    setUsername = _useState18[1];
  var _useState19 = useState(""),
    _useState20 = _slicedToArray(_useState19, 2),
    password = _useState20[0],
    setPassword = _useState20[1];
  var _useState21 = useState(""),
    _useState22 = _slicedToArray(_useState21, 2),
    error = _useState22[0],
    setError = _useState22[1];
  var navigate = useNavigate();
  function handleSignup(_x4) {
    return _handleSignup2.apply(this, arguments);
  }
  function _handleSignup2() {
    _handleSignup2 = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee4(e) {
      var adminUsername, result;
      return _regenerator().w(function (_context4) {
        while (1) switch (_context4.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context4.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context4.a(2);
          case 1:
            adminUsername = "admin:".concat(username);
            _context4.n = 2;
            return jacSignup(adminUsername, password);
          case 2:
            result = _context4.v;
            if (result["success"]) {
              navigate("/Admin");
            } else {
              setError(result["error"] ? result["error"] : "Signup failed");
            }
          case 3:
            return _context4.a(2);
        }
      }, _callee4);
    }));
    return _handleSignup2.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#fca5a5",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
      "padding": "24px"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "32px 28px",
      "borderRadius": "18px",
      "width": "320px",
      "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
      "border": "1px solid #1f2937",
      "color": "#e5e7eb",
      "boxSizing": "border-box"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "fontSize": "22px",
      "fontWeight": "700"
    }
  }, ["Sign Up"]), __jacJsx("form", {
    "onSubmit": handleSignup
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "10px",
      "marginBottom": "10px",
      "border": "1px solid #374151",
      "borderRadius": "8px",
      "boxSizing": "border-box",
      "backgroundColor": "#020617",
      "color": "#e5e7eb",
      "fontSize": "14px"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "10px",
      "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
      "color": "#f9fafb",
      "border": "none",
      "borderRadius": "999px",
      "cursor": "pointer",
      "fontWeight": "600",
      "fontSize": "14px",
      "marginTop": "4px",
      "boxShadow": "0 12px 30px rgba(34,197,94,0.45)"
    }
  }, ["Sign Up"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "16px",
      "fontSize": "13px",
      "color": "#9ca3af"
    }
  }, ["Have an account?", " ", __jacJsx(Link, {
    "to": "/adminlogin",
    "style": {
      "color": "#38bdf8",
      "textDecoration": "none",
      "fontWeight": "500"
    }
  }, ["Admin Login"])])])]);
}
function Customer() {
  var _useState23 = useState(""),
    _useState24 = _slicedToArray(_useState23, 2),
    answer = _useState24[0],
    setAnswer = _useState24[1];
  var _useState25 = useState(""),
    _useState26 = _slicedToArray(_useState25, 2),
    input = _useState26[0],
    setInput = _useState26[1];
  var _useState27 = useState(false),
    _useState28 = _slicedToArray(_useState27, 2),
    loading = _useState28[0],
    setLoading = _useState28[1];
  function computeAnswer() {
    return _computeAnswer.apply(this, arguments);
  }
  function _computeAnswer() {
    _computeAnswer = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee5() {
      var response, result;
      return _regenerator().w(function (_context5) {
        while (1) switch (_context5.n) {
          case 0:
            setLoading(true);
            setAnswer("");
            _context5.n = 1;
            return __jacSpawn("analyzer", "", {
              "feedback": input
            });
          case 1:
            response = _context5.v;
            result = response.reports;
            setAnswer(result);
            setLoading(false);
          case 2:
            return _context5.a(2);
        }
      }, _callee5);
    }));
    return _computeAnswer.apply(this, arguments);
  }
  return __jacJsx("div", {
    "className": "customer-page"
  }, [__jacJsx("div", {
    "className": "customer-column"
  }, [__jacJsx(ReviewInputCard, {
    "input": input,
    "setInput": setInput,
    "computeAnswer": computeAnswer
  }, []), __jacJsx(AutoReplyCard, {
    "answer": answer,
    "loading": loading
  }, [])])]);
}
function Admin() {
  var _useState29 = useState("Last 3 Days"),
    _useState30 = _slicedToArray(_useState29, 2),
    range = _useState30[0],
    setRange = _useState30[1];
  var _useState31 = useState([]),
    _useState32 = _slicedToArray(_useState31, 2),
    positive_count = _useState32[0],
    setPositiveCount = _useState32[1];
  var _useState33 = useState([]),
    _useState34 = _slicedToArray(_useState33, 2),
    negative_count = _useState34[0],
    setNegativeCount = _useState34[1];
  var _useState35 = useState([]),
    _useState36 = _slicedToArray(_useState35, 2),
    neutral_count = _useState36[0],
    setNeutralCount = _useState36[1];
  var _useState37 = useState(null),
    _useState38 = _slicedToArray(_useState37, 2),
    pricing_count = _useState38[0],
    setPricingCount = _useState38[1];
  var _useState39 = useState(null),
    _useState40 = _slicedToArray(_useState39, 2),
    food_quality_count = _useState40[0],
    setFoodQualityCount = _useState40[1];
  var _useState41 = useState(null),
    _useState42 = _slicedToArray(_useState41, 2),
    delivery_count = _useState42[0],
    setDeliveryCount = _useState42[1];
  var _useState43 = useState(null),
    _useState44 = _slicedToArray(_useState43, 2),
    other_count = _useState44[0],
    setOtherCount = _useState44[1];
  var _useState45 = useState([]),
    _useState46 = _slicedToArray(_useState45, 2),
    dates = _useState46[0],
    setDates = _useState46[1];
  var _useState47 = useState([]),
    _useState48 = _slicedToArray(_useState47, 2),
    data = _useState48[0],
    setData = _useState48[1];
  var _useState49 = useState(""),
    _useState50 = _slicedToArray(_useState49, 2),
    summary = _useState50[0],
    setSummary = _useState50[1];
  var _useState51 = useState(false),
    _useState52 = _slicedToArray(_useState51, 2),
    loading = _useState52[0],
    setLoading = _useState52[1];
  function get_data(_x5) {
    return _get_data.apply(this, arguments);
  }
  function _get_data() {
    _get_data = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee6(e) {
      var response, result, data_list, lent, num, d;
      return _regenerator().w(function (_context6) {
        while (1) switch (_context6.n) {
          case 0:
            setRange(e.target.value);
            _context6.n = 1;
            return __jacSpawn("grt_counts", "", {
              "range_option": e.target.value
            });
          case 1:
            response = _context6.v;
            console.log(response);
            result = response.reports[0];
            setPositiveCount(result["positive_count"]);
            setNegativeCount(result["negative_count"]);
            setNeutralCount(result["neutral_count"]);
            setPricingCount(result["pricing_count"]);
            setFoodQualityCount(result["food_quality_count"]);
            setDeliveryCount(result["delivery_count"]);
            setOtherCount(result["other_count"]);
            setDates(result["dates"]);
            data_list = [];
            lent = result["dates"].length;
            console.log("lent", lent);
            num = 0;
            while (num < lent) {
              console.log("num", num);
              console.log("date", result["dates"][num]);
              d = {
                "date": result["dates"][num],
                "Positive": result["positive_count"][num],
                "Negative": result["negative_count"][num],
                "Neutral": result["neutral_count"][num]
              };
              data_list.push(d);
              num = num + 1;
            }
            setData(data_list);
          case 2:
            return _context6.a(2);
        }
      }, _callee6);
    }));
    return _get_data.apply(this, arguments);
  }
  function gen_summary() {
    return _gen_summary.apply(this, arguments);
  }
  function _gen_summary() {
    _gen_summary = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee7() {
      var summ, result;
      return _regenerator().w(function (_context7) {
        while (1) switch (_context7.n) {
          case 0:
            setLoading(true);
            _context7.n = 1;
            return __jacSpawn("summerize", "", {
              "range_option": range
            });
          case 1:
            summ = _context7.v;
            result = summ.reports[0];
            setSummary(result["summary"]);
            setLoading(false);
          case 2:
            return _context7.a(2);
        }
      }, _callee7);
    }));
    return _gen_summary.apply(this, arguments);
  }
  return __jacJsx("div", {
    "className": "pageC"
  }, [__jacJsx("div", {
    "className": "contentC"
  }, [__jacJsx("div", {
    "className": "header-rowNew",
    "style": {
      "marginBottom": "16px"
    }
  }, [__jacJsx("div", {}, [__jacJsx("div", {
    "className": "header-titleNew"
  }, ["Comment activity graph"]), __jacJsx("div", {
    "className": "header-subtitleNew"
  }, ["Visualise positive, negative and neutral comments over time."])]), __jacJsx("select", {
    "value": range,
    "onChange": function onChange(e) {
      get_data(e);
    },
    "className": "range-select"
  }, [__jacJsx("option", {
    "value": "Last 3 Days"
  }, ["Last 3 Days"]), __jacJsx("option", {
    "value": "Last 7 Days"
  }, ["Last 7 Days"]), __jacJsx("option", {
    "value": "Last 30 Days"
  }, ["Last 30 Days"])])]), __jacJsx("div", {
    "className": "card-base"
  }, [__jacJsx(StatsRow, {
    "range": range,
    "foodValue": food_quality_count,
    "deliveryValue": delivery_count,
    "pricingValue": pricing_count,
    "otherValue": other_count
  }, []), __jacJsx(SentimentBarChart, {
    "chartdata": data
  }, [])]), __jacJsx("div", {
    "className": "card-base"
  }, [__jacJsx(SummaryCard, {
    "summary": summary,
    "loading": loading
  }, []), __jacJsx("div", {
    "className": "button-row"
  }, [__jacJsx("button", {
    "onClick": function onClick() {
      gen_summary();
    },
    "className": "btn-primary"
  }, ["Generate Summary"])])])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {
    "style": {
      "fontFamily": "system-ui, sans-serif"
    }
  }, [__jacJsx(Navigation, {}, []), __jacJsx(Routes, {}, [__jacJsx(Route, {
    "path": "/",
    "element": __jacJsx(Home, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/customerlogin",
    "element": __jacJsx(CustomerLoginPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/adminlogin",
    "element": __jacJsx(AdminLoginPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/customersignup",
    "element": __jacJsx(CustomerSignupPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/adminsignup",
    "element": __jacJsx(AdminSignupPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/Customer",
    "element": __jacJsx(Customer, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/Admin",
    "element": __jacJsx(Admin, {}, [])
  }, [])])])]);
}
export { Admin, AdminLoginPage, AdminSignupPage, Customer, CustomerLoginPage, CustomerSignupPage, Navigation, app };