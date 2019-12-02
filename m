Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_IMAGE_ONLY_08,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E17C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 22:06:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45A02070B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 22:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL8h8Ygd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45A02070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 529D02048E;
	Mon,  2 Dec 2019 22:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YR6PjZ7JbwNH; Mon,  2 Dec 2019 22:06:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD0F1203C3;
	Mon,  2 Dec 2019 22:06:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A93B4C1798;
	Mon,  2 Dec 2019 22:06:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50E4C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C640D203FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EaQQe3NNpDv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:06:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 3767F203C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:06:38 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 6so1254961oix.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 14:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=s8KV8wP28Jf7zlx1NPjrJ9C6GJXQ2itR6fwVtYkQ3zs=;
 b=jL8h8Ygd4fHEnLX28XP2Cx/H29U9IKgN15yAmT5fvNV1yon/T78ixBxQcyxX+s2V/M
 KGjv5SLJcuMjKOs3Ae3wMDdkG+wjkBRLUW50ryFRKPb3Jd8nU4vLlijN4Y8AQ0uC6GOe
 81rJdVEtQWVWTAnPSefIlpJJOKP05Pq1a62BmngsbZ+sBtGBH74LWdmGw2qQSnVXhW+c
 EXA4QbSayDwiJSvRnIznS91JBQBzjfBWlHG1ZYI5deOBFTufrpOdJGmF1iH3xvOhFbkW
 J04gmHBhHyAz4U7pSCRvF6xtK0+0YOWJLlV72bxfPOlrnfpTMSGmhMmBHHcTMElQoGV1
 cAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=s8KV8wP28Jf7zlx1NPjrJ9C6GJXQ2itR6fwVtYkQ3zs=;
 b=XOxzPwuS9XHg9Q1pW4PRu8D9QxJ2Yzif97k1LGLxG+5//foRBaiqX8C1yMrOEztJyP
 oNRMmfo4QLWd5bWO5Z7vcsVRTFq6aqX47QpbmMi1KFPl0qfJGLqT/MyZADH75MhljWll
 Sn6q6mEH1nU7fP/vNGEbbcePDOun3rleFmMRi4Yi4o/4cEXBEvOsvYZVhnoBEpegxWcs
 KkVU8avvFsU0PSsK1L3oUqt7JZQnnkRXGHp1gugfteY3EO3sjHSf16SRQzdG7okJnFst
 9AlA6W5WumZvJYLhwGxW7U2CGO31Wn4E2+dCgQBxZ6TMoFVKftJi8u+P0er3C13kD4gs
 CvbQ==
X-Gm-Message-State: APjAAAXITt3EqCc5RcEZQe19bgD6Q3y3ftz/X2WiwRAbt2eIf7nK4o3l
 hnlON3vRvldmu2kjr3i5/ZYqbfeF81FDioIl+g0=
X-Google-Smtp-Source: APXvYqw3yeNvsBys0MQZHBmsliy1AygiFbGQbcYwpJLP24i2e/H9e/dBDjfh78oFzqQ9HNtThsJhTHDqZZq7lO7jIWY=
X-Received: by 2002:aca:5303:: with SMTP id h3mr1016160oib.109.1575324396913; 
 Mon, 02 Dec 2019 14:06:36 -0800 (PST)
MIME-Version: 1.0
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Tue, 3 Dec 2019 03:36:25 +0530
Message-ID: <CAF65HP34ecBsDW5vcHukBmLSVevqitc=CbKpkRozuCf8ehdwPw@mail.gmail.com>
To: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] BOOT TEST: Linux 5.4.1
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
Content-Type: multipart/mixed; boundary="===============8582447338583432243=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8582447338583432243==
Content-Type: multipart/alternative; boundary="0000000000001588250598bfcb42"

--0000000000001588250598bfcb42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I boot tested Linux 5.4.1, everything seems okay except the following error=
:

[    0.275509] platform MSFT0101:00: failed to claim resource 1: [mem
0xfed40000-0xfed40fff]
[    0.275515] acpi MSFT0101:00: platform device creation failed: -16

Thank You,
Madhuparna
=E1=90=A7

--0000000000001588250598bfcb42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I boot tested Linux 5.4.1, everythi=
ng seems okay except the following error:</div><div><br></div><div>[ =C2=A0=
 =C2=A00.275509] platform MSFT0101:00: failed to claim resource 1: [mem 0xf=
ed40000-0xfed40fff]<br>[ =C2=A0 =C2=A00.275515] acpi MSFT0101:00: platform =
device creation failed: -16<br></div><div><br></div><div>Thank You,</div><d=
iv>Madhuparna</div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D124d3fbd-1d8c-48fa-82a5-c7=
f782182430"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--0000000000001588250598bfcb42--

--===============8582447338583432243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8582447338583432243==--
