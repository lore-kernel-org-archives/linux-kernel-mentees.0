Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB37C433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:20:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F49D20775
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pesu-pes-edu.20150623.gappssmtp.com header.i=@pesu-pes-edu.20150623.gappssmtp.com header.b="N+phtonw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F49D20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 383C8875F0;
	Mon, 27 Jul 2020 05:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfjFf8HNjSQs; Mon, 27 Jul 2020 05:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39F8E875EB;
	Mon, 27 Jul 2020 05:20:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25E4FC004F;
	Mon, 27 Jul 2020 05:20:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20EF0C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0C21585C54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_UoWgrMCuBl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:19:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0AB3885C52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:19:56 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 140so8285612lfi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ozt9OYkcD6AjbMEqO1NrB1cTbEGxVehRnBtW5ShPGTE=;
 b=N+phtonw/dLSV8xFacy0xHc1wofpvI9z3iQxJQwYwoEXtwfSpEPSi1hVNut4CuuvW1
 tanKnHYJGp/zyWkmdRyClrxB5CGH6z9xpKgkuxzTJXXwJrUbarnS4POKJaxuECOuWYUV
 uYFbWVBoP1grcT0vbngIsGoi9q6ukeITNW4mBpFW2za6vClqsSRwvtXr2TXr4RtaeOg5
 ObpwnkCcJO1mvVGlsxSsGTOfw1i5zrdqGzOnaZzKjB9MXRn7Y4M8NfLExIZfcWRiqP8Q
 EsMyHuOoeU3hvws/PJX+CcFfGH7bV+1ZTtF3cwkaBMdoiMVtAIgnkxDNar79iUtG+ADU
 fR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ozt9OYkcD6AjbMEqO1NrB1cTbEGxVehRnBtW5ShPGTE=;
 b=cSSm2XmvBbUTQdVmV1sff/FrdLJC4kopEdIMtq6LGwgd19I78OuRlEc/J0KUERrMRB
 NPu6A69xSnyWYqVbPN+coFheC5iShVK7A3+22uruJETsZFFJFTcw3U5U6lpho6ATi7l5
 3lhEFZXpBVe0Ndt7Ygh3ot/8GZYLhLW3/G0ifYjZOWpMHOg6PJ86InnbecdxKU+hJd74
 ExMz8pKIIgoSoAhU3h8nlQW1nHkWeJT9tT5Idh3YyZ2wjVnV9xlpw7wkiVVv8l4Ng0aM
 nK1YP2+DkaRFAZlXuOD7u5MX9eOfu0PfURDYOEacW9plPyfsuoQnKMsHifyo6UXeVVqk
 7Mxw==
X-Gm-Message-State: AOAM533naDzu+0y6mXC/Y/N94Tsr3KJt3YWOfgXc4HuvtUl/hb7xpueQ
 nfPAc/k//BnxCtXwgcHxVC96KbOyP5F/44Pp5Rxzyw==
X-Google-Smtp-Source: ABdhPJztlE0965bqCYFX7suGiujXvJJ3ywyoZaR6TB+veUzG5oUH+5xrRYioBMIf1tP3Ihlkzp5YBmatVk9njhY+7vw=
X-Received: by 2002:ac2:4144:: with SMTP id c4mr10880776lfi.118.1595827194783; 
 Sun, 26 Jul 2020 22:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200726030855.q6dfjekazfzl5usw@pesu.pes.edu>
 <CAM_iQpUFL7VdCKSgUa6N3pg7ijjZRu6-6UAs2oNosM-EzgXbaQ@mail.gmail.com>
 <CAAhDqq28h9_ji=ANttUyx2Q1Md=bZD3-JVCwQRW06W7aikPN0A@mail.gmail.com>
 <CAM_iQpX+iw+5AALriNZLfx5P-LV_ratiwhMRiHXmuLE2z81aaw@mail.gmail.com>
In-Reply-To: <CAM_iQpX+iw+5AALriNZLfx5P-LV_ratiwhMRiHXmuLE2z81aaw@mail.gmail.com>
From: B K Karthik <bkkarthik@pesu.pes.edu>
Date: Mon, 27 Jul 2020 10:49:43 +0530
Message-ID: <CAAhDqq3kf-XPB5nEEr76YOT=DifuCWM4HagB9R7brs1TaDbzZw@mail.gmail.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: ipv6: fix use-after-free
	Read in __xfrm6_tunnel_spi_lookup
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

