Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D310C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 14:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304F960F3A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 14:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 304F960F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EACE382BC3;
	Sat, 31 Jul 2021 14:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7zeINBt9p1V; Sat, 31 Jul 2021 14:28:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B42E82B51;
	Sat, 31 Jul 2021 14:28:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 169BAC0010;
	Sat, 31 Jul 2021 14:28:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2C7EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E70140106
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 14:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdXQWgpdrnjO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 14:28:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B718400D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 14:28:17 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so12842096oti.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ddGstpzru8neNp0WFaxF5OUQZU0WK/Koaw0pDvwCeZw=;
 b=Yb3kqfIVzr/Nx0fcPHf+3Nkj/j53KBde70lMisXiFfQQ+bY8xjHTJwh18KXOLsfInN
 oYuy2IurL1wYv/ZfBOplpfY29q7znRBj2n1YYVuYkMcbDzu1o76ZQ5MdkufqJlvSDUDY
 iUvM+zJwfZZrEGDqNUo5quVpWjb8+TEmurSABVQLOeBIDZBNXzN14otNw0Jtwp7qzHp1
 +Ioy2TLeQtZZK1wEJg+xvQjhXk+DsBilQVYI1PCC9J+tkDXDFgMc5gmI7mk/sYsWAN/V
 zmuGY9t27uNzlqHvaQap6GHwQVe7EIHB1mBfm3CTTpjcqwr1qixj0qgB/pdc25MERjiC
 opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ddGstpzru8neNp0WFaxF5OUQZU0WK/Koaw0pDvwCeZw=;
 b=BW5rLpHQscMfTntsIS75XsxusFjdLNpaTIkRicaIoO/wOHwc+UzTDclFZ6wBxK7LC/
 E3ZA1umUchAP4w0aMuxFVfoDTyAL2nidkSzNptaXyRBCImFqogvw1FA/ItcMuhRbpU3p
 K01repmReoC80GMFeJ1mlJkGDlX0aVa/uZNzhN+lfww3XBd1ZDUlgmlyrDuLfbJzYpSO
 qJMJinhvbNVj1txv1wbq5xo/SQjbrOXBzEI5moj2QR+E9gPr5f+Fsxci3wx9bx5vIsPn
 zKzSJzLmZ7gP5Nvfh9RUGboPPR9Dwmuz8wYHK1B9PTJ6nGMX2UPuXOUASzAsGu8QFkYe
 l8kw==
X-Gm-Message-State: AOAM532Ib3vr0U7qFx/bjiNBL2N2Xv22rl7YVcKiLmW81pdgPIBUAF8+
 McpYX6UIFaK+fHhWxT6Ze2CRTJrxVqkQwEhE2pk=
X-Google-Smtp-Source: ABdhPJwU89Y0VO1s23A5Xljbeu2an9/71F2LrUc56kQtMYiHlfbcrUZbkUqTTJru4cI64wdf6Pa5Ko+qU3BwuaTVGO8=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr5913124otc.105.1627741696340; 
 Sat, 31 Jul 2021 07:28:16 -0700 (PDT)
MIME-Version: 1.0
From: Kirti Palve <kirtipalve284@gmail.com>
Date: Sat, 31 Jul 2021 19:58:05 +0530
Message-ID: <CALdTm2xBMaXArqWnT+v-mGifn+qGaxhNTzaPxDFmSTcTXMyYjQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8454802800133958659=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8454802800133958659==
Content-Type: multipart/alternative; boundary="00000000000098b64805c86c2556"

--00000000000098b64805c86c2556
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

--00000000000098b64805c86c2556
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.</div>

--00000000000098b64805c86c2556--

--===============8454802800133958659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8454802800133958659==--
