Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FBDC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 12:05:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF8B22409
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 12:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM+YtojM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF8B22409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC8D086103;
	Tue,  3 Nov 2020 12:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOXObZaJu7Zw; Tue,  3 Nov 2020 12:05:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96C1B86099;
	Tue,  3 Nov 2020 12:05:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AB18C088B;
	Tue,  3 Nov 2020 12:05:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA390C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2D508701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM60tAyWTyC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 67E5F86FB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:05:35 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o129so14019931pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoUtQrJSQRYVKiicQfT9b8FMAZeeb+zxod1LbaNVVzE=;
 b=WM+YtojMtExY2bSx1rZgI2jNzAxVBzt+gQy5d6FlFB2ZQ2+tYra7w3xUImdiB+4aCf
 74xlNxvl1zafd+USLWhF854/j/ZmXaeNwS2v68wzLERsUozQD9eavP6APlj9hD/95GCf
 e5WhrwGzr9L0hAv7c8dBT4ZJAZ1AZkXA0byYWy7vGhF6pkyEQBvC0gk7Zya6rn5Gitmx
 0QouET8V/OMgrTYTGYgfO4eYvYyRBauKwGxZuULll1gOABkJJO547wTYFsrCF8wTZsl+
 7T0XRiHLRwTWQbA9BYv4YkX+abx1uCKY4dleuVBYPVruBvQi1tKqVeKpHfCUPUfRPq0L
 VEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoUtQrJSQRYVKiicQfT9b8FMAZeeb+zxod1LbaNVVzE=;
 b=YhQTKbuQAzmV9hJ+ijni77vFvUAq3e/OF/MakxzgIflm+4w5CtkL52Cxi3fDF2e7mm
 VF/dC0AQjbfdGBiNPjCeu4w2uUMI8l9xCOqnjgdFQ806TB/RFgF8cpkPGWQd2OV+4Inx
 QxugyYLsBSSpsJA85tI5DhbSK/GelklTm3q5IwdS8F4wqHzn1aTk2SrtvtDdHGL+nDt2
 FMwo7D8G22DWZxxkpHm49Qjgri99youvj0+F5pGFVPhMHw2Fqpq6vNpn51IyVwmwGJEJ
 vojagfxWCrbcC7qSjP8K9xxU++WI//BIO6BURdBTUauKv0lQa4oNBkquA8f6TBWgqw1n
 uwdA==
X-Gm-Message-State: AOAM532ac7FjyZtrXUOl5eeKY1GKA/u/wK6OjXPUVoTdvNFekUePRVFG
 fNwQ7+PNqNkY9eLU2hQthxaZMBHMwPUI/Itj+Fc=
X-Google-Smtp-Source: ABdhPJxUO60AuqbTEpZJUSjqUhnIPjXMPgP8GNKeKA0lClIJQEIZVlsw/a1hRyj6/h1KU1n4Q3C6NkqxI7vqhDJ0z/0=
X-Received: by 2002:a05:6a00:850:b029:18a:a8ce:d346 with SMTP id
 q16-20020a056a000850b029018aa8ced346mr16078623pfk.73.1604405134945; Tue, 03
 Nov 2020 04:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com>
In-Reply-To: <20201103115223.GA268796@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2020 14:06:23 +0200
Message-ID: <CAHp75Vcw8Hyaks9ZbRfz7HhBzPM2cJxR4ypye5PwcZqY9rsYhA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_printf.c to
	KUnit
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

On Tue, Nov 3, 2020 at 1:54 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:

...

> > Better, indeed.
> >
> > But can be this improved to have a cumulative statistics, like showing only
> > number of total, succeeded, failed with details of the latter ones?
>
> Is that the proper test output format?  We have a standard...

I dunno. I'm asking...
We have few possibilities here: a) let it go like above, b) use the
cumulative statistics, c) if there is no such available, implement and
use it, d) ...

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
