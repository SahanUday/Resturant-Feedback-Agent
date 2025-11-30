cl import from react { useState, useEffect }

cl import from "@jac-client/utils" {
    Router,
    Routes,
    Route,
    Link,
    Navigate,
    useNavigate,
    jacSignup,
    jacLogin,
    jacLogout,
    jacIsLoggedIn
}

import ".cstyles.css";
import ".adstyles.css";
import ".homestyle.css";

# Navigation
# Navigation
def Navigation()  -> any {
    let isLoggedIn = jacIsLoggedIn();
    let navigate = useNavigate();

    def handleLogout(e: any) -> None {
        e.preventDefault();
        jacLogout();
        navigate("/");
    }

    if isLoggedIn {
        return <nav
            style={{
                "padding": "12px 24px",
                "background": "linear-gradient(90deg,#020617,#0b1120,#020617)",
                "color": "#ffffff",
                "display": "flex",
                "justifyContent": "space-between"
            }}
        >
            <div
                style={{"fontWeight": "600"}}
            >
                KAMRA 
            </div>
            <div
                style={{"display": "flex", "gap": "16px"}}
            >
                <button
                    onClick={handleLogout}
                    style={{
                        "background": "none",
                        "color": "#ffffff",
                        "border": "1px solid #ffffff",
                        "padding": "2px 10px",
                        "borderRadius": "4px",
                        "cursor": "pointer"
                    }}
                >
                    Logout
                </button>
            </div>
        </nav>;
    }

    # Not logged in: just show the title bar, no buttons
    return <nav
        style={{
            "padding": "12px 24px",
            "background": "linear-gradient(90deg,#020617,#0b1120,#020617)",
            "color": "#ffffff",
            "display": "flex",
            "justifyContent": "space-between"
        }}
    >
        <div
            style={{"fontWeight": "600"}}
        >
            KAMRA
        </div>
        <div />
    </nav>;
}


