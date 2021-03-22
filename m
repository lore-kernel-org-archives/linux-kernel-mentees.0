Return-Path: <SRS0=kSKC=IU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF18C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 14:32:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3507A6186A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3507A6186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slateberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C83B54031E;
	Mon, 22 Mar 2021 14:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7v7WS53F0PlV; Mon, 22 Mar 2021 14:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F0A3402B7;
	Mon, 22 Mar 2021 14:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D95C000A;
	Mon, 22 Mar 2021 14:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F6D1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 14:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C7DB402B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 14:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Je-Ja9fKI_Qh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 14:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC27F402C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 14:32:44 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id l5so15035063ilv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=slateberry.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=QG6SkGNy8YhatuYd2rWwTx7E7Phk0XQW59qvSJOeSuQ=;
 b=KsyqwvJKXRKXu9p8Hg6ggFpZxY5kQ0eM3ngSUcLI7Zw6wdQeSGnnj/r5sw1X1UMhl5
 RtY/mhKCQIuJUCjOUIX2/OGpBcOp+zfTnmY0IeL1fWeHe/ZwCHb20VNmCWz68KYhdKjU
 GDPbHMUFMVl2lsriqAFE5bZulakldRW43ExfJPAAZeiaumtNzLHjN64I5JfnJuIgNHAJ
 gGErhoVhZiRMfdDRAM02SHTSiDbtT0BxvO1BkOMwCz+G5MGpDRPlB+VDofguL3YATZia
 P1wDuI/tgPlTwvnlurXP81Vw+MXQihGg9t0943pcQwZy9GRCuEXqSA4nNz8JgvroEpgq
 lo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QG6SkGNy8YhatuYd2rWwTx7E7Phk0XQW59qvSJOeSuQ=;
 b=O/4cQgUuglMh7HCoS6uGfmsDJr+ahkVFCrHurRg8p3rTI51BH1fgkk/ygMdrXXL1S6
 5j9EAe/EsiuKEyYznSJAGx62KBal2agx04Io1g16/MvKKdQFEHSaodcD8qCIsSb+XiWY
 SK+Suiau2hyaTWUC433gyAQ1JBtGFnjeoSa3Xp6eIvyqWJaclLhbsg6NhXfejawgM7tv
 F6Cxd7hm9hM+au0EhVQgStFM/RNG18BtYVpb4dTrADIWSgFqU5r8deNsocTxNxxhWTIY
 qricy7HDMAextx63ZKVbSos5KmV3wRbm38yq9lTpNU8d5Ev4QxZkSp7HjbjHktLp/95U
 X2eQ==
X-Gm-Message-State: AOAM530K3+b4cheXP3G5xN0BCwMLCWGcg3CPQPoW+IToxiZVZfYK8L5K
 XOA+eCYsCMtRXDoYRfpyRELyfIRw3n89/dMOsx8uRYMoW44=
X-Google-Smtp-Source: ABdhPJy1FSSe4qVsrFlJYDd9X7h9puUgda6dy/5u6lxv2fAmXdd+3F4KWBB/v7cqJdZnIWhZpOSRKhwFLvpf1bFzKPk=
X-Received: by 2002:a05:6e02:13d4:: with SMTP id
 v20mr244122ilj.1.1616423563888; 
 Mon, 22 Mar 2021 07:32:43 -0700 (PDT)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Mar 2021 07:32:43 -0700
MIME-Version: 1.0
From: Lauren Harris <lharris@slateberry.com>
Date: Mon, 22 Mar 2021 07:32:43 -0700
Message-ID: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
Subject: Redirected link on lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3448711976900882459=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3448711976900882459==
Content-Type: multipart/alternative; boundary="000000000000550c4805be20f0b8"

--000000000000550c4805be20f0b8
Content-Type: text/plain; charset="UTF-8"

I noticed that your old link to the Multibit Bitcoin wallet (Multibit.org)
now gets redirected to a page on Github.com. (KeepKey, the company that
bought Multibit, redirected the site to that page).

That would be a good link if all your readers were hard-core developers
looking to restart that project.  But, given that the Multibit project has
been shut down, most of your readers are probably looking for historical
information or a suggestion on how to get their Bitcoin into a new wallet.

You link to Multibit.org here:
lists.linuxfoundation.org/pipermail/bitcoin-dev/2013-June/002837.html

We just published an article that explains Multibit's history, including
background on the founders, the project's acquisition and how
wallet holders can move forward now.  I think it's an interesting story,
and it could be useful to your readers.

Here's the article if you want to take a look:
https://cryptoassetrecovery.com/2021/02/19/multibit-cryptocurrency-wallet/

Would you consider adding a link to our article on your post?

Thanks,
-Lauren

--
Lauren Harris, Editor
5 Ross Rd
Durham, NH 03824

BTW, if you didn't like getting this email, please reply with something
like "please don't email me anymore", and I'll make sure that we don't.

--000000000000550c4805be20f0b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I noti=
ced that your old link to the Multibit Bitcoin wallet (Multibit.org) now ge=
ts redirected to a page on Github.com. (KeepKey, the company that bought Mu=
ltibit, redirected the site to that page).<br></div><div><br></div><div>Tha=
t would be a good link if all your readers were hard-core developers lookin=
g to restart that project.=C2=A0 But, given that the Multibit project has b=
een shut down, most of your readers are probably looking for historical inf=
ormation or a suggestion on how to get their Bitcoin into a new wallet.=C2=
=A0=C2=A0</div><div><div><br></div></div><div><div>You link to Multibit.org=
 here: <a href=3D"http://lists.linuxfoundation.org/pipermail/bitcoin-dev/20=
