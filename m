Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97106EE49A4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Aug 2023 15:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0356D60B9E;
	Sun, 20 Aug 2023 15:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0356D60B9E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=afk2Ucb3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSlaWhBClEW6; Sun, 20 Aug 2023 15:15:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EF692606F2;
	Sun, 20 Aug 2023 15:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF692606F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7C3DC0039;
	Sun, 20 Aug 2023 15:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AEAEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ED5060A7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED5060A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNXEEVYLLmM4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:15:03 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE79F606F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 15:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE79F606F2
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a7e68f4214so1995886b6e.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692544502; x=1693149302;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hSZIhmkHGzjNtkdqhrKis5XPDMMe45VDbgxuLxmNpc=;
 b=afk2Ucb3vmpuLfYssTTfFt+0EA6p/DPQhSYRmg91/OavyjhqQLYy8dJCwNgvKd02G6
 NqUhAB/BPDYPlu7A2iIF9Jlw7nbstwks0mJ0wOZtOOcmWwM+MOkgWUQAti3VZ3+TLNyP
 1todpDNBj42CVsA4XmZg4np6e8nXYKnIAqpSL8hnWotP5betbKeaxajgHd6jy3qLzCgF
 Ws1RiKIn+OAqjeI5HTz49Frkciwr8UjaLbE3EB6QccxVogvQTeeBGmJVmyscFbNzAQgr
 +QMIbFOYGaxCEMk0I7EsB2c12qfhFi8rqoShfqo+NHNuqnGhzz1ilynNjRZCVdN64uTd
 9kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692544502; x=1693149302;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/hSZIhmkHGzjNtkdqhrKis5XPDMMe45VDbgxuLxmNpc=;
 b=k+np10k2yRsW4WTgl0jHgEYH0Ys4tQfvfekCgPVcF3JCdkTGrZ7XZYxhnZbAXhIKq4
 mOcCMQHH14+W2UXatM63PEPxJzHiAN75EvOLsu0kqHw08JrX3+JynGwljQRRMhzHo2vS
 yMqEjZXm3wfr/iMcZQlQb3iQe9tdNimjZW3yLPkLAMU3y/Dl9FLM4PdvYIpelHCcjbdp
 A9IZ5ZqNiH3MCK4o0SWk8+UwsE35FsrTbUFRrfnC7fLc0xc8Ue6+s7KJXFaIaYKfN7ci
 UbBT1fA1kWUTAX9pSaNSDsP8JXaey6hkPr0mc1QJ98Ou/47m0UT/WuVZrxGVzBpQykbb
 AMQQ==
X-Gm-Message-State: AOJu0YyWh89qPRcYsC4H5JpgcdeF+HdVCte0ZALHkUAxyneFvq/O5D9u
 wnBI05ikASoa3yac1NWcnYk=
X-Google-Smtp-Source: AGHT+IFeVM78TX6uAGcng2/uDfZQ4CAtx3zUD+6/o8h5qq1zmlLCrnu/Cdu8RbfcHK890LMj+EtFGw==
X-Received: by 2002:a05:6358:9920:b0:13a:6cb:4d91 with SMTP id
 w32-20020a056358992000b0013a06cb4d91mr4301834rwa.7.1692544501787; 
 Sun, 20 Aug 2023 08:15:01 -0700 (PDT)
Received: from localhost (172.174.245.35.bc.googleusercontent.com.
 [35.245.174.172]) by smtp.gmail.com with ESMTPSA id
 i3-20020a0cf483000000b00646e0411e8csm2251406qvm.30.2023.08.20.08.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 08:15:01 -0700 (PDT)
Date: Sun, 20 Aug 2023 11:15:01 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kuba@kernel.org, netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com, 
 shuah@kernel.org
Message-ID: <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
In-Reply-To: <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
Subject: Re: [PATCH 1/2] selftests: Provide local define of min() and max()
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
> to avoid manual calculation of min and max values
> and fix coccinelle warnings such WARNING opportunity for min()/max()
> adding one common definition that could be used in multiple files
> under selftests.
> there are also some defines for min/max scattered locally inside sources
> under selftests.
> this also prepares for cleaning up those redundant defines and include
> kselftest.h instead.
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> ---
>  tools/testing/selftests/kselftest.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index 829be379545a..e8eb7e9afbc6 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -55,6 +55,13 @@
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>  #endif
>  
> +#ifndef min
> +# define min(x, y) ((x) < (y) ? (x) : (y))
> +#endif
> +#ifndef max
> +# define max(x, y) ((x) < (y) ? (y) : (x))
> +#endif
> +

Should this more closely follow include/linux/minmax.h, which is a lot
more strict?

I'm fine with this simpler, more relaxed, version for testing, but
calling it out for people to speak up.

Only the first two of these comments in minmax.h apply to this
userspace code.

/*
 * min()/max()/clamp() macros must accomplish three things:
 *
 * - avoid multiple evaluations of the arguments (so side-effects like
 *   "x++" happen only once) when non-constant.
 * - perform strict type-checking (to generate warnings instead of
 *   nasty runtime surprises). See the "unnecessary" pointer comparison
 *   in __typecheck().
 * - retain result as a constant expressions when called with only
 *   constant expressions (to avoid tripping VLA warnings in stack
 *   allocation usage).
 */

Note that a more strict version that includes __typecheck would
warn on the type difference between total_len and cfg_mss. Fine
with changing the type of cfg_mss in the follow-on patch to address
that.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
