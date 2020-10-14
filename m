Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B9DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 17:46:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38C82072C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 17:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0XaLtHU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B38C82072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FFDB87DB4;
	Wed, 14 Oct 2020 17:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPbWvnjo4F9y; Wed, 14 Oct 2020 17:46:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 653E587D9C;
	Wed, 14 Oct 2020 17:46:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52351C07FF;
	Wed, 14 Oct 2020 17:46:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31EF2C1AD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2002C880E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Klu52OCJmlq1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9F7E880C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:46:10 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id 67so3354029ybt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5AZaJPXWNDGZWzFZgqpQzEpS7MiNSjgYXkkad50wZ1Q=;
 b=X0XaLtHUBCZXGIw9YSO+4kWV6USf0yRc+mINuIu/T4o98a49SjvTmCWQwhTxue34Fb
 CnuAAf/bSpAAQFwsfdT5HYwoiVOs5a3PIBQRiP1H2d5sVTll824hB0095J7Sp4J/8r2m
 rQRjgFuKS8hZk8aEwooDyK9RiIlbEFRvN7+1e22mZV/MKnNeZWVo5tWd/X9ndc1rEkT5
 hJPk6z7RA5z/kfwdCNhS8nFwPOL3A63970ahMyNzCRPztC4c7hffV/098g3iqJYxzVVv
 vTVDGVXFDiA5yN4w34mbfuGGYFnvFkSFwNk2McqzRV5O5BKKDxAFFKxUzzV8qSQbVTwS
 qY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5AZaJPXWNDGZWzFZgqpQzEpS7MiNSjgYXkkad50wZ1Q=;
 b=L0UHilFhL1dPbYHon3NENImVyXmw8j7Eld6y/HoO9+nOJcbc688UJ3J1CJerloBYzo
 gm2U2NGvbZBposQNZUez5nFS9of25i7j6KByOLs32UidSQ+IXBOqwB1CiHTtgSGI1LWB
 qWnFHZk/l4oUN9gvZXU4UVauXb78q6hV14TBJD4NWZw0bopRpg377SX02cQfBC3Kscsb
 ht8pb54Pg3b9wHM0CRbXoiz3FXBMmyYMaXvrz1CJTpZgKWbgcylaWRhmE2aGsXI+Dl2r
 FxvVib25Ld1nPBBVl9Z+t34aNjZNHzw4hPvCEz5vTrUgGJ72/QB7+lWtbXM2+M6Bw0nR
 PImQ==
X-Gm-Message-State: AOAM531srhK7rXYPhF8SU3LaGSR1cDtMrqRO1RJJqr1DIP4rm7xCXy/T
 WNfayFJX7c2wGr2HfDCABIN+TQBT4EpsGZPbp+Q=
X-Google-Smtp-Source: ABdhPJybo4M4wILi8aUvrZUMVA77tOrm4EF2DKDFZi5wTOxS0hIiTSmpgjZBHrTkVY9K41xrkX47WCCbtn2qT78J6Ws=
X-Received: by 2002:a25:3b4b:: with SMTP id i72mr816775yba.22.1602697569839;
 Wed, 14 Oct 2020 10:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
In-Reply-To: <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2020 19:45:59 +0200
Message-ID: <CANiq72kogiVbBURCrb74_vCPCLb09LGTudxE-QG8US7pX8LqQw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Wed, Oct 14, 2020 at 10:40 AM Joe Perches <joe@perches.com> wrote:
>
> Eek no.
>
> Mindless use of either tool isn't a great thing.

That is up to opinion. I (and others) definitely want to get to the
point the kernel sources are automatically formatted, because it has
significant advantages. The biggest is that it saves a lot of time for
everyone involved.

> Linux source code has generally be created with
> human readability in mind by humans, not scripts.

Code readability is by definition for humans, and any code formatter
(like clang-format) is written for them.

> Please don't try to replace human readable code
> with mindless tools.

Please do :-)

> There is a _lot_ of relatively inappropriate
> output in how clang-format changes existing code
> in the kernel.

Sure, but note that:

  - Code that should be specially-formatted should be in a
clang-format-off section to begin with, so it doesn't count.

  - Some people like to tweak identifiers or refactor code to make it
fit in the line limit beautifully. If you are doing that, then you
should do that for clang-format too. It is not fair to compare both
outputs when the tool is restricted on the transformations it can
perform. You can help the tool, too, the same way you can help
yourself.

  - Some style differences may be worth ignoring if the advantage is
getting automatic formatting.

Cheers,
Miguel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
