<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.model.function.dao.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE HTML>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<!-- 다이어리 페이지 스타일 -->
<style>
@import url(fontawesome-all.min.css);

@import
   url("https://fonts.googleapis.com/css?family=Open+Sans:400,600,400italic,600italic|Roboto+Slab:400,700")
   ;
/*
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
   blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
   em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
   b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
   table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   font-size: 100%;
   font: inherit;
   vertical-align: baseline;
   font-family: KoPubWorld Dotum Light;
}


article, aside, details, figcaption, figure, footer, header, hgroup,
   menu, nav, section {
   display: block;
}

body {
   line-height: 1;
}

ol, ul {
   list-style: none;
}

blockquote, q {
   quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
   content: '';
   content: none;
}

table {
   border-collapse: collapse;
   border-spacing: 0;
}

body {
   -webkit-text-size-adjust: none;
}

mark {
   background-color: transparent;
   color: inherit;
}

input::-moz-focus-inner {
   border: 0;
   padding: 0;
}

input, select, textarea {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
}

/* Basic */
@
-ms-viewport {
   width: device-width;
}

body {
   -ms-overflow-style: scrollbar;
}

@media screen and (max-width: 480px) {
   html, body {
      min-width: 320px;
   }
}

html {
   box-sizing: border-box;
}

*, *:before, *:after {
   box-sizing: inherit;
}

body {
   background: #ffffff;
}

body.is-preload *, body.is-preload *:before, body.is-preload *:after,
   body.is-resizing *, body.is-resizing *:before, body.is-resizing *:after
   {
   -moz-animation: none !important;
   -webkit-animation: none !important;
   -ms-animation: none !important;
   animation: none !important;
   -moz-transition: none !important;
   -webkit-transition: none !important;
   -ms-transition: none !important;
   transition: none !important;
}

/* Type */
body, input, select, textarea {
   color: #7f888f;
   font-family: "Open Sans", sans-serif;
   font-size: 13pt;
   font-weight: 400;
   line-height: 1.65;
}

@media screen and (max-width: 1680px) {
   body, input, select, textarea {
      font-size: 11pt;
   }
}

@media screen and (max-width: 1280px) {
   body, input, select, textarea {
      font-size: 10pt;
   }
}

@media screen and (max-width: 360px) {
   body, input, select, textarea {
      font-size: 9pt;
   }
}

a {
   -moz-transition: color 0.2s ease-in-out, border-bottom-color 0.2s
      ease-in-out;
   -webkit-transition: color 0.2s ease-in-out, border-bottom-color 0.2s
      ease-in-out;
   -ms-transition: color 0.2s ease-in-out, border-bottom-color 0.2s
      ease-in-out;
   transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
   border-bottom: dotted 1px;
   color: #D8EEE1;
   text-decoration: none;
}

a:hover {
   border-bottom-color: #D8EEE1;
   color: #D8EEE1 !important;
}

a:hover strong {
   color: inherit;
}

strong, b {
   color: #3d4449;
   font-weight: 600;
}

em, i {
   font-style: italic;
}

p {
   margin: 0 0 2em 0;
}

h1, h2, h3, h4, h5, h6 {
   color: #3d4449;
   font-family: "Roboto Slab", serif;
   font-weight: 700;
   line-height: 1.5;
   margin: 0 0 1em 0;
}

h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
   color: inherit;
   text-decoration: none;
   border-bottom: 0;
}

h1 {
   font-size: 4em;
   margin: 0 0 0.5em 0;
   line-height: 1.3;
}

h2 {
   font-size: 1.75em;
}

h3 {
   font-size: 1.25em;
}

h4 {
   font-size: 1.1em;
}

h5 {
   font-size: 0.9em;
}

h6 {
   font-size: 0.7em;
}

@media screen and (max-width: 1680px) {
   h1 {
      font-size: 3.5em;
   }
}

@media screen and (max-width: 980px) {
   h1 {
      font-size: 3.25em;
   }
}

@media screen and (max-width: 736px) {
   h1 {
      font-size: 2em;
      line-height: 1.4;
   }
   h2 {
      font-size: 1.5em;
   }
}

sub {
   font-size: 0.8em;
   position: relative;
   top: 0.5em;
}

sup {
   font-size: 0.8em;
   position: relative;
   top: -0.5em;
}

blockquote {
   border-left: solid 3px rgba(210, 215, 217, 0.75);
   font-style: italic;
   margin: 0 0 2em 0;
   padding: 0.5em 0 0.5em 2em;
}

code {
   background: rgba(230, 235, 237, 0.25);
   border-radius: 0.375em;
   border: solid 1px rgba(210, 215, 217, 0.75);
   font-family: "Courier New", monospace;
   font-size: 0.9em;
   margin: 0 0.25em;
   padding: 0.25em 0.65em;
}

pre {
   -webkit-overflow-scrolling: touch;
   font-family: "Courier New", monospace;
   font-size: 0.9em;
   margin: 0 0 2em 0;
}

pre code {
   display: block;
   line-height: 1.75;
   padding: 1em 1.5em;
   overflow-x: auto;
}

hr {
   border: 0;
   border-bottom: solid 1px rgba(210, 215, 217, 0.75);
   margin: 2em 0;
}

hr.major {
   margin: 3em 0;
}

.align-left {
   text-align: left;
}

.align-center {
   text-align: center;
}

.align-right {
   text-align: right;
}

/* Row */
.row {
   display: flex;
   flex-wrap: wrap;
   box-sizing: border-box;
   align-items: stretch;
}

.row>* {
   box-sizing: border-box;
}

.row.gtr-uniform>*>:last-child {
   margin-bottom: 0;
}

.row.aln-left {
   justify-content: flex-start;
}

.row.aln-center {
   justify-content: center;
}

.row.aln-right {
   justify-content: flex-end;
}

.row.aln-top {
   align-items: flex-start;
}

.row.aln-middle {
   align-items: center;
}

.row.aln-bottom {
   align-items: flex-end;
}

.row>.imp {
   order: -1;
}

.row>.col-1 {
   width: 8.33333%;
}

.row>.off-1 {
   margin-left: 8.33333%;
}

.row>.col-2 {
   width: 16.66667%;
}

.row>.off-2 {
   margin-left: 16.66667%;
}

.row>.col-3 {
   width: 25%;
}

.row>.off-3 {
   margin-left: 25%;
}

.row>.col-4 {
   width: 33.33333%;
}

.row>.off-4 {
   margin-left: 33.33333%;
}

.row>.col-5 {
   width: 41.66667%;
}

.row>.off-5 {
   margin-left: 41.66667%;
}

.row>.col-6 {
   width: 50%;
}

.row>.off-6 {
   margin-left: 50%;
}

.row>.col-7 {
   width: 58.33333%;
}

.row>.off-7 {
   margin-left: 58.33333%;
}

.row>.col-8 {
   width: 66.66667%;
}

.row>.off-8 {
   margin-left: 66.66667%;
}

.row>.col-9 {
   width: 75%;
}

.row>.off-9 {
   margin-left: 75%;
}

.row>.col-10 {
   width: 83.33333%;
}

.row>.off-10 {
   margin-left: 83.33333%;
}

.row>.col-11 {
   width: 91.66667%;
}

.row>.off-11 {
   margin-left: 91.66667%;
}

.row>.col-12 {
   width: 100%;
}

.row>.off-12 {
   margin-left: 100%;
}

.row.gtr-0 {
   margin-top: 0;
   margin-left: 0em;
}

.row.gtr-0>* {
   padding: 0 0 0 0em;
}

.row.gtr-0.gtr-uniform {
   margin-top: 0em;
}

.row.gtr-0.gtr-uniform>* {
   padding-top: 0em;
}

.row.gtr-25 {
   margin-top: 0;
   margin-left: -0.375em;
}

.row.gtr-25>* {
   padding: 0 0 0 0.375em;
}

.row.gtr-25.gtr-uniform {
   margin-top: -0.375em;
}

.row.gtr-25.gtr-uniform>* {
   padding-top: 0.375em;
}

.row.gtr-50 {
   margin-top: 0;
   margin-left: -0.75em;
}

.row.gtr-50>* {
   padding: 0 0 0 0.75em;
}

.row.gtr-50.gtr-uniform {
   margin-top: -0.75em;
}

.row.gtr-50.gtr-uniform>* {
   padding-top: 0.75em;
}

.row {
   margin-top: 0;
   margin-left: -1.5em;
}

.row>* {
   padding: 0 0 0 1.5em;
}

.row.gtr-uniform {
   margin-top: -1.5em;
}

.row.gtr-uniform>* {
   padding-top: 1.5em;
}

.row.gtr-150 {
   margin-top: 0;
   margin-left: -2.25em;
}

.row.gtr-150>* {
   padding: 0 0 0 2.25em;
}

.row.gtr-150.gtr-uniform {
   margin-top: -2.25em;
}

.row.gtr-150.gtr-uniform>* {
   padding-top: 2.25em;
}

.row.gtr-200 {
   margin-top: 0;
   margin-left: -3em;
}

.row.gtr-200>* {
   padding: 0 0 0 3em;
}

.row.gtr-200.gtr-uniform {
   margin-top: -3em;
}

.row.gtr-200.gtr-uniform>* {
   padding-top: 3em;
}

