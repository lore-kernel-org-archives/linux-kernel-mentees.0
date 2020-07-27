Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B2DC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:55:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F50420775
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzW94luz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F50420775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7AA442036D;
	Mon, 27 Jul 2020 05:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmd+dUcAOwQ2; Mon, 27 Jul 2020 05:55:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0DAFD20033;
	Mon, 27 Jul 2020 05:55:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E063DC004F;
	Mon, 27 Jul 2020 05:55:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D43A3C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B4AFB2034A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNp+wlZQmDb0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:55:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1580B20033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:55:09 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o1so7429920plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGWIuwdMtZTOoSuQVQNMVyQoWTT0FqCbci1iZWDfg0M=;
 b=UzW94luzogN6pC/WqmPCe6pTi0gXeDLxDYtbOREVgfv2qU1vZXgrym3s0gQCgP7RiU
 WQOgk8TygKmMOeume2UzuyCpgZU9POlW7yBv3uI8iyADDySGs/Ud2d0NRSrJZDbCrSfA
 cOovf7gnz1OUJdm/VD9lNBbLYev0xReMlGEBJIPFQmxMSXtdMwVErxUuS7aswEYRGL8P
 L6SoLMzmGGEjSSSmwm0AmmFvvwIfsQ8TgCNHmods9nP8upC/xpxPwyT0MLhkcVECH4+i
 gZw06lNQuDgbhMyddIlcP0EPDip8prlTGoXJxgv9WqJ29OdYi6EAzNase+t3dNQ21V3i
 xvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGWIuwdMtZTOoSuQVQNMVyQoWTT0FqCbci1iZWDfg0M=;
 b=OT5kQu4aOIitB/HMfVCCZZpm2vgqszTcAnYADYQKaNPT6mFrd4jOEyBZs5ElvxxCUr
 mnh03kCCuGCfaofLDHNR8x0h4fWZcP1MmuMDMSrVUrAdh2sOVKIZZGfi73RT/KmVBP7q
 BOz4xWL+xcb4oQut8rCmdO87Op1NTfvCHZTyvJoGpsz6fSERMhK8R4k61wNMYBmy1M+p
 KoLTnt3KyAGtDx+piF/XJLNWsTjMPAqpNe06FNTe0JJrJX3WqYyMXcIJsR+TK8OU91K6
 DfnBQM/3QgzZadEbEdQpP8X8DpbD0FCntcPuiXW6xzeXvpKsBm9D/cyZJPveaagSn4kx
 pkKg==
X-Gm-Message-State: AOAM530uplp0zTd8KURte+pYdgoIm4AL8kEmJbDrQncdYYAEV67iUwzr
 wyCL9oEQ8jXdUYGGvCfOoT0=
X-Google-Smtp-Source: ABdhPJzpFgyP85X6QUFCCcMPTOfE1m7wfVo50jr6xHpIfgrEzvpcD9QbbHK0XoP/ebdGWCda0uo3uA==
X-Received: by 2002:a17:902:c38b:: with SMTP id
 g11mr17252373plg.340.1595829308671; 
 Sun, 26 Jul 2020 22:55:08 -0700 (PDT)
Received: from endurance.iB-W4G311N.setup.in ([59.95.38.168])
 by smtp.googlemail.com with ESMTPSA id y68sm920158pfy.185.2020.07.26.22.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 22:55:07 -0700 (PDT)
From: Nachiket Naganure <nachiketun8@gmail.com>
To: apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org
Date: Mon, 27 Jul 2020 11:24:58 +0530
Message-Id: <20200727055458.559558-1-nachiketun8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: nachiketun8@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: disable commit log
	length check warning for signature tag
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

Disable commit log length check in case of signature tag. If the commit
log line has valid signature tags such as "Reported-and-tested-by" with
more than 75 characters, suppress the long length warning.

For instance in commit ac854131d984 ("USB: core: Fix misleading driver bug
report"), the corresponding patch contains a "Reported by" tag line which
exceeds 75 chars. And there is no valid way to shorten the length.

Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 197436b20288..46237e9e0550 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2806,6 +2806,8 @@ sub process {
 					# filename then :
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
+		      $line =~ /$signature_tags/ ||
+					# Check for signature_tags
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
