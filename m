Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29922C3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED17C20873
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVYR9gRX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED17C20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99950873E3;
	Tue,  3 Mar 2020 05:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfPY13PAlRD1; Tue,  3 Mar 2020 05:03:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EFAF28750A;
	Tue,  3 Mar 2020 05:03:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6945C07FE;
	Tue,  3 Mar 2020 05:03:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7C3BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A78D9203AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xrS+G6Cviob
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by silver.osuosl.org (Postfix) with ESMTPS id 29C18204DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id d7so788643pjw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 21:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N/iUS9xlwhnRwn8ycV3kyYeyWXGgYeSILX+l2MBUv2c=;
 b=pVYR9gRXdunMZ2xCOqSGRxL/S4cyc6o/in4nF/Kqz47Oe1Yv4+C22w0qIDZXbMDgMr
 QmFda8Vv0CRHHgeYaDJWwLw2EmOBncDN0JV69c/iErEUpRhLfU6sf5QbJCKAFozqnb2x
 N7WRrlQExOYxIlPmNDdCMVKfLP8lh9x5sSxDFLDStVNjLPOM9ZkSo7AIpcwSnyhrEiuV
 0hQ7NTBkCLbt9FA6AaUGVjpx+jbLkn7/sGe/Kus9lHXajgBHSCBSGhRl/xIAPncgxj5d
 sCufOxY7WmTEO7Spb9MwKPa6K2alHw2uOEaL+7jtoHd5WOoRaZNah3+m4WAdQHfeEFuE
 CgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N/iUS9xlwhnRwn8ycV3kyYeyWXGgYeSILX+l2MBUv2c=;
 b=NR8RryBpALRSiHEkLyS5ymy6JP452RKpLiG+XE0UzZfGLQSE8YX1RhcTOqkgyNh8e0
 vZ1Z6BKC3Zzul65zygVtCYXYOGN7YkiO9R405uMct4hRyLGrO0YUtpXXasiUttFBVegb
 CVNWs8aNDtdQRK8paZNiYtHjCEOYs3QaPH1WVXW5TdvPEk7lPbzeAqQ+YNLNCDOkeed+
 FkJlS8LQhLxPcrk+oJpexifhpIn4vEyaLaTF3EDrDrEtX4hICsRONoW+Ps7icQ0CF2Gw
 1GiTduelbhVLCtBBMW8sMNTSLK3vZi/WGKhL0D1PSM8jz61cC4kbZuPGnqdTyYftr6Mw
 C2Cg==
X-Gm-Message-State: ANhLgQ1GmMwLiUpwqbBID8NLiPivNuTsKzaGz8AU/STShPNfP5QNWDYc
 cF4bonODKkUyG5TXyFxxuEs=
X-Google-Smtp-Source: ADFU+vsStuckLpVn2CMO8otbm7LSh6nbqTchYUDl9xj5VPs6RCRr+PtrOezcRY96gHAGgqMRWvC5hw==
X-Received: by 2002:a17:90a:678e:: with SMTP id
 o14mr2235635pjj.24.1583211809750; 
 Mon, 02 Mar 2020 21:03:29 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c8aa:e481:f8d3:6de2:77f9:5602])
 by smtp.gmail.com with ESMTPSA id b2sm780446pjc.40.2020.03.02.21.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 21:03:29 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 10:33:01 +0530
Message-Id: <20200303050301.5412-3-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303050301.5412-1-pragat.pandya@gmail.com>
References: <20200302114300.34875f69@lwn.net>
 <20200303050301.5412-1-pragat.pandya@gmail.com>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 2/2] Documentation: Add
	io_ordering.rst to driver-api manual
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add io_ordering.rst under Documentation/driver-api and reference it from
the Sphinx TOC Tree present in Documentation/driver-api/index.rst

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 Documentation/driver-api/index.rst                            | 1 +
 Documentation/{io_ordering.txt => driver-api/io_ordering.rst} | 0
 2 files changed, 1 insertion(+)
 rename Documentation/{io_ordering.txt => driver-api/io_ordering.rst} (100%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index e9da95004632..9335412e3832 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -80,6 +80,7 @@ available subsections can be seen below.
    isa
    isapnp
    io-mapping
+   io_ordering
    generic-counter
    lightnvm-pblk
    memory-devices/index
diff --git a/Documentation/io_ordering.txt b/Documentation/driver-api/io_ordering.rst
similarity index 100%
rename from Documentation/io_ordering.txt
rename to Documentation/driver-api/io_ordering.rst
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
