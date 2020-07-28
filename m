Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D5EC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:29:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DA8205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t7ccvhUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08DA8205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9CCD87A33;
	Tue, 28 Jul 2020 11:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ocr9ERunhkW0; Tue, 28 Jul 2020 11:29:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F00987A11;
	Tue, 28 Jul 2020 11:29:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A298C004F;
	Tue, 28 Jul 2020 11:29:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9695FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84F4987A33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIQ+U2BjZa6b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB9CA87A11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:29:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w2so11704177pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPsJ77H+Gr6KJwODk9E/fy3Cd6Kd23KE/I6e+cqO0VA=;
 b=t7ccvhUSx9eqG/qZIbcxQO4p9eWxukMyS1jxVQaDXgEaMnschPle3EkPBk057Qze2G
 zqO9BzVRhzvK9rYbI4EVPBUXhKUFdW2rDpBodWTFrgbBr7C81Dn2lj/NAcM38dFxPdZy
 gIaifr7Uf3puPbWfRwaG1RfcQ+HV8iYAmCoMGzLFsoXsVoS5LGzOkfh+ycVioIk/21wV
 Q1VwTYX6ke+r4hf96nMTULfaK/we5MC35eoNzgkEoavdwfnvYnRpcGxZnw1IrJgMDcce
 Jdxc+Gp/85IU35043++AfYrjLvPharAQOfTBYBXgtan6+hfAKm/Si5HE10kipukrTkKh
 Ussw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPsJ77H+Gr6KJwODk9E/fy3Cd6Kd23KE/I6e+cqO0VA=;
 b=GsXXtEbXXV87mbAi6du+MclEUPKbEUSqwBUsGnXZ2S0Wk4dfBymy1meT0O5J7/wmm0
 Z8O3F3K+QSn5gvVvlQ7m+gQoIsFpMDFTBC1pE7fi5COaWNgIqiRk+sxoM2jv7Cibz+fr
 AKj4foBrbCf43tuWBe7Tcg34ePuzLDwzX8G2ZLFm96LoBWBPBwL4XGIw9JyR13iYudOW
 7GuFoDU90R9mnV8V2+u7+qTAznWaITR/O4njTlU/lla0XH1N6pXIAVHkQ7EDQ2MemNAy
 IKQTHdRMrYqyDuGPrPNo6VHtR+miFGZz/AepV33k5RlhxMNUl7JwCzVfBeDjz8S/UQgb
 ZYYQ==
X-Gm-Message-State: AOAM532ELnjW8A1YWKKWpUMHDzckX+KDlw1YeJy4LL3/0Y087Z+hXslN
 TQBQeqwJCHQZqLgbRJsOkH8=
X-Google-Smtp-Source: ABdhPJy1YSU+V/ePEmbu+3a9/kbPk6xNv9BKU/2wJnCs7pa6BWY4SSre3l24Ot5UdHC3WhhbOMpN4w==
X-Received: by 2002:a62:1494:: with SMTP id 142mr23138641pfu.216.1595935758467; 
 Tue, 28 Jul 2020 04:29:18 -0700 (PDT)
Received: from endurance.iB-W4G311N.setup.in ([59.95.235.115])
 by smtp.googlemail.com with ESMTPSA id b18sm2877600pju.10.2020.07.28.04.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:29:17 -0700 (PDT)
From: Nachiket Naganure <nachiketun8@gmail.com>
To: apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org
Date: Tue, 28 Jul 2020 16:59:00 +0530
Message-Id: <20200728112900.703186-1-nachiketun8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: nachiketun8@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: disable commit log
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
index 197436b20288..ef603f2d9dbf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2806,6 +2806,8 @@ sub process {
 					# filename then :
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
+		      $line =~ /^\s*$signature_tags/ ||
+					# Check for signature tag
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.25.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
