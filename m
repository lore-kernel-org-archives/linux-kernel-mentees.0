Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E4EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 20:45:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477882074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 20:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477882074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F614885E5;
	Thu, 30 Jul 2020 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vgm+rLSAxjdp; Thu, 30 Jul 2020 20:45:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FF79885DC;
	Thu, 30 Jul 2020 20:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52EE9C0050;
	Thu, 30 Jul 2020 20:45:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18097C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 020CD885E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 20:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XsocGOnHiBa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 20:45:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A9A1B885DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 20:45:22 +0000 (UTC)
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEFnP-1jtF5G2z13-00AAy6 for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Jul 2020 22:45:19
 +0200
Received: by mail-qt1-f175.google.com with SMTP id o22so21177430qtt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 13:45:19 -0700 (PDT)
X-Gm-Message-State: AOAM5326E9e1iUxfhdbqpRxJv7MllHQyHWgMPbohYETb/Fn78IZ+5Cv6
 IQb5nPtX64lwgFvnf0BcqYJ56aPg1PSVgttSp2w=
X-Google-Smtp-Source: ABdhPJwwPO9hZwLZNagtwDmktY5mx1mcmsBMR1k9OLKFMguOZRxKmQmtyn1wb9YuRx7t2pYE3m7tLxnTNippxiVQFmY=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr527498qtq.7.1596141918397;
 Thu, 30 Jul 2020 13:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <20200729115157.8519-1-yepeilin.cs@gmail.com> <20200729125820.GB1840@kadam>
 <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
 <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
 <202007301056.D3BD1805B0@keescook>
In-Reply-To: <202007301056.D3BD1805B0@keescook>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 22:45:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2oUgdaYicdHwWvCY-HqjrcBAEzYA5yc5Gw14RLLoLdug@mail.gmail.com>
Message-ID: <CAK8P3a2oUgdaYicdHwWvCY-HqjrcBAEzYA5yc5Gw14RLLoLdug@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Provags-ID: V03:K1:/QTnPEZMRypQ7gL46bn/b6Rqt1z53W9N6KXwP0u5bfRLhsrbbKW
 V1chqf3myfomaaYy5OXMU3e8F9ZhQ0MEb7P7b4PkFCShB5Rt5r6eQvfRIwmDzGa9C3wvw66
 C152dVG8Zyo/EX3aafo9hN1xRMJmgHCY6b8LOt9ZGZzhK/E96y9J1WBFKKPRFaBQpk3upwj
 /n3+/mqsjxfxwO9/CpIkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MEc0J9BN61M=:cunkXolTm0s2dwdlwHSZpG
 4UOCkX+7dTPMkrJvt1fTlgxFKZW3GQL4K5rlNMZPIkN0YUk6D2xueP/mUDvG+FfvdP8KDLROL
 GWsIeq9Xr65ZSR/uRSi+R/B5QTFnOKydqqBK8rkfSGvzklaBFZOIn6wCnYctNFB4ptjyLm4q1
 8X5RwXNh71OoQqeiErz1WLNdPJsnbuawHFdhf9NTrNnmn2xr5Fmq7PoWsVXzv4qcEL12Isydc
 OvjhCANI1HlMcUmJJ/ALncQUzR/hSv3PdiIVuCrkgLczcCOdISoePxDuCLyQ/Pe6QdjgbFEM4
 RoTGLS4A1Q8szRjo21g3ww1cqfeP0bh/FfG4hcgwJTS4WQ7xPGxxtmgQCAejiBnXrIPBDSdv6
 fxKB/D4Bb25pFTvCZheRW1jd27XKKL4zK/OFyblldpAIyu5GI+ukIWGbOZnvuzci8QQ+PcHnz
 VMFXr9+r/9Z4SJzQGFSzdL4K3BniFH++bP0IXF1gUwRFoxlkSFFP0Z7mCZ46A2ISi+WmH3bOL
 HruIIfhV5MpkSwBdWV7fouDzlHypOgFMhEahCETP14rydGt6dI9LfMSrQqFO0aBhvm7/1zmIJ
 31AamycOEJVzhoHHR2/qVK3LmK9Mm2GVs1Md1dKS8Zk02r40gFotVlHlZErOzXiTVbBK+eb5Q
 LpYVK90Gur2jpfhB4XwpeXm8sNX1wcAOYBuZAmQYUMtsP54aL7Q2rmdqZbKLEQy85gieczYQF
 Vae0F8X5NCvrbftawatTBBiePRDl4xdnOYCBRpVjBvuU/cCvFyBFry31VcL+Qu76wGdfZb4bS
 RzHmSliSpHlUI59k5tqCFYvYN/7CBev2pEazUtxgORJu3vE6Feniw+1LWBGK7KG1+L9GToQ
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Denis Efremov <efremov@linux.com>, linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
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

On Thu, Jul 30, 2020 at 8:10 PM Kees Cook <keescook@chromium.org> wrote:
> On Thu, Jul 30, 2020 at 10:11:07AM +0200, Arnd Bergmann wrote:
>
> test_stackinit.c intended to use six cases (where "full" is in the sense
> of "all members are named", this is intentionally testing the behavior
> of padding hole initialization):

Ok, so I read that correctly, thanks for confirming.

> >
> >    struct test_big_hole var = *arg;
>
> So this one is a "whole structure copy" which I didn't have any tests
> for, since I'd (perhaps inappropriately) assumed would be accomplished
> with memcpy() internally, which means the incoming "*arg"'s padding holes
> would be copied as-is. If the compiler is actually doing per-member copies
> and leaving holes in "var" untouched, that's unexpected, so clearly that
> needs to be added to test_stackinit.c! :)

For some reason I remembered this not turning into a memcpy()
somewhere, but I can't reproduce it in any of my recent attempts,
just like what Denis found.

> > or the a constructor like
> >
> >   struct test_big_hole var;
> >   var = (struct test_big_hole){ .one = arg->one, .two=arg->two, .three
> > = arg->three, .four = arg->four };
> >
> > Kees, do you know whether those two would behave differently?
> > Would it make sense to also check for those, or am I perhaps
> > misreading your code and it already gets checked?
>
> I *think* the above constructor would be covered under "full runtime
> init", but it does also seem likely it would be handled similarly to
> the "whole structure copy" in the previous example.

I would assume that at least with C99 it is more like the
"whole structure copy", based on the standard language of

  "The value of the compound literal is that of an unnamed
  object initialized by the initializer list. If the compound literal
  occurs outside the body of a function, the object has static
  storage duration; otherwise, it has automatic storage duration
  associated with the enclosing block."

> I will go add more tests...

Thanks!

         Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
