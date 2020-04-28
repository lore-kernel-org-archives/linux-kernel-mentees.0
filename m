Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA744C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3FB205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGnQcBwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3FB205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D7D1843BD;
	Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIYgTcIXAwh6; Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1ACB681279;
	Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17BE6C0864;
	Tue, 28 Apr 2020 17:03:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12BBBC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 001DA8828C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Iu8o7XIAVBy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADE938827C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x26so10634994pgc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q9ypuI2Md0mVYC2/fR1d5UCBTOm19QzTtQ7LOldzd/4=;
 b=sGnQcBwj0+KWdi3/t43j3icLp5UtL4LzlrApg+HHE+KsfkZ9L6CvqNVabhgxyCy/Gc
 cnVJbKCpvMkjZfPNPA1Md7CMVSEgyU8k1kW8geRQd8hC/ibWlFf9MNKXFM29pV4C3hp8
 3VciX5SDw4vqTa+xIdy/XvE43j4WnGREY4gAU++KmoN8Vl2fJCZOJ3U0ylrGx6Du0ntC
 aSJ+wWsYR5rX2KVWmrvpTzw8C+66enrE0bM2EC4fijOn1SSupV6KSUV2mlDlv87UV534
 kjyrIKn6EIYdygETvz9UnC9NDoBLjzD6BxEMUQmB63oPAkREuayKK5LPVBhCqhuHgoe3
 MAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9ypuI2Md0mVYC2/fR1d5UCBTOm19QzTtQ7LOldzd/4=;
 b=VIL0KmtUnPKNxyCvvONvcRiGfHGLOZJKA9vQFaGZ/DlQBTUjx2HDysMxyc6UVVqo42
 cO/68TJ7wD5yfe6Cwu5sFPBIjHrzF0ktBVIKfJwXgoGr3ES8wVpp+VufPvWuspB+njRz
 UiRqBBeEyyr9BvoXGwhE+Vy+Wfa5UV8Wr9VzmGi3Yahc9/KHbh4n6fbn9xT2iS35shd7
 O1n+53fp0D/UirE6UE/avXaWeZL1pj329vOlPFXPag08rXZ1TAWoJIOIarQ15fIb4eA6
 R4g0kYSqeExBIbA9PCCmlcTW3wQCpdVKLrwVsNkoZZllskgJeSaGgSBJL4MIWMMW2lPT
 yNig==
X-Gm-Message-State: AGi0Pub5PKZGzq0iKNymIkV3PimOIFqQ7e93lHZXYzX7QnLMpvO3YQtC
 T7H5u1fx8yYN/q7Vci/2EAI=
X-Google-Smtp-Source: APiQypK3QbMs2Nq/04EQeN1osXxk5PqrNu9YDcoiv+tUFTgay2wdPXeVdMfqymHZKQeMDvCeqMYVmQ==
X-Received: by 2002:a63:cf10:: with SMTP id j16mr28578648pgg.201.1588093431303; 
 Tue, 28 Apr 2020 10:03:51 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:50 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:13 +0530
Message-Id: <20200428170228.7002-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/32] parsing_cocci: ast0toast:
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
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 09c28c06..56f684ee 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -439,9 +439,10 @@ and expression e =
 	Ast.RecordAccess(expression exp,mcode pt,ident field)
     | Ast0.RecordPtAccess(exp,ar,field) ->
 	Ast.RecordPtAccess(expression exp,mcode ar,ident field)
-    | Ast0.Cast(lp,ty,rp,exp) ->
+    | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	let allminus = check_allminus.VT0.combiner_rec_expression e in
-	Ast.Cast(mcode lp,typeC allminus ty,mcode rp,expression exp)
+	let attr = List.map mcode attr in
+	Ast.Cast(mcode lp,typeC allminus ty,attr,mcode rp,expression exp)
     | Ast0.SizeOfExpr(szf,exp) ->
 	Ast.SizeOfExpr(mcode szf,expression exp)
     | Ast0.SizeOfType(szf,lp,ty,rp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
