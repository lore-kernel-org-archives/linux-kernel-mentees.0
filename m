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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C547C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:46:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4769720684
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8yVsadC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4769720684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1602820023;
	Sun, 19 Jan 2020 13:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms9poJ7VUdlE; Sun, 19 Jan 2020 13:46:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 497F22000A;
	Sun, 19 Jan 2020 13:46:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF0BC0177;
	Sun, 19 Jan 2020 13:46:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18879C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CEE8853E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrI_zttrb2L8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:46:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F15148501A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:46:21 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so11988708plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 05:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdQS21ydiqH5O7l4ooG/TbyIarLFdZNwCcRFXTzEwfQ=;
 b=g8yVsadCSULub5bNPjIuuon7MP5sQOQ+uKbpLp34p0xd39uUfADL0thOAr96gxlGsZ
 bsnV3z3EIau8hNzkPWNLOeM9etBrJTDQVO3QQ9OPgUQnJn13H++1lCyrXg/lNOFUIeBA
 xTZLOXMu5gwKWSeFOEMOTlO22LQzBrYcp5XDT5/0hOX8J0ymDSVWASpnsvIES4wjx876
 eb6muTy2pVJuldAhs1AJ1J+FJkPw9uNL9Uql3fXYL21c8pw0CxJqtJLBqZNrciJCzn07
 AyZESXG2lj9OkWz0JDHVRYpqsEIvKwgUCpFPvEuCoYBNN7KCnPGEDHQHwH9cqThfge4J
 hCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdQS21ydiqH5O7l4ooG/TbyIarLFdZNwCcRFXTzEwfQ=;
 b=G07RFy1bzoXilH/+e8NOwXl90q5pVyUbXcWkh5HRp/BZRoHRyTjC8VaDvX+4ZgAdHH
 UIPMJjbmBDptrVEiBicPGEgtNUsQcINHMh2A0YHg+hptGABNatw0blZ+eIf9swHOrWf/
 HqBYZbxYc6oad1H0OTO38BJehYXAlmf3WTJ/Ieg4RfDA8txJnDJxIGKSK2H/zcbY2tRn
 Qeg/VUvl5amIIURN/usLUwO3hE66vOhMctYYaizefzGmW1kkUIqx/QtwDZiWrB+jLbli
 cMa4Y6P3ke3POGz1KAiLLZqAiq0Xvx3S/M71oSE1aHZ5qRwLrt7qVTNzjOxR+UgbpWrJ
 6gbA==
X-Gm-Message-State: APjAAAXmAW7ZbREaasFoGlqMiayW2Qp5nzDCzR1X58G8GhN7SbxLaiNB
 ousZJHLtD7MQCuQyvZQ7Kos=
X-Google-Smtp-Source: APXvYqzqcOHDOnTkKGQB+XSvGRU5b5uYLBPee7b0EMF3isHAsuCacEPXpVGFofwedMr3goox6AAKCQ==
X-Received: by 2002:a17:90a:22a5:: with SMTP id
 s34mr18265484pjc.8.1579441581580; 
 Sun, 19 Jan 2020 05:46:21 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166b:5b82:8890:55cc:899c:7e19])
 by smtp.gmail.com with ESMTPSA id b1sm25871067pfp.44.2020.01.19.05.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 05:46:20 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 19 Jan 2020 19:16:10 +0530
Message-Id: <20200119134610.31961-1-jaskaransingh7654321@gmail.com>
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

If typedef is a known typedef (such as u8 or *_t), then label
<macro> as a CppMacro. Subsequent cases will then label <typedef>
correctly.

Following are results of --parse-c on the Linux Kernel v5.5-rc4:

Before:

  nb good = 18956150,  nb passed = 134061 =========> 0.70% passed

After:

  nb good = 18956150,  nb passed = 134062 =========> 0.70% passed

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 8374731b..23d675cf 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -2184,6 +2184,41 @@ let lookahead2 ~pass next before =
       && ok_typedef s && is_macro s2 && is_type type_
         ->
 	  TIdent (s, i1)
+
+  (* xx yy zz : xx is a macro *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TIdent(_,_)::_ , _)
+    when not_struct_enum before
+	&& ok_typedef s2
+	&& is_known_typdef s2
+        ->
+	  TCommentCpp(Token_c.CppMacro, i1)
+
+  (* xx yy zz : xx is a typedef ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TIdent(_,_)::_ , _)
+    when not_struct_enum before
+	&& ok_typedef s
+        ->
+      msg_typedef s i1 2; LP.add_typedef_root s i1;
+      TypedefIdent (s, i1)
+
+  (* xx yy * zz : xx is a macro *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::ptr , _)
+    when pointer ~followed_by:(function TIdent _ -> true | _ -> false) ptr
+	&& not_struct_enum before
+	&& ok_typedef s2
+	&& is_known_typdef s2
+        ->
+	  TCommentCpp(Token_c.CppMacro, i1)
+
+  (* xx yy * zz : xx is a typedef ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::ptr , _)
+    when pointer ~followed_by:(function TIdent _ -> true | _ -> false) ptr
+	&& not_struct_enum before
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
