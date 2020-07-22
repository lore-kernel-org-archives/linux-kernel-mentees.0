Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FEDC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 15:20:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE442068F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 15:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ8HekGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE442068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC32188674;
	Wed, 22 Jul 2020 15:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XafaZpWosSk; Wed, 22 Jul 2020 15:20:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62388885CA;
	Wed, 22 Jul 2020 15:20:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E795C004D;
	Wed, 22 Jul 2020 15:20:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1721C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 15:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EBFC685CF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 15:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98yRRU0iVdNT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 15:20:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C91B80496
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 15:20:17 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id p7so1179170qvl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mC+9VCisrQOLG6kTWdRwYqg9YnRsNnWuSWD6BGUaBPU=;
 b=FZ8HekGeo5ShXhCW8K3Qz+diyX/yNtoMBwYcfNlQOkYqwJMOBDgkjjnrXxMcFytvl0
 EUX2omBZVUM4mZLAJv89P8Bsab6RM96iDKoWFBid86ut6Rknmzs9hd4FivGcc5tzWmQe
 WPpqaU6RcomIDNnm5zy7m/x16lXpOcKVuJ8icY/dPG9fNcMZwDbSClIimXXW4FeW0x/k
 sYD9XbJqXHFmkDNHbxUi39CWdyXfFfd2joCrE6kn+tBk1FIU6AqzTvCiRBhFHukdqTv/
 A/2auoshCGbIidQlhZt5lalBFxNltjZZYOPyxB0qTqMD5DqmgL5eZl/75YGNCnWB3mq1
 /gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mC+9VCisrQOLG6kTWdRwYqg9YnRsNnWuSWD6BGUaBPU=;
 b=EKQaOUu40jy3g59zcKCKZjRZrbZEGlluRBDm9vXDGTFGq/k3PXCLp895EnJQXzqc0c
 gMz61GyIkokYRT3mgWvQy45/JoDRb0RGJ7Iod5p6Gpx1wGDjCRNg3inyBFtekqEK6Hvn
 /LZWVXcLrdyDaF4lfTKTpLi6YY2sGINVEuATECkMptDZWli0GfLb+0jvZ5cQNhKJJBUo
 /1pEsuCi3Py6YQ00RqnBz70HNvvc4cgMhczrb52Awq7W6e9MXoFnWwt9cr1cHZQFqO3a
 0junbShsPE+fDYfsCn8npIkECGXIyOuoLcaGRqSv67qyxX38ywrfCDhSWuPVjqknS5wg
 RFww==
X-Gm-Message-State: AOAM533lioL0iDI7dlVTl9Gce4bfwI03sNkKpuodzR7xEy3xT2jN6OVk
 MaJ1CnidVJ5N0KRxJSAoLA==
X-Google-Smtp-Source: ABdhPJyQlAbWhv80O6xSt+eVr/q5xPqqgm6J3gKBuQeelHhV7/HpWfRDD0xY6q8tS7Z3mN/bUfbdRQ==
X-Received: by 2002:ad4:4583:: with SMTP id x3mr454680qvu.133.1595431216569;
 Wed, 22 Jul 2020 08:20:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id 16sm147427qkv.48.2020.07.22.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 08:20:16 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Joerg Reuter <jreuter@yaina.de>,
	Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 22 Jul 2020 11:19:01 -0400
Message-Id: <20200722151901.350003-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds read in
	ax25_connect()
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

Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
equals to 7 or 8. Fix it.

This issue has been reported as a KMSAN uninit-value bug, because in such
a case, ax25_connect() reaches into the uninitialized portion of the
`struct sockaddr_storage` statically allocated in __sys_connect().

It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
`addr_len` is guaranteed to be less than or equal to
`sizeof(struct full_sockaddr_ax25)`.

Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/ax25/af_ax25.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fd91cd34f25e..ef5bf116157a 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
 	if (addr_len > sizeof(struct sockaddr_ax25) &&
 	    fsa->fsa_ax25.sax25_ndigis != 0) {
 		/* Valid number of digipeaters ? */
-		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
+		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
+		    addr_len < sizeof(struct sockaddr_ax25) +
+		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
 			err = -EINVAL;
 			goto out_release;
 		}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
