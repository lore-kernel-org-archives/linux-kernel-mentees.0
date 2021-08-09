Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52962C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 18:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60EA60EE7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 18:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E60EA60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DDF40145;
	Mon,  9 Aug 2021 18:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcCO_ZCR0e8L; Mon,  9 Aug 2021 18:39:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B19B34013F;
	Mon,  9 Aug 2021 18:39:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CC45C0010;
	Mon,  9 Aug 2021 18:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 067DCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB1D340137
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpG1vtkl4CsK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:39:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C70D400E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:39:28 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r72so14725606iod.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cUnKF1wCfv0rrbjdfYSt9g+oVc+oM7+Jz6uNfnNQDbM=;
 b=kM6T/LjPp90F+Br0cvANIbobvsEztAFW8MCT+FD99iE4wKXFfF6HsM4sDOga9UmUQC
 ILdVzWbiK4OZE8Fasc4fh9mCb9ifOjc+rCn/vRfnlIjg8IGgbboD19J59ot54XmLFk2w
 h+9Tzwu4N4e9utrxq4k8+LZI32KwGY+0WuPEzFEUGKEs2SJCV7KKp+CcA6FIoAZvgPHP
 H6ECyTSEH6w6NG45P3v2Pj9miy5MSE01fM7rwPAcaTyNq8RbfRxbjVpjhFqSqWYAVz+z
 gbXfAVjvhCESJmYrouSicfSx9PqIDgPsPthcRkFaftCmifHcHVaQ6l6/3StFuEC5Dgm9
 JbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cUnKF1wCfv0rrbjdfYSt9g+oVc+oM7+Jz6uNfnNQDbM=;
 b=IcF/vvmvT5rLD0VtJJZeHPzY+PIbFwBvwhsjy3hWmMaKsa221cs/2TLPGT66KpPHNm
 BlO50m58XVr2V4AZo4Ld1ERUY6MZ+UO5aBIQ8QlD47ZapIW6ejlPOcpR7Q01ftR+HPco
 Rig3zs0PXqj1BaVTql2omHuGnNBd39TRBeGxs7ozh/3YrRZvHIVtfWvz6bJbU0q7rr92
 BJzhSj2D8H13w1XRuPGxQGo1o62wdbkxbr7boK624DPQjU1KLc2dImVF2dlvVT3fAV4D
 /K2WGQ9NJvkZ4I/KiIDyzd9Qki+9kaYxBAlTfQEFfk+DRWcRuHV6WHjLA6qUKigzdSEk
 O7oQ==
X-Gm-Message-State: AOAM532EiOyW09D/OP31WtvxD5c8kPqacJgI/9cwuGeLHS7L4OPv9VW9
 1GkYOzNB/ZTB5oYBkJj87SdNPSfrSSIKGO6A9OQ=
X-Google-Smtp-Source: ABdhPJxI8+cbzhCjjyc+CIq8tut4LrWRai3ibdNlKTevsSy5x71G6cz1TP0CbXqiK0vESlWkxUfLZBcfix5UHh54s0Q=
X-Received: by 2002:a5e:a914:: with SMTP id c20mr390684iod.188.1628534368068; 
 Mon, 09 Aug 2021 11:39:28 -0700 (PDT)
MIME-Version: 1.0
From: Sunday <digitalsimboja@gmail.com>
Date: Mon, 9 Aug 2021 19:39:17 +0100
Message-ID: <CAO2pFNZ0=UDPqdFEjbULgq=3ewugKKYd7shoOLOfii1w+BBP_g@mail.gmail.com>
Subject: Mining Maintainers mentorship program
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
Content-Type: multipart/mixed; boundary="===============0028068946449225109=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0028068946449225109==
Content-Type: multipart/alternative; boundary="0000000000008369b905c924b440"

--0000000000008369b905c924b440
Content-Type: text/plain; charset="UTF-8"

Dear Lukas,

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Regards

Sunday Mgbogu

--0000000000008369b905c924b440
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Lukas,</div><div><br></div><div>I am interested =
in the Mining Maintainers mentorship program and I would like to work on th=
e tasks for the mentee selection.</div><div><br></div><div>Regards</div><di=
v><br></div><div>Sunday Mgbogu<br></div></div>

--0000000000008369b905c924b440--

--===============0028068946449225109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0028068946449225109==--
