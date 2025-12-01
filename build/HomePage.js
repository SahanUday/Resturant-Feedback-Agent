import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
function Home() {
  return __jacJsx("div", {
    "className": "page-home"
  }, [__jacJsx("div", {
    "className": "container-home"
  }, [__jacJsx("div", {}, [__jacJsx("h1", {
    "className": "title-home"
  }, ["Kamra Feedback Portal"]), __jacJsx("p", {
    "className": "shop-description-home"
  }, ["Kamra is your cosy corner for great food and better moments.Use this portal to share your experience so we can keep improvingour dishes, delivery, and service for you."])]), __jacJsx("div", {}, [__jacJsx("p", {
    "className": "mid-description-home"
  }, ["Login or sign up to give your feedback."])]), __jacJsx("div", {
    "className": "cards-row-home"
  }, [__jacJsx("div", {
    "className": "portal-card-home"
  }, [__jacJsx("h3", {
    "className": "card-title-home"
  }, ["For customers"]), __jacJsx("p", {
    "className": "card-subtitle-home"
  }, ["Share your dining or delivery experience, track your past feedback,and help Kamra become your perfect spot."]), __jacJsx(Link, {
    "to": "/Customer",
    "className": "card-button-home"
  }, ["Go to customer portal"])]), __jacJsx("div", {
    "className": "portal-card-home"
  }, [__jacJsx("h3", {
    "className": "card-title-home"
  }, ["For admins"]), __jacJsx("p", {
    "className": "card-subtitle-home"
  }, ["Review customer feedback, monitor trends, and respond to issuesfrom your management dashboard."]), __jacJsx(Link, {
    "to": "/Admin",
    "className": "card-button-home"
  }, ["Go to admin portal"])])])])]);
}
export { Home };