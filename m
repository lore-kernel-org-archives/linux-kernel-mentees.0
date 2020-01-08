Return-Path: <SRS0=o+/b=25=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A013C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 15:06:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F9D20678
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 15:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPuQ83UW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F9D20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90E2184DFF;
	Wed,  8 Jan 2020 15:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3mRPy4k0gUT; Wed,  8 Jan 2020 15:05:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1174E83F31;
	Wed,  8 Jan 2020 15:05:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F29BBC1D81;
	Wed,  8 Jan 2020 15:05:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4819C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C2CD420116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 15:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg7E2qNlUsUp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 15:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 048701FEAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 15:05:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w62so1764899pfw.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jan 2020 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUwJ27XEFpUuBXgMRS/BEIIAe4hyJ5l1iuWvozEVZ6U=;
 b=dPuQ83UWydIqsWeSchcRRy05lexLKAJQxOaDOmHV67/vUo0qZgjPZ3zkI0Hkp51WFT
 t6kLq+i+ylXpJY5sfrKHpZ5yvjGlnxShRumYMajf/k4l9Se+q2YESIUC3sKccpdmWvKm
 Pr4nYzAPFxQy1uRWfAt+2aOI9CSDsQ7um6YgQMcbTocGLJDRx/c2aZr4AnKpEBiD5LpJ
 vkVgoamKZFGJYTRcSj2Wevl3so+oGQIh3Us5DSxTbdYSEG0EGReojSNbDgVVegT0SlJ+
 6I4W26tpHiKDnr+SavNPD69Wk5Gshy1FYO8xpgaHMmdEOxvBFVONuXL/rGZFrMIWFXOU
 X+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUwJ27XEFpUuBXgMRS/BEIIAe4hyJ5l1iuWvozEVZ6U=;
 b=ozWMU1PwdxMdKozeZPA389VsbU2s7oboOty8l9JgdHpWwHfB47dwfYUE0ZbEqo0ieu
 0QaE2pG78LnSQYRZxw3hsN3aSfcXS8tsGtG+qINxHDGkkqGL0fWJ2ZC01MV2RDtzQaOU
 iXER8yOPuDYVl5LBbkGEZahnp7PzmLzyqp2dabwUh6PCc1lp82OfhYKZE/GBNMmIWWDi
 DJ86I83mzoptBsjF7ZZcfrXBrclgwhaDZMsbnwBetxV1hUubgxfaZ7e7U8KZFYUB9vhS
 P5l+BxSeKWb34dx4CMJdPzN7Y0iu5gFSrEZGj6Oi3XHKPG+ez6QIRppi+pxJN4SbXBTI
 5eFA==
X-Gm-Message-State: APjAAAUlm7/nxSyExteEsckOP4fEOM0JTMnqRX9jduGniVrOQLjyI2kX
 8MpJ6QIeCJM+GFvlWSPWIiA=
X-Google-Smtp-Source: APXvYqykSMYgSd5K55qxQI3Y4D6Yabu9lKEy+aBE8e00zyETqHIkaJFZ4yTSW55KznAU4ue8BJgf5Q==
X-Received: by 2002:a63:d108:: with SMTP id k8mr5567009pgg.434.1578495955555; 
 Wed, 08 Jan 2020 07:05:55 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166c:23ca:1508:1c17:9fe8:b5e0])
 by smtp.gmail.com with ESMTPSA id 3sm149584pjg.27.2020.01.08.07.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:05:55 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jan 2020 20:35:18 +0530
Message-Id: <20200108150518.6241-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_c: Handle case of annotation
	in function proto/def
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

[const_vol] <type> [ptr] <annotation> <identifier> <open_par>

The lookahead function in Parsing_hacks would mislabel <annotation> as a
CppDirective, causing pretty printing errors.

Add a case in the lookahead function for handling this case.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 43421647..3f031f21 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -2066,6 +2066,20 @@ let lookahead2 ~pass next before =
 	&& is_type type_ ->
 	  TCommentCpp (Token_c.CppDirective, i1)
 
+        (* tt xx yy ( : xx is an annot *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TOPar _::_, seen::_)
+    when LP.current_context () = LP.InTopLevel
+	&& (is_struct_enum before || is_type seen)
+	&& s ==~ regexp_annot ->
+	  TCommentCpp (Token_c.CppMacro, i1)
+
+        (* tt * xx yy ( : xx is an annot *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::TOPar _::_, ptr)
+    when LP.current_context () = LP.InTopLevel
+	&& pointer ptr
+	&& s ==~ regexp_annot ->
+	  TCommentCpp (Token_c.CppMacro, i1)
+
 	(* tt xx yy; : yy is an annot *)
   | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::type_::rest)
     when (is_struct_enum (type_::rest)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
