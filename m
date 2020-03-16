Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48926C18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C06020724
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdIXojF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C06020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EE11727BB6;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8V0UYtXK6Lx; Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC6F628ECC;
	Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA523C1D7C;
	Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 215E4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4FE5528EC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OatmIT5Yj17h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id E7D4027F2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z5so9650622pfn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OV/gLGY/NmJycahJnWnGTZEGnDcl13EtNi5n5P7gq2I=;
 b=LdIXojF4AEBLwrKSe93EZWDWVYYpZQyOuighxeDAClAz3875iNebFlJySGd70hNxHA
 Xs7WwFPdSwmXPrjd/vv99iKk9/xUjWpTUFNBuRyqOSMSpggE29EDjIamSuQyZkxY0fAN
 Tj3/X6t7lKAmITa4gN5oxEP3J9FIoby9Rr/mLTcYJrIlXCXA/53Hckix7/ffyY2u5zl+
 eAdKvWDoZz+x9DjJ/JVfY8nySi06KLSyI7qVtrM4oNu0I2Lht2OwC/hRJZbtPQbPRwL4
 K7b9k3lT42mrGkVh5majpe6ltHFgSUZc63asSjcMhoDH0UD4Ein4LsXqJhLux4Wi8kBY
 aQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OV/gLGY/NmJycahJnWnGTZEGnDcl13EtNi5n5P7gq2I=;
 b=rBAeNnhOv6EaB3tbhEbs0LSd0mSbVSEWGADSc59+LNxvs79zqMN7FMF/J8l60ijVdr
 NknnAKb0thOneUJVjeorCL2qx8f6hweG+U0DQsm0KbQevaFVYB7jy4fKNqpE7jkzKNFs
 bgyL1eT0nklUabWDqthDus2VqBja2PgD5HZrcjdrzJdJ5kA3m5K0JTooLAufuYt7ZX8R
 9Dr9VeseyU+l+FsAvxvwAEaW11TFkyZjf8o7jtxBLqrRfNt9Lv3F3eV9CHpnMUxNli/1
 NTfrR1IH7bqKAqSUZ4q6bT/MY2M6he0Bh2i8GNQZVzVfiY1iHl0msm4QIw7tJj0a2s9y
 CNxw==
X-Gm-Message-State: ANhLgQ0++t0Qe5xWaLRgqCucv1ZZe8KoRFOKv9MBqEp1edAAaG6esgZw
 c1XzK2tigyC7LZjoBMIYfYY=
X-Google-Smtp-Source: ADFU+vuN/4QeJpwFXrMRTXdG+rQ3zXWdlfjwiqpQ3hI8HLFII+BXHQKXrEJXNoVtxZzmlFT9UCr3YQ==
X-Received: by 2002:a63:215a:: with SMTP id s26mr26646837pgm.339.1584353032489; 
 Mon, 16 Mar 2020 03:03:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:52 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:32:59 +0530
Message-Id: <20200316100319.27935-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/26] parsing_cocci: arity: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are added to the SmPL ASTs. Add
cases for these types in arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index f29b86eb..3b408554 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -419,6 +419,23 @@ and top_typeC tgt opt_allowed typ =
       let params = parameter_list tgt params in
       make_typeC typ tgt arity
 	(Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
+  | Ast0.ParenType(lp,ty,rp) ->
+      let arity =
+        all_same opt_allowed tgt (mcode2line lp)
+        [mcode2arity lp; mcode2arity rp] in
+      let lp = mcode lp in
+      let ty = typeC arity ty in
+      let rp = mcode rp in
+      make_typeC typ tgt arity (Ast0.ParenType(lp,ty,rp))
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      let arity =
+        all_same opt_allowed tgt (mcode2line lp)
+        [mcode2arity lp; mcode2arity rp] in
+      let ty = typeC arity ty in
+      let lp = mcode lp in
+      let params = parameter_list tgt params in
+      let rp = mcode rp in
+      make_typeC typ tgt arity (Ast0.FunctionType(ty,lp,params,rp))
   | Ast0.Array(ty,lb,size,rb) ->
       let arity =
 	all_same opt_allowed tgt (mcode2line lb)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