13-June/002837.html">lists.linuxfoundation.org/pipermail/bitcoin-dev/2013-J=
une/002837.html</a></div></div><div><div><br></div></div><div><div>We just =
published an article that explains Multibit&#39;s history,=C2=A0including b=
ackground on the founders,=C2=A0the project&#39;s acquisition and how walle=
t=C2=A0holders can move forward now.=C2=A0 I think it&#39;s an interesting =
story, and it could be useful to your readers.</div></div><div style=3D"col=
or:rgb(80,0,80)"><div><br></div></div><div><div>Here&#39;s the article if y=
ou want to take a look: <a href=3D"https://cryptoassetrecovery.com/2021/02/=
19/multibit-cryptocurrency-wallet/" target=3D"_blank">https://cryptoassetre=
covery.com/2021/02/19/multibit-cryptocurrency-wallet/</a></div></div><div s=
tyle=3D"color:rgb(80,0,80)"><div><br></div></div><div><div>Would you consid=
er adding a link to our article on your post?</div></div><div><div><br></di=
v></div><div><div>Thanks,</div></div></div></div></div></div></div></div><d=
iv dir=3D"ltr"><div><div><div style=3D"margin:2px 0px 0px"><div id=3D"gmail=
-m_-6148779891664430970m_-1084495376646659447m_-4668798218014470695gmail-m_=
-408491972067746283m_3488138788388989778m_7384179102769867055gmail-m_248414=
742104681395m_-4881172833632138526gmail-m_4540721236450369149m_-67905413806=
31623199m_-6818611334724111342m_7108229142253841330m_6970731877949862732m_8=
268863430003288276gmail-:43h"><font face=3D"arial, sans-serif">-Lauren</fon=
t></div></div></div></div></div></div><div dir=3D"ltr"><div><div><br></div>=
</div><div><div><div style=3D"margin:2px 0px 0px"><div id=3D"gmail-m_-61487=
79891664430970m_-1084495376646659447m_-4668798218014470695m_788574557873746=
8192m_7384179102769867055gmail-m_248414742104681395m_-4881172833632138526gm=
ail-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_7108=
229142253841330m_6970731877949862732m_8268863430003288276gmail-:43h">--</di=
v><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-466879821=
8014470695m_7885745578737468192m_7384179102769867055gmail-m_248414742104681=
395m_-4881172833632138526gmail-m_4540721236450369149m_-6790541380631623199m=
_-6818611334724111342m_7108229142253841330m_6970731877949862732m_8268863430=
003288276gmail-:43h">Lauren Harris, Editor</div><div id=3D"gmail-m_-6148779=
891664430970m_-1084495376646659447m_-4668798218014470695m_78857455787374681=
92m_7384179102769867055gmail-m_248414742104681395m_-4881172833632138526gmai=
l-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_710822=
9142253841330m_6970731877949862732m_8268863430003288276gmail-:43h">5 Ross R=
d</div><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-4668=
798218014470695m_7885745578737468192m_7384179102769867055gmail-m_2484147421=
04681395m_-4881172833632138526gmail-m_4540721236450369149m_-679054138063162=
3199m_-6818611334724111342m_7108229142253841330m_6970731877949862732m_82688=
63430003288276gmail-:43h">Durham, NH 03824</div><div id=3D"gmail-m_-6148779=
891664430970m_-1084495376646659447m_-4668798218014470695m_78857455787374681=
92m_7384179102769867055gmail-m_248414742104681395m_-4881172833632138526gmai=
l-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_710822=
9142253841330m_6970731877949862732m_8268863430003288276gmail-:43h"><br></di=
v><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-466879821=
8014470695m_7885745578737468192m_7384179102769867055gmail-m_248414742104681=
395m_-4881172833632138526gmail-m_4540721236450369149m_-6790541380631623199m=
_-6818611334724111342m_7108229142253841330m_6970731877949862732m_8268863430=
003288276gmail-:43h">BTW, if you didn&#39;t like getting this email, please=
 reply with something like &quot;please don&#39;t email me anymore&quot;, a=
nd I&#39;ll make sure that we don&#39;t.=C2=A0<img src=3D"https://ssl.gstat=
ic.com/ui/v1/icons/mail/images/cleardot.gif"></div></div></div></div></div>=
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<img src=3D"http://email.slateberry.com/d8I7pBRrJuxaIwZfRUDtnC6MxC0X2KlQJIl=
IsmNSBHIWxigm2nrpH_jzd961x5Y5xDrhqC2yslt0PV2bWNOGw9etedzbF0l7x33GEscoMU_nxM=
LFvQCOVByVR0eYBD1Rb0RVFweNnyvkxQBWJJ_Ku0t9bWqLnyaoPCIp4gCIeR0f6axtVZDA9EClT=
UzKhDzKh56CtatpwqXvjYjz">

--000000000000550c4805be20f0b8--

--===============3448711976900882459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3448711976900882459==--
