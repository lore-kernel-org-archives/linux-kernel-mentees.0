Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8FDC11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 07:17:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351F761DD9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 07:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351F761DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02295607C6;
	Tue, 29 Jun 2021 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VXWq-2q4JUh; Tue, 29 Jun 2021 07:17:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 243C7605FF;
	Tue, 29 Jun 2021 07:17:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05A28C001A;
	Tue, 29 Jun 2021 07:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9224AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69AC4403E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnHhMs5ACMbX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77F4640296
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:17:26 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id h4so17679005pgp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=2+Cu9SpYbGPGq/dBp+lKzry3SpkbCUR6ztL08O/s6WQ=;
 b=Umuv1mRarTEy7QYktWElHfzYOUIMQAxnUe/gAE87BfSvtXV148jd6rBS8Ul1b6lGh+
 xOYYGHOPnoX2KjubjaYmiUeyFjOrZGT8Klzmxc9S9/OH1fxWYcSx/e76lHnrhmEGU/k4
 aTd0452z6DYuwkx+UJEYnmqiLDN5FBj66uizlNWYf6pnhJTI4qO1Mh3F5rfjSEz8TCZG
 nRy31ybaRVlpCLOfEgQmBgAnGQH4jGFJXYrf2rF8Q4CzTYGKl55Rol0mUf6nz3lIaQSj
 hjDOfMgsJAy0S0nMlwPf+U2TkjBZmSCPcn7x8kYgPjUfE+O39TVekj7mJJYhcxM8Q7B9
 P/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=2+Cu9SpYbGPGq/dBp+lKzry3SpkbCUR6ztL08O/s6WQ=;
 b=RWgPEXgvMb/liT5bXoSpJAV13OnUcKylQ9tS3fZom3g2fyQQpVp39SYzhLdhXWodpW
 08qQStVL0Ub1R12cqTr0utSPmMO5ChrK9PoEa61KbQfOhlgg+yi5WKwJx3w6HZSEGOTW
 MEy948ctDThQsd+9YxwAOAG4TezO3/ExLFEYjq5+cI5jjY3iwkvj2BIiR2GkrmJrTdto
 CKFvE0ZuZPPZ/bkYpvZGam0bG5R3S1FVATc6xA6Vta59+Kf9kSAyKEMBS0r0coesy683
 LcG/hilp8T9kS3Y1hVzRrHI4SHcs9P3ngJPHU3SwqaFOxdBS8Cvvkne17OYieIinnDsH
 Y69w==
X-Gm-Message-State: AOAM531o/4FshxzFvubMd038kvT9qZKlP1NbhdEU+dR24KDC8CpLlC2/
 zOxJSPP78SxW3mf6G70pocs=
X-Google-Smtp-Source: ABdhPJzjAoL145d3X7MXU034uajL/zhC7Mwao65kP6f3NvgS2bgyLNfXBRdAW/gyqWLcWtJQzOnTlw==
X-Received: by 2002:a62:3244:0:b029:308:22b0:52ff with SMTP id
 y65-20020a6232440000b029030822b052ffmr26641060pfy.68.1624951045936; 
 Tue, 29 Jun 2021 00:17:25 -0700 (PDT)
Received: from [10.122.117.192] ([183.90.37.214])
 by smtp.gmail.com with ESMTPSA id w18sm18337383pjg.50.2021.06.29.00.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:17:25 -0700 (PDT)
Date: Tue, 29 Jun 2021 15:17:20 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Neal Cardwell <ncardwell@google.com>
From: Nguyen Dinh Phi <phind.uet@gmail.com>
Message-ID: <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yuchung Cheng <ycheng@google.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On June 29, 2021 1:20:19 AM GMT+08:00, Neal Cardwell <ncardwell@google.com> wrote:
>)
>
>On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen <phind.uet@gmail.com> wrote:
>>
>> On 6/29/2021 12:24 AM, Neal Cardwell wrote:
>>
>> > Thanks.
>> >
>> > Can you also please provide a summary of the event sequence that
>> > triggers the bug? Based on your Reported-by tag, I guess this is
>based
>> > on the syzbot reproducer:
>> >
>> >  
>https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
>> >
>> > but perhaps you can give a summary of the event sequence that
>causes
>> > the bug? Is it that the call:
>> >
>> > setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
>> > &(0x7f0000000000)='cdg\x00', 0x4)
>> >
>> > initializes the CC and happens before the connection is
>established,
>> > and then when the connection is established, the line that sets:
>> >    icsk->icsk_ca_initialized = 0;
>> > is incorrect, causing the CC to be initialized again without first
>> > calling the cleanup code that deallocates the CDG-allocated memory?
>> >
>> > thanks,
>> > neal
>> >
>>
>> Hi Neal,
>>
>> The gdb stack trace that lead to init_transfer_input() is as bellow,
>the
>> current sock state is TCP_SYN_RECV.
>
>Thanks. That makes sense as a snapshot of time for
>tcp_init_transfer(), but I think what would be more useful would be a
>description of the sequence of events, including when the CC was
>initialized previous to that point (as noted above, was it that the
>setsockopt(TCP_CONGESTION) completed before that point?).
>
>thanks,
>neal

I resend my message because I accidently used html format in last one. I am very sorry for the inconvenience caused.
---
Yes, the CC had been initialized by the setsockopt, after that, it was initialized again in function tcp_init_transfer() because of setting isck_ca_initialized to 0.
Regards, 
Phi.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
