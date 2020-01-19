Return-Path: <SRS0=OzsJ=3I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C57BC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:19:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0D5206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFVu0Ftb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0D5206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC7D98284B;
	Sun, 19 Jan 2020 13:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgEz5UbReAWd; Sun, 19 Jan 2020 13:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BE1081CA3;
	Sun, 19 Jan 2020 13:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32767C0177;
	Sun, 19 Jan 2020 13:19:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61BDFC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A77185593
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzbF5-fqbub8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:19:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BD1B853E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:19:03 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d5so5416537pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 05:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+zYbXDJWvtFPM6M3BR12O6UVxhMabahLWPbjZiZqxpk=;
 b=sFVu0FtbzfwOrx7EO/YIWEZdOZLuccN7CIeGbupCv/jzt00LvcDUNmgnl0fDcaghDp
 l3M4/R4UL23FffyxFSjrVk98v/TrUU8Yhj3VddqpJKVnhTLA6eAo+pEgnWJxWuMpEg3d
 j9i8xye+FZPEGXOF/ibYEWtiFU28gzvIBcn8rSvQEalqh50BR1+D9ydxWKPlfj3UzKRa
 mDh7dn15Oj3R8sSTY0El4NVKyfcXgSMkY+uCUuESg5Dx+J2+77PQ4B1qiEcieUanjpvx
 fzXSGJNMv5EXJeEhC51OYsS5IE9Vkzsiw4KNii5XlX9Uw1jXSEdOA3qLDISASX0XGJDX
 3cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+zYbXDJWvtFPM6M3BR12O6UVxhMabahLWPbjZiZqxpk=;
 b=Q4/gmpJ0lxeJyqnJeWu7UVj3lu9bIxZL3T9xFj6Omf6HrAy+Kc9/KMQPDFluRIJqcj
 8AG8YYN4bSEuhVTwbZEWtpoEWxhDVYRu5TxmE69lKguifrlUO4ACQazQrUia32V9yZfQ
 qMwPIRR0WMYKwRFqVv60AS3aEnfHi/vA/Pr3Yaxvxv5y6s7of/HL8iLB+odTcqvZr00X
 8+dFuycvwEa60ZFtycQq/8TADvrnjpWRZWpDx6wwaxMkOYvlzNlyYz8BEPQjWKYY4xa/
 Fvp9Pqm3TdyXQvFGD46SFOxUM98A8TqTTTsDz5MvDZZD3WHcXpopT5hGdu55jTHEFACm
 nTPQ==
X-Gm-Message-State: APjAAAVDT/A/UbiT7wiM6WP3DKOc2e6NgJSzEfkvWF5g8eF7PRACRj7k
 LphQKYmksJclGeh4JRc094g=
X-Google-Smtp-Source: APXvYqxjVrqKSg2O/7dbdQ6QUtsIqh6WPUujOWKNvdbmgYayIjdeEbd9hhVnFQLRPP/gWodogskyCQ==
X-Received: by 2002:a17:90a:7784:: with SMTP id
 v4mr18091340pjk.134.1579439942550; 
 Sun, 19 Jan 2020 05:19:02 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:6ff0:778b:ad50:8d0:2129])
 by smtp.gmail.com with ESMTPSA id d129sm36746054pfd.115.2020.01.19.05.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 05:19:01 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 19 Jan 2020 18:48:46 +0530
Message-Id: <20200119131846.23302-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_c: Handle case of macro
	before typedef
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

For the following case:

<macro> <typedef> <identifier>

A case in parsing_hacks.ml sometimes mislabels <macro> as a
typedef ident.

If <typedef> is a known typedef (such as u8 or *_t), then label
<macro> as a CppMacro. Subsequent cases will then label <typedef>
correctly.

Following is a diff of --parse-c on the Linux Kernel v5.5-rc4:
Before
---
After

nb good = 18956150,  nb passed = 134061 =========> 0.70% passed
---
nb good = 18956150,  nb passed = 134062 =========> 0.70% passed

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 8374731b..685a4908 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -2184,6 +2184,39 @@ let lookahead2 ~pass next before =
       && ok_typedef s && is_macro s2 && is_type type_
         ->
 	  TIdent (s, i1)
+
+  (* xx yy zz : xx is a macro *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TIdent(_,_)::_ , _)
+	when not_struct_enum before
+        && ok_typedef s2
+        && is_known_typdef s2
+        ->
+	  TCommentCpp(Token_c.CppMacro, i1)
+
+  (* xx yy zz : xx is a typedef ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TIdent(_,_)::_ , _)
+	when not_struct_enum before
+        && ok_typedef s
+        ->
+      msg_typedef s i1 2; LP.add_typedef_root s i1;
+      TypedefIdent (s, i1)
+
+  (* xx yy * zz : xx is a macro *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::ptr , _)
+    when pointer ~followed_by:(function TIdent _ -> true | _ -> false) ptr
+	&& not_struct_enum before
+	&& ok_typedef s2 && is_known_typdef s2
+        ->
+	  TCommentCpp(Token_c.CppMacro, i1)
+
+  (* xx yy * zz : xx is a typedef ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::ptr , _)
+    when pointer ~followed_by:(function TIdent _ -> true | _ -> false) ptr && not_struct_enum before
+	&& ok_typedef s
+        ->
+      msg_typedef s i1 2; LP.add_typedef_root s i1;
+      TypedefIdent (s, i1)
+
   (* xx yy *)
   | (TIdent (s, i1)::TIdent (s2, i2)::rest  , _) when not_struct_enum before
 	&& ok_typedef s && not (is_macro_paren s2 rest)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
