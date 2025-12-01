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
                        to="/Customer"
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
                        to="/Admin"
                        className="card-button-home"
                    >
                        Go to admin portal
                    </Link>
                </div>
            </div>
        </div>
    </div>;
}