On Mon, Jul 27, 2020 at 1:37 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Sat, Jul 25, 2020 at 11:12 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
> >
> > On Sun, Jul 26, 2020 at 11:05 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
> > >
> > > On Sat, Jul 25, 2020 at 8:09 PM B K Karthik <bkkarthik@pesu.pes.edu> wrote:
> > > > @@ -103,10 +103,10 @@ static int __xfrm6_tunnel_spi_check(struct net *net, u32 spi)
> > > >  {
> > > >         struct xfrm6_tunnel_net *xfrm6_tn = xfrm6_tunnel_pernet(net);
> > > >         struct xfrm6_tunnel_spi *x6spi;
> > > > -       int index = xfrm6_tunnel_spi_hash_byspi(spi);
> > > > +       int index = xfrm6_tunnel_spi_hash_byaddr((const xfrm_address_t *)spi);
> > > >
> > > >         hlist_for_each_entry(x6spi,
> > > > -                            &xfrm6_tn->spi_byspi[index],
> > > > +                            &xfrm6_tn->spi_byaddr[index],
> > > >                              list_byspi) {
> > > >                 if (x6spi->spi == spi)
> > >
> > > How did you convince yourself this is correct? This lookup is still
> > > using spi. :)
> >
> > I'm sorry, but my intention behind writing this patch was not to fix
> > the UAF, but to fix a slab-out-of-bound.
>
> Odd, your $subject is clearly UAF, so is the stack trace in your changelog.
> :)
>
>
> > If required, I can definitely change the subject line and resend the
> > patch, but I figured this was correct for
> > https://syzkaller.appspot.com/bug?id=058d05f470583ab2843b1d6785fa8d0658ef66ae
> > . since that particular report did not have a reproducer,
> > Dmitry Vyukov <dvyukov@google.com> suggested that I test this patch on
> > other reports for xfrm/spi .
>
> You have to change it to avoid misleading.

I will do that once somebody tells me this patch is reasonable to
avoid wasting people's time.
>
> >
> > Forgive me if this was the wrong way to send a patch for that
> > particular report, but I guessed since the reproducer did not trigger
> > the crash
> > for UAF, I would leave the subject line as 'fix UAF' :)
> >
> > xfrm6_spi_hash_by_hash seemed more convincing because I had to prevent
> > a slab-out-of-bounds because it uses ipv6_addr_hash.
> > It would be of great help if you could help me understand how this was
> > able to fix a UAF.
>
> Sure, you just avoid a pointer deref, which of course can fix the UAF,
> but I still don't think it is correct in any aspect.

I saw a function call being made to tomoyo_check_acl(). the next thing
happening is a kfree().
Also, spi_hash_byspi just returns spi % XFRM6_TUNNEL_SPI_BYSPI_HSIZE .

I'm a mentee, hence I would say my knowledge is very limited, please
let me know if I am making a horrible mistake somewhere,
but return (__force u32)(a->s6_addr32[0] ^ a->s6_addr32[1] ^
a->s6_addr32[2] ^ a->s6_addr32[3]); seems like a better because
as David S. Miller <davem@davemloft.net> said "It is doing a XOR on
all bits of an IPv6 address, it is doing more bit shifting which the
existing hash was ignoring" .

Please help me understand this better if I am going wrong.

>
> Even if it is a OOB, you still have to explain why it happened. Once
> again, I can't see how it could happen either.
>
> >
> > >
> > > More importantly, can you explain how UAF happens? Apparently
> > > the syzbot stack traces you quote make no sense at all. I also
> > > looked at other similar reports, none of them makes sense to me.
> >
> > Forgive me, but I do not understand what you mean by the stack traces
> > (this or other similar reports) "make no sense".
>
> Because the stack trace in your changelog clearly shows it is allocated
> in tomoyo_init_log(), which is a buffer in struct tomoyo_query, but
> none of xfrm paths uses it. Or do you see anything otherwise?

Aren't there indirect inet calls and netfilter hooks? I'm sorry I do
not see anything otherwise.
Please help me understand.

thanks,

karthik
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
