Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08769EE49A4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Aug 2023 15:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 733D760BFC;
	Sun, 20 Aug 2023 15:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733D760BFC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PTUghERm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqhXRwue3Qd4; Sun, 20 Aug 2023 15:10:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 63C8F60A7F;
	Sun, 20 Aug 2023 15:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C8F60A7F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45935C0039;
	Sun, 20 Aug 2023 15:10:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A7F1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2A960B9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2A960B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgaEW86AS2Dh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:10:36 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C627560A7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C627560A7F
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-410921a7921so5044861cf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692544234; x=1693149034;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PYlfXntXcRmI25j0ASkJL4cIGa95ibyMQikoaQtS0w=;
 b=PTUghERm0z9Kru2noqJAjcsws+7KJ7/G77coMBTUtmwnGulFBKynGVpCwHtQt00ds1
 9wKHz4VRVqPu4O8/of0KIyVHBZqHFAMJYbtgTPKHDGms/r9QMEugVBR2erBHIl1fKcX0
 Dl/ha7voh1SYJXopaDJhUNklkoUvcnp7vUIPF+c7yXe50jneiw25WvPZq+yl+0PSKo4L
 eGfpLUWWm75zNfaMa19fZJy38FO1c4o9XGWN5V6i6CIzNmP02TysYc6EKUSFHYP92gxx
 /YuA4cKZNEkZ7GMbSLR0fYdfk6B/1iY9iBfVtU/DbRjUfn1VpaT1VqN/nhFp9hDzBAA3
 R1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692544234; x=1693149034;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/PYlfXntXcRmI25j0ASkJL4cIGa95ibyMQikoaQtS0w=;
 b=LXmSfLDwd+Ym1uFkMOTTUolBulsK+kZNEVnYrA81ohhsheHbCMDNzFa/Hrd53Sjpo4
 UDAubqpQDS1RCLAjJt9j/qIr9+2Xsag5WsephS9FzdcAPRQa3fwYhORe44Qoa4naC8Ca
 6izERn0cl9RzUKmKnJxZV1zoHSYAT4YezXLT6HsNdk6naXHjhRNud31Oz7AX/w+H7QIC
 1pvCecZwUEaGn4NgEowHeNvPB99BN6595Fj9JbEU3qJC61O6US5NTBs+LMLH5ZontZa0
 0dH8hE/FBSGStGPxq80dEyneSnWrSChJwvOtzIzt1QzaXD7CK+Hki5hVrzersnMLFN2k
 YORw==
X-Gm-Message-State: AOJu0YzaLq1UMoDG3nSXqEBN6tpB+vmaJHjpvdt8LO1s1teLA9RxNu3d
 fnTs3Euxqz0SzZX3tEC5D+0=
X-Google-Smtp-Source: AGHT+IGoodQGXQnMlCl9Eys/HA+oeTgQM0W0xeD3x+7ZT9Zl78Uwukum6SL9eZ/kZVN7m2BkspSRWQ==
X-Received: by 2002:ac8:57d3:0:b0:410:959f:d7c4 with SMTP id
 w19-20020ac857d3000000b00410959fd7c4mr2442356qta.61.1692544234461; 
 Sun, 20 Aug 2023 08:10:34 -0700 (PDT)
Received: from localhost (172.174.245.35.bc.googleusercontent.com.
 [35.245.174.172]) by smtp.gmail.com with ESMTPSA id
 j19-20020ac874d3000000b0040fcf8c0aaasm1772762qtr.54.2023.08.20.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 08:10:33 -0700 (PDT)
Date: Sun, 20 Aug 2023 11:10:33 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kuba@kernel.org, netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com, 
 shuah@kernel.org
Message-ID: <64e22ce99cfa6_35801629446@willemb.c.googlers.com.notmuch>
In-Reply-To: <20230819195005.99387-3-mahmoudmatook.mm@gmail.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-3-mahmoudmatook.mm@gmail.com>
Subject: Re: [PATCH 2/2] selftests/net: replace ternary operator with
 min()/max()
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

Mahmoud Maatuq wrote:
> Fix the following coccicheck warning:
> tools/testing/selftests/net/udpgso_bench_tx.c:297:18-19: WARNING opportunity for min()
> tools/testing/selftests/net/udpgso_bench_tx.c:354:27-28: WARNING opportunity for min()
> tools/testing/selftests/net/so_txtime.c:129:24-26: WARNING opportunity for max()
> tools/testing/selftests/net/so_txtime.c:96:30-31: WARNING opportunity for max()
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> ---
>  tools/testing/selftests/net/Makefile          | 2 ++
>  tools/testing/selftests/net/so_txtime.c       | 7 ++++---
>  tools/testing/selftests/net/udpgso_bench_tx.c | 6 +++---
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 7f3ab2a93ed6..a06cc25489f9 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -3,6 +3,8 @@
>  
>  CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
>  CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
> +# Additional include paths needed by kselftest.h
> +CFLAGS += -I../

Why this, instead of the existing include with relative path?
  
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