@media screen and (max-width: 1680px) {
   .row {
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      align-items: stretch;
   }
   .row>* {
      box-sizing: border-box;
   }
   .row.gtr-uniform>*>:last-child {
      margin-bottom: 0;
   }
   .row.aln-left {
      justify-content: flex-start;
   }
   .row.aln-center {
      justify-content: center;
   }
   .row.aln-right {
      justify-content: flex-end;
   }
   .row.aln-top {
      align-items: flex-start;
   }
   .row.aln-middle {
      align-items: center;
   }
   .row.aln-bottom {
      align-items: flex-end;
   }
   .row>.imp-xlarge {
      order: -1;
   }
   .row>.col-1-xlarge {
      width: 8.33333%;
   }
   .row>.off-1-xlarge {
      margin-left: 8.33333%;
   }
   .row>.col-2-xlarge {
      width: 16.66667%;
   }
   .row>.off-2-xlarge {
      margin-left: 16.66667%;
   }
   .row>.col-3-xlarge {
      width: 25%;
   }
   .row>.off-3-xlarge {
      margin-left: 25%;
   }
   .row>.col-4-xlarge {
      width: 33.33333%;
   }
   .row>.off-4-xlarge {
      margin-left: 33.33333%;
   }
   .row>.col-5-xlarge {
      width: 41.66667%;
   }
   .row>.off-5-xlarge {
      margin-left: 41.66667%;
   }
   .row>.col-6-xlarge {
      width: 50%;
   }
   .row>.off-6-xlarge {
      margin-left: 50%;
   }
   .row>.col-7-xlarge {
      width: 58.33333%;
   }
   .row>.off-7-xlarge {
      margin-left: 58.33333%;
   }
   .row>.col-8-xlarge {
      width: 66.66667%;
   }
   .row>.off-8-xlarge {
      margin-left: 66.66667%;
   }
   .row>.col-9-xlarge {
      width: 75%;
   }
   .row>.off-9-xlarge {
      margin-left: 75%;
   }
   .row>.col-10-xlarge {
      width: 83.33333%;
   }
   .row>.off-10-xlarge {
      margin-left: 83.33333%;
   }
   .row>.col-11-xlarge {
      width: 91.66667%;
   }
   .row>.off-11-xlarge {
      margin-left: 91.66667%;
   }
   .row>.col-12-xlarge {
      width: 100%;
   }
   .row>.off-12-xlarge {
      margin-left: 100%;
   }
   .row.gtr-0 {
      margin-top: 0;
      margin-left: 0em;
   }
   .row.gtr-0>* {
      padding: 0 0 0 0em;
   }
   .row.gtr-0.gtr-uniform {
      margin-top: 0em;
   }
   .row.gtr-0.gtr-uniform>* {
      padding-top: 0em;
   }
   .row.gtr-25 {
      margin-top: 0;
      margin-left: -0.375em;
   }
   .row.gtr-25>* {
      padding: 0 0 0 0.375em;
   }
   .row.gtr-25.gtr-uniform {
      margin-top: -0.375em;
   }
   .row.gtr-25.gtr-uniform>* {
      padding-top: 0.375em;
   }
   .row.gtr-50 {
      margin-top: 0;
      margin-left: -0.75em;
   }
   .row.gtr-50>* {
      padding: 0 0 0 0.75em;
   }
   .row.gtr-50.gtr-uniform {
      margin-top: -0.75em;
   }
   .row.gtr-50.gtr-uniform>* {
      padding-top: 0.75em;
   }
   .row {
      margin-top: 0;
      margin-left: -1.5em;
   }
   .row>* {
      padding: 0 0 0 1.5em;
   }
   .row.gtr-uniform {
      margin-top: -1.5em;
   }
   .row.gtr-uniform>* {
      padding-top: 1.5em;
   }
   .row.gtr-150 {
      margin-top: 0;
      margin-left: -2.25em;
   }
   .row.gtr-150>* {
      padding: 0 0 0 2.25em;
   }
   .row.gtr-150.gtr-uniform {
      margin-top: -2.25em;
   }
   .row.gtr-150.gtr-uniform>* {
      padding-top: 2.25em;
   }
   .row.gtr-200 {
      margin-top: 0;
      margin-left: -3em;
   }
   .row.gtr-200>* {
      padding: 0 0 0 3em;
   }
   .row.gtr-200.gtr-uniform {
      margin-top: -3em;
   }
   .row.gtr-200.gtr-uniform>* {
      padding-top: 3em;
   }
}

@media screen and (max-width: 1280px) {
   .row {
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      align-items: stretch;
   }
   .row>* {
      box-sizing: border-box;
   }
   .row.gtr-uniform>*>:last-child {
      margin-bottom: 0;
   }
   .row.aln-left {
      justify-content: flex-start;
   }
   .row.aln-center {
      justify-content: center;
   }
   .row.aln-right {
      justify-content: flex-end;
   }
   .row.aln-top {
      align-items: flex-start;
   }
   .row.aln-middle {
      align-items: center;
   }
   .row.aln-bottom {
      align-items: flex-end;
   }
   .row>.imp-large {
      order: -1;
   }
   .row>.col-1-large {
      width: 8.33333%;
   }
   .row>.off-1-large {
      margin-left: 8.33333%;
   }
   .row>.col-2-large {
      width: 16.66667%;
   }
   .row>.off-2-large {
      margin-left: 16.66667%;
   }
   .row>.col-3-large {
      width: 25%;
   }
   .row>.off-3-large {
      margin-left: 25%;
   }
   .row>.col-4-large {
      width: 33.33333%;
   }
   .row>.off-4-large {
      margin-left: 33.33333%;
   }
   .row>.col-5-large {
      width: 41.66667%;
   }
   .row>.off-5-large {
      margin-left: 41.66667%;
   }
   .row>.col-6-large {
      width: 50%;
   }
   .row>.off-6-large {
      margin-left: 50%;
   }
   .row>.col-7-large {
      width: 58.33333%;
   }
   .row>.off-7-large {
      margin-left: 58.33333%;
   }
   .row>.col-8-large {
      width: 66.66667%;
   }
   .row>.off-8-large {
      margin-left: 66.66667%;
   }
   .row>.col-9-large {
      width: 75%;
   }
   .row>.off-9-large {
      margin-left: 75%;
   }
   .row>.col-10-large {
      width: 83.33333%;
   }
   .row>.off-10-large {
      margin-left: 83.33333%;
   }
   .row>.col-11-large {
      width: 91.66667%;
   }
   .row>.off-11-large {
      margin-left: 91.66667%;
   }
   .row>.col-12-large {
      width: 100%;
   }
   .row>.off-12-large {
      margin-left: 100%;
   }
   .row.gtr-0 {
      margin-top: 0;
      margin-left: 0em;
   }
   .row.gtr-0>* {
      padding: 0 0 0 0em;
   }
   .row.gtr-0.gtr-uniform {
      margin-top: 0em;
   }
   .row.gtr-0.gtr-uniform>* {
      padding-top: 0em;
   }
   .row.gtr-25 {
      margin-top: 0;
      margin-left: -0.375em;
   }
   .row.gtr-25>* {
      padding: 0 0 0 0.375em;
   }
   .row.gtr-25.gtr-uniform {
      margin-top: -0.375em;
   }
   .row.gtr-25.gtr-uniform>* {
      padding-top: 0.375em;
   }
   .row.gtr-50 {
      margin-top: 0;
      margin-left: -0.75em;
   }
   .row.gtr-50>* {
      padding: 0 0 0 0.75em;
   }
   .row.gtr-50.gtr-uniform {
      margin-top: -0.75em;
   }
   .row.gtr-50.gtr-uniform>* {
      padding-top: 0.75em;
   }
   .row {
      margin-top: 0;
      margin-left: -1.5em;
   }
   .row>* {
      padding: 0 0 0 1.5em;
   }
   .row.gtr-uniform {
      margin-top: -1.5em;
   }
   .row.gtr-uniform>* {
      padding-top: 1.5em;
   }
   .row.gtr-150 {
      margin-top: 0;
      margin-left: -2.25em;
   }
   .row.gtr-150>* {
      padding: 0 0 0 2.25em;
   }
   .row.gtr-150.gtr-uniform {
      margin-top: -2.25em;
   }
   .row.gtr-150.gtr-uniform>* {
      padding-top: 2.25em;
   }
   .row.gtr-200 {
      margin-top: 0;
      margin-left: -3em;
   }
   .row.gtr-200>* {
      padding: 0 0 0 3em;
   }
   .row.gtr-200.gtr-uniform {
      margin-top: -3em;
   }
   .row.gtr-200.gtr-uniform>* {
      padding-top: 3em;
   }
}

@media screen and (max-width: 980px) {
   .row {
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      align-items: stretch;
   }
   .row>* {
      box-sizing: border-box;
   }
   .row.gtr-uniform>*>:last-child {
      margin-bottom: 0;
   }
   .row.aln-left {
      justify-content: flex-start;
   }
   .row.aln-center {
      justify-content: center;
   }
   .row.aln-right {
      justify-content: flex-end;
   }
   .row.aln-top {
      align-items: flex-start;
   }
   .row.aln-middle {
      align-items: center;
   }
   .row.aln-bottom {
      align-items: flex-end;
   }
   .row>.imp-medium {
      order: -1;
   }
   .row>.col-1-medium {
      width: 8.33333%;
   }
   .row>.off-1-medium {
      margin-left: 8.33333%;
   }
   .row>.col-2-medium {
      width: 16.66667%;
   }
   .row>.off-2-medium {
      margin-left: 16.66667%;
   }
   .row>.col-3-medium {
      width: 25%;
   }
   .row>.off-3-medium {
      margin-left: 25%;
   }
   .row>.col-4-medium {
      width: 33.33333%;
   }
   .row>.off-4-medium {
      margin-left: 33.33333%;
   }
   .row>.col-5-medium {
      width: 41.66667%;
   }
   .row>.off-5-medium {
      margin-left: 41.66667%;
   }
   .row>.col-6-medium {
      width: 50%;
   }
   .row>.off-6-medium {
      margin-left: 50%;
   }
   .row>.col-7-medium {
      width: 58.33333%;
   }
   .row>.off-7-medium {
      margin-left: 58.33333%;
   }
   .row>.col-8-medium {
      width: 66.66667%;
   }
   .row>.off-8-medium {
      margin-left: 66.66667%;
   }
   .row>.col-9-medium {
      width: 75%;
   }
   .row>.off-9-medium {
      margin-left: 75%;
   }
   .row>.col-10-medium {
      width: 83.33333%;
   }
   .row>.off-10-medium {
      margin-left: 83.33333%;
   }
   .row>.col-11-medium {
      width: 91.66667%;
   }
   .row>.off-11-medium {
      margin-left: 91.66667%;
   }
   .row>.col-12-medium {
      width: 100%;
   }
   .row>.off-12-medium {
      margin-left: 100%;
   }
   .row.gtr-0 {
      margin-top: 0;
      margin-left: 0em;
   }
   .row.gtr-0>* {
      padding: 0 0 0 0em;
   }
   .row.gtr-0.gtr-uniform {
      margin-top: 0em;
   }
   .row.gtr-0.gtr-uniform>* {
      padding-top: 0em;
   }
   .row.gtr-25 {
      margin-top: 0;
      margin-left: -0.375em;
   }
   .row.gtr-25>* {
      padding: 0 0 0 0.375em;
   }
   .row.gtr-25.gtr-uniform {
      margin-top: -0.375em;
   }
   .row.gtr-25.gtr-uniform>* {
      padding-top: 0.375em;
   }
   .row.gtr-50 {
      margin-top: 0;
      margin-left: -0.75em;
   }
   .row.gtr-50>* {
      padding: 0 0 0 0.75em;
   }
   .row.gtr-50.gtr-uniform {
      margin-top: -0.75em;
   }
   .row.gtr-50.gtr-uniform>* {
      padding-top: 0.75em;
   }
   .row {
      margin-top: 0;
      margin-left: -1.5em;
   }
   .row>* {
      padding: 0 0 0 1.5em;
   }
   .row.gtr-uniform {
      margin-top: -1.5em;
   }
   .row.gtr-uniform>* {
      padding-top: 1.5em;
   }
   .row.gtr-150 {
      margin-top: 0;
      margin-left: -2.25em;
   }
   .row.gtr-150>* {
      padding: 0 0 0 2.25em;
   }
   .row.gtr-150.gtr-uniform {
      margin-top: -2.25em;
   }
   .row.gtr-150.gtr-uniform>* {
      padding-top: 2.25em;
   }
   .row.gtr-200 {
      margin-top: 0;
      margin-left: -3em;
   }
   .row.gtr-200>* {
      padding: 0 0 0 3em;
   }
   .row.gtr-200.gtr-uniform {
      margin-top: -3em;
   }
   .row.gtr-200.gtr-uniform>* {
      padding-top: 3em;
   }
}

