Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD95C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 16:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FB360EE6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 16:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2FB360EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA83060AB3;
	Fri, 30 Jul 2021 16:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIDNA1-EndfN; Fri, 30 Jul 2021 16:27:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91FA960AAA;
	Fri, 30 Jul 2021 16:27:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD65C0010;
	Fri, 30 Jul 2021 16:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FD4CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 16:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B584055B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 16:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NXPOzFbSERh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 16:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6248B40237
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 16:27:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gn26so17797224ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+iw0ezDSCjZU1ebGXsQKJODGUjwuIC+2tXZnyH2o69U=;
 b=OXqN7VwXIQI38BGmnJ20DMahgSr1Pkc1dWOFOSV0skU6/BXOnNIMu7y6H4g6RXRzho
 IrpUts0svLR88VAM7Evifg0FtovyhzKAtRchxsyzLLEXT7sdG9kdM/mierIvdEk5hQb3
 8N+/v0Z/nNN0aGrhdDtXc1EePT4VlSEc5hzj9CmC1R64WITu89OjzQ/q7PJBJVsBrQ22
 agKaSU9lGEojf2uUKAOK+bkEoTyH9/0pL9dDVswBQsDhs195tCNTrbfjl8Vp/tVapHOH
 aOFQn3Tn1n6YZVQDe+VtWVRXXJB9sQtLwODNm8pohsBCdf7EYlSHEqc4XSjVbbwnKTmU
 ymOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+iw0ezDSCjZU1ebGXsQKJODGUjwuIC+2tXZnyH2o69U=;
 b=UA6eJna9k4XytEa0Gjh0MZDK4aZIl8h+EHJGMOKCIf4Ss9HwlnS+e5mPs9vFxUAd6x
 y2EUmqJHoXNq3IuoI2utLmK/VXbgl0Hfg7MhEUU4XCytlgFD7OfH+qcM60WSwTWIatD4
 +5k1l/lV0089Yykxk5GXBgP+SRShUvXtewOpNjY+JriyQx10vdszXP7wrmz3LdRY5Mql
 H/EKYeQXIzaDsepVMrm4aKuxtRagFefs3IyLs1f+TWZH31eJQmBzMEFGmS7UHJT9f+BV
 MWK5UOHdA/l0y+NSrcVSZVXoY6CkJhWqRxaOoQEVqGZHkgckUl3d/VI7O4bInfVt6P05
 99nQ==
X-Gm-Message-State: AOAM531qXUH5C8B/Nx5EHUNCNxcJEHqBMEmjPnf1oBm0T1iM9BdFCupo
 +Y26s7KaC+FEBeYgE/ZhOYAIQonS7BF2t+kY3Jw=
X-Google-Smtp-Source: ABdhPJxCxZu595kkQ9niTUr1aPveMa54rXwjwu9eGdU1cp1p2ia+adSbtG76Fb4u9muvkCT0nZfj03FYJOSMkB0iUjY=
X-Received: by 2002:a17:907:2719:: with SMTP id
 w25mr3345489ejk.239.1627662474517; 
 Fri, 30 Jul 2021 09:27:54 -0700 (PDT)
MIME-Version: 1.0
From: Ravi Jain <jravi248@gmail.com>
Date: Fri, 30 Jul 2021 21:57:43 +0530
Message-ID: <CAJrKHSt5_xaYsEMYF8VadQtcxxXoeicBS4Lgib_R7YqfEMbypA@mail.gmail.com>
Subject: Linux Kernel: Mining for Maintainers
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
Content-Type: multipart/mixed; boundary="===============3026762349775966836=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3026762349775966836==
Content-Type: multipart/alternative; boundary="0000000000009ba14d05c859b31b"

--0000000000009ba14d05c859b31b
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

--0000000000009ba14d05c859b31b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><br></d=
iv>

--0000000000009ba14d05c859b31b--

--===============3026762349775966836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3026762349775966836==--
