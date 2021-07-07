Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDC3C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 07:44:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD5F61C9D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 07:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD5F61C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA4D82ED2;
	Wed,  7 Jul 2021 07:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQJ855-KwuTw; Wed,  7 Jul 2021 07:44:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0877C8271D;
	Wed,  7 Jul 2021 07:44:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3552C0010;
	Wed,  7 Jul 2021 07:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0A98C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E80540299
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEMAI8Ezzrh6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D7B3403CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:36 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id n11so1044629pjo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jul 2021 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0e4qh6X8hZkaKgvTuHVOL+IOiL/w9aZMRgfdARHgzGg=;
 b=ipg1ciMSTf3kZZeE3mit0qFPsgj5zRjOR2AAwJfN5WZKv1ahL65eSQjZ569rW4XTeG
 vEuIZFmAjcpJWUNPmmjCm2dFKQK6+QJJtef09DFQg4r5aNVhXcSYjUm77flhsTdLPgzw
 OY6QRYdT6Xr33aSGymEhrAH2FhWO4/kgigTLsrNVV8wzV8WLoSEyTsAGzPFOnhT2npNk
 jZovhsjgSqh01v8Y9HVHTktl30cxZrGpuhva6wOJFJmRSWZOotJMkyxLp5MP4VLMgnxE
 yDLhd6I3S5QqwV7ncB/VFQBhOJob+KsYUFUpWK4YQrPS3q3D05xFlyBYB6C46XDGs6zZ
 ZaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0e4qh6X8hZkaKgvTuHVOL+IOiL/w9aZMRgfdARHgzGg=;
 b=nV7syURsNHx/26WwsDFIijAEKwhXmhmU4DASIkujcWD5F5XfdECNpbKcH4/I/Nfdsc
 TSSpFommeYQxLm2Pnr5E2AmI6SafeCEoh5lykrhrnnN6wVvSliJxY1PGzhii3xvyxNY3
 Q1Vi7iib1GW2M6K9DB4ai10ZvNzz61oMox5+BkG50akmVum7EUuYKIkEZfK6XLfdeOJb
 RaSQ1afB2nfM23AAsx3Z9ocUUsWGh3Qt2KnsEBIsFfqwRCtbxYcVmSLWyeeYFXKtxX/I
 QDBom8wAanneNJhlMvNGZFebE84Bltmnb3beiCaWpz3e0kHQehieOdYHf6A//0UI50hi
 aAZQ==
X-Gm-Message-State: AOAM532D1j4V4Qhbfkjt3KufM/VUdapOjC6dYNWwOeLft54eVVWsH9jA
 XADFryRFJsEHcE4lfG61sDQ=
X-Google-Smtp-Source: ABdhPJxjcafVG9vCtOFem9f9EdWv9fquVaqtgUXMF5rhxabs65uETaTz0miKRCt5ZMpkLc7tKHGM5Q==
X-Received: by 2002:a17:902:6b47:b029:129:ab4e:6407 with SMTP id
 g7-20020a1709026b47b0290129ab4e6407mr6345192plt.20.1625643876011; 
 Wed, 07 Jul 2021 00:44:36 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id x39sm12958519pfu.81.2021.07.07.00.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 00:44:35 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 0/2] fcntl: fix potential deadlocks
Date: Wed,  7 Jul 2021 15:43:59 +0800
Message-Id: <20210707074401.447952-1-desmondcheongzx@gmail.com>
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

Sorry for the delay between v1 and v2, there was an unrelated issue with Syzbot testing.

Syzbot reports a possible irq lock inversion dependency:
https://syzkaller.appspot.com/bug?id=923cfc6c6348963f99886a0176ef11dcc429547b

While investigating this error, I discovered that multiple similar lock inversion scenarios can occur. Hence, this series addresses potential deadlocks for two classes of locks, one in each patch:

1. Fix potential deadlocks for &fown_struct.lock

2. Fix potential deadlock for &fasync_struct.fa_lock

v2 -> v3:
- Removed WARN_ON_ONCE, keeping elaboration for why read_lock_irq is safe to use in the commit message. As suggested by Greg KH.

v1 -> v2:
- Added WARN_ON_ONCE(irqs_disabled()) before calls to read_lock_irq, and added elaboration in the commit message. As suggested by Jeff Layton.

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
