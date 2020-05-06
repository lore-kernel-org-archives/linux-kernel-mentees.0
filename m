Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D99C28CBC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 07:06:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C4E20735
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 07:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIVSMDCX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C4E20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D066E204E2;
	Wed,  6 May 2020 07:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raz30b36MNC6; Wed,  6 May 2020 07:06:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0706320441;
	Wed,  6 May 2020 07:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E636AC088B;
	Wed,  6 May 2020 07:06:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 597A1C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 07:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C3E3204E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 07:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isD866bgGinx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 07:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by silver.osuosl.org (Postfix) with ESMTPS id D0BDA20441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 07:06:09 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id k12so569131qtm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 06 May 2020 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=K6l8KY9KgPkWGL14r+EOHJ+Api8UIYnDz5GCp2L57d4=;
 b=nIVSMDCXdP4EBpkn+DWvEUbG+JWKBVV/MPWp+Dzlx+waX/5WNtffLnl4+Gm8TuYZeg
 EledgtW0wZNrxITAro7N62EugfevycLKWXzX10OykEvmGhOtGmAC3x6LOnG5YXtn1ohG
 9YOAb1mbzoxEJyZuMfvkYcH+BakWoNQEq7A09MHm00FZ8XeW+VLdPj6F2a5UvZ0fyaNK
 ElXs2WHUjsBTV9Z2zOb+Qbs736wSw64LyxB70h47BY/zikFTJzTk6hjLvtZHo2XP+wKj
 wLlhaMscmnnzFhhS4RlsFMZyAelKcVDPABl9U67VTVbPaxZowWiVn5UDzySLBW48olNk
 szQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=K6l8KY9KgPkWGL14r+EOHJ+Api8UIYnDz5GCp2L57d4=;
 b=lN3pAYkdMOX2QvcH0O84JHM0C2tfRBRuE0K0j2fT3k8hJIyH1ai4zvFtw7iHBlfXPw
 xX6Xnbug8jQVWtc6/e/N4snjkqOVSJDIRRY4Luhs6XCxUeRiZt3PSMD+Cnyjr3/jQ4C0
 WFrwiqdIuMQ8c+p8t/oSOznHD8i+rtJYtUfR8WqXQR1OfpQtE09p+lm50S0mUqu9BFw+
 01y4K9GYfCWaSseFW/0U9n9g4H0m8auFMMgDTmBfh/GqzCXC3ISLWYEmCtKVNbRb/IeW
 2Brp2OH1xBorukN/3s8XkC0ubpsVgqfPdoaV4nKxQMoMnTQeLThT7OYq3QqWqfXDy47c
 4BFw==
X-Gm-Message-State: AGi0PuYJA3QLqaaloS72QbW72v7lY1wlWqxo5bpPdrqmvLSP522KlJAe
 OHJT7PqWruqEqDKNVwR8x28=
X-Google-Smtp-Source: APiQypJzL+DMV903BNl1mG0nAnxu64WBIMH2Hl/jOjf8pJ3K006CWQLtjtbEh2Mk7Xl67VaZX2VRTw==
X-Received: by 2002:ac8:66cf:: with SMTP id m15mr6777065qtp.146.1588748768680; 
 Wed, 06 May 2020 00:06:08 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
 by smtp.gmail.com with ESMTPSA id z40sm818400qtj.45.2020.05.06.00.06.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 00:06:07 -0700 (PDT)
Date: Wed, 6 May 2020 04:05:25 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
In-Reply-To: <20200503111338.53db66b8@coco.lan>
References: <20200503111338.53db66b8@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?kstewart=40linuxfoundation.org?="
 <kstewart@linuxfoundation.org>, "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 11/11] media: vidtv: Add a MPEG Transport Stream Multiplexer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Mauro! Thank you for reviewing this!


>> Add a MPEG Transport Stream multiplexer responsible for polling encoders,
>> interleaving packets, padding the resulting stream with NULL packets if
>> necessary and then delivering the resulting TS packets to the bridge
>> driver so it can feed the demux.
>> 
>> This patch includes a "channel" abstraction, which attempts to map a
>> MPEG service into a struct that vidtv can work with.
>> 
>> When vidtv boots, it will create some hardcoded channels:
>> 
>> -Their services will be concatenated to populate the SDT.
>> -Their programs will be concatenated to populate the PAT
>> -For each program in the PAT, a PMT section will be created
>> -The PMT section for a channel will be assigned its streams.
>> -Every stream will have its corresponding encoder polled to produce
>> TS packets
>> -These packets may be interleaved by the mux and then delivered to
>> the bridg
>> 
>> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> The same notes I made on previous patches apply here.

I did not understand this. Do you mean to say that I should remove these
dashes in the beginning of the lines?


thanks
- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
