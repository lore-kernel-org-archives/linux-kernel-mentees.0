Return-Path: <SRS0=TbHr=67=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504EBC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 May 2020 00:05:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B142075F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 May 2020 00:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk1f0yox"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B142075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0A5E86D9A;
	Sun, 17 May 2020 00:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0uBleyexn14; Sun, 17 May 2020 00:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA4F886D95;
	Sun, 17 May 2020 00:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87205C0865;
	Sun, 17 May 2020 00:05:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF6FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3871520400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8sGzM4iHKseQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by silver.osuosl.org (Postfix) with ESMTPS id 701DE203EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:04:59 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b6so6607496qkh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=HwdR2oSJeubyxJObstAoNY0VbZWC9XtBQV0xlMILnjU=;
 b=hk1f0yoxhjmfmMrTn/DXpRlHHJmGE4iUZsnhuAY+6HMcrJfdxAYlfR21sNsHOELxE5
 dyzOaNxznDxukdYgpDc28nHYpA3WhV7I/T/ot38CR9pmN19Zosjnm9LNxpmfKF1MvhxG
 J05PiKkHAIXnySihbI5inPc4oVs11ZBEFS3FclozMW+BZAyWsyexNf2V6AsewXMApFRR
 vCyAkDDuIEFvEfSKbLcn4viW95IwbUbu7jMB77zkBRQKidW/ZL4IdAJuqWJ1Y/CM4ALC
 FVSE9wshRUvq38Ajpxp235CDhWyg270xkJQc/o0ilYP0lfxHHVWroS4x0qRUHMu7g0rO
 SxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=HwdR2oSJeubyxJObstAoNY0VbZWC9XtBQV0xlMILnjU=;
 b=UuNTXEpjHDn6DQIY2S3RHy/xP+M+6znUW0diLwRxKgOukZwneGgq4vsSHyt5JeQEL+
 7PcCKYNPeyfB1oPbaGSGb749XaENBlQyMC06hnzn+wbdFZ4VUx4+kQ0jody7T6mAC42B
 VS7OJtfG0iHQsowQxU9rxQ5uXetpIPdnKDEjaXAU8HATE+6prB1WLnWzSNAQVO3s/iqR
 NsCccwLos7iqub84jbFa850pHayIYLkmsHE9wFPWzk2eaQj37IoX7SXUcZZgtGc4o4Ez
 jWMpO8l5Vv/D3AqvromTqNzYDoOeMw4dd9ZVvWMlz1AcybTUj1N9ri9iwCBUftmQjYBA
 GOKQ==
X-Gm-Message-State: AOAM5322uMyVNCug1W1MiCmR+YH3LSf/t/83UXiBm6VI0QwsrxvvX2Uj
 lqA+XHd1ZpqpHirRKahgbPA=
X-Google-Smtp-Source: ABdhPJwrh5Q+3hoVWhc1D/quYBKHRf+7Gi0NigsFvlWuLbTqLjFjvcqtN6Kkr4oIjkeRorWJDstOag==
X-Received: by 2002:a37:5d3:: with SMTP id 202mr8635709qkf.324.1589673898188; 
 Sat, 16 May 2020 17:04:58 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id c24sm4867663qka.25.2020.05.16.17.04.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 May 2020 17:04:57 -0700 (PDT)
Date: Sat, 16 May 2020 21:04:54 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <A67F53F3-E285-4E60-B3ED-6747F60E11C9@getmailspring.com>
In-Reply-To: <20200517014237.30e521dd@coco.lan>
References: <20200517014237.30e521dd@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org=22?="
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do
	anything
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

Yeah the Makefile was broken, although I corrected it in the last
revision, so this warning should be gone already?

I guess you're looking at v4, in which case I have sent in new code that
hopefully addresses the things you pointed out in the last code review :)

I will try what you said regarding the platform bus and report back.

- Daniel.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
