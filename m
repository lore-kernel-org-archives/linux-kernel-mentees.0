Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483FEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Jul 2023 12:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3B460A80;
	Sun,  2 Jul 2023 12:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3B460A80
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TZ0auGwB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIZ6Mp2Xa-iR; Sun,  2 Jul 2023 12:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A666260792;
	Sun,  2 Jul 2023 12:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A666260792
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D213C0071;
	Sun,  2 Jul 2023 12:15:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACC9BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D236079D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D236079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTZRjfmYB0uN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1FF60792
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD1FF60792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jul 2023 12:14:57 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-66869feb7d1so1847224b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Jul 2023 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688300097; x=1690892097;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DntoVejHzUbHw/NVUKBMPCnwyUmjZxJJvZNMunsjz2U=;
 b=TZ0auGwBpAA34z5ux4Ti1uCBf+dNqx1vvBq47z1hhYWQtFwFH6M5xKYRmFCgSkKhwF
 R/3cCHwkK4lbwe1K3Nm+4mi1p8U45QsjC7kSMiwh9u60KGr/PnZ5Lim3fNrdVDDDpFhC
 xzI09Feq19Xpx6f6lxSOGEKHeaih+WeBR5IappNLR+PNvBZXcKQIzJhLvasFO9v8a3aB
 YgKfpvHcWZE0aWlMVhyAkwgOjw0UG+hM4y/qGTfpeKj/II6oXr7bKlz10JhdmlDSIAhl
 gdJyNdzMKyLA3jnI/qImrgeQmrpOw80oIQ/TiFg7K+UTBHgfWiz6AqADNHIMSavQ5NFn
 sOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688300097; x=1690892097;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DntoVejHzUbHw/NVUKBMPCnwyUmjZxJJvZNMunsjz2U=;
 b=hTj1sEVlF333lScgodNfeYD/krZvCN+j4xm+4Svb+//sHiogYHJPb8dEePJ8ktMtOi
 TXRPJrFwLt0T9iwCs+siuvxSex80Q+LOW0duUj6XH4tnEiHItH/p7HggCnMpczvXCacY
 wkfqs2crLUXd171tCcJoTv0oVIAZtLwIia45lS2l0E2BPORzSlnAAMwfvFZkFC/AaG7C
 Wf4r5Vp+9r1cHcs7mG0//QDeppR5wWScoMInhDPejuMaBT3U8iddyDXDs0tV12HwQngX
 YhwfWT4KghYjHp6hq8dHFdj8SJcmmEgIzNP5kclhsATkEhm0C3086Qpy4+//5IjqJwtc
 t54A==
X-Gm-Message-State: ABy/qLa49w2cOICX+DxN7KTPvLMH+BzE4BteCe/0lUOp3TDaEoxL31uc
 G7cUkoOt0UTVL0T/HuZi/oo=
X-Google-Smtp-Source: APBJJlGYLwl9SAOzS6EirIrfOIWXQT6mVPsrD5EOuD1iouxZhpiFuZrjPUk5Docf0ium9XGDiOH45Q==
X-Received: by 2002:a05:6a00:1891:b0:64a:2dd6:4f18 with SMTP id
 x17-20020a056a00189100b0064a2dd64f18mr9674054pfh.13.1688300097163; 
 Sun, 02 Jul 2023 05:14:57 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 e25-20020aa78c59000000b006732786b5f1sm11185655pfd.213.2023.07.02.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 05:14:56 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:44:51 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Trivial code cleanup patches
Message-ID: <cover.1688299890.git.yogi.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Rename variables in function _rtl92e_dm_check_rate_adaptive 
to avoid checkpatch complains.

The patches are required to be applied in sequence.

Yogesh Hegde (4):
  staging: rtl8192e: Rename variable currentRATR
  staging: rtl8192e: Rename variable targetRATR
  staging: rtl8192e: Rename variable LowRSSIThreshForRA
  staging: rtl8192e: Rename variable HighRSSIThreshForRA

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
