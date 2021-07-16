Return-Path: <SRS0=Sa9D=MI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56313C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 17:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C486A613F1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 17:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C486A613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82F54844F2;
	Fri, 16 Jul 2021 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RXaYVxtc5gV; Fri, 16 Jul 2021 17:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A1714844D7;
	Fri, 16 Jul 2021 17:07:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A11C001A;
	Fri, 16 Jul 2021 17:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F414C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 17:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7954D401B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 17:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mcmr6fXlGTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 17:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAB03400F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 17:07:11 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id f4so5426062vsh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=okz8//6NzoS8t4o6bFehuQfvACDsLvIA+/9N2Xs7csU=;
 b=OW5q75rPiUBeHM0uL182DmR4qWDnx4WWsAq/g9NM8X+QlFL9TSb+ZoGiPFYPCrXkV+
 rVwcyLCjrwYVtHELSc8Yn9wzBA7I1BPMePxHin/UK0G3sbHAN5+tCiWE3VlaOXLsQFUu
 zKnrBaRWCl5fX6/ca1jyRyMaT6l8lkxX9oPRzy5oeNVfEvehf4fnq3d+OKojQB3gROQT
 1UKlN5bQjYQJ1ngfDNIAZfb9Ns633NJXqOWokT9Q7PC8w1+fgH0sATcc0dKhX2c5M0D8
 S1v1FIzkgaOL9O/AequmhdyzsSrjksrl50rxJqB0u2IKRMrjpTLwcgkzEt8LtB9VFE08
 2H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=okz8//6NzoS8t4o6bFehuQfvACDsLvIA+/9N2Xs7csU=;
 b=hxJkdfsUrZOgmmJ4dYdL/f8YItpvtsMWilcHR8M/0rOo+/hMgGzE3uPJ7DrujoVuDg
 hgQJkXiIiEHazkiIdtG+H6EUcH8/QhwhsK/KuVEU5d9BlIhOntonbwkF/HbsswzPQdv1
 Wg2xbcVWhs2nO/IQB9NIcQegYUPLIjcspYl6tdMaqr4CI9W9aEaXpUc6z5M//OZIroZR
 ih+DWOp7vUmf/6Et0hdcVjEdusWVmC3KXYSOJvyZm2PR+cFsPvohnjGmi36RnOYn8Auc
 6vahUv5JP02o0HURsvEGsjzXd/nYcFdy1AlQPMD5N7TCVrc1p2k0eyM28fMekDOfj7wN
 UBzg==
X-Gm-Message-State: AOAM5300pRCPfGwO70nTk9UwsLoUJrMHJp/XjP++5I1vJalJvEnDitDq
 usY8Sibo6yVVxI2PgNOzjZ9wJwkE5RG/azKDu+I=
X-Google-Smtp-Source: ABdhPJzUnnyAaGXznAc83fHvjLoymYeA7BILWApsJkeJlIORuOH5GWwR57BDjPXz2kQ6wfzN2/KeBKCGnntnXzJuOoU=
X-Received: by 2002:a67:707:: with SMTP id 7mr13603300vsh.39.1626455230773;
 Fri, 16 Jul 2021 10:07:10 -0700 (PDT)
MIME-Version: 1.0
From: Subhasmita Swain <subhasmitaofc@gmail.com>
Date: Fri, 16 Jul 2021 22:37:00 +0530
Message-ID: <CAHLqCyqH6wrkH4cugVFinF40_-Q=NH7CGtiAj5cwXm=drWBVcA@mail.gmail.com>
Subject: 
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
Content-Type: multipart/mixed; boundary="===============3939134729340323522=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3939134729340323522==
Content-Type: multipart/alternative; boundary="00000000000045fc3805c7409edf"

--00000000000045fc3805c7409edf
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

--00000000000045fc3805c7409edf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.
</span><br class=3D"gmail-Apple-interchange-newline"></div>

--00000000000045fc3805c7409edf--

--===============3939134729340323522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3939134729340323522==--
