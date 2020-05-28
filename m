Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32415C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 17:28:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66542073B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 17:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MuSRtJI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66542073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76E6486FFD;
	Thu, 28 May 2020 17:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1W7h-QHwcAZ; Thu, 28 May 2020 17:28:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E72EA86C82;
	Thu, 28 May 2020 17:28:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C68F3C07FF;
	Thu, 28 May 2020 17:28:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7049DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 587F1881F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJEQ8T98n0+f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 17:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9CB9A881F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 17:28:28 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d191so699733oib.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fHyYz6nP7wTksJQUG/djnUS6+jOyIk+f5n0ywhaKoDw=;
 b=MuSRtJI8VTGc0UCEzAz3cuwZDM2mqqIlSnl5vwZVEY+qBeK7LBTNAmhIB77xiHMlmK
 aJx4mbm4O7iNGqKCDbgCzCpTOttRxL774RYYI69d2wkxl4WK5OQfovvWFrs0W6ntR8h5
 /HN6NraT5wLOdz1a5pqfhH63Ig7NIhYPJPpuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fHyYz6nP7wTksJQUG/djnUS6+jOyIk+f5n0ywhaKoDw=;
 b=N59oDRHIkJKSBprHck2U0fW5TifVR7+NaveN0Tf4nyc5JSjCptBXjppcC+5ODu0aWA
 +C6TgTxgifnIVCy7riFttMzC/KugNM9795yB5PoCGmeuuTLYoF/WCsiZKwTRVjri8kNU
 0H8I6VUGqE/4S1obntdg31NdU1G/6C2dq5gTwQnZWfBZt386Lt1L2NiJbF5bMxtl1+Cy
 oxEaNrI1XFM1bTmto5EyGxFNihi+3YVKp9NPA4RijCtEoE6WuA2SJ5b7WSKQ1nqPkWzt
 dmod8Bskd8HtuElfRygVpq+eejwBBmll0BKZvs3ZTrofxZHABwVnANxg/ALSS7/EfzKd
 MaPg==
X-Gm-Message-State: AOAM532FMAK7QI8LWc5ovhb2HlfbcVEdHGtVb8SPuzxSIJfMWLKW+vu/
 5qxYcBj7eMYbk/tHtp7DMV6+FNQu
X-Google-Smtp-Source: ABdhPJz8K2qEpKSG8d/E96Ivi+1oX/z6t2E69KX04odQ/hKLRgeQYkcpMySfRzy/nyC+2t/bI1VHWA==
X-Received: by 2002:aca:ad45:: with SMTP id w66mr2974934oie.59.1590686907819; 
 Thu, 28 May 2020 10:28:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id e190sm1995327oib.5.2020.05.28.10.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 10:28:26 -0700 (PDT)
To: Vitor Massaru Iha <vitor@massaru.org>, kunit-dev@googlegroups.com
References: <20200527003420.34790-1-vitor@massaru.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9b12d44c-938e-b57f-d3ed-509b8e1b07bc@linuxfoundation.org>
Date: Thu, 28 May 2020 11:28:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527003420.34790-1-vitor@massaru.org>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [fixup v2] kunit: use --build_dir=.kunit
	as default
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

On 5/26/20 6:34 PM, Vitor Massaru Iha wrote:
> To make KUnit easier to use, and to avoid overwriting object and
> .config files, the default KUnit build directory is set to .kunit
> 
> Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>
> 
> Fixed this identation error exchanging spaces for tabs between lines
> 248 and 252:
> 
> tools/testing/kunit/kunit.py run --defconfig
> 
>    File "tools/testing/kunit/kunit.py", line 254
>      if not linux:
>                  ^
> TabError: inconsistent use of tabs and spaces in indentation
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205221

Vitor,

This patch doesn't apply. Can you change to subject to be unique
Fix TabError and do the patch on top of linux-kselftest kunit

I think you did this, but I can't apply this on top:

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
