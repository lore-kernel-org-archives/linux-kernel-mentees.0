Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87C6C63798
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:19:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4465A2468B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 07:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="PM5ZFUFa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4465A2468B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1A4686365;
	Tue, 17 Nov 2020 07:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v+E5kabv8WU; Tue, 17 Nov 2020 07:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E3DC85BBD;
	Tue, 17 Nov 2020 07:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74BA6C0800;
	Tue, 17 Nov 2020 07:19:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E0C2C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D52085BBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nt42YleVdTt5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D80F886018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 07:19:18 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y16so23144279ljk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 23:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VqbhrlwZuajEm+teSYWJKZoTHJHEtWue2CbD3XkInj4=;
 b=PM5ZFUFaPn3lORLQj+Jdm+yibQ53k1gZ1XppMq6hrFOsoSIiEGhkNRKX8LsGwQjnlX
 CjLZyjsfumoxuR9uGSsV5WRqWuDzlB8EIfxU2XPZRk/EwuiDc58eIgmFjU6OlvoUDV5/
 vvuE4XtHzjVKq1WeNI78mry3c+CLFIum0mh8nxr5OFvK5+64wZ/ZYGc9BNSGwU2u0DhM
 5+lEJMVfvc2HDshEFstJ4heEbHupV+jPANVv8cmCnmmI2eEoEeX2KddZzU1RIhiSKih8
 Px7TMrK3DavfOrAryPQCCo2pKSy9nyBuMa22bXUSlVV8SJZkXXnHp/9loQLvVaoTu03v
 eZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqbhrlwZuajEm+teSYWJKZoTHJHEtWue2CbD3XkInj4=;
 b=oS+ySQydPwbbEob+bE/l5ZZCpnuLb760i42synryvzZRkGOy9vJO8WU+vbbTW8tbWa
 g+dK/TjHT7Yf1ZiirPGvm7Hgpa4W5wxTDvL3XiBNBjT123e0gHof6Mo4UIX1s1x58c2r
 ofNO3TWZu02O0Su/Urv5V/CKWki8CpEYzluJS7/unv2sKnwoergN3/TQkGUkhG9XD2z2
 cLCcxIT4bdrsR7VKlHJNShrBTBSFCVf+1+9X3QYbXwOUAVDZU5Hpdk+ccQIzw9Fas2Lp
 lZ5UuNYZ/f7SyOTiSCbMF1C4xd+av4l/4THd0Scmbt4zXL2tqwUO8Fz8SeKSSsUcxROJ
 s/hA==
X-Gm-Message-State: AOAM531kz4ZH034UlV2d1rtoBeG5lFqg9mj46OgBeOdTiBkNwStA7+EZ
 sDkAtvu67k6bihGISUbeTKDmW09m+wGJEn/7uIuaAw==
X-Google-Smtp-Source: ABdhPJzjbQ/RynOU0RVO2j9c9+2zydhegh2Q7i2bmrdL7N2NtzuFDspniAcg2Q0D1uAfHM/pckkep0eEEz+yEoXzYgE=
X-Received: by 2002:a2e:b54b:: with SMTP id a11mr1385448ljn.40.1605597556614; 
 Mon, 16 Nov 2020 23:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <20201116054150.211562-1-98.arpi@gmail.com>
In-Reply-To: <20201116054150.211562-1-98.arpi@gmail.com>
Date: Tue, 17 Nov 2020 15:19:05 +0800
Message-ID: <CABVgOSnHUnxM3fZrvUTioWAnkwLc1WFgtpWJTCE74T=D6JQjrA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: multipart/mixed; boundary="===============0129071453189888540=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0129071453189888540==
Content-Type: multipart/alternative; boundary="00000000000004688705b44850e1"

--00000000000004688705b44850e1
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 1:42 PM Arpitha Raghunandan <98.arpi@gmail.com>
wrote:

> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>

Thanks: this is working well over here.
The only (minor) issue I've noticed is that the diagnostic output is too
big for the default log buffer if debugfs output is used, causing some of
the messages to be dropped from the debugfs results file. But that's
clearly not an issue with this patch, and the actual combined result is
still present (and the complete results should show up in dmesg anyway).

Tested-by: David Gow <davidgow@google.com>
Reviewed-by: David Gow <davidgow@google.com>

Thanks!
-- David

--00000000000004688705b44850e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 16, 2020 at 1:42 PM Arpitha R=
aghunandan &lt;<a href=3D"mailto:98.arpi@gmail.com">98.arpi@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Modify fs/ext4/inode-test.c to use the parameterized t=
esting<br>
feature of KUnit.<br>
<br>
Signed-off-by: Arpitha Raghunandan &lt;<a href=3D"mailto:98.arpi@gmail.com"=
 target=3D"_blank">98.arpi@gmail.com</a>&gt;<br>
Signed-off-by: Marco Elver &lt;<a href=3D"mailto:elver@google.com" target=
=3D"_blank">elver@google.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>Thanks: this is working well over h=
ere.</div><div>The only (minor) issue I&#39;ve noticed is that the diagnost=
ic output is too big for the default log buffer if debugfs output is used, =
causing some of the messages to be dropped from the debugfs results file. B=
ut that&#39;s clearly not an issue with this patch, and the actual combined=
 result is still present (and the complete results should show up in dmesg =
anyway).</div><div><br></div><div>Tested-by: David Gow &lt;<a href=3D"mailt=
o:davidgow@google.com">davidgow@google.com</a>&gt;</div><div>Reviewed-by: D=
avid Gow &lt;<a href=3D"mailto:davidgow@google.com">davidgow@google.com</a>=
&gt;</div><div><br></div><div>Thanks!</div><div>-- David</div></div></div>

--00000000000004688705b44850e1--

--===============0129071453189888540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0129071453189888540==--