@media screen and (max-width: 736px) {
   .row {
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      align-items: stretch;
   }
   .row>* {
      box-sizing: border-box;
   }
   .row.gtr-uniform>*>:last-child {
      margin-bottom: 0;
   }
   .row.aln-left {
      justify-content: flex-start;
   }
   .row.aln-center {
      justify-content: center;
   }
   .row.aln-right {
      justify-content: flex-end;
   }
   .row.aln-top {
      align-items: flex-start;
   }
   .row.aln-middle {
      align-items: center;
   }
   .row.aln-bottom {
      align-items: flex-end;
   }
   .row>.imp-small {
      order: -1;
   }
   .row>.col-1-small {
      width: 8.33333%;
   }
   .row>.off-1-small {
      margin-left: 8.33333%;
   }
   .row>.col-2-small {
      width: 16.66667%;
   }
   .row>.off-2-small {
      margin-left: 16.66667%;
   }
   .row>.col-3-small {
      width: 25%;
   }
   .row>.off-3-small {
      margin-left: 25%;
   }
   .row>.col-4-small {
      width: 33.33333%;
   }
   .row>.off-4-small {
      margin-left: 33.33333%;
   }
   .row>.col-5-small {
      width: 41.66667%;
   }
   .row>.off-5-small {
      margin-left: 41.66667%;
   }
   .row>.col-6-small {
      width: 50%;
   }
   .row>.off-6-small {
      margin-left: 50%;
   }
   .row>.col-7-small {
      width: 58.33333%;
   }
   .row>.off-7-small {
      margin-left: 58.33333%;
   }
   .row>.col-8-small {
      width: 66.66667%;
   }
   .row>.off-8-small {
      margin-left: 66.66667%;
   }
   .row>.col-9-small {
      width: 75%;
   }
   .row>.off-9-small {
      margin-left: 75%;
   }
   .row>.col-10-small {
      width: 83.33333%;
   }
   .row>.off-10-small {
      margin-left: 83.33333%;
   }
   .row>.col-11-small {
      width: 91.66667%;
   }
   .row>.off-11-small {
      margin-left: 91.66667%;
   }
   .row>.col-12-small {
      width: 100%;
   }
   .row>.off-12-small {
      margin-left: 100%;
   }
   .row.gtr-0 {
      margin-top: 0;
      margin-left: 0em;
   }
   .row.gtr-0>* {
      padding: 0 0 0 0em;
   }
   .row.gtr-0.gtr-uniform {
      margin-top: 0em;
   }
   .row.gtr-0.gtr-uniform>* {
      padding-top: 0em;
   }
   .row.gtr-25 {
      margin-top: 0;
      margin-left: -0.375em;
   }
   .row.gtr-25>* {
      padding: 0 0 0 0.375em;
   }
   .row.gtr-25.gtr-uniform {
      margin-top: -0.375em;
   }
   .row.gtr-25.gtr-uniform>* {
      padding-top: 0.375em;
   }
   .row.gtr-50 {
      margin-top: 0;
      margin-left: -0.75em;
   }
   .row.gtr-50>* {
      padding: 0 0 0 0.75em;
   }
   .row.gtr-50.gtr-uniform {
      margin-top: -0.75em;
   }
   .row.gtr-50.gtr-uniform>* {
      padding-top: 0.75em;
   }
   .row {
      margin-top: 0;
      margin-left: -1.5em;
   }
   .row>* {
      padding: 0 0 0 1.5em;
   }
   .row.gtr-uniform {
      margin-top: -1.5em;
   }
   .row.gtr-uniform>* {
      padding-top: 1.5em;
   }
   .row.gtr-150 {
      margin-top: 0;
      margin-left: -2.25em;
   }
   .row.gtr-150>* {
      padding: 0 0 0 2.25em;
   }
   .row.gtr-150.gtr-uniform {
      margin-top: -2.25em;
   }
   .row.gtr-150.gtr-uniform>* {
      padding-top: 2.25em;
   }
   .row.gtr-200 {
      margin-top: 0;
      margin-left: -3em;
   }
   .row.gtr-200>* {
      padding: 0 0 0 3em;
   }
   .row.gtr-200.gtr-uniform {
      margin-top: -3em;
   }
   .row.gtr-200.gtr-uniform>* {
      padding-top: 3em;
   }
}

@media screen and (max-width: 480px) {
   .row {
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      align-items: stretch;
   }
   .row>* {
      box-sizing: border-box;
   }
   .row.gtr-uniform>*>:last-child {
      margin-bottom: 0;
   }
   .row.aln-left {
      justify-content: flex-start;
   }
   .row.aln-center {
      justify-content: center;
   }
   .row.aln-right {
      justify-content: flex-end;
   }
   .row.aln-top {
      align-items: flex-start;
   }
   .row.aln-middle {
      align-items: center;
   }
   .row.aln-bottom {
      align-items: flex-end;
   }
   .row>.imp-xsmall {
      order: -1;
   }
   .row>.col-1-xsmall {
      width: 8.33333%;
   }
   .row>.off-1-xsmall {
      margin-left: 8.33333%;
   }
   .row>.col-2-xsmall {
      width: 16.66667%;
   }
   .row>.off-2-xsmall {
      margin-left: 16.66667%;
   }
   .row>.col-3-xsmall {
      width: 25%;
   }
   .row>.off-3-xsmall {
      margin-left: 25%;
   }
   .row>.col-4-xsmall {
      width: 33.33333%;
   }
   .row>.off-4-xsmall {
      margin-left: 33.33333%;
   }
   .row>.col-5-xsmall {
      width: 41.66667%;
   }
   .row>.off-5-xsmall {
      margin-left: 41.66667%;
   }
   .row>.col-6-xsmall {
      width: 50%;
   }
   .row>.off-6-xsmall {
      margin-left: 50%;
   }
   .row>.col-7-xsmall {
      width: 58.33333%;
   }
   .row>.off-7-xsmall {
      margin-left: 58.33333%;
   }
   .row>.col-8-xsmall {
      width: 66.66667%;
   }
   .row>.off-8-xsmall {
      margin-left: 66.66667%;
   }
   .row>.col-9-xsmall {
      width: 75%;
   }
   .row>.off-9-xsmall {
      margin-left: 75%;
   }
   .row>.col-10-xsmall {
      width: 83.33333%;
   }
   .row>.off-10-xsmall {
      margin-left: 83.33333%;
   }
   .row>.col-11-xsmall {
      width: 91.66667%;
   }
   .row>.off-11-xsmall {
      margin-left: 91.66667%;
   }
   .row>.col-12-xsmall {
      width: 100%;
   }
   .row>.off-12-xsmall {
      margin-left: 100%;
   }
   .row.gtr-0 {
      margin-top: 0;
      margin-left: 0em;
   }
   .row.gtr-0>* {
      padding: 0 0 0 0em;
   }
   .row.gtr-0.gtr-uniform {
      margin-top: 0em;
   }
   .row.gtr-0.gtr-uniform>* {
      padding-top: 0em;
   }
   .row.gtr-25 {
      margin-top: 0;
      margin-left: -0.375em;
   }
   .row.gtr-25>* {
      padding: 0 0 0 0.375em;
   }
   .row.gtr-25.gtr-uniform {
      margin-top: -0.375em;
   }
   .row.gtr-25.gtr-uniform>* {
      padding-top: 0.375em;
   }
   .row.gtr-50 {
      margin-top: 0;
      margin-left: -0.75em;
   }
   .row.gtr-50>* {
      padding: 0 0 0 0.75em;
   }
   .row.gtr-50.gtr-uniform {
      margin-top: -0.75em;
   }
   .row.gtr-50.gtr-uniform>* {
      padding-top: 0.75em;
   }
   .row {
      margin-top: 0;
      margin-left: -1.5em;
   }
   .row>* {
      padding: 0 0 0 1.5em;
   }
   .row.gtr-uniform {
      margin-top: -1.5em;
   }
   .row.gtr-uniform>* {
      padding-top: 1.5em;
   }
   .row.gtr-150 {
      margin-top: 0;
      margin-left: -2.25em;
   }
   .row.gtr-150>* {
      padding: 0 0 0 2.25em;
   }
   .row.gtr-150.gtr-uniform {
      margin-top: -2.25em;
   }
   .row.gtr-150.gtr-uniform>* {
      padding-top: 2.25em;
   }
   .row.gtr-200 {
      margin-top: 0;
      margin-left: -3em;
   }
   .row.gtr-200>* {
      padding: 0 0 0 3em;
   }
   .row.gtr-200.gtr-uniform {
      margin-top: -3em;
   }
   .row.gtr-200.gtr-uniform>* {
      padding-top: 3em;
   }
}

