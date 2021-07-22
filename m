Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40551C6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6FA460FE7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6FA460FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89C6D40527;
	Thu, 22 Jul 2021 13:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IJK-3gzoKrp; Thu, 22 Jul 2021 13:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A1DFE4052E;
	Thu, 22 Jul 2021 13:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 762ACC0010;
	Thu, 22 Jul 2021 13:27:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FCCAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6298401E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUA_OnQ_geQK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED6904025A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:34 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id v26so6285568iom.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DnMTHrSOhr0fYbbyc3n6Xmdeh66LrLXlWmdh6/1zKeI=;
 b=rOycqjzsJ5LcCpPeLgP2dxasVbydWIL9MKphtthyzTuD3cKynLtzrkmQMeaYf9Osjh
 hMH81TGkOmDnkLchV/wUZX5XI2yviD6Vh3cswRe2K4N+z43+FnQLSQItZwf2o/lVBIFy
 ZhjUknyktiIMZkJiMGiGGifmGOH3VAdpUbuuqURAXRokC8dVgI5ZOdcZWor1mI8dIl7E
 0RrI6XmRI6yrsLcPa6/XDOBLsnJ1vnwPqqFkhxGlY/dqZ1H7nTGPIGQrvKWU4PYgG6Cb
 vGalX0Re/qL6LKs583YC+aYHeFU35HUu43bZvEvUtxsRzWB00uIYZDdpFFoFhN0g006w
 r2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DnMTHrSOhr0fYbbyc3n6Xmdeh66LrLXlWmdh6/1zKeI=;
 b=VNWG99W077kCpBgAiZXXpy923MsWkTFGlKz+P0Ab7z4aMfKulTxf2Z/VezbGPUYA8i
 2VhA5zSg50I7iUHKa/AdJcdtww60RGmdYZdi472Jsv95VA9HWAUNVOVuRePPyAfxHN5t
 h3frJSfmn/K53bNwjNTD90FjdQs/BmxK4qz8KoS+s6FvQRNZTc7CYU99usPOB9wbqPrR
 A10V/2FlHIGOsKopgdtoSDJ06N5jQfkn21id8RskNeMxBtHMaXb/XQa7DU90AxCxkE2S
 mW7eoawFh9N5CT4vRLHG8jjf1eq442aO6KXwoNON4ARetwe1pIy4KiJG1wanxESfS4wE
 N4KA==
X-Gm-Message-State: AOAM532gDSrNNB1J4QI+U0Zo28zosViPEXJ2T2iMmVYOxUQBXpzj4bRQ
 GxJkisyfrfGWXo1yQy7rtJsCWbxAwMeXDpei6ZKNPkGX+XuAOsH2
X-Google-Smtp-Source: ABdhPJxulB4zkND2TFb6vtY0+KL5GFqy04lYbeDGuO7qKfnSYrlIrzl4dnjkWcRlOLyQ2E3GlXQbclSO7+K+lWcIcck=
X-Received: by 2002:a5d:9e4f:: with SMTP id i15mr27990085ioi.58.1626960453747; 
 Thu, 22 Jul 2021 06:27:33 -0700 (PDT)
MIME-Version: 1.0
From: Yash Singhal <ramusinghal112@gmail.com>
Date: Thu, 22 Jul 2021 18:57:22 +0530
Message-ID: <CAFwExaOTyWaPvNTMzk5cSyPPafF0RO0fHfCaczSGxTT3Af6OBw@mail.gmail.com>
Subject: For participation in Mining Maintainers mentorship program at Linux
 Foundation
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============5797867291980841285=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5797867291980841285==
Content-Type: multipart/alternative; boundary="000000000000e8c6eb05c7b63f95"

--000000000000e8c6eb05c7b63f95
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Yash Singhal
India

--000000000000e8c6eb05c7b63f95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><font c=
olor=3D"#888888"><br><div><span style=3D"color:rgb(33,37,41);font-family:Po=
ppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;w=
hite-space:pre-line"><br></span></div><div><span style=3D"color:rgb(33,37,4=
1);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;f=
ont-size:12.8px;white-space:pre-line">Yash Singhal</span></div><div><span s=
tyle=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue=
&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">India</span>=
</div></font></div>

--000000000000e8c6eb05c7b63f95--

--===============5797867291980841285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5797867291980841285==--
