Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D40C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE094206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSWFN84T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE094206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A352684AAE;
	Sun, 31 May 2020 15:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqJVf6nad8uK; Sun, 31 May 2020 15:27:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5186C85D8F;
	Sun, 31 May 2020 15:27:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FEB2C0863;
	Sun, 31 May 2020 15:27:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B544C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67E7B86B55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VOIw7DqCyyZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A83786ADD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:39 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q9so3798358pjm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L99YIbczK8ww6izwOowhRAEm6cO+5mBUJvpTwe6i4g=;
 b=mSWFN84TLxSdkskZ4cZ56blCcGnFkEFHzLH0Osr2U4ee62aU7bOF5Iq9iqCTUW56kA
 N0MQz9nOnaVwDXL623dpkjW9QyjQswAiUeJW9u67cmWSxWlZcbxhKNyNWswXtrzCHt/E
 SoZPU9B8IXVAfp9jHDyWfLLYhEOlSZ1R5qeDHyTILLpBKa7yiEKf+iMyTaGl0IIQwDOL
 55rmpE7qcqVLYzmBWt6+P8ynqjD9EfKMT48rNjepfcWm66lF59Bf0qn7xoP2HxS3csot
 Zu+t380Yjxfz8yuk+cvdht7LsDu+9mieO5eLCacYxcZNs9yXzUqd6R/Lg63/Tb/dKeJo
 r7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6L99YIbczK8ww6izwOowhRAEm6cO+5mBUJvpTwe6i4g=;
 b=hbFh1pceM4WqsNy5VmXdCBiMWZgdVcgFYCAjc+2bAiU7sATCHKrZARrv1GfILt67/f
 /bMb6oywwXEoT440FKBmDDEJTW/HND7s+9cuH3ypITxMD+gCaSh6bVCzrNS8WK4Wbfq6
 VzJjcM54k9u4xtAxPtJZGNMQeKFcNj6mtLk5EdCnI4Ks+3rt61kVkqwwdcbh+I+l66EQ
 CAgBPsMZQFXkAz+CUlM+cOy9F4sB105Z0yOPPVHyyxActv4HujW8Y8/ESaY7TFX39C4L
 Kq4vVk6hzm5eqQzlPqxZXD1QHOU4nG5CZ94rGcYqUIc0Irc6KpJFaBIpXL7WJeroTLD+
 tHiQ==
X-Gm-Message-State: AOAM533kI5EOHiPO+h5eVx/Df207RfjZHXZog3nKZ4CEDcVZUrXmjSI6
 yO+0+VCYGljXm5DqSghdn6240veg
X-Google-Smtp-Source: ABdhPJyH54IqKpZ1VmC7ag4Nco1E6y0VSCwoOG9vhJ6FaUZS0/bqMuE2KOZTLxIUSme3vcfkDx7ylg==
X-Received: by 2002:a17:90b:1002:: with SMTP id
 gm2mr19282084pjb.197.1590938858691; 
 Sun, 31 May 2020 08:27:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:38 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:05 +0530
Message-Id: <20200531152621.2886-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/27] parsing_cocci: context_neg:
	Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index 5354bb3e..41bc621f 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -763,7 +763,8 @@ let equal_declaration d1 d2 =
        equal_option stg1 stg2 &&
        equal_mcode lp1 lp2 && equal_mcode rp1 rp2 && equal_mcode eq1 eq2
 	 && equal_mcode sem1 sem2
-  | (Ast0.TyDecl(_,sem1),Ast0.TyDecl(_,sem2)) -> equal_mcode sem1 sem2
+  | (Ast0.TyDecl(_,attr1,sem1),Ast0.TyDecl(_,attr2,sem2)) ->
+       List.for_all2 equal_mcode attr1 attr2 && equal_mcode sem1 sem2
   | (Ast0.OptDecl(_),Ast0.OptDecl(_)) -> true
   | (Ast0.DisjDecl(starter1,_,mids1,ender1),
      Ast0.DisjDecl(starter2,_,mids2,ender2))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