/* Section/Article */
section.special, article.special {
   text-align: center;
}

header p {
   font-family: "Roboto Slab", serif;
   font-size: 1em;
   font-weight: 400;
   letter-spacing: 0.075em;
   margin-top: -0.5em;
   text-transform: uppercase;
}

header.major>:last-child {
   border-bottom: solid 3px #D8EEE1;
   display: inline-block;
   margin: 0 0 2em 0;
   padding: 0 0.75em 0.5em 0;
}

header.main>:last-child {
   margin: 0 0 1em 0;
}

/* Form */
form {
   margin: 0 0 2em 0;
}

label {
   color: #3d4449;
   display: block;
   font-size: 0.9em;
   font-weight: 600;
   margin: 0 0 1em 0;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
   input[type="search"], input[type="url"], select, textarea {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
   background: #ffffff;
   border-radius: 0.375em;
   border: none;
   border: solid 1px rgba(210, 215, 217, 0.75);
   color: inherit;
   display: block;
   outline: 0;
   padding: 0 1em;
   text-decoration: none;
   width: 100%;
}

input[type="text"]:invalid, input[type="password"]:invalid, input[type="email"]:invalid,
   input[type="tel"]:invalid, input[type="search"]:invalid, input[type="url"]:invalid,
   select:invalid, textarea:invalid {
   box-shadow: none;
}

input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus,
   input[type="tel"]:focus, input[type="search"]:focus, input[type="url"]:focus,
   select:focus, textarea:focus {
   border-color:#D8EEE1;
   box-shadow: 0 0 0 1px #D8EEE1;
}

select {
   background-image:
      url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' preserveAspectRatio='none' viewBox='0 0 40 40'%3E%3Cpath d='M9.4,12.3l10.4,10.4l10.4-10.4c0.2-0.2,0.5-0.4,0.9-0.4c0.3,0,0.6,0.1,0.9,0.4l3.3,3.3c0.2,0.2,0.4,0.5,0.4,0.9 c0,0.4-0.1,0.6-0.4,0.9L20.7,31.9c-0.2,0.2-0.5,0.4-0.9,0.4c-0.3,0-0.6-0.1-0.9-0.4L4.3,17.3c-0.2-0.2-0.4-0.5-0.4-0.9 c0-0.4,0.1-0.6,0.4-0.9l3.3-3.3c0.2-0.2,0.5-0.4,0.9-0.4S9.1,12.1,9.4,12.3z' fill='rgba(210, 215, 217, 0.75)' /%3E%3C/svg%3E");
   background-size: 1.25em;
   background-repeat: no-repeat;
   background-position: calc(100% - 1em) center;
   height: 2.75em;
   padding-right: 2.75em;
   text-overflow: ellipsis;
}

select option {
   color: #3d4449;
   background: #ffffff;
}

select:focus::-ms-value {
   background-color: transparent;
}

select::-ms-expand {
   display: none;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
   input[type="search"], input[type="url"], select {
   height: 2.75em;
}

textarea {
   padding: 0.75em 1em;
}

input[type="checkbox"], input[type="radio"] {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
   display: block;
   float: left;
   margin-right: -2em;
   opacity: 0;
   width: 1em;
   z-index: -1;
}

input[type="checkbox"]+label, input[type="radio"]+label {
   text-decoration: none;
   color: #7f888f;
   cursor: pointer;
   display: inline-block;
   font-size: 1em;
   font-weight: 400;
   padding-left: 2.4em;
   padding-right: 0.75em;
   position: relative;
}

input[type="checkbox"]+label:before, input[type="radio"]+label:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 900;
}

input[type="checkbox"]+label:before, input[type="radio"]+label:before {
   background: #ffffff;
   border-radius: 0.375em;
   border: solid 1px rgba(210, 215, 217, 0.75);
   content: '';
   display: inline-block;
   font-size: 0.8em;
   height: 2.0625em;
   left: 0;
   line-height: 2.0625em;
   position: absolute;
   text-align: center;
   top: 0;
   width: 2.0625em;
}

input[type="checkbox"]:checked+label:before, input[type="radio"]:checked+label:before
   {
   background: #3d4449;
   border-color: #3d4449;
   color: #ffffff;
   content: '\f00c';
}

input[type="checkbox"]:focus+label:before, input[type="radio"]:focus+label:before
   {
   border-color: #D8EEE1;
   box-shadow: 0 0 0 1px #D8EEE1;
}

input[type="checkbox"]+label:before {
   border-radius: 0.375em;
}

input[type="radio"]+label:before {
   border-radius: 100%;
}

::-webkit-input-placeholder {
   color: #9fa3a6 !important;
   opacity: 1.0;
}

:-moz-placeholder {
   color: #9fa3a6 !important;
   opacity: 1.0;
}

::-moz-placeholder {
   color: #9fa3a6 !important;
   opacity: 1.0;
}

:-ms-input-placeholder {
   color: #9fa3a6 !important;
   opacity: 1.0;
}

/* Box */
.box {
   border-radius: 0.375em;
   border: solid 1px rgba(210, 215, 217, 0.75);
   margin-bottom: 2em;
   padding: 1.5em;
}

.box>:last-child, .box>:last-child>:last-child, .box>:last-child>:last-child>:last-child
   {
   margin-bottom: 0;
}

.box.alt {
   border: 0;
   border-radius: 0;
   padding: 0;
}

/* Icon */
.icon {
   text-decoration: none;
   border-bottom: none;
   position: relative;
}

.icon:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 400;
}

.icon>.label {
   display: none;
}

.icon:before {
   line-height: inherit;
}

.icon.solid:before {
   font-weight: 900;
}

.icon.brands:before {
   font-family: 'Font Awesome 5 Brands';
}

/* Image */
.image {
   border-radius: 0.375em;
   border: 0;
   display: inline-block;
   position: relative;
}

.image img {
   border-radius: 0.375em;
   display: block;
}

.image.left, .image.right {
   max-width: 40%;
}

.image.left img, .image.right img {
   width: 100%;
}

.image.left {
   float: left;
   padding: 0 1.5em 1em 0;
   top: 0.25em;
}

.image.right {
   float: right;
   padding: 0 0 1em 1.5em;
   top: 0.25em;
}

.image.fit {
   display: block;
   margin: 0 0 2em 0;
   width: 100%;
}

.image.fit img {
   width: 100%;
}

.image.main {
   display: block;
   margin: 0 0 3em 0;
   width: 100%;
}

.image.main img {
   width: 100%;
}

a.image {
   overflow: hidden;
}

a.image img {
   -moz-transition: -moz-transform 0.2s ease;
   -webkit-transition: -webkit-transform 0.2s ease;
   -ms-transition: -ms-transform 0.2s ease;
   transition: transform 0.2s ease;
}

a.image:hover img {
   -moz-transform: scale(1.075);
   -webkit-transform: scale(1.075);
   -ms-transform: scale(1.075);
   transform: scale(1.075);
}

/* List */
ol {
   list-style: decimal;
   margin: 0 0 2em 0;
   padding-left: 1.25em;
}

ol li {
   padding-left: 0.25em;
}

ul {
   list-style: disc;
   margin: 0 0 2em 0;
   padding-left: 1em;
}

ul li {
   padding-left: 0.5em;
}

ul.alt {
   list-style: none;
   padding-left: 0;
}

ul.alt li {
   border-top: solid 1px rgba(210, 215, 217, 0.75);
   padding: 0.5em 0;
}

ul.alt li:first-child {
   border-top: 0;
   padding-top: 0;
}

dl {
   margin: 0 0 2em 0;
}

dl dt {
   display: block;
   font-weight: 600;
   margin: 0 0 1em 0;
}

dl dd {
   margin-left: 2em;
}

/* Actions */
ul.actions {
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   cursor: default;
   list-style: none;
   margin-left: -1em;
   padding-left: 0;
}

ul.actions li {
   padding: 0 0 0 1em;
   vertical-align: middle;
}

ul.actions.special {
   -moz-justify-content: center;
   -webkit-justify-content: center;
   -ms-justify-content: center;
   justify-content: center;
   width: 100%;
   margin-left: 0;
}

ul.actions.special li:first-child {
   padding-left: 0;
}

ul.actions.stacked {
   -moz-flex-direction: column;
   -webkit-flex-direction: column;
   -ms-flex-direction: column;
   flex-direction: column;
   margin-left: 0;
}

ul.actions.stacked li {
   padding: 1.3em 0 0 0;
}

ul.actions.stacked li:first-child {
   padding-top: 0;
}

ul.actions.fit {
   width: calc(100% + 1em);
}

ul.actions.fit li {
   -moz-flex-grow: 1;
   -webkit-flex-grow: 1;
   -ms-flex-grow: 1;
   flex-grow: 1;
   -moz-flex-shrink: 1;
   -webkit-flex-shrink: 1;
   -ms-flex-shrink: 1;
   flex-shrink: 1;
   width: 100%;
}

ul.actions.fit li>* {
   width: 100%;
}

ul.actions.fit.stacked {
   width: 100%;
}

/* Icons */
ul.icons {
   cursor: default;
   list-style: none;
   padding-left: 0;
}

ul.icons li {
   display: inline-block;
   padding: 0 1em 0 0;
}

ul.icons li:last-child {
   padding-right: 0;
}

ul.icons li .icon {
   color: inherit;
}

ul.icons li .icon:before {
   font-size: 1.25em;
}

/* Contact */
ul.contact {
   list-style: none;
   padding: 0;
}

ul.contact li {
   text-decoration: none;
   border-top: solid 1px rgba(210, 215, 217, 0.75);
   margin: 1.5em 0 0 0;
   padding: 1.5em 0 0 3em;
   position: relative;
}

ul.contact li:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 400;
}

ul.contact li:before {
   color: #D8EEE1;
   display: inline-block;
   font-size: 1.5em;
   height: 1.125em;
   left: 0;
   line-height: 1.125em;
   position: absolute;
   text-align: center;
   top: 1em;
   width: 1.5em;
}

ul.contact li:first-child {
   border-top: 0;
   margin-top: 0;
   padding-top: 0;
}

ul.contact li:first-child:before {
   top: 0;
}

