Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CAC83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8DA20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbGb5ctz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8DA20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F33F7864C3;
	Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxpxJiltJS_z; Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A43558648E;
	Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 943D1C0864;
	Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 999C6C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 85A438648C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsNFcFQZMl-p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1F6A864EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:27 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s10so8638945plr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=bbGb5ctzyyjnU5zF0n7nik61jW67Nq7rYY7opWEujDztPnaoWJgtN5wL3ip1FLrsJq
 Q0X/FP7PA3V4b5gGk6QNUI/ivRR0jmoh42PkxSfo1AyyXj4gAcHzCmG7Fzd+JGmkUHkx
 ZyapJlWSoSFVYlMsSHqQb32cRlUyWdXFEnMCicHmOG1hw9ka8rHcWDYUE5keiZqqz/li
 dks2iKRWJ5J+wCrr2COh+B5PQzBa6dmz22KfDABSqtOCKLq70PpJTCOuMZ11wtXADwbk
 60rNVQ5cOvLGD2P4tVQhkfxDcRxnqxpziejKtz9GgbTiU+1N5IeDfd1fD8Sm1XUIB32A
 51HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=iDxUzJ/oEOW2fmqkqY01OPZNxevJZsZJGx6I+dYETPVHc/1xbnUy/uPQjyZcQ8Zums
 G5oXHxOaQ40Kf+2Iqfi4QNst3CdTAbrzpqfG4wrJa2WNiIycRcmcjYCIYQGyV30iuj3k
 /q7UvoAEWwtc9sV4p+Cm6Ubs1bg89IkPHFRbj000LOE232BPCi4xs+LRTe+nq1fbSv/t
 R1bb4f8NANblQGZRhUH0D+e4Ppr56IjIk9qp5uYig5ZRXh30NmCrsCvYjUKjKp1yJDOQ
 GcOgNj4MA1lKacznthLhEs/S3YHsYMF/L2tIdS2IpII/IL9msc0s+++qTCLqyoWWojP4
 bX0g==
X-Gm-Message-State: AGi0PubyfgpvcBL59J6+CYzdWnyxIV4qH94TCA3s1vVXn5lo0HsMMw4u
 1A5w42HhETVikmJJheAb7x8=
X-Google-Smtp-Source: APiQypIdQYKGQND0Zg442MpY+WqCPCpNVdXZwF2ItJYbTcyuWCjpG4ggtB2TD4asXLF3ttfmk1h25w==
X-Received: by 2002:a17:902:690b:: with SMTP id
 j11mr30676924plk.236.1588093407275; 
 Tue, 28 Apr 2020 10:03:27 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:26 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:07 +0530
Message-Id: <20200428170228.7002-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/32] parsing_cocci: compute_lines:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 1361d842..e945914b 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -425,11 +425,12 @@ let rec expression e =
       let ar = normal_mcode ar in
       let field = ident field in
       mkres e (Ast0.RecordPtAccess(exp,ar,field)) exp field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let lp = normal_mcode lp in
       let exp = expression exp in
+      let attr = List.map normal_mcode attr in
       let rp = normal_mcode rp in
-      mkres e (Ast0.Cast(lp,typeC ty,rp,exp)) (promote_mcode lp) exp
+      mkres e (Ast0.Cast(lp,typeC ty,attr,rp,exp)) (promote_mcode lp) exp
   | Ast0.SizeOfExpr(szf,exp) ->
       let szf = normal_mcode szf in
       let exp = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
