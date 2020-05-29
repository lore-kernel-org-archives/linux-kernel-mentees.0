Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000AC2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZdQYIK1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000AC2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B4BE920410;
	Fri, 29 May 2020 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kV4OvEHMWf0e; Fri, 29 May 2020 12:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9305C220A2;
	Fri, 29 May 2020 12:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CA58C07FF;
	Fri, 29 May 2020 12:09:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08BF3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E661C25D72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLJIf1kBUuZN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 704CC220A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:59 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w20so1404120pga.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cpg5XFXC/HQO82XvoKtnC91SCX9ljDeFNodUPxNe4tw=;
 b=lZdQYIK1cKhaLdhcwdI1k1D/5XUZdEWpfy8kY3vtnbaWdEkC6TIqV2rNEJ0zfqkesM
 dZLZwuDRSvHcsAc4P92Ihx9QbaXkfx7WyLHxWjWHMJvb5rgJewVMkwJHWw5nd3kslHed
 UPAF7WG5dY0A+i7H+Z7Az8F/hygVFOK8B6y2sQ803IlWYgBHFcPGQfyvZp5WQaMnYg0N
 36ONKDVXigwajucfIC3tf5kzdMpp4//0vjfjk/ki+d8Scklb/YbFk5wuRZ05xA3omNvB
 AaGiEuda36+lbyAFUGp0pGtByvYe+66C4EJZkUQPtcv9XFy7hFF8AlmQuxv3XO2Le+dX
 kIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cpg5XFXC/HQO82XvoKtnC91SCX9ljDeFNodUPxNe4tw=;
 b=YBn3gjinAV7b8sH/qkxjwejncxb3t4oNlEEdUCfasEBQxSMnctUO1JnjheRg93EFob
 jkq7v6gFi2kASSBrpOMU7OKuUYXP7Gmoo5oC+XRZND5xj1wOvFevD1VKHib0G5DTJwTY
 N3FEh1ztgv/lkTjNnoqPCn00Qvg9i83iB39Rn3vALEISjg3fDa0tPMlO2a2UFotXQEk7
 Sjpy+8yQIowfAEvZDFaVHJbaRGYu9DZFbzaMUCEUWeXtw0o5JxGgK3UVAJ5b8DLDIzvO
 Vs5GTu+jOvFYJHx65OUa9yGJf09tAUQBDOVYf6cFqRnoG31OnlRtSQa1ni+5Ma8v7Q6h
 2hgQ==
X-Gm-Message-State: AOAM532HK/6WN/1O6Q/l/0IPjvt/0J0GIfIUaB0NAc2uFVAfuzj/JN02
 nqLYIsBSIl30PadBrti0F/8=
X-Google-Smtp-Source: ABdhPJxEZhwo1GscAc8LPwTDkIT4nCa6M025kaV16rFjo5ItaEm0cAx+mvH0hW1vvwhkBa3YT3falQ==
X-Received: by 2002:a63:63c4:: with SMTP id x187mr6290234pgb.112.1590754138992; 
 Fri, 29 May 2020 05:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:40 +0530
Message-Id: <20200529120703.31145-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 10/32] parsing_cocci: check_meta:
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
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 0e7e04e5..9cbb79c5 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -172,7 +172,8 @@ let rec expression context old_metas table minus e =
   | Ast0.RecordPtAccess(exp,ar,field) ->
       expression ID old_metas table minus exp;
       ident FIELD old_metas table minus field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
+      (* No meta attribute yet *)
       typeC old_metas table minus ty; expression ID old_metas table minus exp
   | Ast0.SizeOfExpr(szf,exp) -> expression ID old_metas table minus exp
   | Ast0.SizeOfType(szf,lp,ty,rp) -> typeC old_metas table minus ty
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
