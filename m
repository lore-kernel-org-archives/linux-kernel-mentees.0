Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B86C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 11:35:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8F46501A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 11:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA8F46501A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F69B6F9E7;
	Sat,  6 Mar 2021 11:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8YrAULtykkl; Sat,  6 Mar 2021 11:35:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41E4605CA;
	Sat,  6 Mar 2021 11:35:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81E54C000B;
	Sat,  6 Mar 2021 11:35:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A038C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 11:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DDF43022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 11:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVarLe0cR9sJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 11:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 102A1414F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 11:35:20 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id x29so3156629pgk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Mar 2021 03:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RFcAptOGUzRFgc1VcA5H4/3lDHhPtSvWgw9OuJoIW28=;
 b=ZvgTalSC71oPlL8WnLg4t8W9jsbTDX2i6R7giAZKzGn89jhZCH6bvptq9X5yzNQS5I
 TqWkQy4xBzy1OqYPpKLPkibJibENFxX0lVx2Z3bBNqQJT6/Cxoo1YJqChS7XXHLYoD1Y
 hAIEuNh9Mniy8UBLnq/dzEFSFRGsZuKkSWTI6xTY74miUVquK7bKEGdjq69axTk/ecyw
 OXwtviL6EtS4ew+my7eiZj7n5tX3sEg6cLFBYdft0RVMHx3jO/htmDoJd07BvIFQCdla
 kFXLUUzIe9kVZjcE3mKs1fqRFOZ+fB/z6yztLuFF/OumKpCvkZU9An0PiPBG1vVRKVHV
 ET0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RFcAptOGUzRFgc1VcA5H4/3lDHhPtSvWgw9OuJoIW28=;
 b=g6R2lHhGuK3fsEbkkjjdHtdrmL/YQyI7cmUBdnsfgObKiP7QtbruX5wtNIVCvHattO
 jgRPvYO9BUBuuXwrp5Cr8NoypndqBW5XyHe3Bn1bCUFDYIRAs2CC1LYHgHr+ajExdbMZ
 u68UjG7/mtjZKDLIPMIJzHQCLSYbOm8JWoDLwr5TyfNR/TIS+FmOZG8SbMAQCznHY7Pe
 Y5an1kEoniYfwu3nn3bJoXvxXIICqloqAMT4qbFOtJjEEX8p/KLOk2cWRbf2oqPdF5NH
 13UlvIQRVS2DYG+c74Exd3f0PX9HApjZIvzTUCMkBTqbrggELoo/Bl7VTfKV5EVc3kTC
 ct9w==
X-Gm-Message-State: AOAM530q8ORgXibeigwjw0wu7x7x7ubImECCzU2zweE5pl/nLxGnEmOe
 wKIYuTjJcbkx2uKrNp1HY8E=
X-Google-Smtp-Source: ABdhPJyVJQxFLZUKLdkwHW2bBFVsEj+2VwFa5BbmcE8NrsH2miLBMn1v3xMmQzBBt4oxhz57odo1ow==
X-Received: by 2002:a63:d618:: with SMTP id q24mr12380661pgg.283.1615030520441; 
 Sat, 06 Mar 2021 03:35:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:2cbb:f743:ffa5:41bc])
 by smtp.googlemail.com with ESMTPSA id
 n184sm5342980pfd.205.2021.03.06.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 03:35:19 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC v2] scripts: kernel-doc: fix attribute capture in function
 parsing
Date: Sat,  6 Mar 2021 17:05:10 +0530
Message-Id: <20210306113510.31023-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMwoYa6xbCsqnUYL5uSA71h_3xV7-8erF6XTpmkck8ozaw@mail.gmail.com>
References: <CAKXUXMwoYa6xbCsqnUYL5uSA71h_3xV7-8erF6XTpmkck8ozaw@mail.gmail.com>
Cc: linux-doc@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Currently, kernel-doc warns for function prototype parsing on the
presence of attributes "__attribute_const__" and "__flatten" in the
definition.

There are 166 occurrences in ~70 files in the kernel tree for
"__attribute_const__" and 5 occurrences in 4 files for "__flatten".

Out of 166, there are 3 occurrences in three different files with
"__attribute_const__" and a preceding kernel-doc; and, 1 occurrence in
./mm/percpu.c for "__flatten" with a preceding kernel-doc. All other
occurrences have no preceding kernel-doc.

Add support for  "__attribute_const__" and "__flatten" attributes.

A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
that no additional warning or error has been added or removed by the fix.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
- Remove "__attribute_const__" from the $return_type capture regex and add to the substituting ones.
- Add support for "__flatten" attribute
- Modify commit message

 scripts/kernel-doc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 68df17877384..e1e562b2e2e7 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1766,12 +1766,14 @@ sub dump_function($$) {
     $prototype =~ s/^noinline +//;
     $prototype =~ s/__init +//;
     $prototype =~ s/__init_or_module +//;
+    $prototype =~ s/__flatten +//;
     $prototype =~ s/__meminit +//;
     $prototype =~ s/__must_check +//;
     $prototype =~ s/__weak +//;
     $prototype =~ s/__sched +//;
     $prototype =~ s/__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +//;
     my $define = $prototype =~ s/^#\s*define\s+//; #ak added
+    $prototype =~ s/__attribute_const__ +//;
     $prototype =~ s/__attribute__\s*\(\(
             (?:
                  [\w\s]++          # attribute name
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
