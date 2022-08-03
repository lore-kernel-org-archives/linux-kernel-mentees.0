Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBEDC19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 04:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92EE408AE;
	Wed,  3 Aug 2022 04:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92EE408AE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D6kV0fC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxl0qXwwMHMD; Wed,  3 Aug 2022 04:11:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8C0C40499;
	Wed,  3 Aug 2022 04:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C0C40499
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD18EC0032;
	Wed,  3 Aug 2022 04:11:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0806C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85933410C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85933410C0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6kV0fC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjjrBiG3TJq5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:11:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CCF0409A7
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CCF0409A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 04:11:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id tk8so29259180ejc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 02 Aug 2022 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBcWLfOi59Zr0OA6U2ZttJvd4WsA8un2MakZZH/LgV0=;
 b=D6kV0fC3rK/LOD5m0hcWijn1wlfGGcZssoqodkcTn+/Cm0HOeSQ4TfcZ1qjI0He4+Z
 ZexOIfLUrcDA0spFK3yGySsBVibEV++GmmBTY8WEdFt52uNemXA+mxP7srG48R9TGX2T
 0DeXhTkxTzUM4WG5IrLgNaK7oNAS7/95/uj+VOXGeP06ioEb9dK2gtDrAx5P1lwHEJz4
 A0HorGO9TB0SMac2TPz3RSVKmGJkCBY/02IVX/TSXeV9A3eCpFtuXS5IIpPUi5LArKH+
 nhXWlhiM7K+vBGdFzg3cc1DpmXwts8Z95jLd87uu2XYwKUMXVMUvIDnUAHiz8VtAPksP
 gcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBcWLfOi59Zr0OA6U2ZttJvd4WsA8un2MakZZH/LgV0=;
 b=aStJZXmmY+LYuQB+Z7DgVFOeGRLSq55lcyjW7b37OGEMHYbCyfqRB3f9VeemD6EgBO
 HPRL/UjKPE8W8ebiUHrwWGjO9bpaZthEc3b3FTBKdp5oYUN5uD6ss7K+ZHe4fdMPx5bL
 XrRfJDfq8ADQjfQFWoD1OJ5VrMMbZ5DPgB9cG11Zg0PgQhNqvUhtm2MYBWsazM6HZJaA
 w++y+s/BvuYRDFua223kKfRzP+vPXD9bTRadcYpCwVQsdcTHhq9ClSXomvN0UWPlmbsR
 3IC5nNAWiA1HasfRrXKCdry4Ixnc/tPU3gG//S01Nq+rpm14DSgAMuWQ6cfYUBu+MbYu
 dKQg==
X-Gm-Message-State: AJIora9TvaxtnlaNsBsUHCJT0m3zbNgm/jBsRORxXaCQC4qf0iE3eKjh
 M0/x8PfEwS0Kvaznek8mr0V3WQRd0tFkFs6DGQ0=
X-Google-Smtp-Source: AGRyM1soNFypQaJtvjgXMvAEI6HJEv2aCgoO8EqtElH6QUrSikaWdCRfoInwTfCYEKKwn0F52DRoiLdyScRVZ84K0XQ=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr18505734eji.203.1659499861920; Tue, 02
 Aug 2022 21:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
 <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
 <20220801161642.GA1932489@berlinger>
 <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
In-Reply-To: <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Tue, 2 Aug 2022 21:10:50 -0700
Message-ID: <CANX2M5aK5HED2R=VyXGw9osEn3MoX=sRjH9x2i8WvGcM8VFhrg@mail.gmail.com>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
To: Siddh Raman Pant <code@siddh.me>
Cc: Eric Dumazet <edumazet@google.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Mon, Aug 1, 2022 at 11:49 AM Siddh Raman Pant <code@siddh.me> wrote:
>
> On Mon, 01 Aug 2022 21:46:42 +0530  Dipanjan Das <mail.dipanjan.das@gmail.com> wrote:
> > Are you referring to the reproducer attached to our original report?
> > https://lore.kernel.org/all/CANX2M5bHye2ZEEhEV6PUj1kYL2KdWYeJtgXw8KZRzwrNpLYz+A@mail.gmail.com/
>
> Yes, I meant the reproducer you gave.
>
> I suspect I must have missed CONFIG_WATCH_QUEUE=y while setting the kernel
> up, extremely sorry for it.
>
> I now tried 5.10.y with it (using a modification of syzkaller's dashboard
> config I had been using[1]), and I'm getting a __post_watch_notification()
> crash (which is a related crash, as the fix[2][3] for that causes the
> reproducer to not reproduce the post_one_notification crash on mainline),
> but not the post_one_notification() crash you had reported. It seems if I
> apply my patch, it doesn't trigger this related crash, so these bugs are
> seem to be very related maybe due to racing? I haven't looked at that yet.
>
> I then tried on v5.10.131 since that was the exact version you had
> reproduced on, and it reproduces the post_one_notification() error
> successfully. Applying 353f7988dd84 causes __post_watch_notification()
> crash, and then applying this v3 patch does not trigger the issue, but
> the patch to fix __post_watch_notification() crash is [2], which does
> not really address the issue of post_one_notification() crash which
> is due to the dangling reference to a freed pipe.
>
> Can you please try reproducer at your end?

We can confirm that the repro triggers the `post_watch_notification`
crash on 5.10.134 (7a62a4b6212a7f04251fdaf8b049c47aec59c54a). After
applying your v3 patch, the repro did not trigger the bug.

>
> [1] https://gist.github.com/siddhpant/06c7d64ca83273f0fd6604e4677f7c0d
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e64ab2dbd882933b65cd82ff6235d705ad65dbb6
> [3] https://lore.kernel.org/linux-mm/18259769e5e.52eb2082293078.3991591702430862151@siddh.me/



-- 
Thanks and Regards,

Dipanjan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
