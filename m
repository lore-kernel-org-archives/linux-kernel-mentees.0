Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8691C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F754019C;
	Wed, 13 Jul 2022 18:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F754019C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NxJFzBNI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsM245rzWa9T; Wed, 13 Jul 2022 18:15:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 84FAD415D8;
	Wed, 13 Jul 2022 18:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84FAD415D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4FAC0035;
	Wed, 13 Jul 2022 18:15:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D4EEC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B3B415FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2B3B415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBUMN8qLvYe7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C863415E4
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C863415E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:40 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id o12so10921261pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqwrX18Qizf5Kz8IndFQThJnr5knU/Ti4jRFBAiLCCM=;
 b=NxJFzBNIAy/xMVwD+VGFpQvpYQECXNMgxpHFuKp1I0FTTotLjfQOwZ+kciCHXpJJpU
 v25uyN5o0Upp8QE9LkcbN0zOIsDtrYs1XdLsnvgj1rKu5lVL9BqWhjDuEAhDksTEcyGO
 YBOb4lp5iSU/xr3iSgmt7Jm09fqXq8hv0fhc53JG4H66HbQJ4XiFic8jvuT/xkR23gAi
 M0HM48ZMFK/ApLSMOU335GVKXDAaIOtjxzqOhuJjP2qoGSHy1kyhRvpLUqKnkAzT2uLy
 asBhXC/lfb1NszMu6T5kvuHGW9elMatQBW2Ty+yze0K6T3TwBzOq0SoXHrDo9BnaQY/c
 /ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqwrX18Qizf5Kz8IndFQThJnr5knU/Ti4jRFBAiLCCM=;
 b=2kaMg8vB1RHrm1QpNxjgUgiURD3ZK1uOirdwu6gXnu181sr5PgRirHoxPqN6Nr3/Q1
 pQa14WZFfiFTox8JNyYM9BRLgxeks3wq/3HVypBoW7u49pWf/daEy/pNBSHfi4V6O/sL
 WHXHORa/XKCE7HcHJfS8PMUmAhipww3MlJ/NqXn2NsqJzjDk4K8QFTEzxszlS/hAHmCX
 5KcGufPbteZ3sAHcXjwpE9vR3DQL98RyA3VkekjKZt47yS4G5icbnBh54SkUbLmiADOp
 PEDXp2AgK9vgXTFFklU1t7gZc8f3QIlAl9W4d7nU91H5DrbtV8dPfWoBQ3kp7o9g8zGl
 qx6w==
X-Gm-Message-State: AJIora9F/Fo3VJ+sSn4DqCqzUUkRJ1L7e5QiMy3fYPvtF+j74MBIrJmZ
 Qv4dDSYnO6em+oqTiQh23gjuI/h+ai4ZroAe
X-Google-Smtp-Source: AGRyM1v6KQaeH3RMpu+dwySXA//vW78CQWPegk0nSFqeoL3Sv/bb/CRqHI9facbHe4oG/4xOIsiCRA==
X-Received: by 2002:a62:3346:0:b0:52a:c0cb:ae8 with SMTP id
 z67-20020a623346000000b0052ac0cb0ae8mr4310775pfz.37.1657736079466; 
 Wed, 13 Jul 2022 11:14:39 -0700 (PDT)
Received: from fedora.. ([103.159.189.141]) by smtp.gmail.com with ESMTPSA id
 p6-20020a625b06000000b0052abc2438f1sm8874960pfb.55.2022.07.13.11.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 11:14:38 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Subject: [RFC PATCH 0/1][RESEND] Fix KASAN: slab-out-of-bounds Read in
 sk_psock_get
Date: Thu, 14 Jul 2022 00:13:23 +0600
Message-Id: <20220713181324.14228-1-khalid.masum.92@gmail.com>
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

The patch was sent to the wrong mailing list so resending it. Please
ignore the previous one.

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
