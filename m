Return-Path: <SRS0=uW6w=HT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9E9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 14:56:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F8964E02
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 14:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F8964E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2ED2E86E5B;
	Wed, 17 Feb 2021 14:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4KGv86vDZBw; Wed, 17 Feb 2021 14:56:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B919286DEA;
	Wed, 17 Feb 2021 14:56:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA8BAC0893;
	Wed, 17 Feb 2021 14:56:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93F28C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 14:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7B53D85C20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLbk5J0rGzeD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 14:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 004D984F0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 14:56:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n10so8621871pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=umrhymygAjTfKKuGa9j9kzWZRmkTLrdJqnZSqOqe44c=;
 b=ZRifIs2DaEZ0LEtho8jXMGQeDYrvcjndsqk9MOhjsYC1fpC279lJddN/I/YPBvqQAp
 Xh6Ef1WOxac+h3I4blwPlP+KfFs2EAyXPvCmQI5IvNEIFkCbcplzM5R83do0IHnjY3WT
 Ein/k+c3X+YGvtMCLb/lEelZXXcb4kcJfKC+SUksF1yzlq/w97+X/uPrMpfAMPqyP47v
 jgyVYWth0/bZEt65CYppdBEFDhhIwnuKtuXGQT0ldoKjX0sMBkEOraTM0jd1Yp/G1LmO
 yTOsGGZ/AmQaCoNGRLMoKoO/dQmB5XQzH7isHETw05N6fcOK0BPa+8lhcLPUB8yIdwhj
 a4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=umrhymygAjTfKKuGa9j9kzWZRmkTLrdJqnZSqOqe44c=;
 b=AqL6mIxWwTtVzlzRZRSImDcl33y8sLkT+nCwIm5ITlgXJoa4PvaqO+FL6tbOsOpGSp
 PPYdwWQyN8dwgrL0nAra6LJny5r3kYQOWL378liGS4U0/x9lGCp+Vw+3krrfu275bzFz
 8k2U8QB0Yi0/0uuMm/eZge4+5dhnQE2JxMVpAtzFZd/wnUGgLLTiKMrbVA1WGbnN8eIH
 tcYqkGOObLAbQfARMkowLihnj/uwYrmnhmVRcHDa1VpPgqazw/kSmexXyIz5b6tsxMHb
 SN6qr53JTrUusASASEHfXwZHfHowrZVlpOj3uPjnt88/tN/Ny+koTVCakKxDH45DfkD9
 wJYw==
X-Gm-Message-State: AOAM531Vg2mFTUroE7GSwgKj0ed7/hCEGMeLpFDu+OZpT4B8N7nrrTWZ
 77FH13mj/KnY7imVZxxDbrY=
X-Google-Smtp-Source: ABdhPJzjdsLfosibFqefQs5Lrqw/fmLmF8ruBYTEeDJ/hbrpviG4kOHul5ZBVqG2Y929SydEwDBoVQ==
X-Received: by 2002:a05:6a00:1a03:b029:1d3:1fa3:4a5d with SMTP id
 g3-20020a056a001a03b02901d31fa34a5dmr2996903pfv.1.1613573795393; 
 Wed, 17 Feb 2021 06:56:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:b8fb:8ce2:5aae:b58d])
 by smtp.googlemail.com with ESMTPSA id 190sm3064124pgh.81.2021.02.17.06.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 06:56:35 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Date: Wed, 17 Feb 2021 20:26:25 +0530
Message-Id: <20210217145625.14006-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix array element
	capture in pointer-to-func parsing
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

Currently, kernel-doc causes an unexpected error when array element (i.e.,
"type (*foo[bar])(args)") is present as pointer parameter in
pointer-to-function parsing.

For e.g., running kernel-doc -none on kernel/gcov/gcc_4_7.c causes this
error:
"Use of uninitialized value $param in regexp compilation at ...", in
combination with:
"warning: Function parameter or member '' not described in 'gcov_info'"

Here, the parameter parsing does not take into account the presence of
array element (i.e. square brackets) in $param.

Provide a simple fix by adding square brackets in the regex, responsible
for capturing $param.

A quick evaluation, by running 'kernel-doc -none' on entire kernel-tree,
reveals that no additional warning or error has been added or removed by
the fix.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly over next-20210217

 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e046e16e4411..8b5bc7bf4bb8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1553,7 +1553,7 @@ sub create_parameterlist($$$$) {
 	} elsif ($arg =~ m/\(.+\)\s*\(/) {
 	    # pointer-to-function
 	    $arg =~ tr/#/,/;
-	    $arg =~ m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;
+	    $arg =~ m/[^\(]+\(\*?\s*([\w\[\]\.]*)\s*\)/;
 	    $param = $1;
 	    $type = $arg;
 	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
