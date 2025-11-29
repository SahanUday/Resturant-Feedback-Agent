cl import from react {
useState,
useEffect
}

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
                "background": "#3b82f6",
                "color": "#ffffff",
                "display": "flex",
                "justifyContent": "space-between"
            }}
        >
            <div
                style={{"fontWeight": "600"}}
            >
                Todo App
            </div>
            <div
                style={{"display": "flex", "gap": "16px"}}
            >
                # <Link
                #     to="/Customer"
                #     style={{"color": "#ffffff", "textDecoration": "none"}}
                # >
                #     Todos
                # </Link>
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

    return <nav
        style={{
            "padding": "12px 24px",
            "background": "#3b82f6",
            "color": "#ffffff",
            "display": "flex",
            "justifyContent": "space-between"
        }}
    >
        <div
            style={{"fontWeight": "600"}}
        >
            Todo App
        </div>
        <div
            style={{"display": "flex", "gap": "16px"}}
        >
            <Link
                to="/login"
                style={{"color": "#ffffff", "textDecoration": "none"}}
            >
                Login
            </Link>
            <Link
                to="/signup"
                style={{"color": "#ffffff", "textDecoration": "none"}}
            >
                Sign Up
            </Link>
        </div>
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
        success = await jacLogin(username, password);
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
            style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
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
            "background": "#f5f5f5"
        }}
    >
        <div
            style={{
                "background": "#ffffff",
                "padding": "30px",
                "borderRadius": "8px",
                "width": "280px",
                "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"
            }}
        >
            <h2
                style={{"marginBottom": "20px"}}
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
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "background": "#3b82f6",
                        "color": "#ffffff",
                        "border": "none",
                        "borderRadius": "4px",
                        "cursor": "pointer",
                        "fontWeight": "600"
                    }}
                >
                    Login
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "12px",
                    "fontSize": "14px"
                }}
            >
                Need an account?
                <Link to="/customersignup">
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
        success = await jacLogin(username, password);
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
            style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
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
            "background": "#f5f5f5"
        }}
    >
        <div
            style={{
                "background": "#ffffff",
                "padding": "30px",
                "borderRadius": "8px",
                "width": "280px",
                "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"
            }}
        >
            <h2
                style={{"marginBottom": "20px"}}
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
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "background": "#3b82f6",
                        "color": "#ffffff",
                        "border": "none",
                        "borderRadius": "4px",
                        "cursor": "pointer",
                        "fontWeight": "600"
                    }}
                >
                    Login
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "12px",
                    "fontSize": "14px"
                }}
            >
                Need an account?
                <Link to="/adminsignup">
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
        result = await jacSignup(username, password);
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
            style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
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
            "background": "#f5f5f5"
        }}
    >
        <div
            style={{
                "background": "#ffffff",
                "padding": "30px",
                "borderRadius": "8px",
                "width": "280px",
                "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"
            }}
        >
            <h2
                style={{"marginBottom": "20px"}}
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
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "background": "#3b82f6",
                        "color": "#ffffff",
                        "border": "none",
                        "borderRadius": "4px",
                        "cursor": "pointer",
                        "fontWeight": "600"
                    }}
                >
                    Sign Up
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "12px",
                    "fontSize": "14px"
                }}
            >
                Have an account?
                <Link to="/customerlogin">
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
        result = await jacSignup(username, password);
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
            style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
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
            "background": "#f5f5f5"
        }}
    >
        <div
            style={{
                "background": "#ffffff",
                "padding": "30px",
                "borderRadius": "8px",
                "width": "280px",
                "boxShadow": "0 2px 4px rgba(0,0,0,0.1)"
            }}
        >
            <h2
                style={{"marginBottom": "20px"}}
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
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                <input
                    type="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder="Password"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "marginBottom": "10px",
                        "border": "1px solid #ddd",
                        "borderRadius": "4px",
                        "boxSizing": "border-box"
                    }}
                />
                {errorDisplay}
                <button
                    type="submit"
                    style={{
                        "width": "100%",
                        "padding": "8px",
                        "background": "#3b82f6",
                        "color": "#ffffff",
                        "border": "none",
                        "borderRadius": "4px",
                        "cursor": "pointer",
                        "fontWeight": "600"
                    }}
                >
                    Sign Up
                </button>
            </form>
            <p
                style={{
                    "textAlign": "center",
                    "marginTop": "12px",
                    "fontSize": "14px"
                }}
            >
                Have an account?
                <Link to="/adminlogin">
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
    

    return <div className="app-container">
        <div className="app-layout">
            <ReviewInputCard input={input} setInput={setInput} computeAnswer={computeAnswer} />
            <AutoReplyCard answer={answer} loading={loading} />
        </div>
    </div>;
}

cl def Admin() -> any {
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


    let headerRowStyle = {
        "display": "flex",
        "justifyContent": "space-between",
        "alignItems": "center"
    };

    let titleStyle = {
        "fontSize": "18px",
        "fontWeight": "600",
        "color": "#e5e7eb"
    };

    let subtitleStyle = {
        "fontSize": "12px",
        "color": "#9ca3af"
    };

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
        console.log("lent",lent);
        let num = 0;
        while (num < lent) {
            console.log("num", num);
            console.log("date", result["dates"][num]);
            d = {"date": result["dates"][num], "Positive": result["positive_count"][num], "Negative": result["negative_count"][num], "Neutral": result["neutral_count"][num]};
            data_list.push(d);
            num = num + 1;
        }
        setData(data_list);

    }

    async def gen_summary() -> str {
        setLoading(true);
        summ = root spawn summerize(range_option=range);
        result = summ.reports[0];
        setSummary(result["summary"]);
        setLoading(false);
    
    }

    return <div style={pageStyle()}>
        <div style={contentStyle()}>

            <div style={headerRowStyle}>
                <div>
                    <div style={titleStyle}>
                        Comment activity graph
                    </div>
                    <div style={subtitleStyle}>
                        Visualise positive, negative and neutral comments over time.
                    </div>
                </div>

                <select
                    value={range}
                    # onChange={lambda e: any -> None { setRange(e.target.value); }}
                    onChange={lambda e: any -> None { get_data(e); }}
                    style={{
                        "padding": "8px 12px",
                        "borderRadius": "8px",
                        "fontSize": "13px",
                        "fontWeight": "500",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "border": "1px solid #374151",
                        "outline": "none",
                        "cursor": "pointer"
                    }}
                >
                    <option value="Last 3 Days">Last 3 Days</option>
                    <option value="Last 7 Days">Last 7 Days</option>
                    <option value="Last 30 Days">Last 30 Days</option>
                </select>
            </div>

            <div style={cardBaseStyle()}>
                <StatsRow range={range} 
                    foodValue={food_quality_count} 
                    deliveryValue={delivery_count} 
                    pricingValue={pricing_count} 
                    otherValue={other_count} 
                />
                <SentimentBarChart chartdata={data} />
            </div>
            <div style={cardBaseStyle()}>
                <SummaryCard summary={summary} loading={loading} />
                <div className="button-row">
                    <button
                        onClick={lambda -> None { gen_summary(); }}
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