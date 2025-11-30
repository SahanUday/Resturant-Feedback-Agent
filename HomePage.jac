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


# ----------------------------
# Shared style helpers
# ----------------------------
# cl def pageStyle()  -> any {
#     return {
#         "minHeight": "100vh",
#         "margin": "0",
#         "backgroundImage": "linear-gradient(135deg,#020617,#020617,#0f172a)",
#         "display": "flex",
#         "justifyContent": "center",
#         "alignItems": "center",
#         "fontFamily": "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
#         "color": "#e5e7eb"
#     };
# }

# cl def containerStyle()  -> any {
#     return {
#         "maxWidth": "800px",
#         "width": "100%",
#         "padding": "40px 24px",
#         "boxSizing": "border-box",
#         "textAlign": "center",
#         "display": "flex",
#         "flexDirection": "column",
#         "gap": "32px"
#     };
# }

# cl def titleStyle()  -> any {
#     return {
#         "fontSize": "32px",
#         "fontWeight": "800",
#         "letterSpacing": "0.08em",
#         "textTransform": "uppercase"
#     };
# }

# cl def shopDescriptionStyle()  -> any {
#     return {
#         "fontSize": "15px",
#         "color": "#9ca3af",
#         "maxWidth": "640px",
#         "margin": "0 auto",
#         "lineHeight": "1.7"
#     };
# }

# cl def midDescriptionStyle()  -> any {
#     return {"fontSize": "13px", "color": "#a5b4fc"};
# }

# cl def cardsRowStyle()  -> any {
#     return {
#         "display": "flex",
#         "gap": "24px",
#         "justifyContent": "center",
#         "flexWrap": "wrap"
#     };
# }

# cl def portalCardStyle()  -> any {
#     return {
#         "flex": "1",
#         "minWidth": "260px",
#         "maxWidth": "320px",
#         "backgroundColor": "#020617",
#         "borderRadius": "18px",
#         "border": "1px solid #1f2937",
#         "padding": "20px 18px",
#         "boxSizing": "border-box",
#         "boxShadow": "0 16px 40px rgba(15,23,42,0.8)",
#         "textAlign": "left",
#         "display": "flex",
#         "flexDirection": "column",
#         "justifyContent": "space-between",
#         "gap": "16px"
#     };
# }

# cl def cardTitleStyle()  -> any {
#     return {"fontSize": "16px", "fontWeight": "600", "marginBottom": "4px"};
# }

# cl def cardSubtitleStyle()  -> any {
#     return {"fontSize": "12px", "color": "#9ca3af", "marginBottom": "16px"};
# }

# cl def cardButtonStyle()  -> any {
#     return {
#         "display": "inline-block",
#         "padding": "8px 16px",
#         "borderRadius": "999px",
#         "border": "none",
#         "backgroundImage": "linear-gradient(135deg,#22c55e,#0ea5e9)",
#         "color": "#f9fafb",
#         "fontSize": "13px",
#         "fontWeight": "600",
#         "cursor": "pointer",
#         "textDecoration": "none",
#         "boxShadow": "0 12px 28px rgba(34,197,94,0.4)"
#     };
# }

# ----------------------------
# Main page component
# ----------------------------
cl def Home()  -> any {
    return <div
        className="page-home"
    >
        <div
            className="container-home"
        >
            <div>
                <h1
                    className="title-home"
                >
                    Kamra Feedback Portal
                </h1>
                <p
                    className="shop-description-home"
                >
                    Kamra is your cosy corner for great food and better moments.Use this portal to share your experience so we can keep improvingour dishes, delivery, and service for you.
                </p>
            </div>
            <div>
                <p
                    className="mid-description-home"
                >
                    Login or sign up to give your feedback.
                </p>
            </div>
            <div
                className="cards-row-home"
            >
                <div
                    className="portal-card-home"
                >
                    <h3
                        className="card-title-home"
                    >
                        For customers
                    </h3>
                    <p
                        className="card-subtitle-home"
                    >
                        Share your dining or delivery experience, track your past feedback,and help Kamra become your perfect spot.
                    </p>
                    <Link
                        to="/customerlogin"
                        className="card-button-home"
                    >
                        Go to customer portal
                    </Link>
                </div>
                <div
                    className="portal-card-home"
                >
                    <h3
                        className="card-title-home"
                    >
                        For admins
                    </h3>
                    <p
                        className="card-subtitle-home"
                    >
                        Review customer feedback, monitor trends, and respond to issuesfrom your management dashboard.
                    </p>
                    <Link
                        to="/adminlogin"
                        className="card-button-home"
                    >
                        Go to admin portal
                    </Link>
                </div>
            </div>
        </div>
    </div>;
}


