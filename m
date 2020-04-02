Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F47C2BA18
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 20:23:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0639F20857
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 20:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgwsxnSt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0639F20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D67AA881E9;
	Thu,  2 Apr 2020 20:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvrtrJ04euH7; Thu,  2 Apr 2020 20:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A51688177;
	Thu,  2 Apr 2020 20:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A34CC1D74;
	Thu,  2 Apr 2020 20:23:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 898B7C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7930687561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tVTaiPxvoX5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:23:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E985287557
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:23:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ng8so1996870pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Apr 2020 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TyQdsQSbBekp4Tdk1LegDdgAtaR9xk0x84j7nnBO4Kw=;
 b=XgwsxnStrGVZljq9SxBCE9sZD3SzpuVDfCZcZGyeTerRmyBZ7Ye3fIj1J6qq1DnDme
 cKLLxHm5g/RCFeHqs1PZ7aFVrG+CqT2Hbi2w4hB68Xhmb09P3zzs1FQuNOqOpaBbZ48X
 xm4BhkUdu1MNzujbKWsFIUUjyGEBgYA+jlt6tOxXV32nisrkGJmkaWTYM0ZQbMwzuJng
 BzZyTcY/SQgBojOF259ApOWdN1W0gaRfieuvMOaAy/XLrIk4sJZoOmhypzdHDhsXCWek
 1jhxQVYy8pcGGNBvdXjmdJXSSRbXxSxGy3uG1+XLINRjnSOV7wZyJikpJ9T9Cp33gEm0
 +59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TyQdsQSbBekp4Tdk1LegDdgAtaR9xk0x84j7nnBO4Kw=;
 b=Zyv6p2ENsWbVwGdKZYP6AePKa+E+8CCi6Ba6GpWpFPP+3apgLa4UEsOq8CTO5DyFG7
 52yuS4FUkjDz/J2EsmlLc59e8lYkruQXoWaJbcwTRKl79dZ1av3lIcWcjzjYge2zbX5O
 qAHHJWEwK9sz3jAeiaV49vNxsvWXeVN1Q5SALu8/PzufWU/ak34llgY6Y3y2HzLb4jlo
 lfbJbY0jPEwQ6rB84s1/7cx7VHPkoyG0FamLn6sR+3kInzedSwdV81bFUsuiJWddLRle
 tnr+KzSkiizSHcGIgXO4cpFvtmz9gIoSW311Qhkiag814BuL22MU9Fcxp8kN2UVDJw97
 a/Zw==
X-Gm-Message-State: AGi0PuZ25Z3+MeY761k3/ef1dWtq9o0cB1iuZxQ+j8UP/F7HLFCEJzDn
 ECPMlL3WYjskFF8OkB4wsAbrzm6RT3sbc74sC/E=
X-Google-Smtp-Source: APiQypLfuJPn0GImSHOwLx7gpgYSjhE+LbCob9VHH6QqhJQ7dg98xJ/CCAB4Et4B3KkzbJe4j6qJiJLdtfvDYUAbfP4=
X-Received: by 2002:a17:902:5acb:: with SMTP id
 g11mr4727427plm.18.1585859019364; 
 Thu, 02 Apr 2020 13:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
 <20200402201605.GA74927@google.com>
In-Reply-To: <20200402201605.GA74927@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2020 23:23:27 +0300
Message-ID: <CAHp75Vfpj+ENMe9u-SMKfvCsyFtOucUT9bD3qfWX+QjccZ9ZyQ@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: andy@kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
	dev_pm_ops
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

On Thu, Apr 2, 2020 at 11:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > >
> > > Convert the legacy callback .suspend() and .resume()
> > > to the generic ones.
> >
> > Thank you for the patch.
> >
> > Rather then doing this I think  the best approach is to unify gpio-pch
> > and gpio-ml-ioh together.
> > Under umbrella of the task, the clean ups like above are highly appreciated.
>
> I'd be all in favor of that, but what Vaibhav is working toward is
> eliminating use of legacy PM in PCI drivers.  I think unifying drivers
> is really out of scope for that project.
>
> If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
> Vaibhav move on to other PCI drivers that use legacy PM.  If we
> convert all the others away from legacy PM and gpio-ml-ioh.c is the
> only one remaining, then I guess we can revisit this :)

Then skip this driver for good.

> Or, maybe converting gpio-ml-ioh.c now, along the lines of
> 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
> step towards the eventual unification, by making gpio-pch and
> gpio-ml-ioh a little more similar.

I think it will delay the real work here (very old code motivates
better to get rid of it then semi-fixed one).
Thank you for your understanding.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
