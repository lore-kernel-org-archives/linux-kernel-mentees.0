Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B1CC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:43:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E7522286
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+ltZlIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E7522286
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12C3384826;
	Wed, 16 Sep 2020 13:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ns5tK2GLSA0; Wed, 16 Sep 2020 13:43:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 165D38466C;
	Wed, 16 Sep 2020 13:43:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2FCAC0859;
	Wed, 16 Sep 2020 13:43:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE92BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DB81284771
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Em84ETS9YaTJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:43:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ACF418466C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:43:48 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id q5so8169829qkc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=i+kt8NbkJcxlxgcLxVS6CeOWPHcc3xF+IDhB44RR268=;
 b=K+ltZlIe+PijHm11DJWUqDWOGK2CdfuB9iqjxvoegeouGbkxeLuGjgXq8AfRPqyc83
 5BHzN7xmpjLoZdpzmrN8ETQ1hUjyyZZKVHQpiXj/S5ufWgFvtFmGrrQY2Xbds/0CWUxa
 gs3PLHuK9TjcK6GhGS7+T4bc5U802IRNgTkWD9hkDuzsvjatOhilPYNN78lpKbZ1diRt
 e+azuXZ6VvKEU+qC3SInjzTlG17ZqHbogJEvggkUFdJodfY8cDjE9zaWR8RYUcp1v64/
 fUikdKP51cMfrylKb6jB/4YcOSCuSuVolzOLl0jovm/fs32vnYF7G+dEGjYT4agmpI0C
 sG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=i+kt8NbkJcxlxgcLxVS6CeOWPHcc3xF+IDhB44RR268=;
 b=hGoq4JK8ud+vNaR+1+z/wrFqxOLsfK0crxRJ9dED5MUCbbFZozlCz4gS1uTqQkKy6c
 6CZ4aYvNmMU2S2DRZU0PKlrLeArvXQxD5/t5+MrG9L8MNj8+FzP7UWyZ9DUsy6K77aUh
 enCsWKdIygQyRlxpWGXgFCO3rkFeka9gGaj4pmlY5z/URdvnTUBasQc82J7fAUSsU4S8
 4Rim0FcGoBCyB/a+B0czgnmj1n7VkI+29LIGdjpLXubPHUI4JU1UIq3dNLHpypRamR9X
 +IaAswoFsh2PM9QZVU/ABcD+zdOFsKfmMsB4Dadxe1+9o7cqULMouvp0QaVzD7zLDy9E
 pW/A==
X-Gm-Message-State: AOAM5330NljTWgQNrEQGtAjmwNzPMi/r9/yAaRNhITCq36vO4XystmsW
 eV/Em31E+0fEHDJeenJeBJo=
X-Google-Smtp-Source: ABdhPJwQ2ByIHypHf9G8Fq55SO7s2+ErkosiVaEblPF4LX6tR/hvnvJnDSyT3oXWCruYXXL3omPuVw==
X-Received: by 2002:a37:9f4e:: with SMTP id i75mr21405479qke.180.1600263827681; 
 Wed, 16 Sep 2020 06:43:47 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w6sm18891846qti.63.2020.09.16.06.43.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 06:43:46 -0700 (PDT)
Date: Wed, 16 Sep 2020 10:43:42 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <BAE73C66-D2B7-44A5-8CD9-72D0430BEED7@getmailspring.com>
In-Reply-To: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
References: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] media: vidtv: fix build on 32bit
	architectures
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

Hi Mauro, Geert,

> That doesn't seem to be the right thing to do here.
>
> Assuming that sampling rate is 48 kHz, you'll
> have duration = 1.875, which would be rounded to 1.
>
> In other words, the above is identical to:
>
> au->pts = count
>
> Now, I don't know from where that CLOCK_UNIT_90KHZ came from.
>

Mauro, here's my current understanding:

The values for PTS have to be defined in terms of a 90khz clock. 

So for 30fps video, the values for PTS per frame would be:

frame_num/30 * 90000

so 0, 3000, 6000, 9000...etc

The same math is being used here for audio, but instead we have the
total audio sample count and a 48000 samples/sec


I did miss this rounding error though, I'm sorry.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
