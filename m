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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B28C83009
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CB720730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCnh/lmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CB720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D7788829F;
	Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09kogFd2GFWK; Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AD4D8625C;
	Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35D61C0864;
	Tue, 28 Apr 2020 17:03:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD483C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB2EB875CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4puQQe8axN05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 48660875A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 145so10952092pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HxfcmDQC1LTYn8Ag4N3xUOyxSJuA9YRm6z4xlq/lwc=;
 b=PCnh/lmIw2ta4I5quFCFtypY4vnIKNrwuafSvnc7rghVziBxwtMbZGiQYlOWpCFLtb
 FwpCKhFMMN1iDE7IsUoinx0WjxGebPN/3zTHCgC1ln1VOp06715CH+TL9o7syTjdRKBc
 FMUHW+/aBbz8GrhyOK2qBuslHOH6bI+TlqIRKvLE7ztS70RjrYtVMhaNMRV65IrN4/VT
 fgrdUEiMcHiM/X5YSI2gZdAF+JaMXpSysC6dhSbelLromaENUALLe3WAH6pSa/wjylaD
 q34LvWfC6AXg+claQglAYiPwh/FKH8FqOc5UOJ1haI0QBgkLo7RMhW8CDEgt27NWe/73
 +4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HxfcmDQC1LTYn8Ag4N3xUOyxSJuA9YRm6z4xlq/lwc=;
 b=VojzD6nkkBAUotmA/8x9BUgCmO9P6/bLbayYdhUMgw0rxmSnvQMjPDSi/2m+p127Vi
 xZzgilQXqJdJr0sulsv8KbcH4EzLSQBGgQndIbCIItXDhdemX4+D7onzEOqbE6iIauzY
 yZz8f8x4d96NMWFk/hjS3Bu2oapAvYSP9ZvI4kVtsz2bRTlT9JOedM1u+1r12GBb0cjr
 netvIu9Sr0XKiPFSDqHVwpIsvamE9HUf9Xa0vrbH52MRBVz8M8aeo4l1DAgR9UCrNizX
 WFpbMmKTo0uMQ6NpYtth1W0iSnDXiJGgB8A+fcsgwA9+8ZIYwex6NB72dYDNuWYm8rwZ
 oong==
X-Gm-Message-State: AGi0Pub7zbHpkr7xh7f4SvMiYDcqfPLAli1HtY0dh3bEUviMXTgL9Lvw
 nDWMo5YZZfAidiYYEETeu/0=
X-Google-Smtp-Source: APiQypJQjSqqCmv95DKjdM4eyjEkHFjrnwmQXA/wMT1DHKg/KK+wb08zAy+rqQL3gkfpNJXXl/D9Dw==
X-Received: by 2002:aa7:9ae5:: with SMTP id y5mr30456404pfp.294.1588093398875; 
 Tue, 28 Apr 2020 10:03:18 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:05 +0530
Message-Id: <20200428170228.7002-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/32] parsing_cocci: arity: Reflect
	Cast attributes
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
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 8ee6d33f..880cd7a3 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -254,13 +254,14 @@ let rec top_expression opt_allowed tgt expr =
       let ar = mcode ar in
       let field = ident false arity field in
       make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let arity = exp_same (mcode2line lp) [mcode2arity lp;mcode2arity rp] in
       let lp = mcode lp in
       let ty = typeC arity ty in
+      let attr = List.map mcode attr in
       let rp = mcode rp in
       let exp = expression arity exp in
-      make_exp expr tgt arity (Ast0.Cast(lp,ty,rp,exp))
+      make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
   | Ast0.SizeOfExpr(szf,exp) ->
       let arity = exp_same (mcode2line szf) [mcode2arity szf] in
       let szf = mcode szf in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
