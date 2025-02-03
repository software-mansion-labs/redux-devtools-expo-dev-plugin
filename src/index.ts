/// <reference types="node" />
import { compose } from "redux";

export let createComposeWithDevTools: typeof import("./devtools").createComposeWithDevTools;

if (process.env.NODE_ENV !== "production") {
  createComposeWithDevTools = require("./devtools").createComposeWithDevTools;
} else {
  createComposeWithDevTools = () => compose;
}