ul.contact li a {
   color: inherit;
}

/* Pagination */
ul.pagination {
   cursor: default;
   list-style: none;
   padding-left: 0;
}

ul.pagination li {
   display: inline-block;
   padding-left: 0;
   vertical-align: middle;
}

ul.pagination li>.page {
   -moz-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -webkit-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -ms-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
   border-bottom: 0;
   border-radius: 0.375em;
   display: inline-block;
   font-size: 0.8em;
   font-weight: 600;
   height: 2em;
   line-height: 2em;
   margin: 0 0.125em;
   min-width: 2em;
   padding: 0 0.5em;
   text-align: center;
}

ul.pagination li>.page.active {
   background-color: #D8EEE1;
   color: #ffffff !important;
}

ul.pagination li>.page.active:hover {
   background-color: #f67878;
}

ul.pagination li>.page.active:active {
   background-color: #f45c5c;
}

ul.pagination li:first-child {
   padding-right: 0.75em;
}

ul.pagination li:last-child {
   padding-left: 0.75em;
}

@media screen and (max-width: 480px) {
   ul.pagination li:nth-child(n+2):nth-last-child(n+2) {
      display: none;
   }
   ul.pagination li:first-child {
      padding-right: 0;
   }
}

/* Table */
.table-wrapper {
   -webkit-overflow-scrolling: touch;
   overflow-x: auto;
}

table {
   margin: 0 0 2em 0;
   width: 100%;
}

table tbody tr {
   border: solid 1px rgba(210, 215, 217, 0.75);
   border-left: 0;
   border-right: 0;
}

table tbody tr:nth-child(2n+1) {
   background-color: rgba(230, 235, 237, 0.25);
}

table td {
   padding: 0.75em 0.75em;
}

table th {
   color: #3d4449;
   font-size: 0.9em;
   font-weight: 600;
   padding: 0 0.75em 0.75em 0.75em;
   text-align: left;
}

table thead {
   border-bottom: solid 2px rgba(210, 215, 217, 0.75);
}

table tfoot {
   border-top: solid 2px rgba(210, 215, 217, 0.75);
}

table.alt {
   border-collapse: separate;
}

table.alt tbody tr td {
   border: solid 1px rgba(210, 215, 217, 0.75);
   border-left-width: 0;
   border-top-width: 0;
}

table.alt tbody tr td:first-child {
   border-left-width: 1px;
}

table.alt tbody tr:first-child td {
   border-top-width: 1px;
}

table.alt thead {
   border-bottom: 0;
}

table.alt tfoot {
   border-top: 0;
}

/* Button */
input[type="submit"], input[type="reset"], input[type="button"], button,
   .button {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
   -moz-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -webkit-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -ms-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
   background-color: transparent;
   border-radius: 0.375em;
   border: 0;
   box-shadow: inset 0 0 0 2px #D8EEE1;
   color: gray !important;
   cursor: pointer;
   display: inline-block;
   font-family: "Roboto Slab", serif;
   font-size: 0.8em;
   font-weight: 700;
   height: 3.5em;
   letter-spacing: 0.075em;
   line-height: 3.5em;
   padding: 0 2.25em;
   text-align: center;
   text-decoration: none;
   text-transform: uppercase;
   white-space: nowrap;
}

input[type="submit"]:hover, input[type="reset"]:hover, input[type="button"]:hover,
   button:hover, .button:hover {
   background-color: rgba(245, 106, 106, 0.05);
}

input[type="submit"]:active, input[type="reset"]:active, input[type="button"]:active,
   button:active, .button:active {
   background-color: rgba(245, 106, 106, 0.15);
}

input[type="submit"].icon:before, input[type="reset"].icon:before, input[type="button"].icon:before,
   button.icon:before, .button.icon:before {
   margin-right: 0.5em;
}

input[type="submit"].fit, input[type="reset"].fit, input[type="button"].fit,
   button.fit, .button.fit {
   width: 100%;
}

input[type="submit"].small, input[type="reset"].small, input[type="button"].small,
   button.small, .button.small {
   font-size: 0.6em;
}

input[type="submit"].large, input[type="reset"].large, input[type="button"].large,
   button.large, .button.large {
   font-size: 1em;
   height: 3.65em;
   line-height: 3.65em;
}

input[type="submit"].primary, input[type="reset"].primary, input[type="button"].primary,
   button.primary, .button.primary {
   background-color: #D8EEE1;
   box-shadow: none;
   color: #ffffff !important;
}

input[type="submit"].primary:hover, input[type="reset"].primary:hover,
   input[type="button"].primary:hover, button.primary:hover, .button.primary:hover
   {
   background-color: #f67878;
}

input[type="submit"].primary:active, input[type="reset"].primary:active,
   input[type="button"].primary:active, button.primary:active, .button.primary:active
   {
   background-color: #f45c5c;
}

input[type="submit"].disabled, input[type="submit"]:disabled, input[type="reset"].disabled,
   input[type="reset"]:disabled, input[type="button"].disabled, input[type="button"]:disabled,
   button.disabled, button:disabled, .button.disabled, .button:disabled {
   pointer-events: none;
   opacity: 0.25;
}

/* Mini Posts */
.mini-posts article {
   border-top: solid 1px rgba(210, 215, 217, 0.75);
   margin-top: 2em;
   padding-top: 2em;
}

.mini-posts article .image {
   display: block;
   margin: 0 0 1.5em 0;
}

.mini-posts article .image img {
   display: block;
   width: 100%;
}

.mini-posts article:first-child {
   border-top: 0;
   margin-top: 0;
   padding-top: 0;
}

/* Features */
.features {
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   -moz-flex-wrap: wrap;
   -webkit-flex-wrap: wrap;
   -ms-flex-wrap: wrap;
   flex-wrap: wrap;
   margin: 0 0 2em -3em;
   width: calc(100% + 3em);
}

.features article {
   -moz-align-items: center;
   -webkit-align-items: center;
   -ms-align-items: center;
   align-items: center;
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   margin: 0 0 3em 3em;
   position: relative;
   width: calc(50% - 3em);
}

.features article:nth-child(2n - 1) {
   margin-right: 1.5em;
}

.features article:nth-child(2n) {
   margin-left: 1.5em;
}

.features article:nth-last-child(1), .features article:nth-last-child(2)
   {
   margin-bottom: 0;
}

.features article .icon {
   -moz-flex-grow: 0;
   -webkit-flex-grow: 0;
   -ms-flex-grow: 0;
   flex-grow: 0;
   -moz-flex-shrink: 0;
   -webkit-flex-shrink: 0;
   -ms-flex-shrink: 0;
   flex-shrink: 0;
   display: block;
   height: 10em;
   line-height: 10em;
   margin: 0 2em 0 0;
   text-align: center;
   width: 10em;
}

.features article .icon:before {
   color: #D8EEE1;
   font-size: 2.75rem;
   position: relative;
   top: 0.05em;
}

.features article .icon:after {
   -moz-transform: rotate(45deg);
   -webkit-transform: rotate(45deg);
   -ms-transform: rotate(45deg);
   transform: rotate(45deg);
   border-radius: 0.25rem;
   border: solid 2px rgba(210, 215, 217, 0.75);
   content: '';
   display: block;
   height: 7em;
   left: 50%;
   margin: -3.5em 0 0 -3.5em;
   position: absolute;
   top: 50%;
   width: 7em;
}

.features article .content {
   -moz-flex-grow: 1;
   -webkit-flex-grow: 1;
   -ms-flex-grow: 1;
   flex-grow: 1;
   -moz-flex-shrink: 1;
   -webkit-flex-shrink: 1;
   -ms-flex-shrink: 1;
   flex-shrink: 1;
   width: 100%;
}

.features article .content>:last-child {
   margin-bottom: 0;
}

@media screen and (max-width: 980px) {
   .features {
      margin: 0 0 2em 0;
      width: 100%;
   }
   .features article {
      margin: 0 0 3em 0;
      width: 100%;
   }
   .features article:nth-child(2n - 1) {
      margin-right: 0;
   }
   .features article:nth-child(2n) {
      margin-left: 0;
   }
   .features article:nth-last-child(1), .features article:nth-last-child(2)
      {
      margin-bottom: 3em;
   }
   .features article:last-child {
      margin-bottom: 0;
   }
   .features article .icon {
      height: 8em;
      line-height: 8em;
      width: 8em;
   }
   .features article .icon:before {
      font-size: 2.25rem;
   }
   .features article .icon:after {
      height: 6em;
      margin: -3em 0 0 -3em;
      width: 6em;
   }
}

@media screen and (max-width: 480px) {
   .features article {
      -moz-flex-direction: column;
      -webkit-flex-direction: column;
      -ms-flex-direction: column;
      flex-direction: column;
      -moz-align-items: -moz-flex-start;
      -webkit-align-items: -webkit-flex-start;
      -ms-align-items: -ms-flex-start;
      align-items: flex-start;
   }
   .features article .icon {
      height: 6em;
      line-height: 6em;
      margin: 0 0 1.5em 0;
      width: 6em;
   }
   .features article .icon:before {
      font-size: 1.5rem;
   }
   .features article .icon:after {
      height: 4em;
      margin: -2em 0 0 -2em;
      width: 4em;
   }
}

@media screen and (max-width: 480px) {
   .features article .icon:before {
      font-size: 1.25rem;
   }
}

/* Posts */
.posts {
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   -moz-flex-wrap: wrap;
   -webkit-flex-wrap: wrap;
   -ms-flex-wrap: wrap;
   flex-wrap: wrap;
   margin: 0 0 2em -6em;
   width: calc(100% + 6em);
}

.posts article {
   -moz-flex-grow: 0;
   -webkit-flex-grow: 0;
   -ms-flex-grow: 0;
   flex-grow: 0;
   -moz-flex-shrink: 1;
   -webkit-flex-shrink: 1;
   -ms-flex-shrink: 1;
   flex-shrink: 1;
   margin: 0 0 6em 6em;
   position: relative;
   width: calc(33.33333% - 6em);
}

.posts article:before {
   background: rgba(210, 215, 217, 0.75);
   content: '';
   display: block;
   height: calc(100% + 6em);
   left: -3em;
   position: absolute;
   top: 0;
   width: 1px;
}

