Return-Path: <SRS0=J4w3=L4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E49C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Jul 2021 14:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BF4613E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Jul 2021 14:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7BF4613E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DE983A56;
	Sun,  4 Jul 2021 14:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATi6TbTr5L_w; Sun,  4 Jul 2021 14:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9B8D3834F1;
	Sun,  4 Jul 2021 14:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7138AC001A;
	Sun,  4 Jul 2021 14:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F9FBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 14:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E50B4014F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 14:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KldMSstWaxTz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 14:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ADFA400FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 14:03:26 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id i42so2512515vkr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Jul 2021 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBspm/BlVrYCvD2/PgUixtAdfPPqsF72ctK925L56Wc=;
 b=lc1LmfjctBzKJNjKLR7QVzRXzvkDICIDyMrYxrN6y5PwKmmAy6WJMPG5oIp+mrsbE3
 XQ2/F31H5tEilzpFWH+jZPPxkOLpsutS/DpuKwoUzY9qDxb2ipYStnabEPwNTNSwEVHz
 Ko9YLgIXfMIRjbRF4uOgoFZ7hZ+bJdcZMJ0urItEc619PEEx1ZAO0l3c+Bzdj0S1/SnM
 Qt98R3v/DaEi0/MPNkDbAWkmam24FQHrhUBsY9goYzCPST14diqxaFcm3b2yvRykULGZ
 oxFwXcxsoXIz+ia5Lk3MsPVxAGSquH9myTASmYxsdSEkGsa+1kalucIIT2GGU+swgI5A
 N99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBspm/BlVrYCvD2/PgUixtAdfPPqsF72ctK925L56Wc=;
 b=MLSuEQDDoVFhcHKXGZBbfTuVPK+7qHX8OvCagFsjfE+CbveoyDzikJxr8pg5dTXxTv
 swq23dHBiGVaEUltDPNKQ2beSl6nhqmQszeDSkIsRFM6klRnEyEYpPQman3NiGuKubR9
 SxMNqFS6fVitZYYKRxTxKie2CJ41vZ6Ztc0hLYBii03b4Zyr1SB3EMToV17XxZTzsEyd
 RLoJ8q1oKOr+3bi6arNQTqVkHp+9C0zSl1CiEnmkSVFrTxAapkVSA0JOkNshxeJeIpjA
 phuW/MXlySRNJWFq0pgSucF194uHZrL91xFtueluKSRGqA32V2I8oBPOOcnxxH6H1e/l
 MAbg==
X-Gm-Message-State: AOAM532882V7YBbYeOn8Wk3MK+IcMApVLJaTaeCP5c66NaeadkViuGRK
 fFvdmzEnDUe+MNvzUjzbSRcXOdSjBito8fgvdT4H8g==
X-Google-Smtp-Source: ABdhPJytYsHbTrFOlrsisLYRSoTTuDDGUpSkgbxQLUklvl9NvDcJPMoaAHHy6mtBNB9vJmqcpiJooThRYrXLq62DZ+o=
X-Received: by 2002:a1f:dfc1:: with SMTP id w184mr5658047vkg.17.1625407404796; 
 Sun, 04 Jul 2021 07:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210703093417.1569943-1-phind.uet@gmail.com>
 <20210703.144945.1327654903412498334.davem@davemloft.net>
In-Reply-To: <20210703.144945.1327654903412498334.davem@davemloft.net>
Date: Sun, 4 Jul 2021 10:03:08 -0400
Message-ID: <CADVnQykHuUTw82Fu6XNXJaX-vmep3UN0kvxdwvqcE--2+xAs5A@mail.gmail.com>
Subject: Re: [PATCH v4] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: David Miller <davem@davemloft.net>
Cc: songliubraving@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, yyd@google.com, ycheng@google.com, kuba@kernel.org,
 kpsingh@kernel.org, yhs@fb.com, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kafai@fb.com,
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
From: Neal Cardwell via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Neal Cardwell <ncardwell@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Jul 3, 2021 at 5:49 PM David Miller <davem@davemloft.net> wrote:
>
> From: Nguyen Dinh Phi <phind.uet@gmail.com>
> Date: Sat,  3 Jul 2021 17:34:17 +0800
>
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 7d5e59f688de..855ada2be25e 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
> >               tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
> >       tp->snd_cwnd_stamp = tcp_jiffies32;
> >
> > -     icsk->icsk_ca_initialized = 0;
> >       bpf_skops_established(sk, bpf_op, skb);
> >       if (!icsk->icsk_ca_initialized)
> >               tcp_init_congestion_control(sk);
>
> Don't you have to make the tcp_init_congestion_control() call unconditional now?

I think we want to keep it conditional, to avoid double-initialization
if the BPF code sets the congestion control algorithm and initializes
it. But that's relatively new and subtle, so it might be nice for this
patch to add a comment about that, since it's touching this part of
the code anyway:

-       icsk->icsk_ca_initialized = 0;
        bpf_skops_established(sk, bpf_op, skb);
+       /* Initialize congestion control unless BPF initialized it already: */
        if (!icsk->icsk_ca_initialized)
                tcp_init_congestion_control(sk);

neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
