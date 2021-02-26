Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBFFC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6EE64EB7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA6EE64EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E1ED8417C;
	Fri, 26 Feb 2021 09:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tas2CXs5MZIm; Fri, 26 Feb 2021 09:38:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8540484165;
	Fri, 26 Feb 2021 09:38:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72BF2C000B;
	Fri, 26 Feb 2021 09:38:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF741C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF15A8417C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elrSifkPGeXT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1894784165
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:48 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id o63so5891354pgo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0JCxRwK/cVF01edZZLT5Wj+Rr/9cd4HuWjSUBop7vU=;
 b=Q5H0AZJTL1NSQGD7LnRILO+s/R0FFXQzHQBSHMRLI6O9gW2U5wMXdyQtJWYmEP6Vtw
 UOgyAb6NQz6CFU12TsYsfJ5T+fXSjZULazZfmx8DVPXi32RUHeKpmKY81aYQzubmnGtv
 wwmaK1dNv2CDfPxTqz1WgKar9J3bKWYUuKGztfKNB5WdQu+38JrdfRZQjrVG6hCv6MgZ
 6QZyn9jLMvUddMF9deJAwcLDIgdX/4XaUo5NXaDhg5Z8sPjgFbIklodv9hM25g7qOh1F
 M/UQZ4QOz/6w0NHS2vdWM/vAKVI4Cogzqx8S+DxhJCWDny5BHPstxIF36NFatGtFdAGH
 7cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0JCxRwK/cVF01edZZLT5Wj+Rr/9cd4HuWjSUBop7vU=;
 b=gz95eQLRqcf4W9gAChueH9FlQkgCpc5dMGZS0Jvc+tjm5elLu7RCEYyO1enlFySYey
 N+R3hs26mN/VTDK3YR+afCM0Z9PXED4tIkC18F9EFBmaJkgfHYGWrFZCQaJ/eMXXCu8m
 LXKeyvNE1ACHp5Be7UX3WV5ZNpsunBYS886vAv5COC14gW8XlwTYmwaW4Ge0fL37gwUZ
 fwvnLK4LN7EEt3A66X0iHUAJnLXjtobSsB53yL+ky/x8grCzRhEQyZCI97hfB3USFzT4
 P7RJJEyMe49n4ShzvPY3uhrWSvcOOh66kp9dwSXNVKOn0FNyqX/SuDFZ/s1vFBHlyKyE
 FtJA==
X-Gm-Message-State: AOAM532ujqc8NK8JIROVzgTz+V+A0k1bRQ8GrxnCYrBZ7DZUcLRTumq/
 Av6UaesAAd8vOqvJdj/f5kc=
X-Google-Smtp-Source: ABdhPJxQtiuvKwP1IU33GuRG5bLiQh02WQ5ZBlGfKG82cdoz0yv2PpI0englQ2YmAzvh/Nww++M9NA==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id
 a5-20020a62bd050000b02901ab06d25edfmr2347975pff.32.1614332327499; 
 Fri, 26 Feb 2021 01:38:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6adb:2468:cd7e:b0b6:7857])
 by smtp.gmail.com with ESMTPSA id n1sm8548833pgi.78.2021.02.26.01.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:38:47 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com,
	corbet@lwn.net,
	mchehab@kernel.org
Subject: [PATCH v8 3/3] MAINTAINERS: clarify responsibility for checkpatch
 documentation
Date: Fri, 26 Feb 2021 15:08:27 +0530
Message-Id: <20210226093827.12700-4-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226093827.12700-1-dwaipayanray1@gmail.com>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

From: Lukas Bulwahn <lukas.bulwahn@gmail.com>

As discussed, Dwaipayan and Lukas take the responsibility for maintaining
the checkpatch documentation that is currently being built up.

To be sure that the checkpatch maintainers and the corresponding
documentation maintainers can keep the content synchronized, add them as
reviewers to the counterpart.

Link: https://lore.kernel.org/lkml/bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com/
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16ada1a4b751..6b48b79ba284 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4181,9 +4181,18 @@ X:	drivers/char/tpm/
 CHECKPATCH
 M:	Andy Whitcroft <apw@canonical.com>
 M:	Joe Perches <joe@perches.com>
+R:	Dwaipayan Ray <dwaipayanray1@gmail.com>
+R:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
 S:	Maintained
 F:	scripts/checkpatch.pl
 
+CHECKPATCH DOCUMENTATION
+M:	Dwaipayan Ray <dwaipayanray1@gmail.com>
+M:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
+R:	Joe Perches <joe@perches.com>
+S:	Maintained
+F:	Documentation/dev-tools/checkpatch.rst
+
 CHINESE DOCUMENTATION
 M:	Harry Wei <harryxiyou@gmail.com>
 M:	Alex Shi <alex.shi@linux.alibaba.com>
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