# CustomerLogin Page
def CustomerLoginPage()  -> any {
    let [username, setUsername] = useState("");
    let [password, setPassword] = useState("");
    let [error, setError] = useState("");
    let navigate = useNavigate();

    async def handleLogin(e: any) -> None {
        e.preventDefault();
        setError("");
        if not username or not password {
            setError("Please fill in all fields");
            return;
        }
        customerUsername = f"cust:{username}";
        success = await jacLogin(customerUsername, password);
        if success {
            navigate("/Customer");
        } else {
            setError("Invalid credentials");
        }
    }

    def handleUsernameChange(e: any) -> None {
        setUsername(e.target.value);
    }

    def handlePasswordChange(e: any) -> None {
        setPassword(e.target.value);
    }

    let errorDisplay = None;
    if error {
        errorDisplay = <div
            style={{"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}
        >
            {error}
        </div>;
    }

    return <div
        style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
            "padding": "24px"
        }}
    >
        <div
            style={{
                "background": "#020617",
                "padding": "32px 28px",
                "borderRadius": "18px",
                "width": "320px",
                "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
                "border": "1px solid #1f2937",
                "color": "#e5e7eb",
                "boxSizing": "border-box"
            }}
        >
            <h2
                style={{"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}
            >
                Login
            </h2>
            <form
                onSubmit={handleLogin}
            >
                <input
                    type="text"
                    value={username}
                    onChange={handleUsernameChange}
                    placeholder="Username"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
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
                    }}
                >
                    Login
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "16px",
                    "fontSize": "13px",
                    "color": "#9ca3af"
                }}
            >
                Need an account?{" "}
                <Link
                    to="/customersignup"
                    style={{"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}
                >
                    Sign up
                </Link>
            </p>
        </div>
    </div>;
}


# AdminLogin Page
def AdminLoginPage()  -> any {
    let [username, setUsername] = useState("");
    let [password, setPassword] = useState("");
    let [error, setError] = useState("");
    let navigate = useNavigate();

    async def handleLogin(e: any) -> None {
        e.preventDefault();
        setError("");
        if not username or not password {
            setError("Please fill in all fields");
            return;
        }
        adminUsername = f"admin:{username}";
        success = await jacLogin(adminUsername, password);
        if success {
            navigate("/Admin");
        } else {
            setError("Invalid credentials");
        }
    }

    def handleUsernameChange(e: any) -> None {
        setUsername(e.target.value);
    }

    def handlePasswordChange(e: any) -> None {
        setPassword(e.target.value);
    }

    let errorDisplay = None;
    if error {
        errorDisplay = <div
            style={{"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}
        >
            {error}
        </div>;
    }

    return <div
        style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
            "padding": "24px"
        }}
    >
        <div
            style={{
                "background": "#020617",
                "padding": "32px 28px",
                "borderRadius": "18px",
                "width": "320px",
                "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
                "border": "1px solid #1f2937",
                "color": "#e5e7eb",
                "boxSizing": "border-box"
            }}
        >
            <h2
                style={{"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}
            >
                Login
            </h2>
            <form
                onSubmit={handleLogin}
            >
                <input
                    type="text"
                    value={username}
                    onChange={handleUsernameChange}
                    placeholder="Username"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
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
                    }}
                >
                    Login
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "16px",
                    "fontSize": "13px",
                    "color": "#9ca3af"
                }}
            >
                Need an account?{" "}
                <Link
                    to="/adminsignup"
                    style={{"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}
                >
                    Sign up
                </Link>
            </p>
        </div>
    </div>;
}


# CustomerSignup Page
def CustomerSignupPage()  -> any {
    let [username, setUsername] = useState("");
    let [password, setPassword] = useState("");
    let [error, setError] = useState("");
    let navigate = useNavigate();

    async def handleSignup(e: any) -> None {
        e.preventDefault();
        setError("");
        if not username or not password {
            setError("Please fill in all fields");
            return;
        }
        customerUsername = f"cust:{username}";
        result = await jacSignup(customerUsername, password);
        if result["success"] {
            navigate("/Customer");
        } else {
            setError(result["error"] if result["error"] else "Signup failed");
        }
    }

    def handleUsernameChange(e: any) -> None {
        setUsername(e.target.value);
    }

    def handlePasswordChange(e: any) -> None {
        setPassword(e.target.value);
    }

    let errorDisplay = None;
    if error {
        errorDisplay = <div
            style={{"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}
        >
            {error}
        </div>;
    }

    return <div
        style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
            "padding": "24px"
        }}
    >
        <div
            style={{
                "background": "#020617",
                "padding": "32px 28px",
                "borderRadius": "18px",
                "width": "320px",
                "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
                "border": "1px solid #1f2937",
                "color": "#e5e7eb",
                "boxSizing": "border-box"
            }}
        >
            <h2
                style={{"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}
            >
                Sign Up
            </h2>
            <form
                onSubmit={handleSignup}
            >
                <input
                    type="text"
                    value={username}
                    onChange={handleUsernameChange}
                    placeholder="Username"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
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
                    }}
                >
                    Sign Up
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "16px",
                    "fontSize": "13px",
                    "color": "#9ca3af"
                }}
            >
                Have an account?{" "}
                <Link
                    to="/customerlogin"
                    style={{"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}
                >
                    Customer Login
                </Link>
            </p>
        </div>
    </div>;
}


# AdminSignup Page
def AdminSignupPage()  -> any {
    let [username, setUsername] = useState("");
    let [password, setPassword] = useState("");
    let [error, setError] = useState("");
    let navigate = useNavigate();

    async def handleSignup(e: any) -> None {
        e.preventDefault();
        setError("");
        if not username or not password {
            setError("Please fill in all fields");
            return;
        }
        adminUsername = f"admin:{username}";
        result = await jacSignup(adminUsername, password);
        if result["success"] {
            navigate("/Admin");
        } else {
            setError(result["error"] if result["error"] else "Signup failed");
        }
    }

    def handleUsernameChange(e: any) -> None {
        setUsername(e.target.value);
    }

    def handlePasswordChange(e: any) -> None {
        setPassword(e.target.value);
    }

    let errorDisplay = None;
    if error {
        errorDisplay = <div
            style={{"color": "#fca5a5", "fontSize": "14px", "marginBottom": "10px"}}
        >
            {error}
        </div>;
    }

    return <div
        style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
            "padding": "24px"
        }}
    >
        <div
            style={{
                "background": "#020617",
                "padding": "32px 28px",
                "borderRadius": "18px",
                "width": "320px",
                "boxShadow": "0 20px 45px rgba(15,23,42,0.9)",
                "border": "1px solid #1f2937",
                "color": "#e5e7eb",
                "boxSizing": "border-box"
            }}
        >
            <h2
                style={{"marginBottom": "20px", "fontSize": "22px", "fontWeight": "700"}}
            >
                Sign Up
            </h2>
            <form
                onSubmit={handleSignup}
            >
                <input
                    type="text"
                    value={username}
                    onChange={handleUsernameChange}
                    placeholder="Username"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "10px",
                        "marginBottom": "10px",
                        "border": "1px solid #374151",
                        "borderRadius": "8px",
                        "boxSizing": "border-box",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "fontSize": "14px"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
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
                    }}
                >
                    Sign Up
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "16px",
                    "fontSize": "13px",
                    "color": "#9ca3af"
                }}
            >
                Have an account?{" "}
                <Link
                    to="/adminlogin"
                    style={{"color": "#38bdf8", "textDecoration": "none", "fontWeight": "500"}}
                >
                    Admin Login
                </Link>
            </p>
        </div>
    </div>;
}


