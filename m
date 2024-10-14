Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC71D3562
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943640; cv=none; b=OYyuWATxPi8nwrmS+QIsEn/5N6aO0JmRdpZVXeW75+Lvh26cngQO/UxCBvzRgpDQowaEqoZnNcxOYEgz7reHWgqihGsrwLowKbAXFcDpe8PymKRPJ8aGhNu7r5/F4oG6HlDttdbvJXsbxItlEx4NrnQBuisL+bjTOD/v1LfqJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943640; c=relaxed/simple;
	bh=BXoqDheXy+2BwaKLV2FiDxisztcZ2Mr3gf7y1y0b2KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhcRYKdj64pPgS0SEZz7LEhLUlynGA0JE2gCYb0RgT/HAy+DDZTv8k6esfHwAl1O1iyU09n6M3d+zGkcfugdKiHjq+wH7g3UluqVpRcU+VU6YO2QRa3zvNQa0RnAZkd6QinugNE4s9v/uQKwOtQ0lvWbN+0WHik03ldwzq+SnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyooTZxz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyooTZxz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D3680D9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHoeFPijaz2R for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 22:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=0x7f454c46@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24C4380DB5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C4380DB5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lyooTZxz
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 24C4380DB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 22:07:17 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso3347436a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943637; x=1729548437; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8w6ffEpFO7SbSBhrFi9OhNa1QYyGwUObySt3ab3Ei0=;
        b=lyooTZxzW5qtCu4mamzRYJBmwsRCCjlFnc+GR14uU56z+SObVzGhrhdwqCWCekpw+v
         OVJG+XKgz5j5OmuXcDq4t2L7GntwfaWomlyFwCLPY3CWZrK81h1F/BqFnKZFKu5si8u6
         5j5sb2D3mZDGsRf34C9MZETolUf3NeR3h3pK4N+vWziWNhQwtyjgk7ZC8z252/oi8GJL
         AfvMzH/I1OgU2t5XGY+BlwST2tEV0P40eChlrQj8bPQimX8M+a1XD3w4M+ro3FIugESo
         L+9HOEkvB96/tCmyhqfnTxfbsOitt94dWVmrDbu1xKyb5EwhSE4T5uLSH8+JyZ5R4KrG
         oELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943637; x=1729548437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8w6ffEpFO7SbSBhrFi9OhNa1QYyGwUObySt3ab3Ei0=;
        b=ZRd+Y7Nsl+gJ1TR2e5QnOUBO8EhePdyiZGHUvpUNTNzMoXT4612VRjt0bxx2lZxMjD
         Qc9xwLDKD3CQsN2dx15lH3q+Vh0UOw7MQS5K8QWM/Y8WacjOWw/W4q1cZX7ErUoVU5ab
         E2tlqpeEHhazqqKMR0G7D1uwl6wLhpLUCZ9lqeoLVzOmq16HrKv3mgns7AkiDoJDmBHj
         iIby2mmPawccDatKfUcEkPRDsm2H8q37V4AN+xDg2eVzxDOtq00om+OGwugQYONdXxuW
         hi9PhK0nCy/tfK9qQgn4EfLr3wJscTr/chYbKJcn5Y//8SrJPnkrXUVLHAlfohyX7gNB
         uNEw==
X-Forwarded-Encrypted: i=1; AJvYcCUOlxtIRU0zaji+FVuy8vvyTC4qG7YZpFgDimghJf1uvwgCNPyggj0p9kDTZ+CIbdYtRHdK7AyvE/K3d5H2t1czY5VQng==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyheumO6ggd2wmT/eswU2PgByPoWI66PeF/SZFFvuvE3I4gJjyP
	Y8wtsWg+f9F6LUVdJyTFqPiajc+oUPzhpF2AN3HD4wkUdbxGTPeRWt3Lw9s6p2y5W/QYRcRov1U
	OFwm5RJ+IW9SlL6UHc6ULqvzIFhY=
X-Google-Smtp-Source: AGHT+IHkyDEUmmGGnyUt7sO+5LG4pdrQyOuHncFHLBQRb0Zc7Ja7f7NQho3LtKeKQZKMj2cJZacYqB1cIXzt/cm2gMw=
X-Received: by 2002:a17:90a:a00f:b0:2e2:92fe:35d5 with SMTP id
 98e67ed59e1d1-2e315356673mr12536398a91.31.1728943636516; Mon, 14 Oct 2024
 15:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213313.15100-1-leocstone@gmail.com>
