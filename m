Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E324DC282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D4C2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvfQuEt9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D4C2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9547A86B82;
	Fri, 10 Jan 2020 17:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxknJVzNH6zO; Fri, 10 Jan 2020 17:12:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1242D86B75;
	Fri, 10 Jan 2020 17:12:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02770C1D7D;
	Fri, 10 Jan 2020 17:12:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 441FAC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33598876A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwfHu3Khj8Nm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5F999876A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q8so1427399pfh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joa4U6NVSyf3okdud4VRwzY72Y0ZlT46zp7owqZcmHc=;
 b=qvfQuEt9fQ8K4OtdLOPjD8xcTI5WbX0ofVHsvV7s+rc6fr8kk4LrVw7/rzCHMh4iMP
 W01njasiHWH0LHlgBmvm3tZt6Gzrp9199R7/wu4/C+DYa8JcOJ5Enj0fC8WW7JLW5LIt
 QRBkrHIWKGZE10grbf2dTD9YY9LcrWVus11FVEsZcIVVpRLOrpQg9bdbjoxSirlb7hLc
 +qHGu1vw0bbuGpfn/EKYaPH6m5+L6OlTLMAij7HvVM8XUHszQwbW3GZLCyaQHGXMb+qu
 vSHhj5zItdSE+IdrUx0xH8OrkL53s3IakhRIEQ0VLTU5jc2Mm0Jf6TLOctFzoGwPGRM9
 /ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=joa4U6NVSyf3okdud4VRwzY72Y0ZlT46zp7owqZcmHc=;
 b=Qey5Thblr69FVDLYi/ePjq24GDg365SZitIbm6AAHpefyiejvCBOxLytwN7TJ+eUaB
 GDhx2GhdlhCSniTkxVp4NM20ZmSpyPbOvr9iGQTAK4FL7VPVc/0CsYJaJgLRcRn9bQya
 aJncz3EmdoYLN0sRRoY8wdILTDrDROBqrZebPvI6NTmLOo9F/rneF0U/y6CFZhYRSops
 kau3J3meiHjvxqp41slPq28Iwm8YAtbSNvp01zMhGrsoMyYaFurhPQ9xORmPiuOtALyi
 +mxJ1JGRm0H4p76KMws5VFmBuniUctPLRC8zOGYBJ2fzKuTeEDukg1rHciBmFFnEf4DD
 kh7w==
X-Gm-Message-State: APjAAAWipgRatih5rLpWWt7xSuNjTwxgCB+tUr8BShsf6YVUXbJ85l/H
 iyXttsgsVC5FWzmbZDh7tSA=
X-Google-Smtp-Source: APXvYqzB/kKjQGYXIaC96i8daTOgWtOxGdexmMQqefBVgyG256LxIiMCm3rK3x7BydmKOtYmVtVGzw==
X-Received: by 2002:a63:de47:: with SMTP id y7mr5491806pgi.270.1578676335906; 
 Fri, 10 Jan 2020 09:12:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:1662:5ce0:c587:cd6:22a3:e892])
 by smtp.gmail.com with ESMTPSA id b24sm3534920pfo.55.2020.01.10.09.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:12:15 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 10 Jan 2020 22:41:49 +0530
Message-Id: <20200110171150.14695-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110171150.14695-1-jaskaransingh7654321@gmail.com>
References: <20200110171150.14695-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] parsing_c: Support user comments
	attached to identifier
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Comments attached to identifiers via OCaml/Python bindings can be helpful
in using Coccinelle for source code analysis. Users of SmPL can attach
these comments to identifiers for denoting some information.

In certain cases, attaching comments to an identifier via OCaml/Python
bindings can lead to pretty printing errors. The reason for this is that
cases in unparse_cocci.ml do not recognize the identifier and the comments
as different tokens.

Add a function to support user comments.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 30e755e9..0388aa59 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -268,23 +268,49 @@ let print_disj_list fn l sep =
 (* --------------------------------------------------------------------- *)
 (* Identifier *)
 
+let print_with_comments id lcol rcol =
+  let ident_re = Str.regexp
+    "^\\([a-zA-Z_][a-zA-Z_0-9]*\\)\\(/\\*.*\\*/\\)*$" in
+  let pr_with_comments i c =
+    match c with
+      "" -> print_text i
+    | _ ->
+        print_text i;
+        pr_barrier lcol rcol;
+        print_text c in
+  let get_match i s =
+    try matched i s
+    with Not_found -> "" in
+  if id ==~ ident_re
+  then
+    let matched_id = get_match 1 id in
+    let comment = get_match 2 id in
+    pr_with_comments matched_id comment
+  else print_text id in
+
 let rec ident i =
   match Ast.unwrap i with
       Ast.Id(name) -> mcode print_string name
     | Ast.MetaId(name,_,_,_) ->
+	let (_,_,_,lcol,rcol) = lookup_metavar name in
 	handle_metavar name (function
-			       | (Ast_c.MetaIdVal id) -> print_text id
+			       | (Ast_c.MetaIdVal id) ->
+                                   print_with_comments id lcol rcol
 			       | _ -> error name i "identifier value expected"
 			    )
     | Ast.MetaFunc(name,_,_,_) ->
+	let (_,_,_,lcol,rcol) = lookup_metavar name in
 	handle_metavar name (function
-			       | (Ast_c.MetaFuncVal id) -> print_text id
+			       | (Ast_c.MetaFuncVal id) ->
+                                   print_with_comments id lcol rcol
 			       | _ ->
 				   error name i "function name value expected"
 			    )
     | Ast.MetaLocalFunc(name,_,_,_) ->
+	let (_,_,_,lcol,rcol) = lookup_metavar name in
 	handle_metavar name (function
-			       | (Ast_c.MetaLocalFuncVal id) -> print_text id
+			       | (Ast_c.MetaLocalFuncVal id) ->
+                                   print_with_comments id lcol rcol
 			       | _ ->
 				   error name i
 				     "local function name value expected"
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