# def AutoReplyCard(props: any) -> any {

#     return <div className="cardbase-style">
#         <h2 className="section-title">Automatic reply</h2>
#         <p className="section-subtitle">
#             The system will generate a friendly response to your review here.
#         </p>

#         <div
#             className="auto-reply-box"
#         >
#             { props.loading &&
#             <div className="flex justify-center items-center my-3">
#                 <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"></div>
#                 <span className="ml-2 text-sm text-gray-500">Generating reply...</span>
#             </div>
#             }
#             <p>{props.answer}</p>
#         </div>
#     </div>;
# }

# def ReviewInputCard(props: any) -> any {

#     return <div className="cardbase-style">
#         <h2 className="section-title">Share your experience</h2>
#         <p className="section-subtitle">
#             Tell us about your visit so we can improve our restaurant service.
#         </p>

#         <label className="review-label">
#             Your review
#         </label>

#         <textarea
#             type="text"
#             value={props.input}
#             onChange={lambda e: any -> None { props.setInput(e.target.value); }}
#             placeholder="Write your review here…"
#             className ="review-textarea"
#         />

#         <div
#             className="review-actions"
#         >
#             <button
#                 onClick={props.computeAnswer}
#                 className="primary-button"
#             >
#                 Post Review
#             </button>
#         </div>
#     </div>;
# }
def Customer -> any {
    let [answer, setAnswer] = useState("");
    let [input, setInput] = useState("");
    let [loading, setLoading] = useState(false); 

    async def computeAnswer() -> None {
        setLoading(true);
        setAnswer("");
        response = root spawn analyzer(feedback=input);
        result = response.reports;
        setAnswer(result);
        setLoading(false);
    }

    return <div className="customer-page">
        <div className="customer-column">
            <ReviewInputCard
                input={input}
                setInput={setInput}
                computeAnswer={computeAnswer}
            />
            <AutoReplyCard
                answer={answer}
                loading={loading}
            />
        </div>
    </div>;
}

