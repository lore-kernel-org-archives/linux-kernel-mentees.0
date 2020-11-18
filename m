Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97F9C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:12:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097F4221EB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMOEWUFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097F4221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5137D872A5;
	Wed, 18 Nov 2020 19:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSynGRNgeH-S; Wed, 18 Nov 2020 19:12:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D06D3872A1;
	Wed, 18 Nov 2020 19:12:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAAE6C0800;
	Wed, 18 Nov 2020 19:12:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7EEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 59E0C872A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kyo53svEzv8e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BE6C3872A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:12:14 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id j12so3255331iow.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 11:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OYLtYz4v2zyoba6JoYMaPc0SPGsdhyjt+lz3tw2+EQ=;
 b=IMOEWUFSinohvLBUOFb6OvDAKGa7j7f7zHmtpgLjlyqg8iI4QHyH06ciXySy1FR4qr
 4daklntUMZKIEPGYmNBdHH9djG7IkMb1wHZ3FITsyHEpS+tOvzyR/AGYQrLT4nIGdapb
 vaz5TL7eHtfib7w6Y2GuochGlnugaGdau+MHd8Dgs04zZtgeNFWZ+5rCgzLhoSStMMBW
 GLPfYSIl/XabVaW1vD/vPkiaDc43v0hVxoHIaTtNnGnWGb3ech3yTL2TXxiy4Ea29gf2
 HESnskEIw7Fooyje75DMpO3kLeCIIMElEVVyq9Ne9PnCNXx9M+dosslnzaBKvUFfUfNp
 T/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OYLtYz4v2zyoba6JoYMaPc0SPGsdhyjt+lz3tw2+EQ=;
 b=ebJq8SqJBancuH4QVpxP+5WLrH9IFr6QOLKmjhiB6rJJzsNXECJ/IoEYA1U/8h58kD
 143qvdYnaUfSN8WeTAwMlrNmS6IqtntzhOXJbDo0gEbp4JEqWvRXUpSD2eyIZPuhl5iW
 0M27zRdaiPnD+t2pxaDlDQbHW7aUQornCX1ez2QM936mNs0usMIr/LRhTptkkcPvw3ZM
 86c8S9LIt6LjF1W0YQHZu2NhEFnn87CzIPyoT6i2BRVQ42n70QhUflWqvnfkTDqcJkXu
 7Wz0sWs/Tw4oD5dCOXFYc91ztQfBEGbSLsItem8AMavQ4FtjpHHHVYHu4EEAA60YPRHy
 OTbg==
X-Gm-Message-State: AOAM533krCTprLOP+5ak4vX45HYrMyPj+XO95XaRAjJlP5bOEvAUKy4x
 VO/s/yvB8GuXR+DSknELu0hl7maAiqrMAnTdxpE=
X-Google-Smtp-Source: ABdhPJxDpEaQLycDybYKsKh+xzFqg4Kvxh4rgy89R5Nnj4BUjyAvw0k8luFncR2GUrcRSUwFPO4TLvl6DPrOn0nBLC0=
X-Received: by 2002:a05:6638:41a:: with SMTP id
 q26mr9968107jap.27.1605726734151; 
 Wed, 18 Nov 2020 11:12:14 -0800 (PST)
MIME-Version: 1.0
References: <1fa76103-e32c-0443-dde1-9ac4fc45f79a@gmail.com>
In-Reply-To: <1fa76103-e32c-0443-dde1-9ac4fc45f79a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 18 Nov 2020 20:12:02 +0100
Message-ID: <CAKXUXMyFRUoDortm8mozyOhNTAyqtZ4WEXzkX26Vvd9zsnPutA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Adding doc for parse-maintainers.pl
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
Content-Type: multipart/mixed; boundary="===============2396859518887650762=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2396859518887650762==
Content-Type: multipart/alternative; boundary="00000000000098753705b466636b"

--00000000000098753705b466636b
Content-Type: text/plain; charset="UTF-8"

On Mi., 18. Nov. 2020 at 19:02, Aditya <yashsri421@gmail.com> wrote:

> Hi Sir
> So, I tried finding doc where to add documentation for
> parse-maintainers.pl and MAINTAINERS.
> I think the only place we have documentation related to MAINTAINERS is
> here:
> https://www.kernel.org/doc/html/latest/process/maintainers.html
>
> Or https://www.kernel.org/doc/linux/MAINTAINERS
>
> Maybe we should add the changes at the end of this section:
>
> https://www.kernel.org/doc/html/latest/process/maintainers.html#descriptions-of-section-entries-and-preferred-order
>
> ie at the end of "Descriptions of section entries and preferred
> order", something like: You can achieve this desired order using
> /scripts/parse-maintainers.pl
>
>
> What do you think/suggest?
>

That is good.

We can more documentation on parse-maintainers in a new separate page.

Lukas


> --
> Thanks
> Aditya
>

--00000000000098753705b466636b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mi.=
, 18. Nov. 2020 at 19:02, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com=
">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Hi Sir<br>
So, I tried finding doc where to add documentation for<br>
<a href=3D"http://parse-maintainers.pl" rel=3D"noreferrer" target=3D"_blank=
">parse-maintainers.pl</a> and MAINTAINERS.<br>
I think the only place we have documentation related to MAINTAINERS is<br>
here:<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/maintainers.html"=
 rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/html/lates=
t/process/maintainers.html</a><br>
<br>
Or <a href=3D"https://www.kernel.org/doc/linux/MAINTAINERS" rel=3D"noreferr=
er" target=3D"_blank">https://www.kernel.org/doc/linux/MAINTAINERS</a><br>
<br>
Maybe we should add the changes at the end of this section:<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/maintainers.html#=
descriptions-of-section-entries-and-preferred-order" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.kernel.org/doc/html/latest/process/maintainers.h=
tml#descriptions-of-section-entries-and-preferred-order</a><br>
<br>
ie at the end of &quot;Descriptions of section entries and preferred<br>
order&quot;, something like: You can achieve this desired order using<br>
/scripts/<a href=3D"http://parse-maintainers.pl" rel=3D"noreferrer" target=
=3D"_blank">parse-maintainers.pl</a><br>
<br>
<br>
What do you think/suggest?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That is good.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">We can more documentation =
on parse-maintainers in a new separate page.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><br>
--<br>
Thanks<br>
Aditya<br>
</blockquote></div></div>

--00000000000098753705b466636b--

--===============2396859518887650762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2396859518887650762==--
