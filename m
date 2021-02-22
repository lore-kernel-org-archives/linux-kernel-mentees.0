Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6F8C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 16:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADC564D73
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 16:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADC564D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DBB6F591;
	Mon, 22 Feb 2021 16:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqsYrWJX22JO; Mon, 22 Feb 2021 16:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACB96F56D;
	Mon, 22 Feb 2021 16:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8843BC000B;
	Mon, 22 Feb 2021 16:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD75EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 16:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B8B183A55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 16:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w70Lfu6jk3GO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 16:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE34C83A51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 16:03:55 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id k22so8009965pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g/df7huNH6MfWEYwBa1KL4hvVPRnxd7sYN0b7qrS+Eo=;
 b=YP9xzY8apNP3InqG+PM1WTiqx1/NMTiW4Hjvdj2gSAg9FlQ8zEwFWKnqERvnc5D267
 eB3iLEJYcvnfae/4iFq6m9bZpvBfg2nFHXDZzIGNkWp7nFxrZm66AJVldpKP/Rn2G+CF
 z5nbRNt/5Sh6XRXpq56MxX0Vnl5/6+v5S5QBL7k3kWamaW8TcDRxcwU2n3QJmFkMFwiM
 3XE+nR2lW9wTN6306HphrG78dAExYFAv8nzY3GkeyBLVuem0Fahpzn/ryDcQmb/Vdo8+
 uDhGPvIf6hTom85/o7UMA4EFIdoYLupLV0yyPA97EShNNOm7iOqOxNWG0FLj1PRmGYyw
 aSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g/df7huNH6MfWEYwBa1KL4hvVPRnxd7sYN0b7qrS+Eo=;
 b=tgau6BniHZmUiHL8Gm26ioHxtmcxMTmYDrgeRo8ujAyxnX5Bl5X+YON/ZR2qy2i1gc
 8cxoG0O8jvBMj3mNVkocATBzWE7CJUKIuACsBCMF8TIyUWCvS0xCPmJaxbbqlKwSKzB8
 dsQG7dqZUsVysv52t8jT38AmX5QiAFs9GBWBxP2BwgQ0rq7y9CzN9tkuaXhYLAEBZBeo
 jpUcO2s+qsBBK0Wx56pGFoKnoB8p99YTxj5u97VdbVNfXxlyWdVKFBDQaMoMxdf8dcoi
 kHChCy6c/73/rc53mab6hPg0j3NVnQ1U6mx9QwwARNYEmjhz435wk0sKx1G0RgtTC4u1
 P73A==
X-Gm-Message-State: AOAM5309p9fhiWqUj8JXw+xQJusBHaQCgeuWvstDAVXOLMFvwxu/hr8+
 1GfNt9//T940GwJw5BkoM/Q=
X-Google-Smtp-Source: ABdhPJwVZA8/60TITCfjuud2smvskuBah0kv6QccJazhIC+JGnxqinDyG7ls9VFb59+lMsi/UtNr/A==
X-Received: by 2002:a17:902:6949:b029:e3:1ee9:6bfd with SMTP id
 k9-20020a1709026949b02900e31ee96bfdmr23241817plt.66.1614009835024; 
 Mon, 22 Feb 2021 08:03:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:d92b:2fcb:b6a3:bcc0])
 by smtp.googlemail.com with ESMTPSA id s18sm18541728pjr.14.2021.02.22.08.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:03:54 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Date: Mon, 22 Feb 2021 21:33:47 +0530
Message-Id: <20210222160347.23410-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix typedef
	support for struct parsing
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

There are files in kernel, which use 'typedef struct' syntax for defining
struct. For eg, include/linux/zstd.h, drivers/scsi/megaraid/mega_common.h,
etc.
However, kernel-doc still does not support it, causing a parsing error.

For eg, running scripts/kernel-doc -none on include/linux/zstd.h emits:
"error: Cannot parse struct or union!"

Add support for parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/kernel-doc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 8b5bc7bf4bb8..46e904dc3f87 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1201,12 +1201,20 @@ sub dump_union($$) {
 sub dump_struct($$) {
     my $x = shift;
     my $file = shift;
+    my $decl_type;
+    my $members;
 
     if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
-	my $decl_type = $1;
+	$decl_type = $1;
 	$declaration_name = $2;
-	my $members = $3;
+	$members = $3;
+    } elsif ($x =~ /typedef\s+(struct|union)\s*\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*\s*(\w*)\s*;/) {
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
