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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A57C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8362074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjpITujX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8362074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D110988473;
	Fri, 29 May 2020 12:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WYjgwfbUoaZ; Fri, 29 May 2020 12:08:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0864F883D3;
	Fri, 29 May 2020 12:08:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBBA1C07FF;
	Fri, 29 May 2020 12:08:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E06FCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF6D5893C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfTISxudoemu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 75DE8893BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:44 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 64so1082911pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1DE9vhHxJKqoZomKSzZvcW1hnN0FrGvk327V6ywbng8=;
 b=fjpITujXwWbFbkd1l8x3i13mzj1wgLtmHFLz8YgXNP0G91d2a8cHSFtQ9F6P11Dtv9
 /mgxiJAaHPuY9CqyRM60R3A8d2UZ8AEK0pOAPRCgl7MBeZskCTtGUvmcFap0eQqVk9c8
 pIrGvAdwjsfjXG5JGUUvBrNVnfbcPI58kBIUPooMcTsYBJUSAkJdbMPfJK62+glx6sek
 b02MZMp2y2Xqe8sL5ZAWarSdNUl2AipsicDfTD8eQbrvxVhigzHgDgEk90bBHeH4BmrI
 O9SzevhiVl7CrLiYIHrIhN1VsWpWl3C1sZEujFw3UtODYSzYh+qR9KDdIS2PzuuM59Ho
 e1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1DE9vhHxJKqoZomKSzZvcW1hnN0FrGvk327V6ywbng8=;
 b=HttwAQwwHW5BAjGukvQWoUn+ugK3a88ycmQPC87J4/GwVgXLy7JoULZFZcmXvGid6L
 cynY/PN7XkHXWfQdbYctG1SdxqrkKCcYe2+sUc4DF8tjdwyOLZLwna130rlQ42iKPdBJ
 oIuwEec7HdfT5SshhTHp7swiUmRvE8MTURUgpgbJ5mIh93HKTCYNnJ/H4F2VND8yQyvH
 +LlWx4EJKqA/tWqWRT49KewKE2m5SFAoOnKszRKpOVc4vPxsFBXJmxMoD2bzhfGM7B/y
 HS/ggJ5ee0vSitdHLrM7QmYoN3OPCrzl5rkbDLjNG39b6p8J7uDBEj5U5qQ5oqVkkes7
 ITog==
X-Gm-Message-State: AOAM532Qg0WdYzNgrOh+X2c4wNNdrdU3F6O2kbGidM/0jjAsVxC3g5nb
 sSkffuqzkJXYKdehZKjAeQg=
X-Google-Smtp-Source: ABdhPJyzeSXJ+5aYQk3u4yEUYaTnt70LgC6Uq8xYsUSsLdHP1t1z0j4fSuyZBfAnNCkfrUkcZeb2Vg==
X-Received: by 2002:aa7:9052:: with SMTP id n18mr4311720pfo.319.1590754124041; 
 Fri, 29 May 2020 05:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:43 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:36 +0530
Message-Id: <20200529120703.31145-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 06/32] parsing_cocci: index:
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
index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index 0952c1a1..86d9c0bf 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -61,7 +61,7 @@ let expression e =
   | Ast0.ArrayAccess(exp1,lb,exp2,rb) -> [27]
   | Ast0.RecordAccess(exp,pt,field) -> [28]
   | Ast0.RecordPtAccess(exp,ar,field) -> [29]
-  | Ast0.Cast(lp,ty,rp,exp) -> [30]
+  | Ast0.Cast(lp,ty,attr,rp,exp) -> [30]
   | Ast0.SizeOfExpr(szf,exp) -> [98] (* added after *)
   | Ast0.SizeOfType(szf,lp,ty,rp) -> [99] (* added after *)
   | Ast0.TypeExp(ty) -> [123] (* added after *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
