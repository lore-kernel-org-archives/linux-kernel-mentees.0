Return-Path: <SRS0=yuUc=E7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10534C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 19:05:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647B3206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 19:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFI7/buB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647B3206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 970B7203FC;
	Wed, 25 Nov 2020 19:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1yO4m2A-RmH; Wed, 25 Nov 2020 19:05:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2EC0203D0;
	Wed, 25 Nov 2020 19:05:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DE8CC0891;
	Wed, 25 Nov 2020 19:05:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DA1AC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C50687630
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hp27iFYdunKR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A8D1887620
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:05:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w187so3227001pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcazdIFkxp5Ex0KRqcsQmJoWP6NwOIES2djFxoGst5I=;
 b=GFI7/buBwyvJd/c4xjxSE8mj050CHdlYMR/zlCT4wLx5llP74oit8xn1NfjNUTa6De
 VoFhjfmTyR9V8uXimUj8XGr8OxOKzBIE9Gj7INmQdI8O0eCak3UoGVFpXSKlU84CM6fz
 /7KqzAQkFrKf5IYebm9V3+yHgZbhuoxEPrSyoXjZYPL4ARTvFtB+dKKch8Fx5UPzNLFX
 x0rlCxS7jj42a951HcxIP9H5zrfOBkhLFZB5gMJD2aVJeTd5IEEB1y7JKs1u4hX/dkk7
 4nRn+owuFjRDPjfXY6g69VRRAP5VFNuKBkiarlzkILTDb7Loa2VM6PJBymqVhwvAM/Ss
 SoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcazdIFkxp5Ex0KRqcsQmJoWP6NwOIES2djFxoGst5I=;
 b=h5w0g61Ej1ONaywLPLEIsxZbHvJ0gCeAWA9DfDmp6uVbD4qu7BgjtL8ovcBqt1ZaEv
 KFpouaSd5zh+QigUBOvCrd7zhlEsbcVICiI5LDHjdjoACCmfn2ZgjkJfpD8meQR3Z+3G
 YUHWNq5ZNG6hwlsG6Qlgj1j3y7OO6SQK664PcJXzTgJefFXE5vO67gINo0nh/LKLxSwl
 Rbh+q4q1bucNi62tbPSTmOsqw7/mBzCcb/+WsNfobUenFF/eZ+kAzWD+gyG/9tGMaT2q
 etnNYkRPHD1kwXaxoMs0s3+dBBE/MVYtGjayQXTDvxlLX5Qp6iNEJ8p8Op5tMpAb12dF
 7InA==
X-Gm-Message-State: AOAM532U+3LWQIfseEuRJslzoHZ5qHJSoNWK/B0HbMYZ/LWpBKf+mFsB
 yOa0ZmHTZcO43O9UQqYdWfc=
X-Google-Smtp-Source: ABdhPJzK3t2uVJ2IiwA+aHN39DvV9R+fRMAb7fh1f3N3lEVrimZ4L7RKUYg37ZPe6WfDMm7Kb+1OGQ==
X-Received: by 2002:a17:90a:c17:: with SMTP id
 23mr5927567pjs.199.1606331117077; 
 Wed, 25 Nov 2020 11:05:17 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:682c:1090:12fe:fa7b:908c])
 by smtp.gmail.com with ESMTPSA id q200sm2621393pfq.95.2020.11.25.11.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 11:05:16 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu, 26 Nov 2020 00:34:44 +0530
Message-Id: <20201125190444.167045-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
	unnecessary use of %h[xudi] and %hh[xudi]
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

Modifiers %h and %hh should never be used.

Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
of unnecessary %h[xudi] and %hh[xudi]") specifies that:

"Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi]."

"The "h" and "hh" things should never be used. The only reason for them
being used if you have an "int", but you want to print it out as a
"char" (and honestly, that is a really bad reason, you'd be better off
just using a proper cast to make the code more obvious)."

Add a new check to emit a warning on finding an unneeded use of %h or
%hh modifier.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..47c1017a9973 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6570,6 +6570,19 @@ sub process {
 			}
 		}
 
+# check for unnecessary use of %h[xudi] and %hh[xudi]
+		if ($perl_version_ok &&
+		    defined $stat &&
+		    $line =~ /(?:[sd]?print[kfd]|(?:pr_|drm_)(?:info|debug|warn|error))/i) {
+			my $lc = $stat =~ tr@\n@@;
+			$lc = $lc + $linenr;
+			my $stat_real = get_stat_real($linenr, $lc);
+			if ($stat_real =~ /\"[^\"]*%[\d\.\*\-]*h+[idux].*\"/i) {
+				WARN("UNNECESSARY_MODIFIER",
+				     "Unnecessary use of length modifiers %h[xudi] or %hh[xudi]\n" . "$here\n$stat_real\n");
+			}
+		}
+
 # check for naked sscanf
 		if ($perl_version_ok &&
 		    defined $stat &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
