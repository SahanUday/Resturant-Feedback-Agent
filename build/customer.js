function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState } from "react";
function cardBaseStyle() {
  return {
    "backgroundColor": "#ffffff",
    "borderRadius": "16px",
    "padding": "24px",
    "boxShadow": "0 10px 30px rgba(15,23,42,0.08)",
    "boxSizing": "border-box"
  };
}
function sectionTitleStyle() {
  return {
    "fontSize": "20px",
    "fontWeight": "700",
    "color": "#111827",
    "marginBottom": "4px"
  };
}
function sectionSubtitleStyle() {
  return {
    "fontSize": "13px",
    "color": "#6b7280",
    "marginBottom": "16px"
  };
}
function primaryButtonStyle() {
  return {
    "padding": "10px 18px",
    "borderRadius": "8px",
    "border": "none",
    "backgroundColor": "#2563eb",
    "color": "#ffffff",
    "fontSize": "14px",
    "fontWeight": "600",
    "cursor": "pointer"
  };
}
function pillButtonBaseStyle() {
  return {
    "padding": "6px 12px",
    "borderRadius": "999px",
    "border": "1px solid #e5e7eb",
    "backgroundColor": "#ffffff",
    "fontSize": "13px",
    "cursor": "pointer"
  };
}
function ReviewInputCard(props) {
  var cardStyle = cardBaseStyle();
  var titleStyle = sectionTitleStyle();
  var subtitleStyle = sectionSubtitleStyle();
  var postBtnStyle = primaryButtonStyle();
  return __jacJsx("div", {
    "style": cardStyle
  }, [__jacJsx("h2", {
    "style": titleStyle
  }, ["Share your experience"]), __jacJsx("p", {
    "style": subtitleStyle
  }, ["Tell us about your visit so we can improve our restaurant service."]), __jacJsx("label", {
    "style": {
      "fontSize": "13px",
      "color": "#4b5563",
      "display": "block",
      "marginBottom": "8px"
    }
  }, ["Your review"]), __jacJsx("textarea", {
    "value": props.input,
    "onChange": function onChange(e) {
      props.setInput(e.target.value);
    },
    "placeholder": "Write your review here…",
    "style": {
      "width": "100%",
      "minHeight": "140px",
      "resize": "vertical",
      "padding": "12px",
      "borderRadius": "8px",
      "border": "1px solid #e5e7eb",
      "fontSize": "14px",
      "outline": "none",
      "boxSizing": "border-box"
    }
  }, []), __jacJsx("div", {
    "style": {
      "display": "flex",
      "justifyContent": "flex-end",
      "marginTop": "16px"
    }
  }, [__jacJsx("button", {
    "onClick": function onClick() {
      props.handlePost();
    },
    "style": postBtnStyle
  }, ["Post Review"])])]);
}
function AutoReplyCard() {
  var cardStyle = cardBaseStyle();
  var titleStyle = sectionTitleStyle();
  var subtitleStyle = sectionSubtitleStyle();
  return __jacJsx("div", {
    "style": cardStyle
  }, [__jacJsx("h2", {
    "style": titleStyle
  }, ["Automatic reply"]), __jacJsx("p", {
    "style": subtitleStyle
  }, ["The system will generate a friendly response to your review here."]), __jacJsx("div", {
    "style": {
      "borderRadius": "12px",
      "border": "1px dashed #d1d5db",
      "padding": "16px",
      "backgroundColor": "#f9fafb",
      "fontSize": "14px",
      "color": "#6b7280",
      "minHeight": "80px",
      "display": "flex",
      "alignItems": "center"
    }
  }, ["Automatic reply preview will appear here…"])]);
}
function ReviewFilters() {
  var _useState = useState("all"),
    _useState2 = _slicedToArray(_useState, 2),
    activeFilter = _useState2[0],
    setActiveFilter = _useState2[1];
  function pillStyle(name) {
    var base = pillButtonBaseStyle();
    if (name === activeFilter) {
      base["backgroundColor"] = "#2563eb";
      base["color"] = "#ffffff";
      base["border"] = "1px solid #2563eb";
    } else {
      base["backgroundColor"] = "#ffffff";
      base["color"] = "#111827";
      base["border"] = "1px solid #e5e7eb";
    }
    return base;
  }
  return __jacJsx("div", {
    "style": {
      "display": "flex",
      "flexDirection": "column",
      "alignItems": "flex-start",
      "gap": "10px",
      "marginBottom": "16px"
    }
  }, [__jacJsx("div", {}, [__jacJsx("h2", {
    "style": {
      "fontSize": "18px",
      "fontWeight": "600",
      "color": "#111827",
      "marginBottom": "2px"
    }
  }, ["Latest reviews"]), __jacJsx("p", {
    "style": {
      "fontSize": "12px",
      "color": "#9ca3af"
    }
  }, ["Filter feedback by category."])]), __jacJsx("div", {
    "style": {
      "display": "flex",
      "gap": "8px",
      "flexWrap": "wrap"
    }
  }, [__jacJsx("button", {
    "onClick": function onClick() {
      setActiveFilter("all");
    },
    "style": pillStyle("all")
  }, ["All"]), __jacJsx("button", {
    "onClick": function onClick() {
      setActiveFilter("food");
    },
    "style": pillStyle("food")
  }, ["Food"]), __jacJsx("button", {
    "onClick": function onClick() {
      setActiveFilter("delivery");
    },
    "style": pillStyle("delivery")
  }, ["Delivery"]), __jacJsx("button", {
    "onClick": function onClick() {
      setActiveFilter("service");
    },
    "style": pillStyle("service")
  }, ["Service"])])]);
}
function ReviewList() {
  return __jacJsx("div", {
    "style": {
      "borderRadius": "12px",
      "border": "1px dashed #e5e7eb",
      "padding": "20px",
      "backgroundColor": "#f9fafb",
      "color": "#9ca3af",
      "fontSize": "14px",
      "textAlign": "center",
      "minHeight": "160px",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center"
    }
  }, ["Reviews will appear here once the system is connected."]);
}
function CustomerDashboard() {
  var _useState3 = useState(""),
    _useState4 = _slicedToArray(_useState3, 2),
    input = _useState4[0],
    setInput = _useState4[1];
  function handlePost() {
    console.log("USER REVIEW:", input);
    setInput("");
  }
  var pageStyle = {
    "minHeight": "100vh",
    "backgroundColor": "#f3f4f6",
    "display": "flex",
    "justifyContent": "center",
    "alignItems": "flex-start",
    "padding": "32px",
    "fontFamily": "system-ui, sans-serif",
    "boxSizing": "border-box"
  };
  var contentWrapperStyle = {
    "width": "100%",
    "maxWidth": "1120px",
    "display": "flex",
    "gap": "24px"
  };
  var leftColumnStyle = {
    "flex": "2",
    "display": "flex",
    "flexDirection": "column",
    "gap": "20px"
  };
  var rightColumnStyle = {
    "flex": "1.2",
    "display": "flex",
    "flexDirection": "column"
  };
  var rightCardStyle = cardBaseStyle();
  rightCardStyle["height"] = "100%";
  return __jacJsx("div", {
    "style": pageStyle
  }, [__jacJsx("div", {
    "style": contentWrapperStyle
  }, [__jacJsx("div", {
    "style": leftColumnStyle
  }, [__jacJsx(ReviewInputCard, {
    "input": input,
    "setInput": setInput,
    "handlePost": handlePost
  }, []), __jacJsx(AutoReplyCard, {}, [])]), __jacJsx("div", {
    "style": rightColumnStyle
  }, [__jacJsx("div", {
    "style": rightCardStyle
  }, [__jacJsx(ReviewFilters, {}, []), __jacJsx(ReviewList, {}, [])])])])]);
}
function app() {
  return __jacJsx(CustomerDashboard, {}, []);
}
export { AutoReplyCard, CustomerDashboard, ReviewFilters, ReviewInputCard, ReviewList, app, cardBaseStyle, pillButtonBaseStyle, primaryButtonStyle, sectionSubtitleStyle, sectionTitleStyle };