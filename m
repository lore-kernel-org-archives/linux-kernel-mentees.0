Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73046C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 06:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007D88176E;
	Wed, 13 Jul 2022 06:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007D88176E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jGbN0Bbs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmoAaAn-pOhq; Wed, 13 Jul 2022 06:32:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1931F8161D;
	Wed, 13 Jul 2022 06:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1931F8161D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAF9DC0035;
	Wed, 13 Jul 2022 06:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A21AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EA61408D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA61408D7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jGbN0Bbs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmgSJxYIjFj2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD97408D5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FD97408D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:26 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso2072562pjc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 23:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JTOHhNS82Zs7gv2Ll8m0Skpw0b8GkGo8ATBrvkVrkA0=;
 b=jGbN0Bbs3ByYTbUOD4XTusC6RAUPWyRYOgCkOBy1FRdDYFnur1Rxm6jMVFiIoFF5LC
 0G4rw3LHxT3HnTkKr4E9se2FnRySdZaiu69zaajuPUCZVKfBxBmL1M/gqf41UWe3L36S
 I+snLJbQcyeasDP/DBer1DfZf99BMhfL27vv7sK8M905YM08llOXBHIc3HqZFtYGzNpr
 uaaFDlvy3YBsYAhnmWu1emt6yvtf2x0XJwMLfBCTPMUO/8Dw57vR2w7xM+Xdrt0OBt0z
 J9wgLX+VMA0y4T4leZRy8eMTyWfS8LxakuDqo1RTwu1zzlMn7RSDfWG6nNb77x3K5U6X
 px2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JTOHhNS82Zs7gv2Ll8m0Skpw0b8GkGo8ATBrvkVrkA0=;
 b=Oiu3o160KWZJBrrQpinj/Ois+EuduVsJAdYaNupJc4hwoZo+3I2IEn+CvKjbPF4LWj
 4HOBeKy4VUe0q5Y0fx34yq1CfUWYIQ0oSm3XMsL7D8lRMf8IIhSLQbeJsbs07XGypdry
 NFL5d5j4yZ8Wht0ni/PmMpETJNJsiBcxLH75rAawvgMEQaoOm4rj92XKF1mMFjE6GguT
 fMyGFXC6fr1zew3rPkEcMCPmHLxFYxcdPptp9UGJkMjyiQRbGvAt5YGodnQ6c+9DRZ76
 RMq0IWqPzhobLNg23+Y/uGyle1oE2xZ2XJWHiqn9TEXaVp1gRpCeRTK+v7eXeUsdEQGC
 xnVw==
X-Gm-Message-State: AJIora89xQKcymbGEsKdizBkZyAtXvnVpuT774i7V3xaxKZOTjmYEZNS
 QLy2ZyFpoxnj0do8xedcb3n0Ybm9N1MkZg4D
X-Google-Smtp-Source: AGRyM1tW0ynDfRA/BnWLYyXoQigU5zvqJXuBAWNWgH09We8DV2eKXA6HVuVltb/qV4aozKZSIa5BMQ==
X-Received: by 2002:a17:903:22cf:b0:16c:4145:75c5 with SMTP id
 y15-20020a17090322cf00b0016c414575c5mr1734686plg.127.1657693945494; 
 Tue, 12 Jul 2022 23:32:25 -0700 (PDT)
Received: from fedora.. ([103.159.189.141]) by smtp.gmail.com with ESMTPSA id
 z16-20020aa79590000000b005289cade5b0sm7901023pfj.124.2022.07.12.23.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 23:32:24 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [RFC PATCH 0/1] Fix KASAN: slab-out-of-bounds Read in sk_psock_get
Date: Wed, 13 Jul 2022 12:32:03 +0600
Message-Id: <20220713063204.6294-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

Using size of sk_psock as the size for kcm_psock_cache size no longer
reproduces the issue. There might be a better way to solve this issue
though so I would like to ask for feedback.

Reported-and-tested-by: syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=1fa91bcd05206ff8cbb5

Khalid Masum (1):
  net: kcm: Use sk_psock size for kcm_psock_cache

 net/kcm/kcmsock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
