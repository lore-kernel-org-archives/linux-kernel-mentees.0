Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84929C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 00:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A5740D7F;
	Wed, 25 May 2022 00:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9SyvAJz6Zv8; Wed, 25 May 2022 00:17:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 27A0440D01;
	Wed, 25 May 2022 00:17:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13C7EC0032;
	Wed, 25 May 2022 00:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07AAEC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF3260A4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NL_15NxJbomN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:17:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A66E460E02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:17:01 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f4so19957943iov.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHn9imWbM35lZ9aZLoE66UnPSUn14mE5KIF2XTLFEo0=;
 b=goKhyyuqKWVVJ20L9tbBRCQ4Y2k+5hFVbdqrF7gqdv/YG6/b6h2ChfYHblF7J6OOBX
 GA6IhqC1VuIpr/4QdPUcECnVeTcbvwK6GmUV9/Wi+A6XvqWPB/GL2JLg4DOMFA8t5xJe
 MPRpDXYfV1pL3qEZ4opXpXaCuks9Uyc/TCag8C/LQ7qFw11Bs3pYrLKjoSVxlcuR1n4j
 llsNV/FLfJFP1MOBhLmthXDI7gdlkxUpGDVnu+IaRL9NuwVko9+5BHzBXYxFWzLene7V
 tqWalZgJEkXPdDQPFkIIe6dLCbKlAVSns08xFuSUS6bF48870JLyDRRWhZy17CmJrHNP
 aAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHn9imWbM35lZ9aZLoE66UnPSUn14mE5KIF2XTLFEo0=;
 b=5l6crOZMmCZDBGcaiFgS/+slgMQxcXglJp5lM6MGqUEg0JxXtapAfatFHHVQK1/yWq
 AsYcyxlpMGKUMVQQODWobe2YGFIGkO7xzzbPrx2Pc4McxhNP0sMsclfI6aoqk+aLkZ5F
 hEQT4gDb8rQttnFUNA8Xq4W9U2rm/PNa1GZGP3vVhO8s/B12LEzopzPEDCGttUPTmk/P
 2teFuxyEQZ20pGKJ26O7j/RdGjpyNa+VoVCpVchbVpv06PTpgI1LVoraNy9ay8yoD77e
 jMwqCpbhRejMrUEZhT4SaLiRJx6aY49Fcj1yPmGW5g+5QUL+f4EifW7FxDZVjW2cIxhV
 gnog==
X-Gm-Message-State: AOAM532TNj+fsxvVuYyUtsPvJebWyh1ngApN7eonxQVoQZpuvZfa0HmG
 l14c1mFnaD5vbGmGVFVD8WC+g3GLfC9tTcTDw2Y=
X-Google-Smtp-Source: ABdhPJzoXAGPV/UGLdemQq0FE64CLQaPx929+WK2aKx6AhcFgNG+Y9MaEkvELL6JMgKnf5ACS/x+eNJ3a3Ia2Q1VtCQ=
X-Received: by 2002:a02:b893:0:b0:32d:c698:1a3a with SMTP id
 p19-20020a02b893000000b0032dc6981a3amr14467232jam.51.1653437820767; Tue, 24
 May 2022 17:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220523165830.581652127@linuxfoundation.org>
In-Reply-To: <20220523165830.581652127@linuxfoundation.org>
From: Labnan Khalid Masum <khalid.masum.92@gmail.com>
Date: Wed, 25 May 2022 06:16:50 +0600
Message-ID: <CAABMjtEwpP36YPvF6p-5rDN4iqP9HCei1BP8fBqyXQNvD47QjA@mail.gmail.com>
Subject: Re: [PATCH 5.17 000/158] 5.17.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: f.fainelli@gmail.com, torvalds@linux-foundation.org, slade@sladewatkins.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, akpm@linux-foundation.org,
 jonathanh@nvidia.com, shuah@kernel.org, sudipm.mukherjee@gmail.com,
 linux@roeck-us.net, linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, May 23, 2022 at 11:05 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.17.10 release.
> There are 158 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 May 2022 16:56:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.17.10-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.17.y
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
