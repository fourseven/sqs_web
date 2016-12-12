# SqsWeb

This project is a test app to try and build a SQS-worker system (similar to [`Verk`](https://github.com/edgurgel/verk) or [`Shoryuken`](https://github.com/phstc/shoryuken)).

The root page is hooked into a gen_stage consumer which will dump the SQS messages to the page. It does not yet pull from SQS however.

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
