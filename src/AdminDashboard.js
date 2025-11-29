import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { useState } from "react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, CartesianGrid, Legend, ResponsiveContainer } from "recharts";
function pageStyle() {
  return {"minHeight": "100vh", "backgroundColor": "#0f172a", "display": "flex", "justifyContent": "center", "alignItems": "flex-start", "padding": "32px", "fontFamily": "system-ui, sans-serif", "boxSizing": "border-box"};
}
function contentStyle() {
  return {"width": "100%", "maxWidth": "900px", "display": "flex", "flexDirection": "column", "gap": "18px"};
}
function cardBaseStyle() {
  return {"backgroundColor": "#020617", "borderRadius": "16px", "padding": "24px", "boxShadow": "0 14px 45px rgba(15,23,42,0.65)", "boxSizing": "border-box", "border": "1px solid #1f2937"};
}
function SentimentBarChart(props) {
  return __jacJsx(ResponsiveContainer, {"width": "100%", "height": 400}, [__jacJsx(BarChart, {"data": props.chartdata, "margin": {top: 20, right: 30, left: 20, bottom: 5}}, [__jacJsx(CartesianGrid, {"strokeDasharray": "3 3"}, []), __jacJsx(XAxis, {"dataKey": "date"}, []), __jacJsx(YAxis, {}, []), __jacJsx(Tooltip, {}, []), __jacJsx(Legend, {}, []), __jacJsx(Bar, {"dataKey": "Positive", "fill": "#4CAF50"}, []), __jacJsx(Bar, {"dataKey": "Negative", "fill": "#F44336"}, []), __jacJsx(Bar, {"dataKey": "Neutral", "fill": "#FFC107"}, [])])]);
}
function StatCard(props) {
  return __jacJsx("div", {"className": "card stat-card"}, [__jacJsx("div", {"className": "stat-label"}, [props.label]), __jacJsx("div", {"className": "stat-value"}, [props.value])]);
}
function StatsRow(props) {
  return __jacJsx("div", {"className": "sentiment-grid"}, [__jacJsx(StatCard, {"label": "Food Quality", "value": props.foodValue}, []), __jacJsx(StatCard, {"label": "Delivery", "value": props.deliveryValue}, []), __jacJsx(StatCard, {"label": "Pricing", "value": props.pricingValue}, []), __jacJsx(StatCard, {"label": "Others", "value": props.otherValue}, [])]);
}
function SummaryCard(props) {
  let displayText = props.summary;
  return __jacJsx("div", {"className": "card"}, [__jacJsx("h2", {"className": "section-title"}, ["Summary"]), __jacJsx("p", {"className": "section-subtitle"}, ["Click the Generate Summary button to generate summary."]), __jacJsx("div", {"className": "summary-box"}, [props.loading && __jacJsx("div", {"className": "flex justify-center items-center my-3"}, [__jacJsx("div", {"className": "animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"}, []), __jacJsx("span", {"className": "ml-2 text-sm text-gray-500"}, ["Generating reply..."])]), displayText])]);
}
export { SentimentBarChart, StatCard, StatsRow, SummaryCard, cardBaseStyle, contentStyle, pageStyle };
