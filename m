Return-Path: <SRS0=2gri=FL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C7CC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 18:58:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94342238D6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 18:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94342238D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24DC98780B;
	Mon,  7 Dec 2020 18:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XU4b9uoFy7rv; Mon,  7 Dec 2020 18:58:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6208B877FB;
	Mon,  7 Dec 2020 18:58:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40CB1C0FA7;
	Mon,  7 Dec 2020 18:58:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA9AFC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 18:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CFBD32E17F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 18:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDilCOAz1N6v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 18:58:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F2252D8B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 18:58:12 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id b5so141863pjl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Dec 2020 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/N/xrIL/qZ8kXAOOwh9PJuTQPNefKxYIgxBhEc6/Fr8=;
 b=NUDx7r6srUzXVJPF7bzh7hWPB8E0mYOMSPPv7ua9fFwyXNaD5YbRR9KfU6QwFaIJMv
 rs4/NCjiSLe9bmoHIJEWYCLVZi6fNLImCSOp39DKu79pLF7N7pPXXkmp6HrfYqG0hhsk
 dDyIRKyIvaRAdZf7cEaCf0xBO67MQCQ9PWolow0f4w07MY0neba/ndivnqrkQP3vFphE
 27yrfm8RlNkBUqfxbtyu6c6xv1YXCFMf+u6vTjc5pIvGjMdS8qCHUvRC+SwEcdB9AD5r
 Z7Xk0nK6RiB38UVHiQKR/yjYN667WZcKPD8uAuRrGmlXpprdS5B7VBZAc/ZWzAG0wDGt
 4ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/N/xrIL/qZ8kXAOOwh9PJuTQPNefKxYIgxBhEc6/Fr8=;
 b=UIA1sbThVlGUrsuz9l/GwtO3N3O0TBGRJ4rgBqdUKI/5zpR9Zfj+YU+H09f9eUm2Sq
 +R9o9axFtDKaOFgf/pnuvof1XcXAmThn8hCvXTe+0xw9LxHRmQHccmZygHK4A8tk76Ly
 LCT7J+KviYpkPvJfd75lv1QfnWMqHa5wXvWy1inoTcEczeHaP49nx7HCwpj/znfGtgyr
 jG6z2mlsXJNLsRUGtS5Kj+l0Ji8n3jnV6UtYvQtnVYCqCGJ9bOknzWIo9yZxCrHrXdbH
 V3FOMU2QEnKSLY9zkkeTImCiK7pixLwlzAFp3ymfNUnUaKP1whJA5Jqj9qADYVKLuG3+
 +hVQ==
X-Gm-Message-State: AOAM532Ypcqtz6IlIgnTK37KNyEuF6sWzkEVZMfooQMUtRYXtpYXefBf
 nfKcdTX2qGW4uWSxCPQHwu4=
X-Google-Smtp-Source: ABdhPJybxojIgt/bjpb/JjHJ3l9bPGAq1F1oWPNNrLORpK4xVVLZhSwpgfl5sr+3egHCyI/1ZVGcBA==
X-Received: by 2002:a17:90a:db48:: with SMTP id u8mr195086pjx.81.1607367491599; 
 Mon, 07 Dec 2020 10:58:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:688f:dd7b:1df0:84ac:76c5])
 by smtp.gmail.com with ESMTPSA id z126sm15334066pfz.120.2020.12.07.10.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 10:58:10 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue,  8 Dec 2020 00:27:47 +0530
Message-Id: <20201207185747.132636-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option to
	IS_ENABLED_CONFIG check
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

Documentation/process/coding-style.rst specifies the use of
IS_ENABLED macro:

Within code, where possible, use the IS_ENABLED macro to convert a Kconfig
symbol into a C boolean expression, and use it in a normal C conditional:

	if (IS_ENABLED(CONFIG_SOMETHING)) {
		...
	}

checkpatch correspondingly has a check for IS_ENABLED() without
CONFIG_<FOO>.
Add a --fix option to the check to automatically correct the argument.

Macros like:
 #if IS_ENABLED(THERMAL)

is corrected to:
 #if IS_ENABLED(CONFIG_THERMAL)

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b086d1cd6c2..751cd13622b9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6877,8 +6877,11 @@ sub process {
 
 # check for IS_ENABLED() without CONFIG_<FOO> ($rawline for comments too)
 		if ($rawline =~ /\bIS_ENABLED\s*\(\s*(\w+)\s*\)/ && $1 !~ /^${CONFIG_}/) {
-			WARN("IS_ENABLED_CONFIG",
-			     "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr);
+			if (WARN("IS_ENABLED_CONFIG",
+				 "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/\bIS_ENABLED\s*\(\s*(\w+)\s*\)/IS_ENABLED(${CONFIG_}$1)/;
+			}
 		}
 
 # check for #if defined CONFIG_<FOO> || defined CONFIG_<FOO>_MODULE
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
