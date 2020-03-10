/**
A [handler] takes a [Request.t] and returns a [Response.t] wrapepd in a [Lwt.t]
*/
type handler('req_body) = Request.t('req_body) => Lwt.t(Response.t);

/**
A [middleware] takes a [handler] and returns a [handler].
*/
type middleware('req_body) = handler('req_body) => handler('req_body);

/**
A [Server.t] is a record that describes a server.
*/
type t('req_body) = {
  start: handler('req_body) => Lwt.t(unit),
  port: int,
};

let apply_all:
  (list(middleware('req_body)), handler('req_body)) => handler('req_body);