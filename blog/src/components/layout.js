import React from "react"
import { Link } from "gatsby"

import { rhythm, scale } from "../utils/typography"
import Bio from "../components/bio"
import DarkModeToggle from "./dark-mode"

const Layout = ({ location, title, children }) => {
  const rootPath = `${__PATH_PREFIX__}/`
  let header

  if (location.pathname === rootPath) {
    header = (
      <div className="header">
        <h1 className="text-5xl">
          <Link>
            {title}
          </Link>
        </h1>
        <DarkModeToggle />
      </div>
    )
  } else {
    header = (
      <div className="header">
        <h1>
          <Link>
            {title}
          </Link>
        </h1>
        <DarkModeToggle />
      </div>
    )
  }

  return (
    <div className="container mx-auto">
      <header class="mb-6 mx-2 mt-4">{header}</header>
      <div className="mx-4 flex">
        <Bio />
        <main className="w-2/3">{children}</main>
      </div>
      <footer className="mt-6 mb-4 text-center">Yuki Uehara , {new Date().getFullYear()}</footer>
    </div>
  )
}

export default Layout
