Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F529CA9ECB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 01:19:57 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E2A218DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 01:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u8NXEsaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E2A218DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 982931090;
	Fri,  1 Nov 2019 01:19:56 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F7E1106F
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 01:19:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41BE7A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 01:19:54 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id l3so5349543pgr.8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 31 Oct 2019 18:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gQaBGQ6PomMMk6fICSsyptPitn6QlkrChUjI1902+xo=;
	b=u8NXEsaGgUEedGaGvrG/+WqP+c+dZnr/iumQ15t1Oq2TL1IEWa/pHJCDzYT118O4jM
	9ZEfhkcub8E6GGSjZqswlJfi8V4sRDkWoXyRWgCIK3S2cKm8gA6mIFSsgtfcQuQTG9Kp
	2u5obrg1aV+6LbZ4eAcrCWWEmWQg3PfRTpV/izqxgnFxvxfd8k7/+08hvLngqeULqCHv
	oo4cQg6AaVVYyjhS59KLK6Jq5lGPzZPCNoiin1CGQfUYYnrBhDmfdJO/lIZLYRCt//7a
	pyV2axp9fOsAh6PF6IqkQIAjsBM5+2ZypTLs8fqrVIMOht5ZKNP1kByHdKaRvHCdoP6E
	KwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gQaBGQ6PomMMk6fICSsyptPitn6QlkrChUjI1902+xo=;
	b=CerzEJiVS3AC5Ut+kAfGhl/L+9Yskbq1noDbCHgKulpSFKJ//Kv1MmSHNWagwkRf3x
	aozVsQDDnI7OOWrb0Mwh7kwKFJNh4RiYrG+3ySZ/pSsotsJBke27jS3qc2EYxEV9JYmD
	/X+aLXdAjB816mha8xkBIUgQGCDsKGByDzkM4PGY29zLiwyvaz/D0UIY5bYJK79y13O/
	Swvhn8oeUpAlx72yD79p0LcVfA/CRqzNDXfQbHZZK4YMXkUpelOCZphJ4keJdrY/EHJI
	jmM5Z0mY3p5guNNk6VAjBunajr3dmn1LA5qfVM0Nkfc/7FszRpNrWaOTImMCoTqYr5Xx
	BiFQ==
X-Gm-Message-State: APjAAAXMsGcdtALdr4y7SIklpxbLmnQhgbw765Rg211HMbBtDfTHG2XG
	Mkspetp990nUpqf6Gkkm32s=
X-Google-Smtp-Source: APXvYqwYz4F5vpSLUpbLeO/wZSv5XQJUO7I8nuhMNYna4xdDshdiMOGFW+JpQQeyI85Q6YWGH7zp+g==
X-Received: by 2002:a65:4907:: with SMTP id p7mr10286770pgs.429.1572571193557; 
	Thu, 31 Oct 2019 18:19:53 -0700 (PDT)
Received: from [192.168.1.149] ([42.116.121.151])
	by smtp.gmail.com with ESMTPSA id
	d14sm4292916pgm.59.2019.10.31.18.19.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 31 Oct 2019 18:19:52 -0700 (PDT)
To: paulmck@kernel.org, madhuparnabhowmik04@gmail.com
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<20191031225439.GD20975@paulmck-ThinkPad-P72>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <35bb2f18-791a-caf3-957d-01e43a4b3afc@gmail.com>
Date: Fri, 1 Nov 2019 08:17:36 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031225439.GD20975@paulmck-ThinkPad-P72>
Content-Language: en-US
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101011736.lIGtmb1gRh4Wmdj8-3EqxQTkfrXEQ8uepGeA4q8HM54@z>

Hi Paul,
On 11/1/19 5:54 AM, Paul E. McKenney wrote:
> Could you and Madhuparna please review and test each other's
> .rst-conversion patches?
> 

It's fine.
pull and "make SPHINXDIRS="RCU" htmldocs pdfdocs" rcu dev branch
without error or warning.

thanks,
Phong.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