In-Reply-To: <20241014213313.15100-1-leocstone@gmail.com>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Mon, 14 Oct 2024 23:07:04 +0100
Message-ID: <CAJwJo6anjg4rBDLhgHL+vVtQ0FTWvK089p3D_xNNmcDTrXRL+w@mail.gmail.com>
Subject: Re: [RFC PATCH] selftest/tcp-ao: Add filter tests
To: Leo Stone <leocstone@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, shuah@kernel.org, rdunlap@infradead.org, 
	mnassiri@ciena.com, jiapeng.chong@linux.alibaba.com, colin.i.king@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, anupnewsmail@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo,

On Mon, 14 Oct 2024 at 22:37, Leo Stone <leocstone@gmail.com> wrote:
>
> Add tests that check if getsockopt(TCP_AO_GET_KEYS) returns the right
> keys when using different filters.
>
> Sample output:
>
> > # ok 114 filter keys: by sndid, rcvid, address
> > # ok 115 filter keys: by sndid, rcvid
> > # ok 116 filter keys: by is_current
> > # ok 117 filter keys: by is_rnext
>
> Signed-off-by: Leo Stone <leocstone@gmail.com>
> ---
> This patch is meant to address the TODO in setsockopt-closed.c:
> > /*
> >  * TODO: check getsockopt(TCP_AO_GET_KEYS) with different filters
> >  * returning proper nr & keys;
> >  */
>
> Is this a reasonable way to do these tests? If so, what cases should I
> add?

Your change does look reasonable to me.
I think you could add one more test here for passing
(FILTER_TEST_NKEYS/2) to getsockopt() as tcp_ao_getsockopt::nkeys with
get_all = 1, and check that the value in tcp_ao_getsockopt::nkeys
after getsockopt() reflects the number of matched keys
(FILTER_TEST_NKEYS).

See also minor nits inline.

[..]
> +static void filter_keys_checked(int sk, struct tcp_ao_getsockopt *filter,
> +                               struct tcp_ao_getsockopt *expected,
> +                               unsigned int nexpected, const char *tst)
> +{
> +       struct tcp_ao_getsockopt all_keys[FILTER_TEST_NKEYS] = {};
> +       struct tcp_ao_getsockopt filtered_keys[FILTER_TEST_NKEYS] = {};
> +       socklen_t len = sizeof(struct tcp_ao_getsockopt);
> +
> +       fetch_all_keys(sk, all_keys);
> +       memcpy(&filtered_keys[0], filter, sizeof(struct tcp_ao_getsockopt));
> +       filtered_keys[0].nkeys = FILTER_TEST_NKEYS;
> +       if (getsockopt(sk, IPPROTO_TCP, TCP_AO_GET_KEYS, filtered_keys, &len))
> +               test_error("getsockopt");

I think the following two checks would be better s/test_error/test_fail/.
The difference between _error() and _fail() is that for the later
exit() is not called, which allows the person running the test to
gather all "not okay" cases.
So, in tcp_ao selftests I used _error() only for failures where
nothing meaningful could be done afterwards, i.e. memory allocation or
socket() creation.

> +       if (filtered_keys[0].nkeys != nexpected)
> +               test_error("wrong nr of keys, expected %u got %u", nexpected,
> +                          filtered_keys[0].nkeys);
> +       if (compare_mkts(expected, nexpected, filtered_keys, filtered_keys[0].nkeys))
> +               test_error("got wrong keys back");

^ in those two it seems to be better to do
: test_fail("...")
: goto out_close;

which would allow to go through other "filter" and "duplicate"
selftests even if one of the "filter" tests has failed.

[..]
>  static void *client_fn(void *arg)
>  {
>         if (inet_pton(TEST_FAMILY, __TEST_CLIENT_IP(2), &tcp_md5_client) != 1)
>                 test_error("Can't convert ip address");
>         extend_tests();
>         einval_tests();
> +       filter_tests();
>         duplicate_tests();
>         /*
>          * TODO: check getsockopt(TCP_AO_GET_KEYS) with different filters

^ please, remove the related TODO comment, I think you just fixed it :-)

Thank you for the patch,
             Dmitry
