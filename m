Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8D8C11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 12:28:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB3561D8B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 12:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB3561D8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F3B82AC8;
	Tue, 29 Jun 2021 12:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FScJrQ6KruB8; Tue, 29 Jun 2021 12:28:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6428982983;
	Tue, 29 Jun 2021 12:28:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34922C001C;
	Tue, 29 Jun 2021 12:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E194EC0010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C4D606E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObW2Atf4YG_t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:28:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E428160592
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:28:25 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id q91so1079461pjk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=za4Y7630P8OYpKUpgNl6rrMIGOh/MhQGVvlgtl3zsCs=;
 b=QnTo3TD2vtvIsP+5AD1ZK2/zUTSArat8iK7DrLOlztVyIY1XhUOtKTPw86G2zVemrq
 ouKl7BDa9iLBpVv2ZQfd9xxgXUpEAyehaJahtv9+F87rVQX5JXDsehri/enTtXsrlwmt
 GGrKPU8o55bhNNpuOdxZvFpp3IqtsHDkyIUiCXgOCTxD8b8IA7qs4LO0a973dUjLFG6f
 6kCEa1b2Y3CY6ZLcLv15UddTZ1i6rnv8s4tYWDOzCm9MY3qQrReh8FykZphlJiRro+y4
 jgW2ay+W5GhCtzOfX0QeJ51ZqgOJNO6dpZ8a4MPEhr+YcN9eeKW2UziUp96hD9So5+LK
 IgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=za4Y7630P8OYpKUpgNl6rrMIGOh/MhQGVvlgtl3zsCs=;
 b=pjT2ZwTLL5jeyND94Uy5cHSIVCMKBj16EckaobRWR59eUPaj2XFqGF6TYMK4mS0lUr
 fc1hPQ4M82r6YUBZ6X+9+EA8ShuX3uPdtvJo4IT7bxcfIlP7rS1FDtSRzP5NFEKHWmty
 bu9xiJo+D/j3wINZWEDnIA8wrLqw3WZk1wUhKBEycRky8Pkl/zOeua77D2We8p50/E2g
 MZKVCtGDWsi63/nDGsBNHFgohqYi3cE2OiilkflBSVFrptzImi8StZD0cVaOSxy30i2S
 DJT9xYaQoesAOFkugIJl1i8uiI2LJUYN1EOYd6JwwGLcuYLVu+B7GkwB5Tyh6muUVagL
 TZSw==
X-Gm-Message-State: AOAM532bKAPMvLSKu711vEE1KsMiCYFmw1srmMNZ8/1RIcMRQRpp/W54
 vgyKOIFHr3qkO0cLwf1l9To=
X-Google-Smtp-Source: ABdhPJy6DLWhMPC49sYZCSKVrs6ztehkeKvKDBXaSm8tUFDnq+Kxu9ImATUp+Z5kOpRE56ufptFqww==
X-Received: by 2002:a17:902:a70c:b029:118:7b47:e5bf with SMTP id
 w12-20020a170902a70cb02901187b47e5bfmr27676238plq.9.1624969705086; 
 Tue, 29 Jun 2021 05:28:25 -0700 (PDT)
Received: from [10.122.117.192] ([183.90.37.214])
 by smtp.gmail.com with ESMTPSA id c68sm17423218pfc.75.2021.06.29.05.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 05:28:24 -0700 (PDT)
Date: Tue, 29 Jun 2021 20:28:20 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CANn89iJbquZ=tVBRg7JNR8pB106UY4Xvi7zkPVn0Uov9sj8akg@mail.gmail.com>
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
 <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
 <CANn89iJbquZ=tVBRg7JNR8pB106UY4Xvi7zkPVn0Uov9sj8akg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Eric Dumazet <edumazet@google.com>
From: Nguyen Dinh Phi <phind.uet@gmail.com>
Message-ID: <1786BBEE-9C7B-45B2-B451-F535ABB804EF@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, kpsingh@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 Neal Cardwell <ncardwell@google.com>, David Miller <davem@davemloft.net>,
 LKML <linux-kernel@vger.kernel.org>,
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

On June 29, 2021 4:21:59 PM GMT+08:00, Eric Dumazet <edumazet@google.com> wrote:
>On Tue, Jun 29, 2021 at 9:17 AM Nguyen Dinh Phi <phind.uet@gmail.com>
>wrote:
>>
>> On June 29, 2021 1:20:19 AM GMT+08:00, Neal Cardwell
><ncardwell@google.com> wrote:
>> >)
>> >
>> >On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen <phind.uet@gmail.com>
>wrote:
>> >>
>> >> On 6/29/2021 12:24 AM, Neal Cardwell wrote:
>> >>
>> >> > Thanks.
>> >> >
>> >> > Can you also please provide a summary of the event sequence that
>> >> > triggers the bug? Based on your Reported-by tag, I guess this is
>> >based
>> >> > on the syzbot reproducer:
>> >> >
>> >> >
>>
>>https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
>> >> >
>> >> > but perhaps you can give a summary of the event sequence that
>> >causes
>> >> > the bug? Is it that the call:
>> >> >
>> >> > setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
>> >> > &(0x7f0000000000)='cdg\x00', 0x4)
>> >> >
>> >> > initializes the CC and happens before the connection is
>> >established,
>> >> > and then when the connection is established, the line that sets:
>> >> >    icsk->icsk_ca_initialized = 0;
>> >> > is incorrect, causing the CC to be initialized again without
>first
>> >> > calling the cleanup code that deallocates the CDG-allocated
>memory?
>> >> >
>> >> > thanks,
>> >> > neal
>> >> >
>> >>
>> >> Hi Neal,
>> >>
>> >> The gdb stack trace that lead to init_transfer_input() is as
>bellow,
>> >the
>> >> current sock state is TCP_SYN_RECV.
>> >
>> >Thanks. That makes sense as a snapshot of time for
>> >tcp_init_transfer(), but I think what would be more useful would be
>a
>> >description of the sequence of events, including when the CC was
>> >initialized previous to that point (as noted above, was it that the
>> >setsockopt(TCP_CONGESTION) completed before that point?).
>> >
>> >thanks,
>> >neal
>>
>> I resend my message because I accidently used html format in last
>one. I am very sorry for the inconvenience caused.
>> ---
>> Yes, the CC had been initialized by the setsockopt, after that, it
>was initialized again in function tcp_init_transfer() because of
>setting isck_ca_initialized to 0.
>
>"the setsockopt" is rather vague, sorry.
>
>
>The hard part is that all scenarios have to be considered.
>
>TCP flows can either be passive and active.
>
>CC can be set :
>
>1) Before the connect() or accept()
>2) After the connect() or accept()
>3) after the connect() but before 3WHS is completed.
>
>So we need to make sure all cases will still work with any combination
>of CDG CC (before/after) in the picture.
>
>Note that a memory leak for a restricted CC (CDG can only be used by
>CAP_NET_ADMIN privileged user)
> is a small problem compared to more serious bug that could be added
>by an incomplete fix.
>
>I also note that if icsk_ca_priv] was increased from 104 to 120 bytes,
>tcp_cdg would no longer need a dynamic memory allocation.
>
>Thank you.

Hi, 
I will try to see whether I am able to get the full sequence. I am also affraid of making a change that could affect big part of the kernel.
About CDG, how we can get rid of dynamic allocation by increasing icsk_priv_data to 120? because I see that the window size is a module parameter, so I guess it is not a fixed value. 
Because the problem only happens with CDG, is adding check in its tcp_cdg_init() function Ok? And about  icsk_ca_initialized, Could I expect it to be 0 in CC's init functions?

Thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
