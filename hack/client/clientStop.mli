(**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 *)

type env = {
  root: Path.path;
}

module type STOP_CONFIG = sig
  type response
  val server_desc : string
  val server_name : string
  val kill_cmd_to_channel : out_channel -> unit
  val response_from_channel : in_channel -> response
  val response_to_string : response -> string
  val is_expected : response -> bool
end

module type STOP_COMMAND = sig
  val kill_server : env -> unit
  val main : env -> unit
end

module StopCommand (Config : STOP_CONFIG) : STOP_COMMAND
