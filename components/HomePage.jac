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
                    Resturant Feedback Portal
                </h1>
                <p
                    className="shop-description-home"
                >
                    Use this portal to share your experience so we can keep improvingour dishes, delivery, and service for you.
                </p>
            </div>
            <div>
                <p
                    className="mid-description-home"
                >
                    Share your feedback as a customer or manage responses as an admin. Choose your portal below to get started.
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
                        Share your dining or delivery experience, track your past feedback,and help us become your perfect spot.
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


