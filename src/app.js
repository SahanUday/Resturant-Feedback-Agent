import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { SentimentBarChart, StatCard, StatsRow, SummaryCard, SuggestionsCard } from "./components/AdminDashboard.js";
import { Home } from "./components/HomePage.js";
import { ReviewInputCard, AutoReplyCard } from "./components/customerdashboard.js";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate } from "@jac-client/utils";
import "./cstyles.css";
import "./adstyles.css";
import "./homestyle.css";
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
  let [suggestions, setSuggestions] = useState("");
  let [loading, setLoading] = useState(false);
  let [suggestionLoading, setSuggestionLoading] = useState(false);
  async function get_data(e) {
    setRange(e.target.value);
    let response = await __jacSpawn("grt_counts", "", {"range_option": e.target.value});
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
    setSummary("");
    let summ = await __jacSpawn("summerize", "", {"range_option": range});
    let result = summ.reports[0];
    setSummary(result["summary"]);
    setLoading(false);
  }
  async function generate_suggestions() {
    setSuggestionLoading(true);
    setSuggestions("");
    let summ = await __jacSpawn("suggestions", "", {"range_option": range});
    let result = summ.reports[0];
    setSuggestions(result["suggestions"]);
    setSuggestionLoading(false);
  }
  return __jacJsx("div", {"className": "pageC"}, [__jacJsx("div", {"className": "contentC"}, [__jacJsx("div", {"className": "header-rowNew", "style": {"marginBottom": "16px"}}, [__jacJsx("div", {}, [__jacJsx("div", {"className": "header-titleNew"}, ["Comment activity graph"]), __jacJsx("div", {"className": "header-subtitleNew"}, ["Visualise positive, negative and neutral comments over time."])]), __jacJsx("select", {"value": range, "onChange": e => {
    get_data(e);
  }, "className": "range-select"}, [__jacJsx("option", {"value": "Last 3 Days"}, ["Last 3 Days"]), __jacJsx("option", {"value": "Last 7 Days"}, ["Last 7 Days"]), __jacJsx("option", {"value": "Last 30 Days"}, ["Last 30 Days"])])]), __jacJsx("div", {"className": "card-base"}, [__jacJsx(StatsRow, {"range": range, "foodValue": food_quality_count, "deliveryValue": delivery_count, "pricingValue": pricing_count, "otherValue": other_count}, []), __jacJsx(SentimentBarChart, {"chartdata": data}, [])]), __jacJsx("div", {"className": "card-base"}, [__jacJsx(SummaryCard, {"summary": summary, "loading": loading}, []), __jacJsx("div", {"className": "button-row"}, [__jacJsx("button", {"onClick": () => {
    gen_summary();
  }, "className": "btn-primary"}, ["Generate Summary"])])]), __jacJsx("div", {"className": "card-base"}, [__jacJsx(SuggestionsCard, {"suggestions": suggestions, "loading": suggestionLoading}, []), __jacJsx("div", {"className": "button-row"}, [__jacJsx("button", {"onClick": () => {
    generate_suggestions();
  }, "className": "btn-primary"}, ["Generate Suggestions"])])])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {"style": {"fontFamily": "system-ui, sans-serif"}}, [__jacJsx(Routes, {}, [__jacJsx(Route, {"path": "/", "element": __jacJsx(Home, {}, [])}, []), __jacJsx(Route, {"path": "/Customer", "element": __jacJsx(Customer, {}, [])}, []), __jacJsx(Route, {"path": "/Admin", "element": __jacJsx(Admin, {}, [])}, [])])])]);
}
export { Admin, Customer, app };