.posts article:after {
   background: rgba(210, 215, 217, 0.75);
   bottom: -3em;
   content: '';
   display: block;
   height: 1px;
   position: absolute;
   right: 0;
   width: calc(100% + 6em);
}

.posts article>:last-child {
   margin-bottom: 0;
}

.posts article .image {
   display: block;
   margin: 0 0 2em 0;
}

.posts article .image img {
   display: block;
   width: 100%;
}

@media screen and (min-width: 1681px) {
   .posts article:nth-child(3n+1):before {
      display: none;
   }
   .posts article:nth-child(3n+1):after {
      width: 100%;
   }
   .posts article:nth-last-child(1), .posts article:nth-last-child(2),
      .posts article:nth-last-child(3) {
      margin-bottom: 0;
   }
   .posts article:nth-last-child(1):before, .posts article:nth-last-child(2):before,
      .posts article:nth-last-child(3):before {
      height: 100%;
   }
   .posts article:nth-last-child(1):after, .posts article:nth-last-child(2):after,
      .posts article:nth-last-child(3):after {
      display: none;
   }
}

@media screen and (max-width: 1680px) {
   .posts article {
      width: calc(50% - 6em);
   }
   .posts article:nth-last-child(3) {
      margin-bottom: 6em;
   }
}

@media screen and (min-width: 481px) and (max-width: 1680px) {
   .posts article:nth-child(2n+1):before {
      display: none;
   }
   .posts article:nth-child(2n+1):after {
      width: 100%;
   }
   .posts article:nth-last-child(1), .posts article:nth-last-child(2) {
      margin-bottom: 0;
   }
   .posts article:nth-last-child(1):before, .posts article:nth-last-child(2):before
      {
      height: 100%;
   }
   .posts article:nth-last-child(1):after, .posts article:nth-last-child(2):after
      {
      display: none;
   }
}

@media screen and (max-width: 736px) {
   .posts {
      margin: 0 0 2em -4.5em;
      width: calc(100% + 4.5em);
   }
   .posts article {
      margin: 0 0 4.5em 4.5em;
      width: calc(50% - 4.5em);
   }
   .posts article:before {
      height: calc(100% + 4.5em);
      left: -2.25em;
   }
   .posts article:after {
      bottom: -2.25em;
      width: calc(100% + 4.5em);
   }
   .posts article:nth-last-child(3) {
      margin-bottom: 4.5em;
   }
}

@media screen and (max-width: 480px) {
   .posts {
      margin: 0 0 2em 0;
      width: 100%;
   }
   .posts article {
      margin: 0 0 4.5em 0;
      width: 100%;
   }
   .posts article:before {
      display: none;
   }
   .posts article:after {
      width: 100%;
   }
   .posts article:last-child {
      margin-bottom: 0;
   }
   .posts article:last-child:after {
      display: none;
   }
}

/* Wrapper */
#wrapper {
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   -moz-flex-direction: row-reverse;
   -webkit-flex-direction: row-reverse;
   -ms-flex-direction: row-reverse;
   flex-direction: row-reverse;
   min-height: 100vh;
}

/* Main */
#main {
   -moz-flex-grow: 1;
   -webkit-flex-grow: 1;
   -ms-flex-grow: 1;
   flex-grow: 1;
   -moz-flex-shrink: 1;
   -webkit-flex-shrink: 1;
   -ms-flex-shrink: 1;
   flex-shrink: 1;
   width: 100%;
}

#main>.inner {
   padding: 0 6em 0.1em 6em;
   margin: 0 auto;
   max-width: 110em;
}

#main>.inner>section {
   padding: 6em 0 4em 0;
   border-top: solid 2px rgba(210, 215, 217, 0.75);
}

#main>.inner>section:first-of-type {
   border-top: 0 !important;
}

@media screen and (max-width: 1680px) {
   #main>.inner {
      padding: 0 5em 0.1em 5em;
   }
   #main>.inner>section {
      padding: 5em 0 3em 0;
   }
}

@media screen and (max-width: 1280px) {
   #main>.inner {
      padding: 0 4em 0.1em 4em;
   }
   #main>.inner>section {
      padding: 4em 0 2em 0;
   }
}

@media screen and (max-width: 736px) {
   #main>.inner {
      padding: 0 2em 0.1em 2em;
   }
   #main>.inner>section {
      padding: 3em 0 1em 0;
   }
}

/* Sidebar */
#search form {
   text-decoration: none;
   position: relative;
}

#search form:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 900;
}

#search form:before {
   -moz-transform: scaleX(-1);
   -webkit-transform: scaleX(-1);
   -ms-transform: scaleX(-1);
   transform: scaleX(-1);
   color: #7f888f;
   content: '\f002';
   cursor: default;
   display: block;
   font-size: 1.5em;
   height: 2em;
   line-height: 2em;
   opacity: 0.325;
   position: absolute;
   right: 0;
   text-align: center;
   top: 0;
   width: 2em;
}

#search form input[type="text"] {
   padding-right: 2.75em;
}

#sidebar {
   -moz-flex-grow: 0;
   -webkit-flex-grow: 0;
   -ms-flex-grow: 0;
   flex-grow: 0;
   -moz-flex-shrink: 0;
   -webkit-flex-shrink: 0;
   -ms-flex-shrink: 0;
   flex-shrink: 0;
   -moz-transition: margin-left 0.5s ease, box-shadow 0.5s ease;
   -webkit-transition: margin-left 0.5s ease, box-shadow 0.5s ease;
   -ms-transition: margin-left 0.5s ease, box-shadow 0.5s ease;
   transition: margin-left 0.5s ease, box-shadow 0.5s ease;
   background-color: #D8EEE1;
   font-size: 0.9em;
   position: relative;
   width: 26em;
}

#sidebar h2 {
   font-size: 1.38889em;
}

#sidebar>.inner {
   padding: 2.22222em 2.22222em 2.44444em 2.22222em;
   position: relative;
   width: 26em;
}

#sidebar>.inner>* {
   border-bottom: solid 2px rgba(210, 215, 217, 0.75);
   margin: 0 0 3.5em 0;
   padding: 0 0 3.5em 0;
}

#sidebar>.inner>*>:last-child {
   margin-bottom: 0;
}

#sidebar>.inner>*:last-child {
   border-bottom: 0;
   margin-bottom: 0;
   padding-bottom: 0;
}

#sidebar>.inner>.alt {
   background-color: #eff1f2;
   border-bottom: 0;
   margin: -2.22222em 0 4.44444em -2.22222em;
   padding: 2.22222em;
   width: calc(100% + 4.44444em);
}

#sidebar .toggle {
   text-decoration: none;
   -moz-transition: left 0.5s ease;
   -webkit-transition: left 0.5s ease;
   -ms-transition: left 0.5s ease;
   transition: left 0.5s ease;
   -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
   border: 0;
   display: block;
   height: 7.5em;
   left: 26em;
   line-height: 7.5em;
   outline: 0;
   overflow: hidden;
   position: absolute;
   text-align: center;
   text-indent: -15em;
   white-space: nowrap;
   top: 0;
   width: 6em;
   z-index: 10000;
}

#sidebar .toggle:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 900;
}

#sidebar .toggle:before {
   content: '\f0c9';
   font-size: 2rem;
   height: inherit;
   left: 0;
   line-height: inherit;
   position: absolute;
   text-indent: 0;
   top: 0;
   width: inherit;
}

#sidebar.inactive {
   margin-left: -26em;
}

@media screen and (max-width: 1680px) {
   #sidebar {
      width: 24em;
   }
   #sidebar>.inner {
      padding: 1.66667em 1.66667em 1.33333em 1.66667em;
      width: 24em;
   }
   #sidebar>.inner>.alt {
      margin: -1.66667em 0 3.33333em -1.66667em;
      padding: 1.66667em;
      width: calc(100% + 3.33333em);
   }
   #sidebar .toggle {
      height: 6.25em;
      left: 24em;
      line-height: 6.25em;
      text-indent: 5em;
      width: 5em;
   }
   #sidebar .toggle:before {
      font-size: 1.5rem;
   }
   #sidebar.inactive {
      margin-left: -24em;
   }
}

@media screen and (max-width: 1280px) {
   #sidebar {
      box-shadow: 0 0 5em 0 rgba(0, 0, 0, 0.175);
      height: 100%;
      left: 0;
      position: fixed;
      top: 0;
      z-index: 10000;
   }
   #sidebar.inactive {
      box-shadow: none;
   }
   #sidebar>.inner {
      -webkit-overflow-scrolling: touch;
      height: 100%;
      left: 0;
      overflow-x: hidden;
      overflow-y: auto;
      position: absolute;
      top: 0;
   }
   #sidebar>.inner:after {
      content: '';
      display: block;
      height: 4em;
      width: 100%;
   }
   #sidebar .toggle {
      text-indent: 6em;
      width: 6em;
   }
   #sidebar .toggle:before {
      font-size: 1.5rem;
      margin-left: -0.4375em;
   }
   body.is-preload #sidebar {
      display: none;
   }
}

@media screen and (max-width: 736px) {
   #sidebar .toggle {
      text-indent: 7.25em;
      width: 7.25em;
   }
   #sidebar .toggle:before {
      color: #7f888f;
      margin-left: -0.0625em;
      margin-top: -0.25em;
      font-size: 1.1rem;
      z-index: 1;
   }
   #sidebar .toggle:after {
      background: rgba(222, 225, 226, 0.75);
      border-radius: 0.375em;
      content: '';
      height: 3.5em;
      left: 1em;
      position: absolute;
      top: 1em;
      width: 5em;
   }
}

/* Header */
#header {
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
   border-bottom: solid 5px #D8EEE1;
   padding: 6em 0 1em 0;
   position: relative;
}

#header>* {
   -moz-flex: 1;
   -webkit-flex: 1;
   -ms-flex: 1;
   flex: 1;
   margin-bottom: 0;
}

#header .logo {
   border-bottom: 0;
   color: inherit;
   font-family: "Roboto Slab", serif;
   font-size: 1.125em;
}

#header .icons {
   text-align: right;
}

@media screen and (max-width: 1680px) {
   #header {
      padding-top: 5em;
   }
}

