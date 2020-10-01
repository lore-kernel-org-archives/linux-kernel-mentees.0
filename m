Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDD1C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:45:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CA120848
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiUgOO93"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CA120848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D212C8738B;
	Thu,  1 Oct 2020 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzjeAndrTtmF; Thu,  1 Oct 2020 19:44:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF42087386;
	Thu,  1 Oct 2020 19:44:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBC56C016F;
	Thu,  1 Oct 2020 19:44:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29652C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 13EAC87388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJCY2h4FUrJV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F6C887386
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:44:48 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id h23so2456999pjv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E6eg5BLNNt6tQQT+oLvRoYQfdPma9PurCdziiw+Wk5c=;
 b=oiUgOO93Ph9o1FeUl3FAvnew+NmadFSQ6IABQjlLbGGj77sSkCyqcKUW3SiPQtMGj1
 HpcEnygbR7ZNjNuZUopNaSx1IerDZ8gJzocfNajdUqvmhfVedaxEeuwsemdws1P5B2p8
 WL3CRSFlrzug+KomnoFHXRSL3GmfUD4u5vep37VKjW1WELDDmz+RHfvkrjpf4tc8l3i9
 qcRCUEVnOSEjypYo/nh0fOgOuWMIOThPRB349aCsZJykwljFHeMgzIdQbLYQq56Hi2xA
 mWalZooC8F6RayHDCzjroFCAvzmo8JbKjlQxNVtkgTHeI5CX1sQmycKNVQPF6e0bDc1H
 888g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=E6eg5BLNNt6tQQT+oLvRoYQfdPma9PurCdziiw+Wk5c=;
 b=l8kdaNYJVLphuc12Q1wmGD5HrYz0ll9y9id07zJoZ4jGwzZyNZOa1dt45qRyRLH+M4
 CPrL/S/HidbCRde9b3jD3Ae7P/MJTN6sv/b4/zXZxYilAkquYZyJ4gH3jbuMqhusel/O
 A+ySvulsLdkcC9jW7Rh+Y97wO4C2S0WzvuM63K+/Vu0xHLqWSBFsn+4e6W4YG75yfXkm
 J8prMaiNSS2IX3hLqEnJYQUHfrjMDdhdL3mOvzk/eNEAiB8qzyzMiiwmflvm6nxcivux
 0qLXGjpFTECHhD5058lq4CZ5Y54P7Mi+xfqR/ZNeq8flf1RSurdmJP8ScwelIVGNwBIF
 /pHA==
X-Gm-Message-State: AOAM530M3NGVwHoCfM5mK5qFiZnJe5q1IlUcK5/u5PWRP40KdCNxRstD
 fCUqk2+DUAiFNi4CWQuIK4CBdj1miLZbXA==
X-Google-Smtp-Source: ABdhPJyIOl9x9fk5cHMZvdbmHtBqlzrI1sKXGtIBkSxH1JAhc6eBIZUnsCh5BY1voOUqbg7sDS8Clw==
X-Received: by 2002:a17:90b:1245:: with SMTP id
 gx5mr1426844pjb.193.1601581487153; 
 Thu, 01 Oct 2020 12:44:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id a5sm6342509pgk.13.2020.10.01.12.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 12:44:46 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <e13498ac-34ec-26bf-2a1d-e166974c9061@gmail.com>
Date: Fri, 2 Oct 2020 01:14:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] comedi: kbuild: use interpreters
	to invoke scripts
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

We cannot rely on execute bits to be set on files in the repository.
The build script should use the explicit interpreter when invoking any
script from the repository.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 drivers/staging/comedi/drivers/ni_routing/tools/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
index 6e92a06a44cb..1d4635320fdb 100644
--- a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
+++ b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
@@ -42,14 +42,14 @@ ni_values.py: convert_c_to_py
 	./convert_c_to_py
 
 csv-files : ni_values.py comedi_h.py
-	./convert_py_to_csv.py
+	$(PYTHON3) ./convert_py_to_csv.py
 
 csv-blank :
-	./make_blank_csv.py
+	$(PYTHON3) ./make_blank_csv.py
 	@echo New blank csv signal table in csv/blank_route_table.csv
 
 c-files : comedi_h.py
-	./convert_csv_to_c.py --route_values --device_routes
+	$(PYTHON3) ./convert_csv_to_c.py --route_values --device_routes
 
 ROUTE_VALUES_SRC=$(wildcard ../ni_route_values/*.c)
 DEVICE_ROUTES_SRC=$(wildcard ../ni_device_routes/*.c)
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
