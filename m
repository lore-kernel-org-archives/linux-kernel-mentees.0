Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800F5C11F65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 18:25:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DAB6113A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 18:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DAB6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E204983BE3;
	Wed, 30 Jun 2021 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFU7xndiNybU; Wed, 30 Jun 2021 18:25:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B4C0825C7;
	Wed, 30 Jun 2021 18:25:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E86E8C001A;
	Wed, 30 Jun 2021 18:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54F84C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 18:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 428C16080F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 18:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qOatMKNa-Ya
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 18:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C024607FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 18:25:33 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so4936507pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RvDcmONdyX10LsCogZh526Ob3MOiNIiyAoMdUbjNYVY=;
 b=IhbSgoSqRJnLgBW0+P9Yus/OfADtejJOvJioaPlYT8TnMYVhk6wKXe0dviexFIDz2h
 3SL1aYsFBV3h4QiJ/oV2RbIQEnScB7ta/T4Agx85ImkxggVv7u/rLnHbEpUFH4usl1R0
 D8tEgceKFC1b+hFoD6roduWWlKQX0JEfEflfQ/vvOqZhxvD9mg9c7ZTNq+fNg6/vw9gU
 ll0k9nWkbHckQFPWm9tV0cD+qzn1TDfJdp3RrdqU8mZw6Otv3fckMn/7irfUOVZvGRlV
 1r65NAenCEvmS1A94qFcKBIPBpNqD6WioQSyKJTJtsmZi/BqxuT4T16UZ8y6O12j6vUz
 s40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RvDcmONdyX10LsCogZh526Ob3MOiNIiyAoMdUbjNYVY=;
 b=oi0zmnq+qv2nZamyhPGx9g3X18YC3i6FhtQ2YD7g+luvPMjyQSW7HszVdA1CGuc3Px
 cD9RGV9lSoVH21Ex/ag5YK8UwF8sv2o+WLgjFwY6+keBgDdsnl5ZvnjD19mgS67RS355
 jziGXZLN8G2YCRmY3PuuHNI600Axa/O1FcPDpMh2bk7LUjNY3NUnFWJpLBp1rub+FgJe
 e5XdHRWamFLuv1QnptD8piNkZXzp4IhNm+bdn6fhDcgAyiIgLl5qDXYvQUrkTAmUSXN6
 SSAO/tWhhuh9NGPwld8LNNZ6XIaM56TBFjp0kI7+V9/oekKlhXhqy6/2P1j7ScSqOVXo
 qyTw==
X-Gm-Message-State: AOAM530JxLE3sh5UX2KKAx5NE0XXbCfgwo1LNDXOb3scKCvHRjeCRsEk
 BNnZak4nN/0SiNn6U4diFh0=
X-Google-Smtp-Source: ABdhPJyTWwng5BNPKZMORDtd68eMkisMZMmSgfZ9BQ8f9UMeX7EpBKiEVBUHIZRyaJOGP40V3igW9g==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr41618840pjn.212.1625077533070; 
 Wed, 30 Jun 2021 11:25:33 -0700 (PDT)
Received: from [192.168.93.106] (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id c24sm20423489pfn.86.2021.06.30.11.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 11:25:32 -0700 (PDT)
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Neal Cardwell <ncardwell@google.com>, Eric Dumazet <edumazet@google.com>
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
 <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
 <CANn89iJbquZ=tVBRg7JNR8pB106UY4Xvi7zkPVn0Uov9sj8akg@mail.gmail.com>
 <1786BBEE-9C7B-45B2-B451-F535ABB804EF@gmail.com>
 <CANn89iK4Qwf0ezWac3Cn1xWN_Hw+-QL-+H8YmDm4cZP=FH+MTQ@mail.gmail.com>
 <CADVnQyk9maCc+tJ4-b6kufcBES9+Y2KpHPZadXssoVWX=Xr1Vw@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <30527e25-dd66-da7a-7344-494b4539abf7@gmail.com>
Date: Thu, 1 Jul 2021 02:25:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADVnQyk9maCc+tJ4-b6kufcBES9+Y2KpHPZadXssoVWX=Xr1Vw@mail.gmail.com>
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, kpsingh@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 6/29/2021 11:59 PM, Neal Cardwell wrote:
>    On Tue, Jun 29, 2021 at 8:58 AM Eric Dumazet <edumazet@google.com> wrote:
>  From my perspective, the bug was introduced when that 8919a9b31eb4
> commit introduced icsk_ca_initialized and set icsk_ca_initialized to 0
> in tcp_init_transfer(), missing the possibility that a process could
> call setsockopt(TCP_CONGESTION)  in state TCP_SYN_SENT (i.e. after the
> connect() or TFO open sendmsg()), which would call
> tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend
> to reset any initialization that the user had already explicitly made;
> it just missed the possibility of that particular sequence (which
> syzkaller managed to find!).
> 
>> Although I am not sure what happens at accept() time when the listener
>> socket is cloned.
> 
> It seems that for listener sockets, they cannot initialize their CC
> module state, because there is no way for them to reach
> tcp_init_congestion_control(), since:
> 
> (a) tcp_set_congestion_control() -> tcp_reinit_congestion_control()
> will not call tcp_init_congestion_control() on a socket in CLOSE or
> LISTEN
> 
> (b) tcp_init_transfer() -> tcp_init_congestion_control() can only
> happen for established sockets and successful TFO SYN_RECV sockets
Is this what was mentioned in this commit ce69e563b325(tcp: make sure 
listeners don't initialize congestion-control state)

> --
> [PATCH] tcp: fix tcp_init_transfer() to not reset icsk_ca_initialized
> 
> This commit fixes a bug (found by syzkaller) that could cause spurious
> double-initializations for congestion control modules, which could cause memory
> leaks orother problems for congestion control modules (like CDG) that allocate
> memory in their init functions.
> 
> The buggy scenario constructed by syzkaller was something like:
> 
> (1) create a TCP socket
> (2) initiate a TFO connect via sendto()
> (3) while socket is in TCP_SYN_SENT, call setsockopt(TCP_CONGESTION),
>      which calls:
>         tcp_set_congestion_control() ->
>           tcp_reinit_congestion_control() ->
>             tcp_init_congestion_control()
> (4) receive ACK, connection is established, call tcp_init_transfer(),
>      set icsk_ca_initialized=0 (without first calling cc->release()),
>      call tcp_init_congestion_control() again.
> 
> Note that in this sequence tcp_init_congestion_control() is called twice
> without a cc->release() call in between. Thus, for CC modules that allocate
> memory in their init() function, e.g, CDG, a memory leak may occur. The
> syzkaller tool managed to find a reproducer that triggered such a leak in CDG.
> 
> The bug was introduced when that 8919a9b31eb4 commit introduced
> icsk_ca_initialized and set icsk_ca_initialized to 0 in tcp_init_transfer(),
> missing the possibility for a sequence like the one above, where a process
> could call setsockopt(TCP_CONGESTION) in state TCP_SYN_SENT (i.e. after the
> connect() or TFO open sendmsg()), which would call
> tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend to reset
> any initialization that the user had already explicitly made; it just missed
> the possibility of that particular sequence (which syzkaller managed to find).

Could I use your commit message when I resubmit patch?

Thank you.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
