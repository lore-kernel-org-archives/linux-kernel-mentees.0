Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0467C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:13:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFB120709
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpv7sdWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAFB120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 253FC87543;
	Fri, 20 Nov 2020 10:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Et9f8k-M-S5; Fri, 20 Nov 2020 10:13:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2DCC87506;
	Fri, 20 Nov 2020 10:13:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6293C1825;
	Fri, 20 Nov 2020 10:13:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E921CC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFE8287535
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHKTXeGBVJP1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 43E3787506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:13:06 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b63so7386857pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LojyVjphxIfE3xS+nLoPkEg9ZNGfFOs/PJ+bvOeGzwU=;
 b=gpv7sdWMqbR3qZ9Am3ajAZ+FHei6syYY9ZoPyI9lXPELWVCnxH1bGeTfl/54ykJQ1n
 vosceD0jrRpL5AOFmLhKxkJ05jyd1tepcdalFnPVDTVj9UEDmD93Bk9TaWHo7D0pLFYx
 dhKhBhvflPWl9roYzbGnA8sMA7NsRM52c4AiBwArGtxPXLaE6rJwgxLIsrbD/yrAzfSB
 agS0VZDqupIDIxSXsZfK4V2iRocX7N2ooFpDDGnU0vkrr2ienhXEzb45/u/bMRWbmmz1
 XWSjYX4PHDsaDQ798te3HJH5szPWQyVBLFD/Uxo0lJpv0kTgZ0CV1DWE4l8sTP0rkdum
 GlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LojyVjphxIfE3xS+nLoPkEg9ZNGfFOs/PJ+bvOeGzwU=;
 b=CQM+OOaZPe3qZ1IaOL+GigPb0Wnl5Q7qSOTuCR93+1KB7qJRHJbLN02wCC83y9PA2c
 64EDM4ptqAPCqhi230sLHZP4rv7GYkCzrb4+wP200MUReYoSpZTepJaozbs2fDRwTwkp
 Ssapr2CzLnERNrKiJahJe2pthM3m07jSvBLICnpv7+78uHlhpxZ1ywWdVNu1TTBWgzNz
 KTSo6qw0YC6e3qYu3lXX5aQeRBWz2fspUVeWuOZXBwrTKe4YBt9vAnOUU7GNFCASF1Jz
 mJfal5qPXBTHAqzh+QUe/FMKq2mQ122WkH5ocCj8tz4U7VIbTRNB2NblGii4cxtKg6PG
 Ys9g==
X-Gm-Message-State: AOAM531Sl9nhUmE6FryiRGK7vrIzUmA7S68OTuBUuul06zg+iBFSULW4
 T+KpgnEcDC9PxEYsUbaaWqs=
X-Google-Smtp-Source: ABdhPJxLW45BYHvEsSxR723O/iZyfvcXNxkYpX12cAlOilKK9ssw+9z2XjgZnyRTpbj20xnSfiMS6A==
X-Received: by 2002:aa7:9308:0:b029:18b:3a1b:f46a with SMTP id
 8-20020aa793080000b029018b3a1bf46amr13464429pfj.64.1605867185782; 
 Fri, 20 Nov 2020 02:13:05 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40a:513c:8f5:b466:78ec:c186])
 by smtp.googlemail.com with ESMTPSA id
 z16sm3026408pfq.179.2020.11.20.02.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 02:13:05 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 20 Nov 2020 15:42:54 +0530
Message-Id: <20201120101254.17712-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
References: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] Documentation: MAINTAINERS: add
	information about parse-maintainers.pl
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

parse-maintainers.pl is a script which can be used to automatically
order the contents of MAINTAINERS file in preferred order (i.e.
'MRLSWQBCPTFXNK').

But currently we don't have a documentation on it.

Add documentation regarding the same in MAINTAINERS file.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
the patch applies perfectly on latest next-20201119

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5db753fa1295..7ad00af7acd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -136,6 +136,9 @@ Descriptions of section entries and preferred order
 	      printk, pr_info or pr_err
 	   One regex pattern per line.  Multiple K: lines acceptable.
 
+This order can be generated automatically for you using
+``scripts/parse-maintainers.pl``.
+
 Maintainers List
 ----------------
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
