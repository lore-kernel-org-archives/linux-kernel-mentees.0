Return-Path: <SRS0=mcle=ZR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDA0C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Nov 2019 10:48:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BEB20740
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Nov 2019 10:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="UoGRlg/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50BEB20740
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26FC285078;
	Mon, 25 Nov 2019 10:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7r4Wxu-Mxia; Mon, 25 Nov 2019 10:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E81E85070;
	Mon, 25 Nov 2019 10:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F78BC1DD7;
	Mon, 25 Nov 2019 10:48:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEACFC0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 10:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A4AAA204A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 10:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s67qfZ1MOFjZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 10:48:19 +0000 (UTC)
X-Greylist: delayed 00:06:10 by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 18087203A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 10:48:18 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i11so4751630ioi.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+B/nVdafVBM5/dMhmn3bx+mejZS7Z1pG2S9hER1tbY=;
 b=UoGRlg/aCwPzEcnNH5oLQwU1wHejhiY4zlbMgpRVenqBQYvr0oU3s1HuYXUnBOpGaZ
 jSkG26bpnd7Z+2y621l1kUW4x2gy1WCbGVL34x+sDpMld724Yz/fQsNL/MwH4bIUORuH
 SV2LudJzIm7OVSUNO+c8CxfBRDsByThe02Ibo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+B/nVdafVBM5/dMhmn3bx+mejZS7Z1pG2S9hER1tbY=;
 b=Vqa5fOafqh9UJ07Um6Sd88HkqijvgOXGDXCbQhg0gw2kOhdivqM/fxu6AKpfpT2YWu
 HYVvz3UHZMbVDy/57iLd7QHpSjk07ObcXSETzEWAWdrnl3/1hBzyTOztop1CnVP7sMwB
 5jlHqbpd9WG8S9wHGOXZgwIMMcWhsZldori3i0iUlm/JyY3AIfKWMUOiMbFlFXZDfGgx
 1iU71R/VPGSSZzzLFAymqUd/nPro6g1Rm+sEzlCOZYa/40tiyiWS/MmCwJIzTlS+ghx9
 zUlPYjkhpw9mM63AKcZyudFfB5LDKO4NiixmeGHjqrDHU5TagM7P/w0E2MvPP3rmS1FH
 S4rQ==
X-Gm-Message-State: APjAAAWctPjCyAtqnS+uzYnoPutxnKyun1XAdqtLIk9Twemmg7qSSo9U
 9PoB49JTpKX7k6m8utQc0N4/MRlGap8ZNC8VAph9WA==
X-Google-Smtp-Source: APXvYqwCxLkdsT8rBQH9Cd/qrlw5KUr81ZdbOyC/YXzhlOlZ5vfdgNrOJPgX7JYFLYBy6AmC+NrP8lZ13cYy8QnYAh8=
X-Received: by 2002:a5d:91da:: with SMTP id k26mr25050284ior.252.1574678528733; 
 Mon, 25 Nov 2019 02:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20191120192655.33709-1-dwlsalmeida@gmail.com>
In-Reply-To: <20191120192655.33709-1-dwlsalmeida@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 25 Nov 2019 11:41:57 +0100
Message-ID: <CAJfpegsxXJN1Z5fGzcv=+sid6gSzyD=KtA2omF2Xsx8dy00tRw@mail.gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert fuse to RST
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

On Wed, Nov 20, 2019 at 8:34 PM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
>
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
>
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.

Hmm, most of this document is *not* an admin-guide at all.  The only
sections that really belong in that category are "What is FUSE?" and
"Control filesystem" and maybe some of the definitions as well.   The
mount options for fuse filesystem are not generally usable for
actually performing a mount, most of those are actually internal
details of the filesystem implementation.

So I suggest leaving this file under Documentation/filesystems/ for
now and later work towards splitting out the admin-guide parts into a
separate document.

Thanks,
Miklos
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
