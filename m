Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3074C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 00:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBC041A09;
	Wed, 25 May 2022 00:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrCwnS2CNk72; Wed, 25 May 2022 00:23:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 516C041919;
	Wed, 25 May 2022 00:23:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E71E2C0032;
	Wed, 25 May 2022 00:23:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23D17C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1743A40D01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygdLM8btoN9h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:23:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D266E400E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:23:51 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id a8so3694465ilh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oh7IQWIZ3peE69FCjIauLlZHhes85Wb72An0tykVojE=;
 b=MiwAbK50xPaA6WyUZqHsYzlwDATpBvsomOGizrUMQhu0LB6Dl4DlOUnfkhYhZTpDRc
 ZhJO6A8I03MDobNUPTdhA8nZrH2KMxaMp3imgBGlnhT8UKJPF6Tim43JScF3AiB2FK96
 8zNJU/J+H6WeWTFT81TkxkGQtu8VMDY1MuY7gzL9WEVDAPZOpharJEqABnQQBavPYjmp
 Z35mAb/wtsRIusrR7t36MsQjUQ7Dqtzm4Vd/nNn3kZMxKjv99KKNpg45E3YPzpprmnEl
 ymPyhscVcd1dzvMhJ1HjQvvFUOMWYqD9tAIQ3IeJtOf1dsjxOK/7vc1EklaYlGV9fdTA
 hHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oh7IQWIZ3peE69FCjIauLlZHhes85Wb72An0tykVojE=;
 b=LZXLqYimhNaeQqnXlKkLqwN8KomtkGbXCJNV2+O069lhpFUb9a+BQ1shrGWVHsk0E3
 dnp3ay4ca3ExO2bhfYmN9aDzZIJeXPCrE3TCMVWm+y5UvuCkqX8OSyCtR+KdwAUoGrfN
 nJCUuXqgkGV/euHFFNAif31XURIubL9ZcFDPD77+soDfJNxeZQUYNARUQnXO+geTduo7
 +SXrY6Y0yrpFMLoUlOMjZgm/IXFxEOIL2puQPZ2KPvGtDIid1T0/uo0/zD+ChJHzZ2RV
 LcGRY3mjyqUm212K+VVyjg6pUPw6e+wEV0obHAS/j7cw2fOOcWcbIkxvM3/ic+4s0C4I
 JBKQ==
X-Gm-Message-State: AOAM532GhQkDL4KlO8UtVuOUGNk8Frdw6pOIUTovEmV7ijQbEsywOlJz
 7WhmMXgAQviTURzE90PJZwlEu0YmCyXNBmUfCR0=
X-Google-Smtp-Source: ABdhPJxynA3FtMX0PZW2cTomP11Gz9aj0hFtPgBBBo8nCM7bVbaZL7xCEumiMoL9b0tQoXyziDoMcaqyzFKtB+wpVTI=
X-Received: by 2002:a05:6e02:1ca9:b0:2d1:3c18:a63f with SMTP id
 x9-20020a056e021ca900b002d13c18a63fmr14510403ill.259.1653438230961; Tue, 24
 May 2022 17:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220523165823.492309987@linuxfoundation.org>
In-Reply-To: <20220523165823.492309987@linuxfoundation.org>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Wed, 25 May 2022 06:23:40 +0600
Message-ID: <CAABMjtH6c6iFXxONOz19Cixuo6+HwDwvM5u34Hb7DDCUQVecJA@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/132] 5.15.42-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: f.fainelli@gmail.com, torvalds@linux-foundation.org, slade@sladewatkins.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, akpm@linux-foundation.org,
 jonathanh@nvidia.com, shuah@kernel.org, sudipm.mukherjee@gmail.com,
 linux@roeck-us.net
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

On Mon, May 23, 2022 at 11:08 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.42 release.
> There are 132 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 May 2022 16:56:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.42-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Compiled and booted on my arch x86_64 system. No dmesg regressions.

Tested-by: Khalid Masum<khalid.masum.92@gmail.com>

thanks,
-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
