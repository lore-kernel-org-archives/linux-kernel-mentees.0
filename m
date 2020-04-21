Return-Path: <SRS0=yja0=6F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0F5C54FCC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 18:56:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BEB2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 18:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vez62K9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7BEB2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1A4A86C46;
	Tue, 21 Apr 2020 18:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiWUafmFPyVV; Tue, 21 Apr 2020 18:56:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE7D586CC0;
	Tue, 21 Apr 2020 18:56:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C345FC1797;
	Tue, 21 Apr 2020 18:56:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35D26C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 18:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1943887FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 18:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYGfhrcMPsIt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 18:56:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 41B0487E60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 18:56:00 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id n20so6255919qtp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=9cmgSA2jmeYl5vE87D/cDzdatVO3JlljWcJZRFJuqzg=;
 b=Vez62K9BqAjDaw0SJfrLRK7lti9ZbtlTor/rA1jAXve7WNWJcUn02XmowLZd50APSR
 Uu535DTg7V5Th4W8GqCFtcAeDo2rel/7hzqDTTzQtOgLU7UIm8D9qxMe/DK+fX7HslHN
 w0e9M0diXBJlopGnLogEJ8QQOuD5qvoqqylr7gk0oJZ6fpBEhkzJVFNeF37ypNWXwTyb
 WvU/19iSrEDK+dTTXFIyLY0bj9YiPdS72aAYCDRFVAuyyBOxcfhoaCJZFJeQTcGPElPc
 pKG9UBgU7qan3faIoNjwmF1cmET0wn2PiO9OTwfmirpPtWWLHvavcuE0rW3/n9BE5gaU
 YAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=9cmgSA2jmeYl5vE87D/cDzdatVO3JlljWcJZRFJuqzg=;
 b=bhFc4OuKhaEEfZM5Jaf8YqEYp3AnBU0++qqClTzpp+SyE/rFowOWvajr377MwBEskz
 AwlAy24/CNYtEL5IU38dY9w+D4KP2B3kp7o56L7Nmm/OPUWV6abnir/1nrZTUmWE6t31
 /J7Gc/k0LZrwXESD9YsgjiOWCRIa1U6mN5FNjGA3VROMqk5g/weu7k0WqPCkctW7K83K
 yVqvUKM1xkeBBlxmMuiz6OEi1yDRB8OEnglalSJ5pKE7Pwza/GpmoK80uXdf5B7dQV/H
 8Pgw2IwVzhSxrLOBMfE5nsNkVKpBZmVR4f0OQCEPF24//LP3A7QtoKcVKv2a+B5mWGlc
 5V1g==
X-Gm-Message-State: AGi0Pub4eyarj7FQhJqNU7Y2eKzLH3uOg4qCai+Jv+Km9Dpj80VDsZWT
 qFVu+YcyZuyX2cm2WzOdtQ7rljw3Uts=
X-Google-Smtp-Source: APiQypJZaf0WuJcAquWqZmvP/8eNjdHvoSp0pheMgjSg/x1Z8MtyAQORFMbDI0B/tAdwHTkNN6HeBA==
X-Received: by 2002:ac8:664a:: with SMTP id j10mr23209110qtp.167.1587495358860; 
 Tue, 21 Apr 2020 11:55:58 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id e8sm2243134qkl.57.2020.04.21.11.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 11:55:57 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: fenrir@videolan.org, baptiste.coudurier@gmail.com, ffmpeg-user@ffmpeg.org
Message-ID: <e56b4f67-63e8-d47c-c407-285ec950dcac@gmail.com>
Date: Tue, 21 Apr 2020 15:55:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
Cc: mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] ffmpeg s302m: are packets really encoded in
	biphase mark code?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello!

I am trying to write a simple SMPTE 302M encoder in order to carry PCM 
audio data into a MPEG transport stream.

I noticed that AES3 uses biphase mark code for frames, except for the 
frame preamble, but SMPTE 302M makes no mention of biphase mark code 
whatsoever.

Looking at libavcodec/s302m.c, it is not clear to me whether any BMC 
decoding is taking place. I could not figure it out by looking at the 
encoder at libavcodec/s302menc.c either.

Therefore, my question is: am I required to encode frames using BMC if I 
want to decode them using ffmpeg?

(On a side note: what is ff_reversed used for in this codec?)

Thank you for your time!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