cl def Admin()  -> any {
    let [range, setRange] = useState("Last 3 Days");
    let [positive_count, setPositiveCount] = useState([]);
    let [negative_count, setNegativeCount] = useState([]);
    let [neutral_count, setNeutralCount] = useState([]);
    let [pricing_count, setPricingCount] = useState(None);
    let [food_quality_count, setFoodQualityCount] = useState(None);
    let [delivery_count, setDeliveryCount] = useState(None);
    let [other_count, setOtherCount] = useState(None);
    let [dates, setDates] = useState([]);
    let [data, setData] = useState([]);

    let [summary, setSummary] = useState("");
    let [loading, setLoading] = useState(false);

    # let headerRowStyle = {
    #     "display": "flex",
    #     "justifyContent": "space-between",
    #     "alignItems": "center"
    # };

    # let titleStyle = {
    #     "fontSize": "18px",
    #     "fontWeight": "600",
    #     "color": "#e5e7eb"
    # };

    # let subtitleStyle = {
    #     "fontSize": "12px",
    #     "color": "#9ca3af"
    # };
    async def get_data(e: str) -> any {
        setRange(e.target.value);
        response = root spawn grt_counts(range_option=e.target.value);
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

        let data_list = [];
        let lent = result["dates"].length;
        console.log("lent", lent);
        let num = 0;
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
    }

    async def gen_summary()  -> str {
        setLoading(true);
        summ = root spawn summerize(range_option=range);
        result = summ.reports[0];
        setSummary(result["summary"]);
        setLoading(false);
    }

    return <div className="pageC">
        <div className="contentC">
            <div className="header-rowNew"
            style={{"marginBottom": "16px"}}
            >
                <div>
                    <div className="header-titleNew">
                        Comment activity graph
                    </div>
                    <div className="header-subtitleNew">
                        Visualise positive, negative and neutral comments over time.
                    </div>
                </div>
                <select
                    value={range}
                    onChange={lambda  e: any  -> None{ get_data(e);} }
                    className="range-select"
                >
                    <option value="Last 3 Days">
                        Last 3 Days
                    </option>
                    <option value="Last 7 Days">
                        Last 7 Days
                    </option>
                    <option value="Last 30 Days">
                        Last 30 Days
                    </option>
                </select>
            </div>
            <div className="card-base">
                <StatsRow
                    range={range}
                    foodValue={food_quality_count}
                    deliveryValue={delivery_count}
                    pricingValue={pricing_count}
                    otherValue={other_count}
                />
                <SentimentBarChart
                    chartdata={data}
                />
            </div>
            <div className="card-base">
                <SummaryCard
                    summary={summary}
                    loading={loading}
                />
                <div className="button-row">
                    <button
                        onClick={lambda   -> None{ gen_summary();} }
                        className="btn-primary"
                    >
                        Generate Summary
                    </button>
                </div>
            </div>
        </div>
    </div>;
}

# Home/Landing Page - auto-redirect
# def HomePage()  -> any {
#     if jacIsLoggedIn() {
#         return <Navigate to="/Customer" />;
#     }
#     return <Navigate to="/login" />;
# }
def app()  -> any {
    return <Router>
        <div
            style={{"fontFamily": "system-ui, sans-serif"}}
        >
            <Navigation />
            <Routes>
                <Route
                    path="/"
                    element={<Home />}
                />
                <Route
                    path="/customerlogin"
                    element={<CustomerLoginPage />}
                />
                <Route
                    path="/adminlogin"
                    element={<AdminLoginPage />}
                />
                <Route
                    path="/customersignup"
                    element={<CustomerSignupPage />}
                />
                <Route
                    path="/adminsignup"
                    element={<AdminSignupPage />}
                />
                <Route
                    path="/Customer"
                    element={<Customer />}
                />
                <Route
                    path="/Admin"
                    element={<Admin />}
                />
            </Routes>
        </div>
    </Router>;
}
# <Link
#     to="/Customer"
#     style={{"color": "#ffffff", "textDecoration": "none"}}
# >
#     Todos
# </Link>

# onChange={lambda e: any -> None { setRange(e.target.value); }}
