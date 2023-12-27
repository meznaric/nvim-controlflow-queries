import React, { useState } from "react";
import Sentry from "@sentry/react";
import * as Woah from "@sentry/react-test";

function Example() {
  const [count, setCount] = useState(0);
  const [name, setName] = useState("John Doe");
  const sentry = new Sentry();

  Sentry.init({ dsn: "https://example.com" });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>

      <p>Your name is {name}</p>
      <input type="text" onChange={(e) => setName(e.target.value)} />
    </div>
  );
}
