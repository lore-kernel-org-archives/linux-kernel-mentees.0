Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ED4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 02:54:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3023221EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 02:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTWcOfhn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3023221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3FAA8876F4;
	Sat, 12 Sep 2020 02:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44LldoGGkRDH; Sat, 12 Sep 2020 02:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3D5D876EE;
	Sat, 12 Sep 2020 02:54:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86DF8C0052;
	Sat, 12 Sep 2020 02:54:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47C2FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 32CB287521
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cvf-7t6pyImK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 293A887514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:54:20 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w16so11861750qkj.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 19:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=bAzZnV2uKZSkA7C3MxOC1iCbaaNtGu8OPpDSgUwBv9o=;
 b=lTWcOfhn2rhcbt4nLZPySePfHB5dVlxo8pgD5L9Phc3eX1Kp54VlRWkWwBlSIil5rD
 7+tgjgGygbzcW5QMRTjPEr1i/NEnTUk8RvUATFBJVcwpPE8/q2BbCGQEcKOE2NYvinE/
 G8dQ8oh5Uq7CH3Cq/4qfFmf8ItEWCQZHjMwNyvsAXIEt4/X+92Bk4bGETOxf6LYJQJJP
 Chlu7A+DdQd1gFWCaHIeRiG6zEbmQpPjhTHHpnkf1rNDAt4dN0MJb26kdHl9D54WdYi+
 kLonMJpu43Gk4ykY/bnSB7AL2wKs9UQ79lVdV535ewIQfeYuBEW+7mzFnF4FhY9K3IzL
 fFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=bAzZnV2uKZSkA7C3MxOC1iCbaaNtGu8OPpDSgUwBv9o=;
 b=T0O2yVRtuPxDnHHoKNUXIZ6Ft7lix+0VgDc3gY5L7f/rRI6QsUhp+NJiTSs+2Lt+Vs
 mi9rNOJtrp/+N7c+PcY/DvR3M7dhGT43Pqy8lzNGWP36/nRRp/r3pCq2dimH8LjlzlBF
 F/ITtFKYhLwvq4mIRe9tnycCRNjAv0NHOsh2k8i+S5sTZkXduLWk4vgNt+3iMMXU9SfM
 qtKLvOXSsOJ+ACNjF/qZsq5ZOQnIek/sZsxv3h7lNbdoHsB7bp3rhMBS7g1kN2ywzPT9
 2iz6rgpQ3gSUAFWJbMlQxDWw7tP6JF3Pz5rBmTvEsO3KIrgQkr2kQjsdK/qPhBXVq6OU
 YKHg==
X-Gm-Message-State: AOAM532FHZ4E+mpLakNv2DgeiIT2Dx/LTaQIYz+q9UXT15fvYCqgXsoI
 d4nhWUyBT6n1+MgwTa+K7og=
X-Google-Smtp-Source: ABdhPJzJwq6QZqROc5AJJ0jDBaWhV4EU1g0SAlHKZ6z2EIakyhZo+gfFCKlDfSRDDVmXFYrqnDxQaQ==
X-Received: by 2002:a37:a712:: with SMTP id q18mr3981849qke.428.1599879259102; 
 Fri, 11 Sep 2020 19:54:19 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id 76sm5249708qkl.127.2020.09.11.19.54.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 19:54:18 -0700 (PDT)
Date: Fri, 11 Sep 2020 23:54:15 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <78C65222-868B-404B-974E-D8808586845A@getmailspring.com>
In-Reply-To: <20200911155640.79a15a14@coco.lan>
References: <20200911155640.79a15a14@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 "=?utf-8?Q?linux-media=40vger.kernel.org=22_________<linux-media=40vger.kernel.org>=2C_skhan=40linuxfoundation.org_<skhan=40linuxfoundation.org>=2C_linux-kernel-mentees=40lists.linuxfoundation.org=22?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org=22?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
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

Hi Mauro,

> Ok, I guess I got what should be done here. ETSI TS 102 154 says that
> SMPTE 302M should use the "registration_descriptor".
> 
> From the specs, such descriptor should be filled with 
> format_identifier = 0x42535344.
> 
> We need to add this on both at v4l-utils and at the vidtv driver.

vidtv will already attach a registration descriptor for s302m audio, i.e.

dvb_parse_section: table 0x02, extension ID 0x0880: done
PMT
| table_id 0x02
| section_length 24
| one 2
| zero 0
| syntax 1
| transport_stream_id 2176
| current_next 1
| version 1
| one2 3
| section_number 0
| last_section_number 0
|- pcr_pid 0200
| reserved2 7
| descriptor length 0
| zero3 0
| reserved3 15
|\
|- stream 0x0111: ISO/IEC 13818-1 Private Data (6)
| descriptor length 6
| 0x05: registration_descriptor
| 42 53 53 44 BSSD <<<<<<<<<<< here it is
|_ 1 streams

So I guess I need to add support for it on v4l-utils then? Any tips on
how to get started?

By the way,

> My plan is to write some patches on the top of yours, in order to
> address the problems I'll find on it. If not something more critical
> won't be solved in time, we may still add it at staging/media. 
> Let's see.

Can you teach me how this works in git? Am I supposed to cherry-pick
your patches, or apply & rebase -i & squash, or something else?


>Well, if you have some spare time, you could try to write
>a debugfs binding for vidtv. The best would be to have it
>on a separate file. Failing to bind debugfs should not
>prevent loading the bridge driver.

Sure, can you provide more details on how this and vidtv should play
together? I will catch up on
the documentation for debugfs in the meantime

As for vidtv_s302m_write_frame:

>doing that didn't work. Yet, this check inside the driver:

What didn't work? It didn't compile? I should have sent a proper diff
but I was short on time, sorry...

-- thanks
-- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
