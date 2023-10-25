Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95833C0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 06:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A384F28E;
	Wed, 25 Oct 2023 06:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A384F28E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k47EXtt+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJgPqbSFmbwb; Wed, 25 Oct 2023 06:09:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DFD3B4F291;
	Wed, 25 Oct 2023 06:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFD3B4F291
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6EBDC0071;
	Wed, 25 Oct 2023 06:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 375CCC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 06:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F35DB8502E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 06:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F35DB8502E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k47EXtt+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PSU1kbOC3oO
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 06:09:15 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26FEB8502B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 06:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26FEB8502B
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ca215cc713so34377205ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698214154; x=1698818954;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DOzMC9JnINWc5MYbwZ7TC8/K6W3nb2Ih949g1iEUhFo=;
 b=k47EXtt+c5FgYZRC1RH6f4KhU0MqAIwh6b3odorugD5Gvjtq9YgEV1oNRdUmoaDlBR
 4tbxbjCMMdsGkxYAbWm0Q0/IK+imEQKSx7g18rcnZjisg8I6U3Q2Prmmt4Li2SIGREto
 6S+dNtSFOFnW8jSvqS1L/FrHjE+/uBDFfmplXQpns9/vtG9mzSlbEqhbLS15JT+ecJez
 rl0q258q89z+b+0cWWKhYcEXUIb15R7fdPpWtRz3uhGwEyv2VlTupGxWrv0LlEEuziRn
 +PVJuOIWVkrcSGf04INI24OTRSBDkJ1nnzZh5TD9+jOM7HkXPgoewDSMUFoHfSNSGD4Q
 UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698214154; x=1698818954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOzMC9JnINWc5MYbwZ7TC8/K6W3nb2Ih949g1iEUhFo=;
 b=R/SkDLJkaFgWCvUdvx9WCVFfyGU9SCytG9uWZ0GjhGafUmFmlbGk8o1DcLv0RQmaQq
 W08jmsb5rbp+TTZ/4ZR5tQa7bhwtn2RQiT7K8DdFN/GWd0FnOBP1hn/3z1ldFne5zwOz
 Z2ps/jqwIO6ZZje7i0XNalEN0hstrIVyCL+4yXdPEAIenWfCY8XRMTeKkIW+SHcq75XH
 ar07r0+JAiyRMYE0DQgWRaG3Ev+uCX8nQr68Vs9LSf0/j94WKDoNpNjXfYzYklSB9oaK
 M771ua0STS5GD55nRKGzIls/UNVE7pviirI4iKzy9DX5zVvms9cNjsZ/soSUgX8wtXN9
 u6SA==
X-Gm-Message-State: AOJu0Yz+a1LBwRcZT0cE/7Q0F9guXeTH4prFxsKLAk8TFKmHCFUNa0w9
 ZDlwu53mZ90PPVJBVh/EU60=
X-Google-Smtp-Source: AGHT+IEaeAcoCGe4BhTpz5eV1Ol/6pw+vtWHIt90lHzvDh2Llq6p722EYAJEY6FXVXxugtYLDKt2Kw==
X-Received: by 2002:a17:902:c404:b0:1c7:8345:f377 with SMTP id
 k4-20020a170902c40400b001c78345f377mr15172079plk.29.1698214154398; 
 Tue, 24 Oct 2023 23:09:14 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.173])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b001c723d6c410sm8380067plb.16.2023.10.24.23.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 23:09:14 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dan.carpenter@linaro.org,
	dave.kleikamp@oracle.com,
	shaggy@kernel.org
Subject: [PATCH-v2] jfs: fix slab-out-of-bounds Read in dtSearch
Date: Wed, 25 Oct 2023 11:39:07 +0530
Message-Id: <20231025060907.115675-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: jfs-discussion@lists.sourceforge.net,
 Manas Ghandat <ghandatmanas@gmail.com>, lkp@intel.com,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Linux-kernel-mentees@lists.linuxfoundation.org, oe-kbuild@lists.linux.dev
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

Currently while searching for current page in the sorted entry table
of the page there is a out of bound access. Added a bound check to fix
the error.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202310241724.Ed02yUz9-lkp@intel.com/
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
V1 -> V2 : Removed redundant check on stbl

 fs/jfs/jfs_dtree.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 92b7c533407c..cf67d32d5b7f 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -633,6 +633,9 @@ int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
 		for (base = 0, lim = p->header.nextindex; lim; lim >>= 1) {
 			index = base + (lim >> 1);
 
+			if (stbl[index] < 0)
+				goto out;
+
 			if (p->header.flag & BT_LEAF) {
 				/* uppercase leaf name to compare */
 				cmp =
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
