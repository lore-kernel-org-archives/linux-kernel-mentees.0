Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6EAC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 08:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D35611EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 08:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D35611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A103282FA2;
	Tue, 20 Jul 2021 08:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edl0C7tK_Hdk; Tue, 20 Jul 2021 08:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C845282F98;
	Tue, 20 Jul 2021 08:43:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A10EAC001A;
	Tue, 20 Jul 2021 08:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F13BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3AC84037F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRrhv__LDD9u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:43:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2866F4036F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:43:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n4so11830041wms.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oTDeLzbQVDAtAAWr+ZT9EPcfpI1GyBsh3gqsZTMzLgQ=;
 b=qhd3uAZIJ6om2RaP740w826/0fcISv1AtxOt3ck31L+C4rbOc4DrEQkoUkPGIIV1C2
 TgF3v4d945BB6/aVcSvj5Ax/QFkjh0cMndGFIPp9QdYMXF9jnlPg6Ugy0yGT5UmxjhOs
 PqbtFLoAewnN1ae6xSJ/NCeocaxLLNtyDzWN/KrGwZ0xthwwPcOIlwy4EXpDaKNU8ZYs
 Elr4u/0CdUJsIW8Eo0BqewWsad4HLBTLU7pCToQFcsz3iMyjG3DRftLinqAOalbpFBqe
 H9KTmJkqQDA2oZMdQvCwTI/MNSyDOmn/vX6k1McBjhinzd9A5rhG2sd/NRaqfcPhcchi
 9XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oTDeLzbQVDAtAAWr+ZT9EPcfpI1GyBsh3gqsZTMzLgQ=;
 b=e1CibT6PegmxU4a9L64j3951jzVlAOjewKseGEiHnRLCVwwN9cxc46oCJ4taOuuggK
 9Pa/e52OWDBTQXH7hpxppPcYVlQFlRYIL5WASCnSULEU8JnYClRpOZBnPAQI40kXkblI
 +cSm01UzCod5X36AD52mwYqXr5s90VsVmLYmn+iWwh4SkrMuw6YVkxeAQlUOjGyNx7+y
 veadwq9JTgrpFc9BWqI7Lj7vDKFpXPdJqMIuqq/I3HNH2kv2AxrOyZVWThUmrIT9eOMV
 2uuXvK5/6ewtbg/TE3G+dJ8GPZjH72PAYusbBAcwGGlztq3pT4ymStoUj5Akvme2CODc
 8xPA==
X-Gm-Message-State: AOAM532ViBuOkf9umKtjdtEd6e6c2gjPUaDTL+3aMShAwgvfFPV0p26a
 XNTl/LzL6cNpSRKnMtcF1zJDVChVSKN320Rzg58=
X-Google-Smtp-Source: ABdhPJzfklj6tDyT5iIW6ppiFRYN/pQqw13meDX+QgXsxR4jEkVGeeaQ5PL4qep9Y1LT972OwgCN352y4pBxMHFHjRU=
X-Received: by 2002:a1c:1bd0:: with SMTP id
 b199mr29990768wmb.108.1626770598340; 
 Tue, 20 Jul 2021 01:43:18 -0700 (PDT)
MIME-Version: 1.0
From: sri vathsa <srivathsa729.8@gmail.com>
Date: Tue, 20 Jul 2021 14:13:07 +0530
Message-ID: <CANx6jmdBVOPVEWMnZyreYGaKc_Unf30V2eVCucOCkbgu1mN1-A@mail.gmail.com>
Subject: Request for mentee selection tasks (Checkpatch Documentation)
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1809619336684316357=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1809619336684316357==
Content-Type: multipart/alternative; boundary="000000000000a52bdf05c78a0b8a"

--000000000000a52bdf05c78a0b8a
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm Srivathsa Dara, I am interested in the Checkpatch Documentation
mentorship program and I would like to work on the tasks for the mentee
selection.

Thanks,
Srivathsa Dara

--000000000000a52bdf05c78a0b8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I&#39;m Srivathsa Dara,=C2=A0<span style=3D"color:=
rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,s=
ans-serif;font-size:12.8px;white-space:pre-line">I am interested in the Che=
ckpatch Documentation mentorship program and I would like to work on the ta=
sks for the mentee selection.</span></div><div><span style=3D"color:rgb(33,=
37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-ser=
if;font-size:12.8px;white-space:pre-line"><br></span></div><div><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Thanks,</span></=
div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quo=
t;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-li=
ne">Srivathsa Dara</span></div></div>

--000000000000a52bdf05c78a0b8a--

--===============1809619336684316357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1809619336684316357==--
