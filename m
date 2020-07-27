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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C83C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:07:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03671206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aipglmc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03671206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3B8B87DFF;
	Mon, 27 Jul 2020 05:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dk3aFzR2kF42; Mon, 27 Jul 2020 05:07:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BE2487D7F;
	Mon, 27 Jul 2020 05:07:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E37DCC0050;
	Mon, 27 Jul 2020 05:07:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99400C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 79E1B2038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6H7zrap4kwTw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id DD01320131
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:07:35 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t6so8714065pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGWIuwdMtZTOoSuQVQNMVyQoWTT0FqCbci1iZWDfg0M=;
 b=aipglmc2iR3fuQW12oGJaTJQwxjSscPmrBsdwJd3rqa85qs3ji4gsuSz6WJTpOBNdK
 hi0AFlURGfzbNsYwFRWCkY20vYJ/sPp8A0peuxQGldpj1GqMUdS/OuU6WBnznS2bZRg4
 uZzon3hUO8bHjgoG040E35vU5EkyHAldMjrxv+AY2TcAS0BXhijqk2micN+BXMlsKdu5
 Fe/7ohG4bXpUXmWr4+ya9d98NSRL3Noy++t0hsATFO2bCq1WVGDC5vdLAERpO/hqQEAy
 HwlZp3oDyx7mFXcqA4BpFUvmusHKTvvwAIxrsxPysZjd7S+1JWJm8R/kNxZDBEYe6r0G
 E2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGWIuwdMtZTOoSuQVQNMVyQoWTT0FqCbci1iZWDfg0M=;
 b=LVCv/xcPnVWJ4LbbCpCKaL0C+LRiEZtlzuRpMaJlMYljVQGMDrJSHfWiUkWlf+LyQW
 86KeVExHOuXgi1l9Ik6Br44Al033rQ8m1UwZ/YfiQ6LnNsiZja5cLVAmFx/DzqtpfrSw
 bKXVo2PHIMxdqfvop6Jxi+9bG+Ad5ffenwhcWPVZs9r9bNVzVi5FplrH7vs39QBIawDf
 oOxA8hA6OX02/GLjlx6iS79YF2jmmkdE8JcKyb7SYI150J44VpDwk3nJkU6H2OjwtnrE
 0LABX77DYZI6P1x1W4RY8pY5AI7MyE8QUjmK/fv4lYPfOsggSt9OZUO8gcsKAParqP17
 5e8g==
X-Gm-Message-State: AOAM530wNhd241X4VrMpXQOL3DmUK18zUt1hGi0RXlBdsVmHiwhInPAL
 2n/5QQ4DUtksiW7u9Fs3zPE=
X-Google-Smtp-Source: ABdhPJxQAv2Flj/jaQMJECwaPSg6h6ZfZW391y2x6AUOPQss4wgT/RtqWUGs4cTJ5wr5g+GYnow+0g==
X-Received: by 2002:aa7:9357:: with SMTP id 23mr129909pfn.278.1595826455461;
 Sun, 26 Jul 2020 22:07:35 -0700 (PDT)
Received: from endurance.iB-W4G311N.setup.in ([59.95.38.168])
 by smtp.googlemail.com with ESMTPSA id w71sm13678038pfd.6.2020.07.26.22.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 22:07:34 -0700 (PDT)
From: Nachiket Naganure <nachiketun8@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Date: Mon, 27 Jul 2020 10:37:24 +0530
Message-Id: <20200727050724.554063-1-nachiketun8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: nachiketun8@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] Checkpatch: Disable commit log
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
