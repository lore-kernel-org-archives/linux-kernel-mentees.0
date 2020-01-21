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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72892C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35CEA22522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OW0W8uqb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35CEA22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E68CC86499;
	Tue, 21 Jan 2020 08:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwzPFsaU4mRY; Tue, 21 Jan 2020 08:05:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 951008634E;
	Tue, 21 Jan 2020 08:05:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91F89C0176;
	Tue, 21 Jan 2020 08:05:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F33F9C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F0269879B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71KFgKb-ahLH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7917F879A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id ay11so1006625plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jdQS21ydiqH5O7l4ooG/TbyIarLFdZNwCcRFXTzEwfQ=;
 b=OW0W8uqbHgyJzGmxlxl+NAeXcoztjqnFUChO+ZQbRKmYbTkaRzUy5fnNEg3Tk35m05
 QVHl4qvauktkQ2yyq7j7hQTro9Al23YybZHIo4FDkpvIYCabyWGr4MSYyB/wBwlMJdwB
 C0KnS5UaI0xTnzLKZnUEBcRjzEw+GmXhOho9cdlHFMfGuKsRmO/TiRTZdc25hOPe962r
 bLFnKm2BcQBJlbbuu/h3jA0pxb8tcQqnkvXQYRiZIWQdUtkEpP0SLw0FaLjgbisTbyG0
 VgLcWdL/ScJe41LDOz5shUal+3M2hmEdivL47eUvJqwdSW/9iVVjZAGopFm8SmNL8waT
 nRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jdQS21ydiqH5O7l4ooG/TbyIarLFdZNwCcRFXTzEwfQ=;
 b=jLcD75zvDdj7oIcnhD9ulAWq0aPLfDHfyTc/oX7I4osrNXWEZwsST55PySI1m+d5aU
 mRiT4x65kLEYXAvlsGcYuz8dNnZcY34CqGC8UaSqZ6OiY+eHCKSF0p8oYbkDgsPFGNaU
 GtVJY6l0QqRT3dnx/U54iM4qjA5c7uQfbSCPff6E1AkodZfMwD/LjPMIIUASfVvQ90YT
 7ii7pfXxVMDk2HE3423cnnbw59ePhSVaHJCQxkUXwyz5x8eO0TbbeNKfvO6KOXU+PSYg
 iRFUhndAN0eEvbAQFk0pj5myS1LIwUnYASR5e/8qrHLImB44VBRa4Sjbn//8pNj+TfcA
 3V0Q==
X-Gm-Message-State: APjAAAWri4EFlCe1X9QUG3aEs4vKmz/3wjpOl8EfymGMbR0Dt7AGMWqa
 dQqTi5T5fNKZWYP8MgNVyP8=
X-Google-Smtp-Source: APXvYqw1rnvTylQT/5z5sYlNe65+4JnHPFjWaGwKKFtC9s0oUYXeMsG79n8MJwsxS3Dr9oIKelKpSw==
X-Received: by 2002:a17:902:6507:: with SMTP id
 b7mr4142142plk.308.1579593923041; 
 Tue, 21 Jan 2020 00:05:23 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 k23sm39229604pgg.7.2020.01.21.00.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 00:05:22 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 13:34:53 +0530
Message-Id: <20200121080455.24748-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] parsing_c: Handle case of
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
