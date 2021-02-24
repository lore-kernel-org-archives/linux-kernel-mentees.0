Return-Path: <SRS0=f1rf=H2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ABBC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Feb 2021 13:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE6D64EBA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Feb 2021 13:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE6D64EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2467982DD0;
	Wed, 24 Feb 2021 13:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SZ1Rwd4orJB; Wed, 24 Feb 2021 13:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCB582F14;
	Wed, 24 Feb 2021 13:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27ABAC000B;
	Wed, 24 Feb 2021 13:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 059A2C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Feb 2021 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6C44DFB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Feb 2021 13:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nx_mFtZZRZ6T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Feb 2021 13:30:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 229984D827
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Feb 2021 13:30:11 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id d2so1324715pjs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Feb 2021 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qfRfzFAwrIoV1GXQkJdn6bloQGW/Oh86EcITr8l8t7o=;
 b=SZoAHANGnhmCzJHG1dCPjNAO/11Ivn7BKBvM+XcDvW+Cc2H5L+epyrPF+ywHodcFyV
 +vKe5obmeeRtNmM/z4AekygbVJU7JW8hQsTuG/9DHJSQjXi9aV0DukKRjQwwbH7CiQk+
 afpA0OzYsOGeYlF4/QzCj2SAAv56Ux6QRAM6tIEShVwD+v1WjM2kW/1wgKjpy6ebXDMo
 U8igCoWCGv+luVMNG9zdre/woqzpuh88dHoUpG3qHirNr/GGngN+F59zyitkRyFrQpRP
 BN/9qwOdBGFgkgC43FJxUR9k0yG1BWXVtyhvhJqoVOi08QGQFbOvpm/MOSFyD4W+Ebij
 uh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qfRfzFAwrIoV1GXQkJdn6bloQGW/Oh86EcITr8l8t7o=;
 b=Os7Xeg4gPFWGGJ0FfLyI3iKcE8HdGXr2mFhGS+OzFC49OOyxso2AJzxQOZbuqWlbW6
 DnvM50aa1uUxrWbKf15AE3e2pHiSp+RT9jf6ULd8/mhVtDugbJ279mTFCnfLldOz7+hS
 IdX86jkoqeldNqLITV+UG0OCK77PTgAnEUuvxTuvEMi2Iik/UMJK4kYKkzPSUTp0LMeq
 jAbqPDpnClFio45JigHma+SL3twLIQACUu2XhNFRTfH7j3yd3JJZjDkR3WHhqGQD2zGA
 ZnxyAIHbNdqF2tG5YBO8lJezs0aHRCHH4/T6E+8NZjvChclhmtlHkIfZ7oudzP1L2eIh
 mgXg==
X-Gm-Message-State: AOAM531JOSzQrXEr5S38S7IYgh10d2fac2IsqApP8Z/tsAg+T0RNrZS3
 Bi2wPISSS4jxH27T5Z2euFg=
X-Google-Smtp-Source: ABdhPJxIPjwG9lM4N5J/rrkK6hFq/627Aqe0h8jJPpIfPt26lVSWCEX1mKKxaUKytjrY5nrJyS2xbw==
X-Received: by 2002:a17:902:9f8b:b029:e0:a90:b62 with SMTP id
 g11-20020a1709029f8bb02900e00a900b62mr32736085plq.70.1614173410483; 
 Wed, 24 Feb 2021 05:30:10 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:5c4:262b:be36:c819])
 by smtp.googlemail.com with ESMTPSA id
 p11sm2809756pjb.31.2021.02.24.05.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 05:30:10 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC v2] scripts: kernel-doc: fix typedef support for struct/union
 parsing
Date: Wed, 24 Feb 2021 19:00:02 +0530
Message-Id: <20210224133002.13503-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <875z2jlr2j.fsf@meer.lwn.net>
References: <875z2jlr2j.fsf@meer.lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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

Currently, there are 447 files in the kernel tree, which use 'typedef
struct/union' syntax for defining some struct/union. In total, there
are ~1290 such occurrences in the kernel tree.

However, kernel-doc does not support it currently, and running
scripts/kernel-doc -none on include/linux/zstd.h emits:
"error: Cannot parse struct or union!"

Add support for parsing struct/union following this syntax.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
- Split recurring regex into multiple variables
- Modify commit message

 scripts/kernel-doc | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 8b5bc7bf4bb8..68df17877384 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1201,12 +1201,23 @@ sub dump_union($$) {
 sub dump_struct($$) {
     my $x = shift;
     my $file = shift;
+    my $decl_type;
+    my $members;
+    my $type = qr{struct|union};
+    # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
+    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
 
-    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
-	my $decl_type = $1;
+    if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
+	$decl_type = $1;
 	$declaration_name = $2;
-	my $members = $3;
+	$members = $3;
+    } elsif ($x =~ /typedef\s+($type)\s*$definition_body\s*(\w+)\s*;/) {
+	$decl_type = $1;
+	$declaration_name = $3;
+	$members = $2;
+    }
 
+    if ($members) {
 	if ($identifier ne $declaration_name) {
 	    print STDERR "${file}:$.: warning: expecting prototype for $decl_type $identifier. Prototype was for $decl_type $declaration_name instead\n";
 	    return;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
