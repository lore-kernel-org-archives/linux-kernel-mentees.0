Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D21C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 14:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445C964E83
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 14:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445C964E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0FE6F789;
	Thu, 25 Feb 2021 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA7CDa2a649b; Thu, 25 Feb 2021 14:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE096F779;
	Thu, 25 Feb 2021 14:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F537C000B;
	Thu, 25 Feb 2021 14:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8C5AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67F86F77E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4ZTy5cPf4Fw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 14:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 460C46F779
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 14:50:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id t9so3633720pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 06:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ICxR1l/7KZSqo36Cd5u0xbdSpjciCk+ekMLVc8kZuio=;
 b=nE6FMH8tBWhfqZypIJmxC5ZJEacdZdRTQGVNDmCmx4YJNFIJcmYMWDXn4VIoeXDo13
 jzFLbi7t95uHfCk9Zv/FVCJYJ9P3c9i45qgjJF5H6TMlNeSOS/rjfcjl+iAMX1c/KfXr
 gN8kryvUYUs9lcMEWRgh9xYg2aIcHAKCEZ+UmAg0OCflDlScn4y97eDbrJ53NnNzKhjk
 n6OcnXDpC0hMsFZhOH7nG/divlVa8I7xzQQoSQNKaZXL9XQFc+ffpVH1w4kSyg+xoi1S
 kzUc7+XH2zRKkg3tY8a3bzPgUzTkog0aMj1J5UuS7hDRSKQ25zDHXyyanhBNF0qnQuRi
 Racw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ICxR1l/7KZSqo36Cd5u0xbdSpjciCk+ekMLVc8kZuio=;
 b=blNJtOmvSBh9iP38F4/yOiDdd2HfoMBy2riNFgPhIwZX0iORZOech7/knrPi31Z2qV
 yzHTvMSJDyYidI5aFRJZhvhzBa8FXT5mr1QnTuD35qYuqqTgNRa5uj0j+H8NfNfw+JeH
 bmhQjje9CcDPx8uhiJoMmDai4aE7cppIkxtd5OKygZSDPHr/+nmy27Hq3UKujQ8vzl9S
 Apw9i/JivIKA6xCWsoyIr5lJYSTFd93I7TpvwpMYDWISP/mOWCnU++jWbwaeocOemXxr
 ZWGV/SzYldcemrMKCmMV/zYwPkv15CUWgdPbBrvzZF3wiQ+U16yTdpfJYyllT+6tQoIq
 0uDg==
X-Gm-Message-State: AOAM530NHkxuRavLO52j4voUHRMxxkGFdxp+mOqJ1ST2acTcl6H5nj+Q
 B8RujExSV2DXPiwN/CoYLy4=
X-Google-Smtp-Source: ABdhPJy0xwfu4LfbRHmB35h3GPFN6CKqur6cB8K9GM7y1x9Cw1fj+2bpbHW0NMjS52DUc2zE6Yc3bw==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id
 l8-20020a170902f688b02900daa8171753mr3410714plg.76.1614264641504; 
 Thu, 25 Feb 2021 06:50:41 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:7d05:ce5c:6c16:3c9f])
 by smtp.googlemail.com with ESMTPSA id x2sm6389082pfi.220.2021.02.25.06.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 06:50:40 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC v3] scripts: kernel-doc: fix typedef support for struct/union
 parsing
Date: Thu, 25 Feb 2021 20:20:33 +0530
Message-Id: <20210225145033.11431-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
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

Currently, there are ~1290 occurrences in 447 files in the kernel tree
'typedef struct/union' syntax for defining some struct/union. However,
kernel-doc currently does not support that syntax. Of the ~1290
occurrences, there are four occurrences in ./include/linux/zstd.h with
typedef struct/union syntax and a preceding kernel-doc; all other
occurrences have no preceding kernel-doc.

Add support for parsing struct/union following this syntax.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v3:
- Modify commit message

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
