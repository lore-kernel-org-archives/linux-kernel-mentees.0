Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623F8C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3825120882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxQ0MCKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3825120882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 16734204DF;
	Tue, 21 Jan 2020 12:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2QxCGfDCZ1R; Tue, 21 Jan 2020 12:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EAAFC2010E;
	Tue, 21 Jan 2020 12:27:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE63EC0176;
	Tue, 21 Jan 2020 12:27:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83465C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6EF20854D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2UdHJjvslZJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B7DB5855EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:31 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l35so1451532pje.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 04:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IsJaYZtQo19fVGMr85I01baXl5YZLZhRFya5p7CvVcc=;
 b=jxQ0MCKhhCdXQfG13FK1N8EIeQabN+ZwE5xg8lRdnRG6k3Wf3MgawtTLlAwHA9+yCU
 SF8U5ok7ybM5buPCtTJ2wiS6BaWILw3EsFytD74I+Oc+JxxVsifQPJj5oge1WIu7GAgg
 SYAV5ZQlAwU6tK9vgQmcgNNCqT23ATrQYMu/AiqOr8hahxuU37C62VVCpQ+nfbFTQc0w
 +tjN8xi10gYIV8/3Hlb+5cvOz14LKO+tnNZTwyCfEYpXh0kNdhuhO5xd1QymgSmCtrjB
 y2kQfrvYss5gOb6GY+xoSLD/HjzzKoNzKrayw9hgh9UDvrL+f3eQpBK3MEVLrfDKoSM6
 5/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IsJaYZtQo19fVGMr85I01baXl5YZLZhRFya5p7CvVcc=;
 b=R5Lq/0NyzaDbluHhO2XhwWIl3yxIrMXWyJXnKyWOb5XBS/n/CsqMvP+pmxmDxphdof
 5F0jw1SDsIvYvVNS/iwo+tGLykvgavCVbpiaaWUKDTTV+1bx7+jp1fMLyC//E+8q21P6
 guTk/d768CHMidbIAg0Pz3TvIXPEhEOePBPLxnG2USUjCLh4e4WXcsBarPGveQnmavUm
 oCCN63FIF8Qbj8sld1Cf4RwoLFkbSDbAvqhC/E4E0mFFzrTxx0ZclOOaQ+uuUfa2hBQi
 uCFbpZNRKpPx2LFA44oJHFgZ9xjb5yAX0QHO/h64aZT1g30d50EQD3rV8Mhi9hYyvQCf
 XFFQ==
X-Gm-Message-State: APjAAAUaE73IFI6V7HYLg99ZkvZClSGc3K+8x43SdLKdyKFYZm3lfhZ0
 gVH6OBTC32iR1VniWWaFFN0=
X-Google-Smtp-Source: APXvYqxQYHQpzequEiKEEkgjz+ZzR514ghsazq64tUGImZDU8JlumnwVK1R/i611HWN8vLMd6boSyA==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr5197189pjg.35.1579609651316; 
 Tue, 21 Jan 2020 04:27:31 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 i9sm44381347pfk.24.2020.01.21.04.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:27:31 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 17:57:17 +0530
Message-Id: <20200121122719.24226-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 1/3] parsing_c: Handle case of
	macro before typedef
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
typedef identifier.

If typedef is a known typedef (such as u8 or *_t), then label <macro>
as a CppMacro. Subsequent cases will continue to label <typedef>
correctly as a typedef identifier.

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
