import React from "react";
import styled from "styled-components";
import svgX from "../svg/socials/x.svg";

const Follow = styled.div`
  margin-top: 2em;
  text-align: center;
`;

const FollowLink = styled.a`
  display: inline-flex;
  align-items: center;
  background: #000000;
  color: #fff;
  padding: 0.5em 1em;
  border-radius: 4px;
  border-radius: 2.5em;
`;

const ShareButtons = () => {
  return (
    <Follow>
      <FollowLink href="https://x.com/psnzbss" rel="nofollow noopener noreferrer" target="_blank">
        <img src={svgX} alt="X" width={31} height={17} />
        Follow @psnzbss
      </FollowLink>
    </Follow>
  );
};

export default ShareButtons;
