Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9DDC636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 05:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF8A610D1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 05:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AF8A610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 048B1401C4;
	Sun, 18 Jul 2021 05:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHR-32nWNSSf; Sun, 18 Jul 2021 05:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2549E4012C;
	Sun, 18 Jul 2021 05:44:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F35C8C001A;
	Sun, 18 Jul 2021 05:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42781C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 05:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31336401C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 05:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxhfE13dWa4e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 05:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 104544012C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 05:44:10 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n11so7782310plc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 22:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:message-id:to:cc
 :content-transfer-encoding;
 bh=innUtTFEitWqUUuvc8mlZRJpv4aGUKMPUD6BdEA+Uwg=;
 b=kwwkY1fvBhu+tXJ/IgcdjEA655eKW4fSR/KeLsAe1C78npNh/R7hbyq/IwcOKIxf0h
 DZIY8F1UW3PUadoy7UIkXJK/DdHLmzkMEqve3tJ4DJvBv7Q4XxmSFJCe/Qa/l8fmXa7v
 gQFXl/eKXz0YVW2GsuFxW6VlcV/STKWQVkC7tV1XNg+cjtMgbR0tkhngQLDSnyktjaiO
 Wy+TnCKPerQ752psW2wv0nVBVTyR5Z6JlxyTuNADV7/VR5y4sr9okSb7QLAPqeYzy+e2
 8WbqIMg+p915y7rrLYGv+uX5jKK8E6RM79fXleDnJWe4N0buGvkij0/m9JYAaRuoIAjx
 fQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:cc:content-transfer-encoding;
 bh=innUtTFEitWqUUuvc8mlZRJpv4aGUKMPUD6BdEA+Uwg=;
 b=uKKAqXn/rL2kZKDegH986dzrZZrK80u6yD+ZJMxrFuP/bAgM1Pb1U6+InubR8t86s4
 Y15LLwELMFMAet4oWPSkw4Tf8q/rQ/3xNk9mHLIH8eAbVmwqkMpqZotip6cRtsv0cEBF
 mJ0g+Dsggdnj8aRqBGyyTJM/WTqFLS1UoMNO6ZRHbcd572oiFOT2rS2gXaFa7AkELamm
 L48YlBFmP14k3Oh/esPb//NIwx90DvPVEfOzdGiM7ck15YwYKtCijCPfXm3eNxSjiiYY
 2g7SnfUUCMOx9x381TgHpSQy22kxUpdGC+MTU1BWROmSd6WwjhVH3tjHpEze24LIXz8P
 XLvA==
X-Gm-Message-State: AOAM531LMQQF6Vtwkrou3I6GGLS0nxGzw3HqPmmBBC923CQZ3tgqc6F4
 0yElWiQ7/25vnNZwszfo1yg=
X-Google-Smtp-Source: ABdhPJynPOV6XBAJz88+LDoU+KZdLoSZL5XbulYKI3jEJ7gV3Khvdizeb0hz0ILZkM+fqxQ8VYoyiQ==
X-Received: by 2002:a17:90a:e513:: with SMTP id
 t19mr18315933pjy.104.1626587050336; 
 Sat, 17 Jul 2021 22:44:10 -0700 (PDT)
Received: from LAPTOP-EJKD55DB ([2409:4053:895:4cd:d1ea:f297:3d00:9cc0])
 by smtp.gmail.com with ESMTPSA id q17sm12068240pjd.42.2021.07.17.22.44.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Jul 2021 22:44:09 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 18 Jul 2021 11:15:01 +0530
From: "shiv14112001@gmail.com" <shiv14112001@gmail.com>
Subject: Regarding LFX Mentorship
Thread-Topic: Regarding LFX Mentorship
Message-ID: <1FF02F6E-8958-4039-805F-E071955D6B2B@hxcore.ol>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============2626527176037872303=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2626527176037872303==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-IN link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span=
 lang=3DEN-US>I am Aviral Gupta an aspiring mentee and I am interested in t=
he Checkpatch Documentation mentorship program and I would like to work on =
the tasks for the mentee selection.<o:p></o:p></span></p><p class=3DMsoNorm=
al><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Sent from <a href=3D"https://g=
o.microsoft.com/fwlink/?LinkId=3D550986">Mail</a> for Windows 10</p><p clas=
s=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>=


--===============2626527176037872303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2626527176037872303==--
