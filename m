Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29800C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 18:52:54 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA4721783
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 18:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co9p9Bfw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA4721783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C3225E59;
	Tue, 12 Nov 2019 18:52:53 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 19B87D8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 18:52:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05DBB89E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 18:52:50 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t8so20939119qtc.6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 10:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:in-reply-to:references:subject
	:mime-version; bh=p4bPsn/7T3qUMIvmSHNpHX3P7os2ydzTVcewig29xp8=;
	b=Co9p9BfwDLxDyPXLNSOF4Q0DYiI8xwDwWoIaVZP6ZEammXiRnO1rWRIzMCD+GoZfnY
	xRgdth2BqE6n05otWxGEiZPgqHQwB/5GIq0EEvCudc1hai9PIbBDD0BdXhvZY+Wu/MD4
	qhLAtMzM8kKAqc8ce5AC0la02PbkpLNHXvcROt3g2h+iBIc0dzx4aKKcOho9hS10RQoo
	Im8FTyCADQKlJgwFgnokf0jvXYbibV4HeY4revXA++WVJ7ginpMfJctwA/kBqM4tnAu+
	TNbQPo4zmNV8da3qT+jvjXjB/Dh0xar6WCMpV24g9b0qvSPs2/qHNaXa9ko/4t1Aq2Gi
	BbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version;
	bh=p4bPsn/7T3qUMIvmSHNpHX3P7os2ydzTVcewig29xp8=;
	b=uBFGhhbKZ/bb645Ez8QB+bnLDYNdQRAjYEsRwCzLrwHdzsPj0CSeFqG33RsrKCsTvf
	7nf4lEzecpGmwiMwI0xtbbBn1QqXKJ+0YSTM2e8FLLxxk0gPqWbbiK2nxSGnvba7NDuI
	gGbrNkoYUaa+cxCjoMY3U1qYvDbf6zEtk1BSn7jmUD7C+t/mQBK8z5EJ4ZLRgrLCaKRT
	FiaNc/AE4aewtMvkp/P5xbc2nh7CjvNhYqiHR2sc7Pe/6HtoXl1+JqqIHzV116hkFOQT
	EEL+A09vylIZKhfHc6Ghr1orBuexi+Vqt3RwwqCLBckNsgaA19zKs1PkpJgb6bbgtK5z
	xwfw==
X-Gm-Message-State: APjAAAXyEdOVMN7IhkqzQVnc6ohj3NwgEunZQEd9BiZr/5rFLVOE1S+m
	Mkyji3VueRE6qyryYVnpiGk=
X-Google-Smtp-Source: APXvYqyn5QPch6MZAzAOmXCVx5wHfbOhl82P8An5sz/7hbqZTvfBwb5kF8mZE7KVL6AXfT6K8Sm6cw==
X-Received: by 2002:ac8:75d0:: with SMTP id z16mr33595615qtq.23.1573584770004; 
	Tue, 12 Nov 2019 10:52:50 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	f39sm10492804qtb.26.2019.11.12.10.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2019 10:52:49 -0800 (PST)
Date: Tue, 12 Nov 2019 15:45:28 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <A489E5A4-AEBB-4561-AE5E-A7C9CE7204AE@getmailspring.com>
In-Reply-To: <20191112094638.54459a23@lwn.net>
References: <20191112094638.54459a23@lwn.net>
X-Mailer: Mailspring
MIME-Version: 1.0
Cc: "=?utf-8?Q?linux-doc=40vger.kernel.org?=" <linux-doc@vger.kernel.org>,
	"=?utf-8?Q?festevam=40gmail.com?=" <festevam@gmail.com>,
	"=?utf-8?Q?s.hauer=40pengutronix.de?=" <s.hauer@pengutronix.de>,
	"=?utf-8?Q?Frank.li=40nxp.com?=" <Frank.li@nxp.com>,
	"=?utf-8?Q?linux-kernel=40vger.kernel.org?="
	<linux-kernel@vger.kernel.org>,
	"=?utf-8?Q?linux-imx=40nxp.com?=" <linux-imx@nxp.com>,
	"=?utf-8?Q?kernel=40pengutronix.de?=" <kernel@pengutronix.de>,
	"=?utf-8?Q?shawnguo=40kernel.org?=" <shawnguo@kernel.org>,
	"=?utf-8?Q?linux-arm-kernel=40lists.infradead.org?="
	<linux-arm-kernel@lists.infradead.org>,
	"=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
	<linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] Documentation: perf: fix
 kernel-doc warnings in imx-ddr.rst
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
Content-Type: multipart/mixed; boundary="===============5610864028140429859=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

--===============5610864028140429859==
Content-Type: multipart/alternative; boundary="5dcafdc8_45a9374_3c0e4"

--5dcafdc8_45a9374_3c0e4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> So this is in no way your fault, but this particular file has been the
> subject of some merge conflicts in linux-next already, so it's probably
> best not to mess with it further at the moment. Could I ask you to
> resubmit the patch after the 5.5 merge window?

Yes that is fine!
Thanks.

--5dcafdc8_45a9374_3c0e4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<blockquote></blockquote><blockquote><font style=3D=22font-size:14.5px=22=
><font style=3D=22font-family:Nylas-Pro, Helvetica, &quot;Lucidia Grande&=
quot;, sans-serif=22>So this is in no way your fault, but this particular=
 file has been the&nbsp;</font></font></blockquote><blockquote><font styl=
e=3D=22font-size:14.5px=22><font style=3D=22font-family:Nylas-Pro, Helvet=
ica, &quot;Lucidia Grande&quot;, sans-serif=22>subject of some merge conf=
licts in linux-next already, so it's probably&nbsp;</font></font></blockq=
uote><blockquote><font style=3D=22font-size:14.5px=22><font style=3D=22fo=
nt-family:Nylas-Pro, Helvetica, &quot;Lucidia Grande&quot;, sans-serif=22=
>best not to mess with it further at the moment. Could I ask you to&nbsp;=
</font></font></blockquote><blockquote><font style=3D=22font-size:14.5px=22=
><font style=3D=22font-family:Nylas-Pro, Helvetica, &quot;Lucidia Grande&=
quot;, sans-serif=22>resubmit the patch after the 5.5 merge window=3F&nbs=
p;</font></font></blockquote><br><div><font style=3D=22font-size:14.5px=22=
><font style=3D=22font-family:Nylas-Pro, Helvetica, &quot;Lucidia Grande&=
quot;, sans-serif=22>Yes that is fine=21</font></font></div><br><div><fon=
t style=3D=22font-size:14.5px=22><font style=3D=22font-family:Nylas-Pro, =
Helvetica, &quot;Lucidia Grande&quot;, sans-serif=22>Thanks.</font></font=
></div><br>
--5dcafdc8_45a9374_3c0e4--


--===============5610864028140429859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5610864028140429859==--

