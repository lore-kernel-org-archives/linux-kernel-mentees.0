Return-Path: <SRS0=9k96=B4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82875C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 13:00:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220FA206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 13:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXg8p5VM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220FA206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A64BD87447;
	Tue, 18 Aug 2020 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bv1qSKfxfY1m; Tue, 18 Aug 2020 13:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 905DF873BC;
	Tue, 18 Aug 2020 13:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82BC7C088B;
	Tue, 18 Aug 2020 13:00:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9372EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7648B85EA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9am7bk3N75Ja
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9493384D22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:00:27 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id r197so4273240vkf.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=h4dVOdNAvyeV+cDbPjTm+40FrkED8j0IYMnpj3Z0P6E=;
 b=lXg8p5VMfjh95ZmIpCMvSBBUEaDZeX9+NZUj+mvlA79HZfwv+6klKOED937O7u9lg8
 YZY+ZWlUWbBV7hwg4ogcOmQobBxtS1spVrTxbeHp9GYHp9twK9MGJ14A9QB4hJu/0wUv
 RQpLTc2UihFtLuBRmn3LfpJcWbxKA8qMY6pG8WhEviNjgggTxtsfgzWEESezyqRUWRod
 eTgEzdgF9MHB87vAZZer5Sm8iteaQWrhTaVxsQlW6Ap7Wu+Jdn8NYZo3N4a7Qn7Gt0uI
 mzILucmadXEIBEjqvBcr1Wm0xK+co6u042silp8R6pIlNdEKrWrlY0z38gBG6PzZxAEO
 viBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=h4dVOdNAvyeV+cDbPjTm+40FrkED8j0IYMnpj3Z0P6E=;
 b=fo9Ruvy4iPYMZCj/W0kpFkx/wskhuV0RHlnUULMxwi1H9OUm/BnylQ86aAth5qQgSZ
 Ijlhs8pZBsx+ha/pqzVuQmgs+iwkYOZRJKeIiY973+1v2+vw4tHJvdBw7+LIEk3VW+0d
 B58UDBkyB7XvOuiw7r4O0vNVEAMqrU/8urUyU5/s0yxn6tNsiIM013ChWT0rVMCAC5+n
 G8r7DLOMWBOA1eUx/PPnsKgU6hUunj4FZC7s/7nWWNB7wGUn0TTImlPwmQqnnlOD2oz2
 ijJo4L6lgYYu0ZO1V8ou9gP1GQHdQagzEcq+UiuglX1ILPldoqG6/xzV1jWeN7DAv9MG
 2JZg==
X-Gm-Message-State: AOAM531WvgpcT+ej31ws2GIhosN99Mn07qR1JUXVtNE455CoWD5ouMmn
 Zuvf6l+SRy6MUuk8TchEU6Z4ftFuu92/+g5U/hM=
X-Google-Smtp-Source: ABdhPJygoCQw5trbrHof0u8UC/1HNjZr3oljcTNs+3qDqiw+son1V1+ZSD92tCohMzKhmIwishjnzpG+i0IRWWkiSaM=
X-Received: by 2002:a1f:bdcd:: with SMTP id n196mr11103406vkf.10.1597755626476; 
 Tue, 18 Aug 2020 06:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3jhPhyU1kVkQdzgQ+e4Lq8aqZeT3+dZ6ZsW2b7L9RrBeA@mail.gmail.com>
 <CAKXUXMxqv_bz+FL1Nckq2FD8gMs9Ymmw3j2MukJKsmgX5ambNA@mail.gmail.com>
 <CACFir3iwBLcZoS8UqOy4qvtf8gRaQgbvhHWyCREk4XD-ap+BsQ@mail.gmail.com>
 <CAKXUXMy6waZDaEPWY8g5yyASkoVgCgz6caBqxkZpMMELWOHOcw@mail.gmail.com>
 <CACFir3jUvTFfoF5CxLw3NSAy+bfLx+9qmaJHMoSpFcC0SPsChw@mail.gmail.com>
 <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
In-Reply-To: <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
From: Jay Rajput <jay24rajput@gmail.com>
Date: Tue, 18 Aug 2020 18:30:14 +0530
Message-ID: <CACFir3jfu7P+2r6XYmXLB6Qf6p3=UeJcCXLE=Mi-Q8_Ues1F5w@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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
Content-Type: multipart/mixed; boundary="===============5094565627454991664=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5094565627454991664==
Content-Type: multipart/alternative; boundary="0000000000008ddc0c05ad26786c"

--0000000000008ddc0c05ad26786c
Content-Type: text/plain; charset="UTF-8"

>
> Okay, I had a look. Terminal buffer overflow? Do you have an idea how to
> pass the terminal output into a file?
>
Yes, I will keep that in mind and do it the next time


> The next task is to run coccinelle on the kernel sources. You will find
> documentation on how to set up and run coccinelle in the kernel
> documentation.
>
> I suggest you run coccinelle on the latest kernel source, v5.9-rc1.
>
Alright, I will have a look and get back to you

--0000000000008ddc0c05ad26786c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><div>=C2=A0</div><div>Okay, I had a look. Terminal buffer overflow? Do=
 you have an idea how to pass the terminal output into a file?</div></div><=
/div></blockquote><div>Yes, I will keep that in mind and do it the next tim=
e</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div class=3D"gmail_quote"><div>The next task is to run coc=
cinelle on the kernel sources. You will find documentation on how to set up=
 and run coccinelle in the kernel documentation.</div><div><br></div><div>I=
 suggest you run coccinelle on the latest kernel source, v5.9-rc1.</div></d=
iv></div></blockquote><div>Alright, I will have a look and get back to you=
=C2=A0</div></div></div>

--0000000000008ddc0c05ad26786c--

--===============5094565627454991664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5094565627454991664==--
