import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
function pageStyle() {
  return {
    "minHeight": "100vh",
    "margin": "0",
    "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
    "display": "flex",
    "justifyContent": "center",
    "alignItems": "center",
    "fontFamily": "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
    "color": "#e5e7eb"
  };
}
function containerStyle() {
  return {
    "maxWidth": "800px",
    "width": "100%",
    "padding": "40px 24px",
    "boxSizing": "border-box",
    "textAlign": "center",
    "display": "flex",
    "flexDirection": "column",
    "gap": "32px"
  };
}
function titleStyle() {
  return {
    "fontSize": "32px",
    "fontWeight": "800",
    "letterSpacing": "0.08em",
    "textTransform": "uppercase"
  };
}
function shopDescriptionStyle() {
  return {
    "fontSize": "15px",
    "color": "#9ca3af",
    "maxWidth": "640px",
    "margin": "0 auto",
    "lineHeight": "1.7"
  };
}
function midDescriptionStyle() {
  return {
    "fontSize": "13px",
    "color": "#a5b4fc"
  };
}
function cardsRowStyle() {
  return {
    "display": "flex",
    "gap": "24px",
    "justifyContent": "center",
    "flexWrap": "wrap"
  };
}
function portalCardStyle() {
  return {
    "flex": "1",
    "minWidth": "260px",
    "maxWidth": "320px",
    "backgroundColor": "#020617",
    "borderRadius": "18px",
    "border": "1px solid #1f2937",
    "padding": "20px 18px",
    "boxSizing": "border-box",
    "boxShadow": "0 16px 40px rgba(15,23,42,0.8)",
    "textAlign": "left",
    "display": "flex",
    "flexDirection": "column",
    "justifyContent": "space-between",
    "gap": "16px"
  };
}
function cardTitleStyle() {
  return {
    "fontSize": "16px",
    "fontWeight": "600",
    "marginBottom": "4px"
  };
}
function cardSubtitleStyle() {
  return {
    "fontSize": "12px",
    "color": "#9ca3af",
    "marginBottom": "16px"
  };
}
function cardButtonStyle() {
  return {
    "display": "inline-block",
    "padding": "8px 16px",
    "borderRadius": "999px",
    "border": "none",
    "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
    "color": "#f9fafb",
    "fontSize": "13px",
    "fontWeight": "600",
    "cursor": "pointer",
    "textDecoration": "none",
    "boxShadow": "0 12px 28px rgba(34,197,94,0.4)"
  };
}
function Home() {
  return __jacJsx("div", {
    "style": pageStyle()
  }, [__jacJsx("div", {
    "style": containerStyle()
  }, [__jacJsx("div", {}, [__jacJsx("h1", {
    "style": titleStyle()
  }, ["Kamra Feedback Portal"]), __jacJsx("p", {
    "style": shopDescriptionStyle()
  }, ["Kamra is your cosy corner for great food and better moments.Use this portal to share your experience so we can keep improvingour dishes, delivery, and service for you."])]), __jacJsx("div", {}, [__jacJsx("p", {
    "style": midDescriptionStyle()
  }, ["Login or sign up to give your feedback."])]), __jacJsx("div", {
    "style": cardsRowStyle()
  }, [__jacJsx("div", {
    "style": portalCardStyle()
  }, [__jacJsx("h3", {
    "style": cardTitleStyle()
  }, ["For customers"]), __jacJsx("p", {
    "style": cardSubtitleStyle()
  }, ["Share your dining or delivery experience, track your past feedback,and help Kamra become your perfect spot."]), __jacJsx(Link, {
    "to": "/customerlogin",
    "style": cardButtonStyle()
  }, ["Go to customer portal"])]), __jacJsx("div", {
    "style": portalCardStyle()
  }, [__jacJsx("h3", {
    "style": cardTitleStyle()
  }, ["For admins"]), __jacJsx("p", {
    "style": cardSubtitleStyle()
  }, ["Review customer feedback, monitor trends, and respond to issuesfrom your management dashboard."]), __jacJsx(Link, {
    "to": "/adminlogin",
    "style": cardButtonStyle()
  }, ["Go to admin portal"])])])])]);
}
export { Home, cardButtonStyle, cardSubtitleStyle, cardTitleStyle, cardsRowStyle, containerStyle, midDescriptionStyle, pageStyle, portalCardStyle, shopDescriptionStyle, titleStyle };