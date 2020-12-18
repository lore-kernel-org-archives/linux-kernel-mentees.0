Return-Path: <SRS0=3x+R=FW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44501C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 16:23:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F2A2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 16:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F2A2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4841D8790F;
	Fri, 18 Dec 2020 16:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIAZz3dn-_pG; Fri, 18 Dec 2020 16:23:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A7DD87904;
	Fri, 18 Dec 2020 16:23:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40846C1787;
	Fri, 18 Dec 2020 16:23:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C3D6C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0332987925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dzUZc6J1c6p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:23:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52DE58790D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:23:35 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id n4so2511836iow.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NRfIXwsdZJuaeHMyPuVYYjFi8mbwUro0YAZaUUIeC8Y=;
 b=BnxJT8PFdmxE+5TdqpL28Gh4aniU9UYpmti0u8K9umKWlMpag8GceN0k/znHc3E0ho
 ig7ecr6Iev5Z7W/WZ/hLU3TJ3l+JsPY1loW1HjqQhEcQnShSljYRiJX+4F3WOpg5w1Nx
 IicouICSyksMWLyynSzIzsXgPUp38izhIJAMHdgQhBigldayKt65YMIlPHDDeHf/FVgV
 gy0gFKda8LXFf6hLjOkyL+KTQqVHYBkypOV8xq6FUukwDcBJ/I3RHZpVcCVqzzuKgrU/
 CaJKXtQ4ss1UHYwzxvs9Pf2lLf/u99bcZUsHMPq4eHrAvfONwud8XSWI1eP9EqZ57R6K
 fbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NRfIXwsdZJuaeHMyPuVYYjFi8mbwUro0YAZaUUIeC8Y=;
 b=lG9VBmET/LvFgOh2ay1o7boon1a0xZ+gKn7pRmpVtxyCX7poBG1xQCZTJj4y+zRviC
 rk5IkBYM8q8KNTz136859FUlvDw+8x28TCFyJEk7Vqmw2/3GcoUS29NuQIKdO4nr1fv4
 FaN1JlbVl6opHzVPUttJJe2d6LRgYI70KmXhaKob+7XvLh0ClxMpIxA72E5CsGkxznQd
 zw7U961ghre/2w1Wk+V3RfKX50t/KeUGd8AjzqpguuazSPtHTqDkdSsqeqgcv6qI9tEP
 zM/nlmmgev4D0tRpNcuHqO51JuPOay7wmomW0c3LEcZ03AJ/NsmjOIckwOu2vIoUPyBg
 bbUQ==
X-Gm-Message-State: AOAM532UtBWHkIytkGpp8wCcYpSYJAZyH/bzPGH2z1EwKMGWWKOSYDix
 evEWLPTjQ1mVnNfIfm4EE7Xx1SEjs6SpP2To1YU=
X-Google-Smtp-Source: ABdhPJyLqAf1uXmw0PQyMfdKYQ1byGlXTlPUn36BCg7aTtQg8lpXbD1lKPdLN4/fFfInVXIeBtwWT5P6ikEAFD9iVDE=
X-Received: by 2002:a02:5581:: with SMTP id e123mr4345945jab.98.1608308614644; 
 Fri, 18 Dec 2020 08:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20201217195902.67041-1-dwaipayanray1@gmail.com>
 <CABJPP5BcUxzH7KmBXkTLh9V3r40AQQinWdzb-NA_4dDRZDe3MQ@mail.gmail.com>
In-Reply-To: <CABJPP5BcUxzH7KmBXkTLh9V3r40AQQinWdzb-NA_4dDRZDe3MQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 18 Dec 2020 17:23:24 +0100
Message-ID: <CAKXUXMx9qyBDpYRAZgy_s+wkfAzwYiSVgV_JAcNebNy7XUmW8Q@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: mod: cleanup a few
	checkpatch.pl warnings
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
Content-Type: multipart/mixed; boundary="===============2974934707046710721=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2974934707046710721==
Content-Type: multipart/alternative; boundary="000000000000aa495c05b6bf8761"

--000000000000aa495c05b6bf8761
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 3:36 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> On Fri, Dec 18, 2020 at 1:29 AM Dwaipayan Ray <dwaipayanray1@gmail.com>
> wrote:
> >
> > Cleanup some warnings reported by checkpatch.pl to make
> > the code more in line with the kernel coding style.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------------
> >  1 file changed, 83 insertions(+), 73 deletions(-)
> >
>
> Lukas, If you have no problem with this cleanup patch, could I send it
> out to the maintainers?
>
>
You can do that, but be aware that this might be rejected and maintainers
generally dislike these "only code style fixup" patches and might not take
them.

I would rather like to see us making some progress on the tool to run
clang-format on patches and experiment a bit more with that.

Lukas


> Thank you,
> Dwaipayan.
>

--000000000000aa495c05b6bf8761
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 3:36 PM Dwaip=
ayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com" target=3D"_blank">d=
waipayanray1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Fri, Dec 18, 2020 at 1:29 AM Dwaipayan Ray &lt;<a =
href=3D"mailto:dwaipayanray1@gmail.com" target=3D"_blank">dwaipayanray1@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Cleanup some warnings reported by <a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> to make<br>
&gt; the code more in line with the kernel coding style.<br>
&gt;<br>
&gt; Signed-off-by: Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail=
.com" target=3D"_blank">dwaipayanray1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------=
------<br>
&gt;=C2=A0 1 file changed, 83 insertions(+), 73 deletions(-)<br>
&gt;<br>
<br>
Lukas, If you have no problem with this cleanup patch, could I send it<br>
out to the maintainers?<br>
<br></blockquote><div><br></div><div>You can do that, but be aware that thi=
s might be rejected and maintainers generally dislike these &quot;only code=
 style fixup&quot; patches and might not take them.</div><div><br></div><di=
v>I would rather like to see us making some progress on the tool to run cla=
ng-format on patches and experiment a bit more with that.</div><div><br></d=
iv><div>Lukas</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Thank you,<br>
Dwaipayan.<br>
</blockquote></div></div>

--000000000000aa495c05b6bf8761--

--===============2974934707046710721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2974934707046710721==--
