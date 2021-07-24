Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F658C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 07:00:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A786056C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 07:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4A786056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A37606AA;
	Sat, 24 Jul 2021 07:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1nA_70NjJXn9; Sat, 24 Jul 2021 07:00:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 60A2B6060C;
	Sat, 24 Jul 2021 07:00:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 429DDC001A;
	Sat, 24 Jul 2021 07:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1459C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 07:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC3B3606AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 07:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRLF7p6T3w7e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 07:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0A926060C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 07:00:35 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id d16so867940vkp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3VYY3BKyDyxtD7WJ9jNTzJibHjPI2V+fx7Oiw4ATUdw=;
 b=gL3Wr3CSlWKlLptw7sKXhAx+JpQOCGZGVQBAJmPblgISIOhcdQZqwl2thKQ+NVneuV
 yLpvZxc7Jwt2/1E8kBGfTfZfhQrUzPOtxb6gtLshlTlZIkZxu/VhcY6L0Do0oRvJzDns
 kKVqZsud2VvLilYM2yD4F+VeyIxxkZXeQZT/uE9Hft1NLLVn2KtkoE5KHgia05R316ae
 WuL/ssErR87UUgCNATZrniqX4VLCmcGMBR+MblkDEoExj2rMotXtzbFsst9/iYIlm2Sr
 v2F858/O0l+UYIFW9sMv5D3Eo+2zcQhT4i1Lk8Gl8IsH5DWuJg0k4NxvnGa4jLMDtLLW
 iL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3VYY3BKyDyxtD7WJ9jNTzJibHjPI2V+fx7Oiw4ATUdw=;
 b=dS4ng1n8IWfyPE1+eewQxDPG/atD5GGXPlVLcT9ycMilw+2LhSKlN/YesNNYm0UpSU
 lQhCsjfVp9KLG4bkgiIOn0RTfl6pBH5gVfEgMH7Gbvhvc5KGSODDj9rA7NCh0mCX2aiy
 MJa+h8XU7CXZ+BvPtbRRwPdTCTwXTYz59ysjYuJoglLaOo2uscguCv2ZjAXcE9cY0RpN
 ArFtVJ/A4QMB2W9ixTmu7wBCASWlxPE/XMLW9bZu1zEbdBKN/fNAh+Zi/RIncbnALHZh
 0pudQ6+qsbtes6C6BzwYGlzJN4z1bEqmPZ5bxstriOA5AsmBnWq2UsyhqFCGsx/GAky/
 lRYg==
X-Gm-Message-State: AOAM53232xAgvdKNcubk9h+KcR72YJyPJQpPJCeCn+RQiDf33hjhKnNG
 sNcOZ7IA4IHFiI3iv13SB30jG65asXlJ88tY9P3r3xljPp/Mh33Y
X-Google-Smtp-Source: ABdhPJxTqWahBTubHpV3iwgfALw3ni9T5awU6x6VD4v/crlQ9VZwTjrC1OdUbxhrT+GnnAkw8wbx5ogIJq5+Hcblub0=
X-Received: by 2002:a1f:7c81:: with SMTP id x123mr6265881vkc.24.1627110034115; 
 Sat, 24 Jul 2021 00:00:34 -0700 (PDT)
MIME-Version: 1.0
From: 4PS19CS059 Mahendra Reddy <reddymahendra52@gmail.com>
Date: Sat, 24 Jul 2021 12:30:21 +0530
Message-ID: <CAFY-XHTSXBrvHfYjxft=eWCR1JLoz7gZ0HzvTVoEL=8w=J6Ozw@mail.gmail.com>
Subject: Linux Kernel: Checkpatch Documentation Mentorship program
To: linux-kernel-mentees@lists.linuxfoundation.org, lukas.bulwahn@gmail.com, 
 dwaipayanray1@gmail.com
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
Content-Type: multipart/mixed; boundary="===============2028708904705523198=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2028708904705523198==
Content-Type: multipart/alternative; boundary="000000000000980f3405c7d91372"

--000000000000980f3405c7d91372
Content-Type: text/plain; charset="UTF-8"

Hello Mentors,
I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

--000000000000980f3405c7d91372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Mentors,<br><span style=3D"color:rgb(33,37,41);font-=
family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size=
:12.8px;white-space:pre-line">I am interested in the Checkpatch Documentati=
on mentorship program and I would like to work on the tasks for the mentee =
selection.</span><br></div>

--000000000000980f3405c7d91372--

--===============2028708904705523198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2028708904705523198==--
