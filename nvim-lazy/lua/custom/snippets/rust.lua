require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("rust", {
  s(
    "api",
    fmta(
      [[
#[derive(Template)]
#[template(path = "<template_path>")]
struct <template_name>Template<<'a>> {
    <field>: &'a <field_type>,
}

#[<http_method>("<http_path>")]
async fn <fn_name>(pool: web::Data<<PgPool>>) ->> HttpResponse {
    HttpResponse::Ok().body(<template_name_same>Template {}.render().unwrap())
}
      ]],
      {
        fn_name = i(1),
        http_method = i(2),
        http_path = i(3),
        template_path = i(4),
        template_name = i(5),
        template_name_same = rep(5),
        field = i(6),
        field_type = i(7),
      }
    )
  ),
  s(
    "apipost",
    fmta(
      [=[
#[derive(Deserialize)]
struct <body_same>Body {
    <param>: <param_type>,
}

#[post["<path>"]]
async fn <fn_name>(body: web::Json<<<body>Body>>, pool: web::Data<<PgPool>>) ->> HttpResponse {
    todo!()
}<finish>
      ]=],
      {
        path = i(1),
        fn_name = i(2),
        body = i(3),
        body_same = rep(3),
        param = i(4),
        param_type = i(5),
        finish = i(0),
      }
    )
  ),
  s(
    "apiget",
    fmta(
      [=[
#[derive(Deserialize)]
struct <query_same>Query {
    <param>: <param_type>,
}

#[get["<path>"]]
async fn <fn_name>(params: web::Query<<<query>Query>>, pool: web::Data<<PgPool>>) ->> HttpResponse {
    todo!()
}<finish>
      ]=],
      {
        path = i(1),
        fn_name = i(2),
        query = i(3),
        query_same = rep(3),
        param = i(4),
        param_type = i(5),
        finish = i(0),
      }
    )
  ),
  s(
    "dal",
    fmta(
      [=[
pub async fn <fn_name>(<params>, pool: &PgPool) ->> Result<<(), sqlx::Error>> {
    sqlx::query!(
        r#"
        <finish>
        "#,
    )
    .execute(pool)
    .await
}
      ]=],
      {
        fn_name = i(1),
        params = i(2),
        finish = i(0),
      }
    )
  ),
})
