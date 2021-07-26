Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F37C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 18:28:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC9C60F58
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 18:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DC9C60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4476440341;
	Mon, 26 Jul 2021 18:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoP8bFnzCsF2; Mon, 26 Jul 2021 18:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5811D40333;
	Mon, 26 Jul 2021 18:28:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3435DC0010;
	Mon, 26 Jul 2021 18:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29FE5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BE3B6079A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWpGJF09UdHk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:28:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C605E6078D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:28:45 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 y16-20020a4ad6500000b0290258a7ff4058so2461551oos.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=m6+6YRJ1D8TK7LKmxAMxDAqujt/Pbo2S2+vLWpDONPk=;
 b=CPrZNcf4nyw2yBR8+YTxiP+TOxLNBh2Ek5Aqur3YWsZ3oNsVuxoIBylqm0puOcAJvh
 AOp1HZp6Q7yDIs2ylOoer+75DqZTnJmieCZ4NEN23fOvJSX5JEqO2XmfRrES6fZuotqy
 HjXmrBj4YBkveCkoOdLksPcFpwVaeDzmXwsRmbDkd6N05SZ3iFVx6yT9OT57e2Pgr68I
 tRglj8+HGdVc06ZPOOMIQLK95G41YYm1+pEp5RTfbvZXUMeX9CZIf9ZKX8O3pxbxuCtp
 nOjxDFTSyUR42kluX9JGNlfoqFq6FUsc0LdP8jVacH9XzttjFlh4HUHehgXXvKvIQ8+O
 VLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m6+6YRJ1D8TK7LKmxAMxDAqujt/Pbo2S2+vLWpDONPk=;
 b=Qo02kTpClncgn9TBZdTqVOdOkktRDEYolYz+udPEepi0s10YfkJIRLGyX6amop6Fdn
 aUTslco67J5p/e7jeKEn0ap6+MZlcwOzp7RibuoPx8jY4KemW5Zlqy9FmTtDGLA5ExqX
 hK2c3RUEQ67Bdbyexa591Ps5ubIhTJZGrm46bew3ByXGTEeBM42HvUeWhJacdTWvlBRu
 gR82bxNxo8/7uhFUfB2YGJGOHpW8Ilq/a4VxY9xkGblIEIYJi8IqrbTQMXHml8ZNmISb
 3DIvJM1FQfcD2mL+A5r78LepfFQ+jf5vTlRcp6ko03jgR7s7HNoCIPWDWSMlrxaaC3F7
 I3vA==
X-Gm-Message-State: AOAM532MArwd0HcU5zr9gWZ5lwtUPcLNmZMjZrsNEyHj3mXEANn93FG+
 wD5+qx9ED65CiJJkvZd52hyiX7XdZ+71s3VXwXQ=
X-Google-Smtp-Source: ABdhPJx6EcnIbroXYf9PJvTExvl1i4C/ruO1JIuGL10gVJ7DRanX3WFiyG+IPdy4GoxuIrsE0KFiRc9QPoC569NRV6U=
X-Received: by 2002:a4a:ca8b:: with SMTP id x11mr2531514ooq.16.1627324124804; 
 Mon, 26 Jul 2021 11:28:44 -0700 (PDT)
MIME-Version: 1.0
From: varun khatri <varunkhatri122@gmail.com>
Date: Mon, 26 Jul 2021 23:58:34 +0530
Message-ID: <CAJPTKA8j8ALgRKdQvpCQExJboi_8UOPZY899PfPTUxTvW7pzow@mail.gmail.com>
Subject: Regarding Linux Kernel: Mining for Maintainers
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============7053757067274370011=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7053757067274370011==
Content-Type: multipart/alternative; boundary="00000000000064b84b05c80aec1e"

--00000000000064b84b05c80aec1e
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Thanks
Varun

--00000000000064b84b05c80aec1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><div><s=
pan style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica=
 Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br></s=
pan></div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Robot=
o,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:=
pre-line">Thanks=C2=A0</span></div><div><span style=3D"color:rgb(33,37,41);=
font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font=
-size:12.8px;white-space:pre-line">Varun</span></div></div>

--00000000000064b84b05c80aec1e--

--===============7053757067274370011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7053757067274370011==--
