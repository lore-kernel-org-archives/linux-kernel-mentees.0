Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085DDCCA480
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Jul 2022 08:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76036421F2;
	Sat,  9 Jul 2022 08:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76036421F2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DB2/3U2e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWmCElX81NV5; Sat,  9 Jul 2022 08:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23BBF421F5;
	Sat,  9 Jul 2022 08:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BBF421F5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B54E9C0035;
	Sat,  9 Jul 2022 08:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3D77C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F0241715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 08:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F0241715
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DB2/3U2e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTcKUdG0ZvHI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 08:37:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4AFB4018A
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4AFB4018A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 08:37:04 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id bf13so776970pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 09 Jul 2022 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1d0xQDbiqOm4xHoNeGRYZWlXM5lvmpFGoowlPoRlBA=;
 b=DB2/3U2eialrjaOb0mFGoJCvEh30k7ZpSf0bS/bJRkpOecubVOPJ9q6Gmo+aZMgLsm
 7MMReC546VXEc7FLVxwcl7zJjaS5Q2ATFqbOKtXxs9nb8/eSKBwXANFMW0YM2DEpRLqh
 /npF9+9k4u78BKkvKmOKi6V5adNoEzmpV3ET3G/uLrWjvqOuao8Dp8mhj8jKRINK0ncd
 pwHB2rJgO7ekyIkhJUyH0JO1inoVG1JjvH/pIunUKQoZTvCltyJMPVjp3X4ttWyq88kc
 ia+UudsmvyU210rVKaeAorx4+wfQ3CxdfqYbgnYFVMN/6+3ijbsn4bVKMJ9y9e/lXoIc
 GQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1d0xQDbiqOm4xHoNeGRYZWlXM5lvmpFGoowlPoRlBA=;
 b=f37XeJ/Fm9zJJRI4wOO3egD6xhKx9JhqT/+rt4dNMwCNR2Cz7JBxoONONBKtQYIulp
 Nx9vj2tCabVw5KFNMiPqWBOjET9qRp/ZavZ20cwd/yc5JFLrAuNcsrwcHqQeLjevp9rP
 gKT5PS+5cjo8viPtMTfsMh3BP8MoksEg/+jjGymINC0lXK0c0/TG7PRcB38QcfXIQRiY
 0nvwaj40/naLfoB/6iedDwBFTE0v30Ohv6F1rlD4Q34D5JnR4u0pMHvzUpsk5lf8ePxi
 VG0kwdXr3w+iJYnPj8TONB+ycL9jstlNznBSdVQVHdGfgc9dyt0BMEyaaPP6NNYid2O8
 RcIw==
X-Gm-Message-State: AJIora8HK/tPcu3Y2STxTbQTF1Wzfi6xAyp3BoTuieeNmAGSR15ekrfu
 7+2uDEfXtPqcd+U0EEhWY4A=
X-Google-Smtp-Source: AGRyM1sYkaJbnS/KJOVYg78AEzQOMDdoEzoud2ZtojUlPutt7DIF/hUo0iBBBgpH2Z28qeRz/4MR0g==
X-Received: by 2002:a05:6a00:84d:b0:525:3ce6:9c33 with SMTP id
 q13-20020a056a00084d00b005253ce69c33mr7777463pfk.47.1657355823800; 
 Sat, 09 Jul 2022 01:37:03 -0700 (PDT)
Received: from ubuntu.lan (pcd364232.netvigator.com. [203.218.154.232])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a65554a000000b004126f1e48f4sm685439pgr.20.2022.07.09.01.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 01:37:03 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: kuba@kernel.org
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Date: Sat,  9 Jul 2022 16:36:42 +0800
Message-Id: <20220709083641.2060-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708200602.1059bc09@kernel.org>
References: <20220708200602.1059bc09@kernel.org>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 kgraul@linux.ibm.com, guwen@linux.alibaba.com, bpf@vger.kernel.org,
 kafai@fb.com
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

On Sat, 9 Jul 2022 at 11:06, Jakub Kicinski <kuba@kernel.org> wrote:
> On Sat,  9 Jul 2022 10:46:59 +0800 Hawkins Jiawei wrote:
> > Reported-and-tested-by: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
> > Signed-off-by: hawk <18801353760@163.com>
> > ---
> >  net/ipv4/tcp.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index 9984d23a7f3e..a1e6cab2c748 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -3395,10 +3395,23 @@ static int do_tcp_setsockopt(struct sock *sk, int level, int optname,
> >       }
> >       case TCP_ULP: {
> >               char name[TCP_ULP_NAME_MAX];
> > +             struct sock *smc_sock;
> >
> >               if (optlen < 1)
> >                       return -EINVAL;
> >
> > +             /* SMC sk_user_data may be treated as psock,
> > +              * which triggers a refcnt warning.
> > +              */
> > +             rcu_read_lock();
> > +             smc_sock = rcu_dereference_sk_user_data(sk);
> > +             if (level == SOL_TCP && smc_sock &&
> > +                 smc_sock->__sk_common.skc_family == AF_SMC) {
>
> This should prolly be under the socket lock?
>
> Can we add a bit to SK_USER_DATA_PTRMASK and have ULP-compatible
> users (sockmap) opt into ULP cooperation? Modifying TCP is backwards,
> layer-wise.

Thanks for your suggestion, I also agree that modifying TCP directly
is not wise.

I am sorry that I can't follow you on haveing ULP-compatible
users (sockmap) opt into ULP cooperation, yet adding a bit to
SK_USER_DATA_PTRMASK seems like a good way.

I plan to add a mask bit, and check it during sk_psock_get(),
in v2 patch

>
> > +                     rcu_read_unlock();
> > +                     return -EOPNOTSUPP;
> > +             }
> > +             rcu_read_unlock();
> > +
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
