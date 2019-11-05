Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1DDC5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:24:15 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04E121A49
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsnbdRGo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04E121A49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B956CD9E;
	Tue,  5 Nov 2019 21:24:14 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76551D88
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:24:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41308844
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:24:14 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 193so15591716pfc.13
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:date:subject:message-id
	:to; bh=L7N+F/KFanfHRPR5N6knagZCEgOaZBvU8KPz8c4qzEE=;
	b=lsnbdRGoGLKgn86MjDzoQjczcuO7IENaL3jjk4cLRpAX2YKCgSEdTa72d+s0/0JLe9
	SqsBrOVoIFtx0ay0wKABn0NTmukqSc+brDoN/wMH4sm1K4ft4qFGK0lsIE8y3JW3w5AJ
	Vtzrz2FeiLQM7kv6MggHdN99uwKmNrgN/WIlnkcQdcG9vDhJo9uqN7lorrNwZxevKCyW
	aefBz/z9IOzCtxw9YEkOfF6teMGFzwqHXc53dj/zT9YzCP52V0PcTO4xk621qs6Jl90B
	HJ1SRLJzjYxSJGT3jzVsqzmwCnywViXPoMr68eJrFMBabeI8UJeE2eNpgZSb5xykDn0U
	F8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
	:subject:message-id:to;
	bh=L7N+F/KFanfHRPR5N6knagZCEgOaZBvU8KPz8c4qzEE=;
	b=QAHSpA9cDrXOSIpuVjqvxfN/Ey+iV00KjtgziRpvfCe10LFSNb+xaAWmQxrzmp9QFW
	qunZBh4KD6Ojv8XcrZ4FPRFa0+sgLwxMFq4eoP1kTOMtp9GgauerYEnQlgfGpjh7n3ko
	H8p4zE4XTP5Euz7a2YYLEBUKC9K66C9TXuCqx2s95yAvM8W+WNTQEXuTf8QXGDYV4ivq
	CRjh0+U1iGvkL18taQTxQUPlZvbsegVjoTyabDYV4L11qvXcPV3B+vEHOhIvdLpEubzP
	3k0KyUWlaRLxJg6UWWj2rBzuwhdOMcDibzovxTiET3drRpArvFeIsDdNsyMC1isL5XzL
	BnJA==
X-Gm-Message-State: APjAAAX2+ZXAtSyHwMTPjAzAAkEcikKKWJrIzDviRNy4oW5Ux/KY32G4
	ZT5618bH8/mcmswSSsLkx3iWimxKh7w=
X-Google-Smtp-Source: APXvYqyxMIGd4r1Kbyok5KSzAIMZKn5cqdb1XbtdS0qP95lto7DvbjXDG58gyLBwDlSTYezFVV1H5A==
X-Received: by 2002:a63:1f57:: with SMTP id q23mr38474038pgm.391.1572989053306;
	Tue, 05 Nov 2019 13:24:13 -0800 (PST)
Received: from [192.168.1.139] ([103.83.69.19])
	by smtp.gmail.com with ESMTPSA id
	12sm15989009pfp.79.2019.11.05.13.24.12
	for <linux-kernel-mentees@lists.linuxfoundation.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 13:24:12 -0800 (PST)
From: Mritunjay Sharma <mritunjaysharma394@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 6 Nov 2019 02:54:09 +0530
Message-Id: <FC57C3AF-8C09-4F31-A70A-F6B96F10D564@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailer: iPhone Mail (17A878)
Subject: [Linux-kernel-mentees] Sending Email Id to Post in the List
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0006657240822847414=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org


--===============0006657240822847414==
Content-Type: multipart/alternative; boundary=Apple-Mail-0A2818FA-EECA-490C-A663-13A353427F65
Content-Transfer-Encoding: 7bit


--Apple-Mail-0A2818FA-EECA-490C-A663-13A353427F65
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Greetings everyone!=20

My name is Mritunjay and I am a second year Bachelors student majoring in Co=
mputer Science Engineering in India .Sorry, the past two emails went from my=
 iCloud id. Here is my email id: mritunjaysharma394@gmail.com to connect wit=
h. Thanks !

--Apple-Mail-0A2818FA-EECA-490C-A663-13A353427F65
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><span style="-webkit-text-size-adjust: auto;">Greetings everyone!&nbsp;</span><br style="-webkit-text-size-adjust: auto;"><span style="-webkit-text-size-adjust: auto;"></span><br style="-webkit-text-size-adjust: auto;"><span style="-webkit-text-size-adjust: auto;">My name is Mritunjay and I am a second year Bachelors student majoring in Computer Science Engineering in India .Sorry, the past two emails went from my iCloud id. Here is my email id:&nbsp;<a href="mailto:mritunjaysharma394@gmail.com" dir="ltr" x-apple-data-detectors="true" x-apple-data-detectors-type="link" x-apple-data-detectors-result="0" style="color: currentcolor;">mritunjaysharma394@gmail.com</a>&nbsp;to connect with. Thanks !</span><div dir="ltr"></div></body></html>
--Apple-Mail-0A2818FA-EECA-490C-A663-13A353427F65--

--===============0006657240822847414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0006657240822847414==--
