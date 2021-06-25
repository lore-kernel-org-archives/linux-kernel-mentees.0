Return-Path: <SRS0=pv0Q=LT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840FAC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 22:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A4061952
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 22:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A4061952
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6BA605E0;
	Fri, 25 Jun 2021 22:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqpf3bdVG9Wb; Fri, 25 Jun 2021 22:33:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E3534605DD;
	Fri, 25 Jun 2021 22:33:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCADEC0010;
	Fri, 25 Jun 2021 22:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CB04C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 22:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3540B83716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 22:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpmt0AapZGJh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 22:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07C9283705
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 22:33:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a15so11004808lfr.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
 b=XxeooSIoZSkGhXTTLzsaf8YXlV0sKShLzgUbVXnUr+3uwjIxtVEAvtn/nLYxqjjS+E
 645gOFtwDu27Q2bAAHc1zQcxXFbXxzSxfIZhsikD9NAkQtowjvqVchR1yrMRrcr3yaGc
 oG89m+lOmnnzs6JW0urF1QbP5OqI5hZg/9Jnz9Zs7O8csPTsI0+1T/sF8vRN4F34ulaO
 jN0E5IiFX+v3fHdTikeXUT+tPYBiENiOPFZ5MEntFVJJ1mx9Fin/wN/atCa6UNVG1s34
 HbD7SNrvdHKSxq1DP43W6eGaSw8NRSBhDXqdrJpu6uhntRQPxAqupsG5Ep8oRmof/4P4
 qiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
 b=TluG7EmaNx0I0ommx6+eyW6xAkcnHy5/N7i3Pd2S+MXtKSku0OqkNsLM3bqJCZTa05
 ac4J1QKvpVmIwmueRAKG5T50MRFHiNw+yuhwztoah9avJeSHG4AKEzdOmrhLYUR+P8cB
 SFkBYqMlX1UEQRq/wmnwVCHNlMHPz9P610OtshxycfLqMTg5h43JdTK0E45tw3lAGKK6
 lPJtldKaxF4xoVrj52WmFNRCwYU4bwx2+PBwmXvKx0+1Xi0cizDgn9USfPadxVrhElkz
 tDbOOG0lhm/i/1UEGiEviERW/vgXNPDRY2mqgKHqYFSo6D3uXoAQmohZpOPKzhsXdI1+
 eQvw==
X-Gm-Message-State: AOAM5319Kb4R+JaDaoQ0nJtQurwTaNPDYWGgvkoYPoDnbjzRyQGS8Ho2
 D8A+kBMdh5l2RUwEaMKmCa0=
X-Google-Smtp-Source: ABdhPJxw0w49mOJH8eZ2E+fmYpRltbdOf6mNxIn28I5KywQCjMRXPg6FGSFpgOtx0JdQRn+GFIukdA==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr9344466lfh.164.1624660420338; 
 Fri, 25 Jun 2021 15:33:40 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id p26sm707610ljn.94.2021.06.25.15.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 15:33:39 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gustavoars@kernel.org,
	sam@ravnborg.org,
	tomi.valkeinen@ti.com
Subject: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Date: Sat, 26 Jun 2021 01:33:23 +0300
Message-Id: <20210625223323.13930-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

In case of allocation failures, all code paths was jumping
to this code:

err:
	kfree(fbi);
	kfree(var);
	kfree(fbops);

	return r;

Since all 3 pointers placed on stack and don't initialized, they
will be filled with some random values, which leads to
deferencing random pointers in kfree(). Fix it by rewriting
error handling path.

Fixes: 897044e99e43 ("OMAP: DSS2: OMAPFB: Reduce stack usage")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../video/fbdev/omap2/omapfb/omapfb-main.c    | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index a3decc7fadde..6a302138ebeb 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -2025,21 +2025,19 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	fbops = NULL;
 
 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
-	if (fbi == NULL) {
-		r = -ENOMEM;
-		goto err;
-	}
+	if (fbi == NULL)
+		return -ENOMEM;
 
 	var = kzalloc(sizeof(*var), GFP_KERNEL);
 	if (var == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_var;
 	}
 
 	fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
 	if (fbops == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_fbops;
 	}
 
 	fbi->fbops = fbops;
@@ -2047,7 +2045,7 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	r = fb_find_mode(var, fbi, mode_str, NULL, 0, NULL, 24);
 	if (r == 0) {
 		r = -EINVAL;
-		goto err;
+		goto err_find;
 	}
 
 	if (display->driver->get_timings) {
@@ -2088,11 +2086,12 @@ static int omapfb_mode_to_timings(const char *mode_str,
 
 	r = 0;
 
-err:
-	kfree(fbi);
-	kfree(var);
+err_find:
 	kfree(fbops);
-
+err_fbops:
+	kfree(var);
+err_var:
+	kfree(fbi);
 	return r;
 }
 
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
