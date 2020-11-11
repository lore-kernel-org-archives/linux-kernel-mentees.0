Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA39AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:20:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20607206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="viFi1vOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20607206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88DB68692C;
	Wed, 11 Nov 2020 19:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtuMsRAVXTED; Wed, 11 Nov 2020 19:20:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B833D868E9;
	Wed, 11 Nov 2020 19:20:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4BAFC088B;
	Wed, 11 Nov 2020 19:20:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C808C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B91487522
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IT1seuHfCJ2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:20:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 668798753C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:20:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f18so2015016pgi.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FWq7Ya4BdHvBON9+WeD4uKcAoU10S2HUQixEcoNV2qc=;
 b=viFi1vOvc3QYLB+hOH9NEDD+So4JIOJIsSQx9GlrSroKpjf9+Y+gJcJePWptsSo6BY
 UeXrLoBncKcuUtItGLDs7Am3vziFaNHcevDCauzkPjrU57sLZdfz67/i4ZglLXk0ZNKS
 HnpATPHQnvundUX5e3eGS+C2ENSTrIBV2V+pmENGsVg+BmXHo+EZRDHhrBFdXB/m+FPq
 yqjU3grhkWp0UvrY+FXJ5ekRgEyX8xEr5mjymDTQPmlBUwUtdjamaeHlS2oBFNum6zJ7
 S/Etb4p18jDuLx9nwhvecAjRmeHox1as2OrN93iHTtTc90sClwfgaxcA+iX2fOk5FWLL
 Xhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FWq7Ya4BdHvBON9+WeD4uKcAoU10S2HUQixEcoNV2qc=;
 b=B1lqqM7q23je3wa3yw3l0QG4NTqwrfY8aF2E0bU/fJeSnyjN4ycArOfbjcY34cnFXl
 TROaAwbQxAcMenx6V43xabyrRSWvcsinmFAw7d3ZSET178e3XQjeSbt8JyKs8Y8fqHyg
 E52cit+2FXUu++XG8xhs3M4EEhsxvSOS/LHTAcIPWFqpOcpQoxvaGkiPaHLqk5gj/pZi
 ftT+8Em9oqTonuukPQH9oxeJXUI8U/OMuhC7lE+n4z9aclMTu80jhgqf/v56/qsPP2bA
 UZh9/xOneiK75jzq26keKNMKyImjEqaIC8/pNiBYjfSVWsArHa1X/hbvgmRn8XK9Jnau
 Hw2w==
X-Gm-Message-State: AOAM533NJR6ohZ46jRdxcUG+k1/g/FPLZpP+2MxWkN839P2WHRFC3RD8
 dODBBlekozcF26Jdi6QHFVE=
X-Google-Smtp-Source: ABdhPJyyR/V4YWgj+7VTEc1vARSb1lWwkncggg9uDJGgAJYnkI9vHY3QaWhBVr63Yu5pNq8AQpTbIw==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr7369226pgl.348.1605122403888; 
 Wed, 11 Nov 2020 11:20:03 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:438:e4d1:90d7:ac69:6d50:789e])
 by smtp.googlemail.com with ESMTPSA id
 x123sm3483878pfb.212.2020.11.11.11.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 11:20:03 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu, 12 Nov 2020 00:49:54 +0530
Message-Id: <20201111191954.398-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
	COMMIT_LOG_LONG_LINE warning for signature tags
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

Currently checkpatch warns us for long lines in commits even for
signature tag lines.

E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
clear Mac Table Digest") reports this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

This is an example of false positive. Provide a fix by excluding
signature tag lines from this class of warning.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ac7e5ac80b58..1d257b1f4a4f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2963,6 +2963,8 @@ sub process {
 					# filename then :
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
+		      $line =~ /^\s*(?:$signature_tags)/ ||
+		      			# signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
