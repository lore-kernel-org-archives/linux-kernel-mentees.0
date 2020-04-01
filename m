Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76185C2D0F3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:43:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3597020842
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="RWI+XKWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3597020842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6C8E86DC0;
	Wed,  1 Apr 2020 00:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47iA-VRLWX9D; Wed,  1 Apr 2020 00:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6105586DBF;
	Wed,  1 Apr 2020 00:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 498CBC1AE2;
	Wed,  1 Apr 2020 00:43:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88199C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72D5D87456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dafN2o-+Y3vV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:43:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B1BD786FD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:43:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t9so20198924qto.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=29l1Cx3EQRTg+9C3FuFocy47P0Q9W5pPReVeNSwur6o=;
 b=RWI+XKWfSaDXusY29+11maE3rke9eaax5k1NXL5V9s98nlLQhJPNZ2LnX2kCDNSbFK
 GGEqZ3xA9w34hAVSlAySVBdYgSLzJPzitgoYCw2moesOic+Frdo4IM1fs2gszhJyJllw
 dCGmFewutA47Tm/igpqUDGnir/3efzX6vIkAX6O4zsQbbrXLLquizZDKw6Uk76Boe3zU
 vKuNi0JYie6zKdtWajostEv0sbOV3Ny/W+WOzH5GXP51U3bAEZ8kbGfPPLJyQmkX4+j8
 9EXLT2JSRXvuw/cvedQKJK8Gd8Hr/lkohg8/CyqTajxurMpQKGLWx0qorUnnEoKNr1DS
 C8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=29l1Cx3EQRTg+9C3FuFocy47P0Q9W5pPReVeNSwur6o=;
 b=ayya96WR+jDj+tt6zSp94GBkJXfSGHTIFYFrjdsuczkO/1eyi20zhZjeXsRyQIYCM6
 PHKzlua3bq8gaVOzTGo5cxcDxZAlz1Ka7SqTqbGYqGcuKud8FRIjnnwdHAWIVt1gBupC
 GakWxzDuYL5GJeCfehm7+Odts7/9GTknkVNTSfu8e0VPG2cGgKir4PpWjCMu8fnxnJ16
 TAH2VgOiM8P0P7FQxjvIHqFuwWNlX94JPx9N6YPfrJry3agbZ9oa0Lr5sCjDO9gMl9R8
 W0V0rVySvI6Dt6QsJN1YDV6kLwkXRr80HZBObxsUY1h//fIXkTvFit9tU7zrGX6eqxWY
 eRuQ==
X-Gm-Message-State: ANhLgQ0aHpoK8wAqvRkAJfcqYpm5tqan8+5BsIxKoMyZLPfRRwHW4gZg
 ey+ZHTW8dZ+15DeWd5gB9pC89A==
X-Google-Smtp-Source: ADFU+vsa9O48OZ0BTiH0JIAZqbnWZeB9KY6uad99GDtbM5YxMPs8wVGAqMTdKHx3aP9ZXRMIqGiC3g==
X-Received: by 2002:ac8:2d88:: with SMTP id p8mr8191570qta.346.1585701789565; 
 Tue, 31 Mar 2020 17:43:09 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id t6sm430247qkd.60.2020.03.31.17.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 17:43:08 -0700 (PDT)
Message-ID: <5ccaf0509d415643338abdd04493a4c6f4a77c9f.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org
Date: Tue, 31 Mar 2020 21:43:04 -0300
In-Reply-To: <20200331141450.035873853@linuxfoundation.org>
References: <20200331141450.035873853@linuxfoundation.org>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: ben.hutchings@codethink.co.uk, torvalds@linux-foundation.org,
 Brendan Higgins <brendanhiggins@google.com>, patches@kernelci.org,
 lkft-triage@lists.linaro.org, stable@vger.kernel.org,
 akpm@linux-foundation.org, shuah@kernel.org, linux@roeck-us.net,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 5.5 000/171] 5.5.14-rc2 review
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

On Tue, 2020-03-31 at 17:32 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.5.14 release.
> There are 171 patches in this series, all will be posted as a
> response
> to this one.  If anyone has any issues with these being applied,
> please
> let me know.
> 
> Responses should be made by Thu, 02 Apr 2020 14:12:02 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	
> https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.5.14-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-
> stable-rc.git linux-5.5.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled, booted, and no regressions on my machine.

BR,
Vitor


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
