Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1DFC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846F061416
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846F061416
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6E84002B;
	Fri,  2 Jul 2021 09:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Te_lEaWFPQdM; Fri,  2 Jul 2021 09:18:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 810A44018B;
	Fri,  2 Jul 2021 09:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FD4AC0010;
	Fri,  2 Jul 2021 09:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F31BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4E683C0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TlI_HhhZjE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:18:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 595EC83123
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:18:53 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id x16so8392174pfa.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJEaMh5QMIWKQSiW3NhFAWboQVAmMWKJTMsm2BnrKWA=;
 b=b3Agk3pau1jzghfawlkN8c7Mdga3Nzlj5mQz3xpbz85WeyXNj6Gs54d14giwqX75H5
 2/iO0XgdoLFJBLkqOlQhhvM/a+j/UNWycRXpCosZ3mKhrSwvnnlt9cjIDIIEiAXXFj1A
 i3MRRi1eV9LT+3SxSydMIET2w22HX1dFDfxfLK73wbc8ITyzucHWxXKLGt2rBLrgUXr3
 Hi5p4TEE1FwGiD8tth8dAB3fbitiFQ/0iez44c5sf/YhBszhhorsAE1aSpgp57Wwm6hD
 zR+SNI6cCUS+7F+0oiMJQEBhLDG07QhSEynK0a4gOpcwTDbfV1UpYirNtbrS5fUZ4t+o
 30XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJEaMh5QMIWKQSiW3NhFAWboQVAmMWKJTMsm2BnrKWA=;
 b=RDj7Yo8J/QMEUSpUjrhosIjsNwXiQufYpUyUHrKnfsBmGGidxfB3xKGqTApzw5cdO7
 ZQmGp+NYw0QRm/kptmitFhAVXoGuP/Ab3m6O0X3m/hEXuK1/LYCKu0/1qF9N9WcCtMhU
 ekItjt9CCOrRsDJmg1p4IZPhtV844cRZ3z6nMf/3OlJTK34ylQ9JC8rJayCrfm5iYXHy
 zCjLRFHR+tN/rAlYjxwQ18TiwlMIvFitdYfuYcGZglNxIES0+9kju2ewUwJL9llJQGFh
 hhpKtE8kIGHS4MMi6NEe2CYoT6/mB4Df6m8Hrni+MlD7deWmhcDKILWnwKQFUiRRpnJc
 AOVg==
X-Gm-Message-State: AOAM531gYFNpLgrbV1txdzdLdafYhGx/BV5/HJhFrO+gMnkuW/YdXSs3
 I58vBCcsOEk4w5m93l9DpTQ=
X-Google-Smtp-Source: ABdhPJxJOwoAcoKmZkfGso6jjy9hW28TXA4lMFBKPHpGF+EHRsgL/W14RrCs8aNA22yZAy3MllzMeQ==
X-Received: by 2002:a63:4f11:: with SMTP id d17mr1260315pgb.20.1625217533419; 
 Fri, 02 Jul 2021 02:18:53 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id y3sm3023918pga.72.2021.07.02.02.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:18:53 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 0/2] fcntl: fix potential deadlocks
Date: Fri,  2 Jul 2021 17:18:29 +0800
Message-Id: <20210702091831.615042-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

Syzbot reports a possible irq lock inversion dependency:
https://syzkaller.appspot.com/bug?id=923cfc6c6348963f99886a0176ef11dcc429547b

While investigating this error, I discovered that multiple similar lock inversion scenarios can occur. Hence, this series addresses potential deadlocks for two classes of locks, one in each patch:

1. Fix potential deadlocks for &fown_struct.lock

2. Fix potential deadlock for &fasync_struct.fa_lock

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  fcntl: fix potential deadlocks for &fown_struct.lock
  fcntl: fix potential deadlock for &fasync_struct.fa_lock

 fs/fcntl.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