@media screen and (max-width: 736px) {
   #header {
      padding-top: 6.5em;
   }
   #header .logo {
      font-size: 1.25em;
      margin: 0;
   }
   #header .icons {
      height: 5em;
      line-height: 5em;
      position: absolute;
      right: -0.5em;
      top: 0;
   }
}

/* Banner */
#banner {
   padding: 6em 0 4em 0;
   display: -moz-flex;
   display: -webkit-flex;
   display: -ms-flex;
   display: flex;
}

#banner h1 {
   margin-top: -0.125em;
}

#banner .content {
   -moz-flex-grow: 1;
   -webkit-flex-grow: 1;
   -ms-flex-grow: 1;
   flex-grow: 1;
   -moz-flex-shrink: 1;
   -webkit-flex-shrink: 1;
   -ms-flex-shrink: 1;
   flex-shrink: 1;
   width: 50%;
}

#banner .image {
   -moz-flex-grow: 0;
   -webkit-flex-grow: 0;
   -ms-flex-grow: 0;
   flex-grow: 0;
   -moz-flex-shrink: 0;
   -webkit-flex-shrink: 0;
   -ms-flex-shrink: 0;
   flex-shrink: 0;
   display: block;
   margin: 0 0 2em 4em;
   width: 50%;
}

#banner .image img {
   height: 100%;
   -moz-object-fit: cover;
   -webkit-object-fit: cover;
   -ms-object-fit: cover;
   object-fit: cover;
   -moz-object-position: center;
   -webkit-object-position: center;
   -ms-object-position: center;
   object-position: center;
   width: 100%;
}

@media screen and (orientation: portrait) {
   #banner {
      -moz-flex-direction: column-reverse;
      -webkit-flex-direction: column-reverse;
      -ms-flex-direction: column-reverse;
      flex-direction: column-reverse;
   }
   #banner h1 br {
      display: none;
   }
   #banner .content {
      -moz-flex-grow: 0;
      -webkit-flex-grow: 0;
      -ms-flex-grow: 0;
      flex-grow: 0;
      -moz-flex-shrink: 0;
      -webkit-flex-shrink: 0;
      -ms-flex-shrink: 0;
      flex-shrink: 0;
      width: 100%;
   }
   #banner .image {
      -moz-flex-grow: 0;
      -webkit-flex-grow: 0;
      -ms-flex-grow: 0;
      flex-grow: 0;
      -moz-flex-shrink: 0;
      -webkit-flex-shrink: 0;
      -ms-flex-shrink: 0;
      flex-shrink: 0;
      margin: 0 0 4em 0;
      height: 25em;
      max-height: 50vh;
      min-height: 18em;
      width: 100%;
   }
}

@media screen and (orientation: portrait) and (max-width: 480px) {
   #banner .image {
      max-height: 35vh;
   }
}

/* Footer */
#footer .copyright {
   color: #9fa3a6;
   font-size: 0.9em;
}

#footer .copyright a {
   color: inherit;
}

/* Menu */
#menu ul {
   -moz-user-select: none;
   -webkit-user-select: none;
   -ms-user-select: none;
   user-select: none;
   color: #3d4449;
   font-family: "Roboto Slab", serif;
   font-weight: 400;
   letter-spacing: 0.075em;
   list-style: none;
   margin-bottom: 0;
   padding: 0;
   text-transform: uppercase;
}

#menu ul a, #menu ul span {
   border-bottom: 0;
   color: inherit;
   cursor: pointer;
   display: block;
   font-size: 0.9em;
   padding: 0.625em 0;
}

#menu ul a:hover, #menu ul span:hover {
   color: #D8EEE1;
}

#menu ul a.opener, #menu ul span.opener {
   -moz-transition: color 0.2s ease-in-out;
   -webkit-transition: color 0.2s ease-in-out;
   -ms-transition: color 0.2s ease-in-out;
   transition: color 0.2s ease-in-out;
   text-decoration: none;
   -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
   position: relative;
}

#menu ul a.opener:before, #menu ul span.opener:before {
   -moz-osx-font-smoothing: grayscale;
   -webkit-font-smoothing: antialiased;
   display: inline-block;
   font-style: normal;
   font-variant: normal;
   text-rendering: auto;
   line-height: 1;
   text-transform: none !important;
   font-family: 'Font Awesome 5 Free';
   font-weight: 900;
}

#menu ul a.opener:before, #menu ul span.opener:before {
   -moz-transition: color 0.2s ease-in-out, -moz-transform 0.2s ease-in-out;
   -webkit-transition: color 0.2s ease-in-out, -webkit-transform 0.2s
      ease-in-out;
   -ms-transition: color 0.2s ease-in-out, -ms-transform 0.2s ease-in-out;
   transition: color 0.2s ease-in-out, transform 0.2s ease-in-out;
   color: #9fa3a6;
   content: '\f078';
   position: absolute;
   right: 0;
}

#menu ul a.opener:hover:before, #menu ul span.opener:hover:before {
   color: #D8EEE1;
}

#menu ul a.opener.active+ul, #menu ul span.opener.active+ul {
   display: block;
}

#menu ul a.opener.active:before, #menu ul span.opener.active:before {
   -moz-transform: rotate(-180deg);
   -webkit-transform: rotate(-180deg);
   -ms-transform: rotate(-180deg);
   transform: rotate(-180deg);
}

#menu>ul>li {
   border-top: solid 1px rgba(210, 215, 217, 0.75);
   margin: 0.5em 0 0 0;
   padding: 0.5em 0 0 0;
}

#menu>ul>li>ul {
   color: #9fa3a6;
   display: none;
   margin: 0.5em 0 1.5em 0;
   padding-left: 1em;
}

#menu>ul>li>ul a, #menu>ul>li>ul span {
   font-size: 0.8em;
}

#menu>ul>li>ul>li {
   margin: 0.125em 0 0 0;
   padding: 0.125em 0 0 0;
}

