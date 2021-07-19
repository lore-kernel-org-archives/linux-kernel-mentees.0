Return-Path: <SRS0=VrTg=ML=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA6DC12002
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 07:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE96F61019
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 07:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE96F61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F8C83415;
	Mon, 19 Jul 2021 07:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8bEkj10L0ON; Mon, 19 Jul 2021 07:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D30D883412;
	Mon, 19 Jul 2021 07:39:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD172C001A;
	Mon, 19 Jul 2021 07:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B92FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 07:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E3A283412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 07:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWcCa8r15yNn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 07:39:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0BBD83415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 07:39:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r11so20746989wro.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e3D3VQt42W04UWm0DkaMYRKYBpU3Guy/Bc7rBnNfAnQ=;
 b=KtEZzdhGdo2XYa5AOHWY/mZdpmI8Wsa0S/BIa9Xjo5KOIilb6cq55KLHx8LGZLnW1y
 W7f3/3S1W0aHXwBBnvVi50/Jtiao8jEAIFbIuODf3AG6qcm4I+HfVzDgjfEwnZh9zVDI
 KisAVZQx6aVYtEesq7+xleQvfOeMSa+AshQjqQhpoE5OaYwyi2Tf1gOp83pwF6l9Cv3Y
 0x33k93fV3iJUxkYKvvrgLXBnSOV130OH3KrT3NVtk+17C4DGu9pjj+zLz3xAu0lOTdK
 bbij7Cr6ldBdy0JvXxvyqvyLwhjsAC9Fp3bltc7FWrCClLk1Ju6A0iB4Rt2eZdgL6rQT
 Sc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e3D3VQt42W04UWm0DkaMYRKYBpU3Guy/Bc7rBnNfAnQ=;
 b=Zh3B7vZp3ySPDGAIKdUfO+tdTY1GTlZBsecxsDcKgMtdrvA6VDopWFatDg2Oh0y3WM
 ZRj0rRkoqPoP5aqgI8I4wpLJ++lDyfafAnlOFVBy/vwTf9qL8sOM9283gbY1IVFrTKSC
 d3whdG0zAJmGpmtcCxNAUYYlP1caQJsJ4YjizPb86GOV7GOXhgbNPU7h6ruuzBSJOyhU
 4fYe6mbsPTeUY4oi0VMw4y7gyYNGR0qpMveumv+C/StK2gtZw2agy6iwV4xBAw9rJ+f0
 liDXQhymuXTLK/0GFWzmR6HlDJaJKQlnRbwzwyHHG0CcNHPI8diO8KclaEXvf0xCtj1B
 9gPg==
X-Gm-Message-State: AOAM533CodP5qwaWNKTFQoCxc/UPN0PpmNjtiQQ9jomPN7iQgMoTkrUc
 NM2HpmbZl8j5auFGH4YLrfwbAEXH6thWLbzLpVw=
X-Google-Smtp-Source: ABdhPJy3oqTHjmtI/9h156g6mOV5HET3B4hfFPT2yUpAatV7oezrf1Q8DRCTJV9VbqdCU3nG+/i/QmNOTEVaBGqPMfc=
X-Received: by 2002:adf:f50e:: with SMTP id q14mr27909032wro.183.1626680394659; 
 Mon, 19 Jul 2021 00:39:54 -0700 (PDT)
MIME-Version: 1.0
From: Kaushambi Sharma <sharma.kaushambi@gmail.com>
Date: Mon, 19 Jul 2021 13:09:38 +0530
Message-ID: <CA+ErUJEvv+aZXytQ-xXmfuHYb0OiYXj7kemxqi1eJJnzaG6P8g@mail.gmail.com>
Subject: Mining Maintainers mentorship program 2021
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
Content-Type: multipart/mixed; boundary="===============2889004975275881051=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2889004975275881051==
Content-Type: multipart/alternative; boundary="000000000000163c8305c7750bde"

--000000000000163c8305c7750bde
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

-- 
With Warm Regards,

Kaushambi Sharma
India

--000000000000163c8305c7750bde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><br cle=
ar=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>With Warm Regards=
,<br><br>Kaushambi Sharma</div><div>India<br><br></div></div></div></div>

--000000000000163c8305c7750bde--

--===============2889004975275881051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2889004975275881051==--
