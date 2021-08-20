Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7938C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 03:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FECB610CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 03:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FECB610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F300080D7D;
	Fri, 20 Aug 2021 03:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eU_1N0AuxDeD; Fri, 20 Aug 2021 03:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F408880D12;
	Fri, 20 Aug 2021 03:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF5CDC0010;
	Fri, 20 Aug 2021 03:51:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 722CAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5496480D3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuJ_naSN_hka
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C64680D12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:51:36 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y34so17499472lfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 20:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=xg1qgcNsiRF3TOImLbj8rF7NKlJUfm2oeVILm3CwjMk=;
 b=V5tkT3A3YJr2GDA4f/QuFahWkvleTuDPYrqC7cj4iTJgStl4e49sCTciEJXkA8yICB
 nPG2dIMQfUbLgv1+rDtbXfi8Zg5+MkZCJ97IiQaLNGCCB2QP6Zxzn+yP3BpaVJzKWR+e
 qrnsA7wNjNiflM2gkSEhRRYRy4quXWFM/FlaD7eW+ToygLvmppiguhY+wGlGIPFFH22i
 1kLK7mlUAqa7qZcoS6szgPW4MBe4Xwa5mPQsAat3nWvZkT2uYQXBJdvgPZYRUQa2y3Sd
 xKCKLna3UHRuxjgXkncvo/nBP1N8Jb8ipVekq1tAXCzwX+hydjbrXFsj3IT7URP2pb8e
 LYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xg1qgcNsiRF3TOImLbj8rF7NKlJUfm2oeVILm3CwjMk=;
 b=H/2RsglCmSF8R5cZJbrtwDi+ZXUrouysefyBNxVMvQ93PObKdRmDY604EDGbojDLxu
 7zQzaH1TDdIHrDJ4i/T+pF/bwakQrPTo6s3YTF0TTo9GUcIyzjStTZ1pzGVKN9VebPON
 7JCTUwumSyXAwVOLPRBdyhiiJApMBdl34KxnOsPm0A2+km0aV6iqJDXZyWlSM9QD6YR2
 vdh1haziVNO8WN13SNrkSPWSew0wpB3u8tLjQ9Yg7nnEaAuoBZFZx6RQgAVmnyayLcDm
 6QF5ePL9IdTu4TDdmMPusArBrO/XQlPqPaBEpsv0piov39hUoDFz0Zas6VFFmPhH/chh
 R4Sw==
X-Gm-Message-State: AOAM530/R2RYExJoJDqVIrtPmupJ2tO5c+QTh/MNPf1lM+IONJCTobmO
 ybVnveONchjIiZoTYKfz/CqPxGky8MgEeAbVYk/twfop2Uk=
X-Google-Smtp-Source: ABdhPJx0eHrIjo3nKFa9TPIa+Q0gznOKoX6WLaIGLuecpvifShejUqANwmrf2SLZRhsPYAgfOqtqrL+P2+97+1blCLA=
X-Received: by 2002:a19:491b:: with SMTP id w27mr12584493lfa.421.1629431494123; 
 Thu, 19 Aug 2021 20:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADC0jA0R9MMLYai5b18Kp6p0vWLtLFA5fx2wys6cMNivkzyqFA@mail.gmail.com>
In-Reply-To: <CADC0jA0R9MMLYai5b18Kp6p0vWLtLFA5fx2wys6cMNivkzyqFA@mail.gmail.com>
From: Siddhant Vispute <sidsv21@gmail.com>
Date: Fri, 20 Aug 2021 09:21:25 +0530
Message-ID: <CADC0jA2Lq7FVkk8VETBjLuWrGQJEfi0G-Qt2L2=-zc4=-1JTig@mail.gmail.com>
Subject: Fwd: Checkpatch Documentation Mentorship Program
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
Content-Type: multipart/mixed; boundary="===============0476587379968218435=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0476587379968218435==
Content-Type: multipart/alternative; boundary="00000000000064a45405c9f595a8"

--00000000000064a45405c9f595a8
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Siddhant Vispute <sidsv21@gmail.com>
Date: Fri, Aug 20, 2021 at 8:41 AM
Subject: Checkpatch Documentation Mentorship Program
To: <dwaipayanray1@gmail.com>


Hey mentors,

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.
Thankyou.




-- 
Regards,
Siddhant Vispute

--00000000000064a45405c9f595a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong cla=
ss=3D"gmail_sendername" dir=3D"auto">Siddhant Vispute</strong> <span dir=3D=
"auto">&lt;<a href=3D"mailto:sidsv21@gmail.com">sidsv21@gmail.com</a>&gt;</=
span><br>Date: Fri, Aug 20, 2021 at 8:41 AM<br>Subject: Checkpatch Document=
ation Mentorship Program<br>To:  &lt;<a href=3D"mailto:dwaipayanray1@gmail.=
com">dwaipayanray1@gmail.com</a>&gt;<br></div><br><br><div dir=3D"ltr"><div=
><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvet=
ica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Hey =
mentors,</span></div><div><span style=3D"color:rgb(33,37,41);font-family:Po=
ppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;w=
hite-space:pre-line"><br></span></div><span style=3D"color:rgb(33,37,41);fo=
nt-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-s=
ize:12.8px;white-space:pre-line">I am interested in the Checkpatch Document=
ation mentorship program and I would like to work on the tasks for the ment=
ee selection.</span><div><font color=3D"#212529" face=3D"Poppins, Roboto, H=
elvetica Neue, Arial, sans-serif"><span style=3D"font-size:12.8px;white-spa=
ce:pre-line">Thankyou.</span></font></div><div><font color=3D"#212529" face=
=3D"Poppins, Roboto, Helvetica Neue, Arial, sans-serif"><span style=3D"font=
-size:12.8px;white-space:pre-line"><br></span></font><div><span style=3D"co=
lor:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Ari=
al,sans-serif;font-size:12.8px;white-space:pre-line"><br></span></div></div=
><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><font color=3D"#666666">Regards,<br>Sidd=
hant Vispute</font></div></div></div>
</div></div>

--00000000000064a45405c9f595a8--

--===============0476587379968218435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0476587379968218435==--