#menu>ul>li:first-child {
   border-top: 0;
   margin-top: 0;
   padding-top: 0;
}
.img_diary{
   width : 400px;
   height : 400px;
}
.diary_title{
   font-size : 50px;
}
.img_title{
   font-size : 30px;
}
.title {
   font-family: 마포당인리발전소;
}
#temporary{
	display:none;
}
</style>
</head>
<body class="is-preload">
   <%
      session = request.getSession();
      DTO dto = (DTO) session.getAttribute("user");
      String email = dto.getEmail();
      postDAO po_dao = new postDAO();
      String result = po_dao.select_email(dto.getSql_post_select_email(), email);
   %>
   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="index.html" class="logo"><strong>Diary</strong> by
                  작성자 이름</a>
               <ul class="icons">
                  <li><a href="#" class="icon brands fa-twitter"><span
                        class="label">Twitter</span></a></li>
                  <li><a href="#" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>
                  <li><a href="#" class="icon brands fa-snapchat-ghost"><span
                        class="label">Snapchat</span></a></li>
                  <li><a href="#" class="icon brands fa-instagram"><span
                        class="label">Instagram</span></a></li>
                  <li><a href="#" class="icon brands fa-medium-m"><span
                        class="label">Medium</span></a></li>
               </ul>
            </header>

            <!-- Banner -->
            <section id="banner">
               <div class="content">
                  <header>
                     <h1 id="title" style="font-family: 마포당인리발전소;">
                        Hi, I m Editorial<br /> by HTML5 UP
                     </h1>
                     <p id="stitle" style="font-family: 마포당인리발전소;">A free and fully responsive site template</p>
                  </header>
                  <p id="content" style="font-family: koPub돋움;">Aenean ornare velit lacus, ac varius enim ullamcorper eu.
                     Proin aliquam facilisis ante interdum congue. Integer mollis,
                     nisl amet convallis, porttitor magna ullamcorper, amet egestas
                     mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id
                     euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor
                     sit nullam.</p>
                  <ul class="actions">
                     <li><a href="external_diary_title.html" class="button big" style="font-family: 마포당인리발전소; color: 'darkgray';">글쓰러가기</a></li>
                  </ul>
               </div>

               <span class="image object"> <img
                  src=getImg()[0] alt="" />
               </span>
            </section>

            <!-- Section -->
            <section>
               <header class="major">
                  <h2 style="font-family: 마포당인리발전소;">내 다이어리 목록</h2>
                  <ul class="actions">
                        <li><a href="editDiary.html" class="button" style="font-family: 마포당인리발전소;">다이어리 작성하기</a></li>
                  </ul>
               </header>
                     <!-- 다이어리 목록 부분 -->
                     
                     
                     <%=result %>
   
               
               
            </section>

         



            <!-- Section -->
            <section>
               <header class="major">
                  <h2>사진첩</h2>
                  <li><a href="imgServer.jsp" class="button">사진서버</a></li>
               </header>
               <div class="posts">
                  <article>
                     <a href="#" class="image"><img id = 'img1' src='images/pic01.jpg' alt="" /></a>
                     <h3 id="img1_title">Interdum aenean</h3>
                     <p id="img1_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img1_button">More</a></li>
                     </ul>
                  </article>
                  <article>
                     <a href="#" class="image"><img id = 'img2' src="images/pic02.jpg" alt="" /></a>
                     <h3 id="img2_title">Nulla amet dolore</h3>
                     <p id="img2_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img2_button">More</a></li>
                     </ul>
                  </article>
                  <article>
                     <a href="#" class="image"><img id = 'img3' src="images/pic03.jpg" alt="" /></a>
                     <h3 id="img3_title">Tempus ullamcorper</h3>
                     <p id="img3_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img3_button">More</a></li>
                     </ul>
                  </article>
                  <article>
                     <a href="#" class="image"><img id = 'img4' src="images/pic04.jpg" alt="" /></a>
                     <h3 id="img4_title">Sed etiam facilis</h3>
                     <p id="img4_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img4_button">More</a></li>
                     </ul>
                  </article>
                  <article>
                     <a href="#" class="image"><img id = 'img5' src="images/pic05.jpg" alt="" /></a>
                     <h3 id="img5_title">Feugiat lorem aenean</h3>
                     <p id="img5_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img5_button">More</a></li>
                     </ul>
                  </article>
                  <article>
                     <a href="#" class="image"><img id = 'img6' src="images/pic06.jpg" alt="" /></a>
                     <h3 id="img6_title">Amet varius aliquam</h3>
                     <p id="img6_plu_name">Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
                        nulla amet lorem feugiat tempus aliquam.</p>
                     <ul class="actions">
                        <li><a href="imgServer.jsp" class="button" id="img6_button">More</a></li>
                     </ul>
                  </article>
               </div>
            </section>

         </div>
      </div>

      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">

            <!-- Search -->
            <section id="search" class="alt">
               <form method="post" action="#">
                  <input type="text" name="query" id="query" placeholder="Search" />
               </form>
            </section>

            <!-- Menu -->
            <nav id="menu">
               <header class="major">
                  <h2>Menu</h2>
               </header>
               <ul>
                  <li><a href="index.jsp">Homepage</a></li>
                  <li><a href="editDiary.html">다이어리 작성하기</a></li>
                  <li><a href="elements.html">책만들기</a></li>
                  <li><span class="opener"></span>
                     <ul>
                        <li><a href="#">Lorem Dolor</a></li>
                        <li><a href="#">Ipsum Adipiscing</a></li>
                        <li><a href="#">Tempus Magna</a></li>
                        <li><a href="#">Feugiat Veroeros</a></li>
                     </ul></li>
     
               </ul>
            </nav>

            <!-- Section -->
            <!-- <section>
               <header class="major">
                  <h2>Ante interdum</h2>
               </header>
               <div class="mini-posts">
                  <article>
                     <a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
                     <p>Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore aliquam.</p>
                  </article>
                  <article>
                     <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
                     <p>Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore aliquam.</p>
                  </article>
                  <article>
                     <a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
                     <p>Aenean ornare velit lacus, ac varius enim lorem
                        ullamcorper dolore aliquam.</p>
                  </article>
               </div>
               <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
               </ul>
            </section> -->

            <!-- Section -->
            <!-- <section>
               <header class="major">
                  <h2>Get in touch</h2>
               </header>
               <p>Sed varius enim lorem ullamcorper dolore aliquam aenean
                  ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
                  sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
                  tempus aliquam.</p>
               <ul class="contact">
                  <li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
                  <li class="icon solid fa-phone">(000) 000-0000</li>
                  <li class="icon solid fa-home">1234 Somewhere Road #8254<br />
                     Nashville, TN 00000-0000
                  </li>
               </ul>
            </section> -->

            <!-- Footer -->
            <footer id="footer">
               <p class="copyright">
                  &copy; Untitled. All rights reserved. Demo Images: <a
                     href="https://unsplash.com">Unsplash</a>. Design: <a
                     href="https://html5up.net">HTML5 UP</a>.
               </p>
            </footer>

         </div>
      </div>

   </div>
	<div id="temporary"></div>
	<div id="temporary2"></div>
   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script>
			var img_dict;
			function getImg(){
				$.ajax({ 
		            url : "getImages", 
		            data : { name : "gil-dong", location : "seoul" },
		             }) .done(function(data) { 
		                 // 전송한 data를 출력 
		                 alert(data); 
		                 
		                 img_dict = JSON.parse(data);
		                 alert(img_dict['1']);
		                 alert(img_dict['1']==undefined);
		                 
		                 //1
 						 if(img_dict['0']===undefined){
 							$('#img1').css("display","none");
 							$('#img1_title').css("display","none");
 							$('#img1_plu_name').css("display","none");
 							$('#img1_button').css("display","none");
		                 }else{
		                	 $('#img1').attr("src",img_dict['0']);
			                 $('#img1_title').text(img_dict['0_name']);
			                 $('#img1_plu_name').text(img_dict['0_plu_name']=="null"?"장소 비등록":img_dict['0_plu_name']);
		                 }
 						 
 						 //2
 						if(img_dict['1']===undefined){
 							$('#img2').css("display","none");
 							$('#img2_title').css("display","none");
 							$('#img2_plu_name').css("display","none");
 							$('#img2_button').css("display","none");
		                 }else{
		                	 $('#img2').attr("src",img_dict['1']);
			                 $('#img2_title').text(img_dict['1_name']);
			                 $('#img2_plu_name').text(img_dict['1_plu_name']=="null"?"장소 비등록":img_dict['1_plu_name']);
		                 }
 						//3
 						if(img_dict['2']===undefined){
 							$('#img3').css("display","none");
 							$('#img3_title').css("display","none");
 							$('#img3_plu_name').css("display","none");
 							$('#img3_button').css("display","none");
		                 }else{
		                	 $('#img3').attr("src",img_dict['2']);
			                 $('#img3_title').text(img_dict['2_name']);
			                 $('#img3_plu_name').text(img_dict['2_plu_name']=="null"?"장소 비등록":img_dict['2_plu_name']);
		                 }
 						//4
 						if(img_dict['3']===undefined){
 							$('#img4').css("display","none");
 							$('#img4_title').css("display","none");
 							$('#img4_plu_name').css("display","none");
 							$('#img4_button').css("display","none");
		                 }else{
		                	 $('#img4').attr("src",img_dict['3']);
			                 $('#img4_title').text(img_dict['3_name']);
			                 $('#img4_plu_name').text(img_dict['3_plu_name']=="null"?"장소 비등록":img_dict['3_plu_name']);
		                 }
 						//5
 						if(img_dict['4']===undefined){
 							$('#img5').css("display","none");
 							$('#img5_title').css("display","none");
 							$('#img5_plu_name').css("display","none");
 							$('#img5_button').css("display","none");
		                 }else{
		                	 $('#img5').attr("src",img_dict['4']);
			                 $('#img5_title').text(img_dict['4_name']);
			                 $('#img5_plu_name').text(img_dict['4_plu_name']=="null"?"장소 비등록":img_dict['4_plu_name']);
		                 }
 						
 						//6
 						if(img_dict['5']===undefined){
 							$('#img6').css("display","none");
 							$('#img6_title').css("display","none");
 							$('#img6_plu_name').css("display","none");
 							$('#img6_button').css("display","none");
		                 }else{
		                	 $('#img6').attr("src",img_dict['5']);
			                 $('#img6_title').text(img_dict['5_name']);
			                 $('#img6_plu_name').text(img_dict['5_plu_name']=="null"?"장소 비등록":img_dict['5_plu_name']);
		                 }
 						
		        });
			}
			function test(n){
				return img_dict[n]
			}
        getImg();
        var file_name = "";
        var email = "";
		function diary(temp){
			file_name = $(temp).attr('href');
			console.log(file_name);
			email = '<%=email%>';
			console.log(email);
			
			$.ajax(
				{ 
					url: "getDiaryImg", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: {
						email: email,
						file_name : file_name
					}, // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					//dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
					.done(function(data) { 
						console.log(data);
						$('#temporary').html(data);
						var ttt = $('#temporary img');
						console.log(ttt);
						console.log(ttt.length);
						

						var li = new Array();
						for(var i=0;i<ttt.length;i++){
							li[i]=ttt[i].currentSrc;
						}
						console.log(li.toString());

						// DB 저장 AJAX
						$.ajax({ url: "saveDiaryImgOrder.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data: { email:email, file_name:file_name, src:li.toString() }, // HTTP 요청과 함께 서버로 보낼 데이터 
							method: "POST", // HTTP 요청 메소드(GET, POST 등) 
							//dataType: "json" // 서버에서 보내줄 데이터의 타입 
							}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
							.done(function(data) { 
								console.log("saveDiaryImgOrder  >>  data  " + data);
						})
						




					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("실패");
					}) //
					
		}
			
		
		function diary2(temp){
			var file_name = $(temp).attr('href');
			console.log(file_name);
			var email = '<%=email%>';
			console.log(email);
			
			$.ajax(
				{ 
					url: "getDiaryImgOrderFromDB", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: {
						email: email,
						file_name : file_name
					}, // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					//dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
					.done(function(data) { 
						console.log(data);
						console.log(JSON.parse(data));
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("실패");
					}) //
					
		}

		
		function temp(){
			$.ajax({ url: "getDiaryMain", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				//data: { name: "홍길동" }, // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "GET", // HTTP 요청 메소드(GET, POST 등) 
				//dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
				.done(function(data) { 
					console.log(data);
					data = data.replace(/\n/g, "");
					console.log(data);
					var jresult = JSON.parse(data.toString());
					console.log(jresult);
					$("#title").html(jresult['title']); 
					$("#stitle").html(jresult['stitle']); 
					$("#content").html(jresult['content']); 
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) { 
					$("#text").html("오류가 발생했다.<br>").append("오류명: " + errorThrown + "<br>").append("상태: " + status); 
				}) //
				.always(function(xhr, status) {
					 $("#text").html("요청이 완료되었습니다!"); 
			});
}
	temp();
function make_book(num){
	console.log(num);
	var link = $("#diary_"+num).attr('href');
	console.log(link);
	location.href = "/MZ/book.jsp?file_name="+link;
}
function next(temp){
	console.log("next machine ",temp);
	file_name = $("#diary_"+temp).attr('href');
	console.log(file_name);
	email = '<%=email%>';
	console.log(email);
	
	$.ajax({ url: "getDiaryHTML", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data: { email : email , file_name : file_name }, // HTTP 요청과 함께 서버로 보낼 데이터 
		method: "GET", // HTTP 요청 메소드(GET, POST 등) 
		//dataType: "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(data) { 
			console.log("getDiaryHTML >> done >> data >> " , data); 
			var start = data.indexOf("<body>");
			var end = data.indexOf("</body>");
			var body_tag = data.slice(start,end);
			body_tag = body_tag.replace("<body>","");
			console.log("body tag", body_tag);
			//ajax 2`\n`, `\r`, `\t`
			String.prototype.replaceAll = function(org, dest) {
    			return this.split(org).join(dest);
			}
			body_tag = body_tag.replaceAll("\\n","");
			body_tag = body_tag.replaceAll("\\r","");
			body_tag = body_tag.replaceAll("\\t","");
			body_tag = body_tag.replaceAll("<","");
			body_tag = body_tag.replaceAll(">","");
			body_tag = body_tag.replaceAll("[A-z]","");
			console.log("body tag", body_tag);
			
			location.href="MachineLearningIndex.jsp?contents="+body_tag;
		})
		.fail(function(xhr, status, errorThrown) { 
			
		}) 
		.always(function(xhr, status) {
			 
		});
	}
    </script>
</body>
</html>