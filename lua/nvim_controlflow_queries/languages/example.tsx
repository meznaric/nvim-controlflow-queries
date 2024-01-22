import React, { useState } from "react";
import Sentry from "@sentry/react";
import * as Woah from "@sentry/react-test";

type Person = {
  name: string;
};

const b = require("alo");

const r = require;

r();
eval("console.log('hello')");

const sentry = new Sentry();

sentry.init({ dsn: "https://example.com" });

function Example() {
  const [count, setCount] = useState(0);
  const [name, setName] = useState("John Doe");
  const [testState, setTestState] = useState<Person>({ name: "John Doe" });

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

class Vito {
  constructor() {
    this.name = "Vito";
  }
  private name: string;
  public getName() {
    return this.name;
  }
  static getStaticName() {
    return <Example />;
  }
}

const vito = new Vito();
vito.getName();
