Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D9CC2BA16
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 18:34:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19132078E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 18:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXpM5y7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19132078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A11F826632;
	Thu,  2 Apr 2020 18:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIqbd71vF+UJ; Thu,  2 Apr 2020 18:34:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B5DD2549D;
	Thu,  2 Apr 2020 18:34:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5C4C1D74;
	Thu,  2 Apr 2020 18:34:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3017C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 18:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B173E865C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 18:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3o0sVb-E81h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 18:33:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 34B638651C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 18:33:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id g9so1852227pjp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Apr 2020 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyphBXh8PTHTDQxehHVJCwGunWLiChskEfIoqWTwvaQ=;
 b=ZXpM5y7GAP9A42RTYplBVCjCe33qIGw2JT0x/NKRNTBtE+7b4Zlc023CFcBP3pjKNa
 5ATyJcpTADz2kMNWYlFbVAtc31nQAsn+WWG0wgfD/Uj7flG85i6+ymRQekR+7w1dd6fi
 537SiNd9M08XnpAyffnAJRqlOOqFllOg1FJ3jVtlPDPk5GWAFw4WWwUPjshtzDAzb77I
 UmxhRCvEvD77fpsXDyxewGth0S/yQRxM99HLjyHYdFJjeY3p6yjYTvoYcRFIYo5+R+/E
 Vy999SfA/2YFblHW++SjU9ov1U6BiFcqBm2okAdZYbFBcudcWu1POyaVWI5RYiDa52F5
 w8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyphBXh8PTHTDQxehHVJCwGunWLiChskEfIoqWTwvaQ=;
 b=eW0s9rAKmzhw5ubv+5KUKpXzCarPv9GaO3tpwKD3dsBBCgwRBHXfhf34iAoRWGWEoa
 CTlFW33Wihp0eigFx5ebSo23KjJm9b6Sa41MY81WAr35dD4NQW4dcLhriVew8uXHbDnn
 e32gr5j+lRtZMDNZ1VYyqhFtY/bpiut0L03aKTMXf9/CO53pOY/Gvf1RjH6bdv2NMWsD
 CjnZv9kkelQXDQ3YtZb4bm046ruU6y7RWY4MtEmP0tfPYHgQAuobRAIDd4xtpeRADlds
 aSwSeIJf6jLzvE6riQtHzVJsLtSkPvIqmPhayhJFoJlhFX2KlW2qMi+qRHBuDLIhuI3y
 FzYA==
X-Gm-Message-State: AGi0Puac6K8QNaqCO73fCKXWr/xUotzfFBOLdxFqJkIH/UMFgLTfTKOY
 inwEH05YjApolJ0g5aHvCiIjl/rkKpXxmRim600=
X-Google-Smtp-Source: APiQypIQUVU5fnxrgi96uTIAhx/kCF3JFOUaqIyWwDoKfIBqblI9dhgdXZIrLJOc0SXKh3FzBsKxXnzzpq8ug3Cxzlw=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr5361787pjn.8.1585852437627; 
 Thu, 02 Apr 2020 11:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2020 21:33:46 +0300
Message-ID: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: andy@kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
	dev_pm_ops
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

On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.
>

Thank you for the patch.

Rather then doing this I think  the best approach is to unify gpio-pch
and gpio-ml-ioh together.
Under umbrella of the task, the clean ups like above are highly appreciated.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
