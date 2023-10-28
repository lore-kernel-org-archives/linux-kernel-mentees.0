Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC99C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 18:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A97383C3D;
	Sat, 28 Oct 2023 18:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A97383C3D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HBn9pcoJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVaO54Ah_Whj; Sat, 28 Oct 2023 18:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4D50583C3A;
	Sat, 28 Oct 2023 18:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D50583C3A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28CF0C0039;
	Sat, 28 Oct 2023 18:22:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02A9BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 18:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDC883C3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 18:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDC883C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQ85b9IOTV-H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 18:22:43 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BC0083C3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 18:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC0083C3A
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso2886639b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698517362; x=1699122162;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=AWZHwbHH5Jw6suHsJrDVFCqpyI99LB7jrpML+AzDazI=;
 b=HBn9pcoJmwVdfussQIVwCLXVQUfhniEJQLrr9bJfYPk1Dv3U9uHYK7Dy8DsAZbPL8d
 XQErjPIaTmjn1MVhX9fzqsy51MVmjuwc6RrTIMh+vvTFYtZ5mJlih5B4cXkvLR2auT2D
 eahznFJ2c/vGyH6RUgdPkKp/nfMECOKtjxKkdntHIRFRUBstWmGgYsTLUO/F+PZsJuw+
 T0/av6eiHoGyUBtRMbtFuQMH9NYzRBZYOj5xBDVmT2ia5FabZGazhzxoYhqcI2UbUWLZ
 swKGBkOskrQS3XISsodS3IlHBOIpS2hzIq146n4VnNI/r13EW+5HUCo4lvx+M7Q4Swj5
 i4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698517362; x=1699122162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AWZHwbHH5Jw6suHsJrDVFCqpyI99LB7jrpML+AzDazI=;
 b=OnJRO4WUHgjkpnU6v7pVvqOuRTKhulW+yOt1jLz/mRkESmGkAeeuda0l/IpEIUxQ8u
 dEbIxNsaQCtUcfVWf1niwtYHQPjyhxQbO3ipIVIF6XJdWXnFnEajbKs5LuP1abckP0hs
 GABt/TZCrf1ecs5WASYGgOfYfXL7+Q69tC9g6mHnjDJOI/9ehYbzbJ26gVU6ll/Nt4t0
 BpTvCeNO9HOcim4c0BvyYVtey9dtsC573cdEYXNGa7AuhOdmSTYTBeTDFuYFtiycVJRq
 QL9R5VRKPEIDzE73p62HSfZ8e5/N5/SfzdE/bgTX7VaSpQu+KL0xfgJ754QE5rlE/aPa
 0C3Q==
X-Gm-Message-State: AOJu0YzGJ5j95xVroe00kzUqY2Q/Ar9EkMMwOvzgfyKlpJB/a7llf3AG
 PxEJnRSHUdmv1t6f+O9O9SU=
X-Google-Smtp-Source: AGHT+IGmVG198oKTgBduvZ9KtnDQa6FkYKviYi4bbFl/ltu6kcETf7NFbhU3hUiuMcamD3IPvLai6A==
X-Received: by 2002:a05:6a00:1a4e:b0:693:4108:1eb7 with SMTP id
 h14-20020a056a001a4e00b0069341081eb7mr6203594pfv.30.1698517362472; 
 Sat, 28 Oct 2023 11:22:42 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.229])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a655305000000b0056b6d1ac949sm2027330pgq.13.2023.10.28.11.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 11:22:41 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: corbet@lwn.net, yujie.liu@intel.com, linux-doc@vger.kernel.org,
 swarupkotikalapudi@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Date: Sat, 28 Oct 2023 23:52:31 +0530
Message-Id: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

make htmldocs has below warnings:

..
Variable length lookbehind is experimental in regex;
marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
<-- HERE / at ./scripts/kernel-doc line 188.
...

"-Werror" option in make command,
needs "-Werror" to have space before
and after while running make command,
hence space checking is sepratly done,
and is not part of lookbehind regular expression.

Below command also didn't
show any error:
 make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o

Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d660e1f4b483..aa9e3e198d12 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
 if (defined($ENV{'KCFLAGS'})) {
 	my $kcflags = "$ENV{'KCFLAGS'}";
 
-	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
+	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
 		$Werror = 1;
 	}
 }
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
