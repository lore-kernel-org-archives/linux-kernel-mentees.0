Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53501C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 17:57:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E300261042
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 17:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E300261042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A178040208;
	Sat, 31 Jul 2021 17:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47vYBKsWwD8s; Sat, 31 Jul 2021 17:57:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F2A6400C3;
	Sat, 31 Jul 2021 17:57:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7582CC001B;
	Sat, 31 Jul 2021 17:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 498E5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 17:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24ECD403B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 17:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TxvrmDMZwvw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 17:57:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8E0B40369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 17:57:50 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id o13so12702134qkk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8lLsWsFBTk5GX+EePXyRXfmeiCt75qGJmNPOXfJYnVM=;
 b=HTk88SW14kPg7adD417jhcXA2W8lzBRVlfS4BJMvZSz0brrdQhNLVvQpjqcFqH3AhY
 QlpU5fFn4A1EF5B+ZQ6l7+NaO1sT630Wthby9T2ttP0BxgM3dq+7GXGVMcpcWXnzzzeq
 CKWeO+KrZCdk5pTrQh9M2ZmAeINXPb11eJ3lvOPnAAvP+fsnM0pXUY1/kg5ZJ8sQGARj
 Or+Tg+QM4HPS5akzf8FFPCHQrzD4wICqVYLwGyCPUkuFDyiGeUaSo4WDvLCBv9FN7ra/
 PHOb/7BK/EF4rs133pzrBFFvisxsvqkDO2k22HQKsJI1CM+8gEX/lQauUNnB0zKaKPO/
 05gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8lLsWsFBTk5GX+EePXyRXfmeiCt75qGJmNPOXfJYnVM=;
 b=YFJYoWYkRX+0bY7axi8fx8cThdujKf7AWRC35mPZ4R0biPDip+YVzzWd/s+kV2CeTm
 62EH3tgzyq1FofXP77ssflVtgG6OD6awFC7b9SYNUB/uUemJVWxa2HDPRXURFjYlDC3j
 my/qOpnZ2tK1oz8LFepb3hlpT4lfuxEfFfb7MsezxDjawK1cbX8hCXDH8bj8Qvhh3dOZ
 HkFJO5Y6sVxMcPBE44tEv6d1eCjFuBXOVEogOxnAIGHVzHWi2AP+od4TsMUeTcCRBm4l
 aHf8BFxJsTTKXF4q7hU3c2IF5Yl/aL9elEhBFFKbk+gi7HWH60AHGvMFoCs1I9mqKWuA
 RejQ==
X-Gm-Message-State: AOAM533A/+MjmArXdMYSs9SUaZk6l7FSKocspgNv2QJMxIifoeiPPvY4
 PB9AwGlgBM9hIptz3Mg/vKYBMFsjQ1YhcywlKkTMqBcn
X-Google-Smtp-Source: ABdhPJyq/q7jWjVZyssGgihlbwbo4lvzvE6BX18HTeN0/LVUndPoe/NnXnNFFjuoMG6A4D2drVS9rKhD92Ad3xFNLfM=
X-Received: by 2002:a37:a5c9:: with SMTP id o192mr7961518qke.58.1627754269509; 
 Sat, 31 Jul 2021 10:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMVeQT7u0LdFc8hjDWk5L4AognGDidw7VT=av4RQrsUbEMtDNg@mail.gmail.com>
In-Reply-To: <CAMVeQT7u0LdFc8hjDWk5L4AognGDidw7VT=av4RQrsUbEMtDNg@mail.gmail.com>
From: TANVI SAXENA <tanvisaxena19010@gmail.com>
Date: Sat, 31 Jul 2021 23:27:37 +0530
Message-ID: <CAMVeQT5TYhaW02T8+Z2ytvJY8JF1q83_X9KmyuSw5BizQRi_Xg@mail.gmail.com>
Subject: Fwd: interested in the Mining Maintainers
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
Content-Type: multipart/mixed; boundary="===============1052840890307810997=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1052840890307810997==
Content-Type: multipart/alternative; boundary="000000000000040a9105c86f13d0"

--000000000000040a9105c86f13d0
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and i would
like to work on the tasks for the mentee selection.
Thanks and regards
Tanvi Saxena

--000000000000040a9105c86f13d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr"><br></div><br><div dir=3D"auto">I am interested in the=
 Mining Maintainers mentorship program and i would like to work on the task=
s for the mentee selection.=C2=A0<div dir=3D"auto">Thanks and=C2=A0regards<=
/div><div dir=3D"auto">Tanvi Saxena</div></div>
</div></div>

--000000000000040a9105c86f13d0--

--===============1052840890307810997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1052840890307810997==--
