/* eslint-disable react/jsx-key */
/* eslint-disable react/prop-types */
import React from "react";

// @ts-ignore
const NavBar = ({ user }) => {
  const providers = ["google", "twitter", "github", "aad"];
  const redirect = `/`;

  return (
    <>
      {!user &&
        providers.map((provider) => (
          <span key={provider}>
            <a
              key={provider}
              href={`/.auth/login/${provider}?post_login_redirect_uri=${redirect}`}
            >
              <h4>{provider}</h4>
            </a>{" "}
          </span>
        ))}
      {user && (
        <div>
          <p>
            <span>
              {user && user?.userDetails} ({user && user?.identityProvider})
            </span>
            <span>
              {" "}
              <a href={`/.auth/logout?post_logout_redirect_uri=${redirect}`}>
                Logout
              </a>
            </span>
          </p>
        </div>
      )}
    </>
  );
};
export default NavBar;
