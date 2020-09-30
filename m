Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385B2C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D336320759
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7peKCf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D336320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8487084EE9;
	Wed, 30 Sep 2020 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXIiB-Z5Jybq; Wed, 30 Sep 2020 21:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13AE685567;
	Wed, 30 Sep 2020 21:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDC4BC016F;
	Wed, 30 Sep 2020 21:03:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5A98C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C4CE85606
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Igc975VKl3Ys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 08A0284EE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:51 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o20so2113066pfp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7s32Tjx2QpZU4PQhzOqdmfdbP5Dew5QFlcBg0TdWvo=;
 b=m7peKCf/TtC34lOzAbyYinj0xB/nFXK4Ixtq0g9CneIFMX7jtRGOWGMjrI8fgB8Q3b
 qor83DP2JdD13O7VI/6Ye6hVf1w1fSdrOIzlc5QF1XcOEO5eyQsHJnLlKFT65A43Rdry
 AfZQHpVOY1sBs5856wlwNJYlSF+AVl1KdTmfFUSW/TzpMWlfss9zxSsaynCzcaVPGU9s
 95ejsv9s5G/IQ3EK3YU8vLy5NytJYFs3m4by/pRuC31L9HSgOA9klOGiXEWVVaWAHIqX
 BtftrlQjMvYwe2K0+Cr8wsAG6zGpDyBrBwuW/pVlaTJmOCfP/E2WM7cPhF50OiBsAp64
 Pk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7s32Tjx2QpZU4PQhzOqdmfdbP5Dew5QFlcBg0TdWvo=;
 b=DuJIT58m35E6W7hOaxcqPm/fjDMLAQHskvCNJKKeSaj8zVccNINEo6GwE58VlxP1iD
 VKOVSyDSWYpYMB6HfbcH2F9B73CbYPydo+XFihZeyPK16cu7nf86Ptk9O/eCP7yuipPf
 1mFHh7XFvXu7+3rY5mrvWWnky4xNz/qeYXfJlXPuRf27JEnA6x9ldqW84vgV0rTMgq8u
 QlREUyu6OwBnY2CXpsyUdbGY/hwBHipwPHs+6ridCgwgq+jd5aL7yHc6mm1CTy6J4GwF
 JhWvpp0vorqVT7BsACoLpydXISRh0yw79nIETZkZHJIpzy2ZCcAw4ZdnbNX8xscFRxpT
 wMMw==
X-Gm-Message-State: AOAM5312K1piQ382Lcno4VC6LWsGbrC8dOcRamS+WyJ1CNTJPqEs2wqm
 t4qC5w63qryPsXDQLRYXALA=
X-Google-Smtp-Source: ABdhPJzHSAr/jMumHZogMVJwHwhCbIIdcSXpK/RwqACQm1t3UkHG+GNQygltSfmY89Nml0GgA+v4Ww==
X-Received: by 2002:a05:6a00:2283:b029:142:2501:35e0 with SMTP id
 f3-20020a056a002283b0290142250135e0mr4404415pfe.64.1601499830483; 
 Wed, 30 Sep 2020 14:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6825:89f0:a659:1148:a80f])
 by smtp.gmail.com with ESMTPSA id y4sm3038922pgl.67.2020.09.30.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 14:03:50 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu,  1 Oct 2020 02:33:32 +0530
Message-Id: <20200930210333.166006-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC 1/2] checkpatch: fix
	multi-statement macro checks
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

Checkpatch.pl generates errors which are false positive for
certain multi-statemenent macros.

The specific case investigated was whitespace separated statement
terminated by a semicolon. Checkpatch wrongly classifies such
as a multi-statement macro.

For example, commit 4649079b9de1 ("tracing: Make ftrace packed
events have align of 1") when analyzed with checkpatch generates:

ERROR: Macros with multiple statements should be enclosed in a do -
while loop
+#define __field_packed(type, container, item)    type item;

The error is misleading in this case and should not be produced.
The solution undertaken is to exclude any macro which doesn't
have any non-WSP character after the first and only semicolon(;)
present in it. This shall allow macros of the form "type item;",
"type item[size];", etc. to not generate the multi-statement macro
error.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..72c4072307ea 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5346,6 +5346,7 @@ sub process {
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
 			    $dstat !~ /^do\s*{/ &&					# do {...
 			    $dstat !~ /^\(\{/ &&						# ({...
+			    $dstat !~ /^[^;]*;\s*$/ &&				# space separated statement;
 			    $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
 			{
 				if ($dstat =~ /^\s*if\b/) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
