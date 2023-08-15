Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15A4C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3641841911;
	Tue, 15 Aug 2023 20:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3641841911
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DqZuiE5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRMtx2dE4Rz5; Tue, 15 Aug 2023 20:59:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ECCE341928;
	Tue, 15 Aug 2023 20:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCE341928
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C73ABC0072;
	Tue, 15 Aug 2023 20:59:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7487EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A2481F26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A2481F26
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DqZuiE5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvUbbVK15CH7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:59:42 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4D1181EF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D1181EF7
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-997c4107d62so776431466b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692133180; x=1692737980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z0gF3RLU8dnkJW3L2cW1INKAdZ4sC+saPsSk/51D5P0=;
 b=DqZuiE5Bkt9zzEHpxzo3DXd8bHwi4MbYJx+Q9rPqeYh5pS4Nl6t+QSM6hxYVO0s2yX
 gIFVoTmPEE/TvLJVfDvenylbEaUrLdI7mETf34kD1zk1P6t7eGjQfrbBqeHTp8n4vWVX
 iIHmBO//AtE9EflYlWzhQ2M61rYUugh9TKa4VR7NM1vfXZV9jtQkMSASlM3+xz1gASog
 qI3Il8PUGASuTvaoLmNCXNZJ6V172qUNDwpevP6D4562wsNPEyxDSHkcRgXQheljEC6N
 9g5NIvAE+Eo7R2b0Iz685urOd1uNBCRkbrQOdvD6p1ynLD/RjauH1LcLT5hh1PV0QdVv
 gDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692133180; x=1692737980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z0gF3RLU8dnkJW3L2cW1INKAdZ4sC+saPsSk/51D5P0=;
 b=VVoCHM1nocObVh8dJ0PnbxdsmjBtsrG+OtC55zJYeHALdTmLNfeDn49297hSz0SX/k
 TZ+LavVoRM0LM2nPH7E58hul5C2xHBo3HIWYcrTrfrL2vrfFml6e9Nwz0ZfcgOFsrwoj
 +1qXF/z45GaGZCaeJaOL4sFR1sPfrnpARR2OxQsvBM61nzPX7Yy+Z3smYxqfxtihG7V2
 M9otteEIZtMt58d/O8sGfq/N+afQWoFZmj8sueHa6YACnwN6LJruBeGSbou5NhlDxQE9
 9Z24Ob9w4FYtdqBEctYkBISinHQAgnp4rtuJZaqxizdGcvUWFnAedCa23YLkVmaytPs2
 VgRg==
X-Gm-Message-State: AOJu0Yy3xQZsURFLLY/yR+iGbdKIF5PCvh7rfEGeEnXj73OKD1jnX+wS
 fkqxur28xag3dN2aC0TqoSnVCLTIIYMTjg==
X-Google-Smtp-Source: AGHT+IH/aGPaNuYrE5FIpeUUEiwDKzx3rBtDl7UzVKwQZ2oG7sty6u4UgJRwrt201to403XS7aFJtw==
X-Received: by 2002:a17:906:847a:b0:99d:9adc:cd76 with SMTP id
 hx26-20020a170906847a00b0099d9adccd76mr7710287ejc.0.1692133179701; 
 Tue, 15 Aug 2023 13:59:39 -0700 (PDT)
Received: from dev7.kernelcare.com ([2a01:4f8:201:23::2])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170906695100b0099297782aa9sm7469235ejs.49.2023.08.15.13.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:59:39 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: paul@paul-moore.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Subject: [PATCH 0/1] netlabel: KMSAN warning
Date: Tue, 15 Aug 2023 22:59:16 +0200
Message-Id: <20230815205917.1504837-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: selinux@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

Recently I started to use KMSAN and found the warning in
security/selinux/hooks.c which triggers each time I use the official
guide to run syzkaller reproducers

Link: https://github.com/google/syzkaller/blob/master/docs/syzbot_assets.md#run-a-c-reproducer

I'm not quiet confident what are the rules in security subsystem. It's
not a bug, but a warning which is triggered by KMSAN for the argument
of the security_net_peersid_resolve() which was not initialized. It
will not affect anything inside this function, at least with the
current order of checking the variables, which might eventually
change.

Please reply if you're ok with such not-a-bug fixes. Otherwise I'll
just ignore this warning in my experiments with KMSAN.

PS: most likely if fixes commit 220deb966ea5 ("SELinux: Better
integration between peer labeling subsystems"). Not sure if this tag
is needed for this patch.

Andrew Kanner (1):
  selinux: netlabel: Prevent KMSAN warning in
    selinux_inet_conn_request()

 security/selinux/netlabel.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
