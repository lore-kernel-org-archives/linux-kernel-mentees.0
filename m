Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E560EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 05:18:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D69F2070B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 05:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxMlVgPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D69F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FDA087686;
	Sun, 12 Jul 2020 05:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVFInvcPt4e4; Sun, 12 Jul 2020 05:18:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ECD10875BB;
	Sun, 12 Jul 2020 05:18:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBA95C088E;
	Sun, 12 Jul 2020 05:18:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93BD9C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 05:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 81DA2892A9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 05:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XoD+hONULoa
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 05:18:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0027D89296
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 05:18:48 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mn17so4574323pjb.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 22:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vMkB/vYykPUxsy4eqke1s40AT3GF2OLCCc3V5bFXrRQ=;
 b=oxMlVgPue3QkZOgpDyZRGzlpcDv4ULzRSbHQEHwK1yj3JJbhxJreEm/uVDk4ley9LL
 vtzGzRtZp0Uccoiy9SgrDQ8gwWuvFvDbZe7z5pyKiBccRgviuUB+elhkkHiRPer0D66D
 DJI9h4VoWHPGwdUUGJfM2ja1ntmX0injdmGwqgSsm0m/Zw0MbCTIuzF7CPz7yn7k0wPg
 gO5+yzwRu09ustx3Ye5BkNlbRNqQAi06G/5PegdLZziAjjuG6APwodbWVE3QcmP1zmzD
 GtQNoJPw5ksscuxv3lx7yTycu7Nl74CAJMyLAIkpzKH4A69zxZ4RVeFdHoQV/RgFX6wd
 Z+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vMkB/vYykPUxsy4eqke1s40AT3GF2OLCCc3V5bFXrRQ=;
 b=QyLmZg3KffK4rZLSdHno70jeQkPCD/18XEp21EaERz45o+AmoYcFSTDnGX8P6Fa3d6
 Ejnr1Vw4bVhfzNrzIgNvKJ3USSRjq0DjxiQqPNGKVi+uPfCPrhWPd2HXcR9OQxM8eWly
 NtIYUhqI7Ak+B4FdSOr7iRmVzXsx4+f/qvRhVY1dSYmEAQEEU3D7QBprwsmqTlTFSosw
 /+yOd8I9mAZStk3IXvHU6re5S/SKId5Bpl/TzYo99PLsgdmzyDEL/w+7xRGtLdEIjzO3
 F6udecrp9dgHZ+RQIZXYmRLcyJpGG8Ff/WLGESVnF72pXVCJtJq3p/CpkuqD368DFOWp
 Vikg==
X-Gm-Message-State: AOAM5317FLMOJ9nXJM50RMpA8kScx5LTV2bfndDmOcO/VM8QFbzZRonA
 Ftsl4eWQqZShB1iQITI1IZ8n4KC30H233SZw7yA=
X-Google-Smtp-Source: ABdhPJw4m7ggQ+z+EEkdv4K2lr5nlwein7jVtjr6m3whAMoUFCIuE91bYZe81wXPjcryOm9xCEd9KCobkThtJo35Q0w=
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr65452478plb.235.1594531128461; 
 Sat, 11 Jul 2020 22:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
 <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
In-Reply-To: <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Sun, 12 Jul 2020 10:48:37 +0530
Message-ID: <CAD1=X6kLBAAMqMH+bZipagmVq4XHx4LOVB=yUb1J870NgXMCUg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org, 
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============2927323964944407597=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2927323964944407597==
Content-Type: multipart/alternative; boundary="0000000000007ecdd505aa37b5be"

--0000000000007ecdd505aa37b5be
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 12, 2020 at 12:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>
>> The usage of "capture group (...)" in the immediate condition after `&&`
>> results in `$1` being uninitialized. This eventually crashes the script.
>>
>>
> It does not really crash it, right? It just emits a warning.
>

Sir,

Yes. I will modify the line accordingly.

>
>
>> Fix this by placing the capture group in the condition before `&&`.
>> Thus, `$1` can be initialized to the text it matches thereby setting it
>> to the desired and required value.
>>
>>
> Maybe you can look when this bug was introduced?
>

The bug was first introduced with the commit `e518e9a59ec3` when the block
was
added to the script. It has been like that since then.
Should I add this detail too in the commit message?

>
> Lukas
>

--0000000000007ecdd505aa37b5be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Jul 12, 2020 at 12:44 AM Lukas Bu=
lwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, J=
ul 11, 2020 at 5:44 PM Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.=
com" target=3D"_blank">mrinalmni@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">The usage of &quot;capture group =
(...)&quot; in the immediate condition after `&amp;&amp;`<br>
results in `$1` being uninitialized. This eventually crashes the script.<br=
>
<br></blockquote><div><br></div><div>It does not really crash it, right? It=
 just emits a warning.</div></div></div></blockquote><div><br></div><div>Si=
r,</div><div><br></div><div>Yes. I will modify the line accordingly.<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Fix this by placing the capture group in the condition before `&amp;&amp;`.=
<br>
Thus, `$1` can be initialized to the text it matches thereby setting it<br>
to the desired and required value.<br>
<br></blockquote><div><br></div><div>Maybe you can look when this bug was i=
ntroduced?</div></div></div></blockquote><div><br></div><div>The bug was fi=
rst introduced with the commit `e518e9a59ec3` when the block was</div><div>=
added to the script. It has been like that since then.</div><div>Should I a=
dd this detail too in the commit message?<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=
<br></div><div>Lukas</div></div></div>
</blockquote></div></div>

--0000000000007ecdd505aa37b5be--

--===============2927323964944407597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2927323964944407597==--
