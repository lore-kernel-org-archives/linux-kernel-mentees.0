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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C9BC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3FD20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHfNLVuU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3FD20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0E2F875EB;
	Tue, 28 Apr 2020 17:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bh78nvV3YaEv; Tue, 28 Apr 2020 17:05:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 866DB875E2;
	Tue, 28 Apr 2020 17:05:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76AACC0864;
	Tue, 28 Apr 2020 17:05:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06553C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 03263875DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSDy9wByA5+F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9E17C84368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:28 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o185so10652643pgo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=PHfNLVuUb1LexSd8MakxPJBFDVmxWAnmBO9h42GPnp3XJxYTwxJFr1xTxRTUPBx8R1
 VpEM/vt4boYEzsKiArDvKIzdSMye76QCjqdwyVZLYQ5o2+Z6brD3LV9TOC2aAeWpO83O
 XsZ/rk8eWHhFdMN3day5PyETooboCcxdN6hNuwaIUWpnl9jzgGE8OSzF8OdENK2hXVzS
 1OMv6HyC01Wt2EX1PK6IC3PsaUm8nSWXrYz3SAgpX2rsU1Cyjb8BHWV4+GO0lmpMvJlM
 mZc0zo7U4w+ugEKxZVJCSiNaTu6XsWX/PO7a8slHoGA7ZlMCAl4DBwtdV6ONBEvbQNse
 ijoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=ImLTx1fmUZOl2IiKKk7XOBZRzpxc3VcxdN8yMIcyWXp7wY/c6vAjM9z1KJxo6yTsDO
 U5sdjhBZ+gguYleT4mNrIwW+9sWaVutJXAsGaqU2qbCPU8zhU4BblodBhh76mzzdr3Wv
 6vzfV1MV1qXw6xyKqfCV4F/c2YHOSgr8uQzw8+UumC5SX1Y/nto3g7B3hMpI46W/a0Zv
 sN20AOrTyyq+wyal/To1C31+++ZXmlsOM9ui+HdXUoaecE2h1E7tisynW6aUUCJL0jFd
 br4XqxhBMcA67faYbECvnceSTPWXnDuPovGmCm+fcIKa5LKp2XZOLor1449fX6Q1Jgwu
 fg3w==
X-Gm-Message-State: AGi0PuYrru2uDzDWGF6HGd9J+/gFIe0aB49OabLNfqOG/I2E7PAJyz64
 j3ke6PhNVApRgPJD4edyh9ggqDMy0Jk=
X-Google-Smtp-Source: APiQypLA61j/GwJXvcuQuAVo/LmvahNT0qtyqis2JhTEZA7pg05jEhuumoxj0K6mcfL7mPpvA+puyw==
X-Received: by 2002:a62:c1c1:: with SMTP id i184mr31850442pfg.18.1588093528183; 
 Tue, 28 Apr 2020 10:05:28 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:27 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:22 +0530
Message-Id: <20200428170228.7002-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 26/32] engine:
	check_exhaustive_pattern: Reflect Cast attributes
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
check_exhaustive_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index 903c32ff..d7785fc7 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -123,7 +123,7 @@ let dumb_astcocci_expr = function
  | A.ArrayAccess (ea1, _, ea2, _) -> ()
  | A.RecordAccess (ea, _, ida) -> ()
  | A.RecordPtAccess (ea, _, ida) -> ()
- | A.Cast (_, typa, _, ea) -> ()
+ | A.Cast (_, typa, attra, _, ea) -> ()
  | A.SizeOfExpr (_, ea) -> ()
  | A.SizeOfType (_, _, typa, _) -> ()
  | A.TypeExp (typa) -> ()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
