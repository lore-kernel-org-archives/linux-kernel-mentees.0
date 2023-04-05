Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272B6C76188
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Apr 2023 20:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BE4A405A2;
	Wed,  5 Apr 2023 20:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE4A405A2
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KET6742x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBN6JirbcGEC; Wed,  5 Apr 2023 20:04:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6BA54401E1;
	Wed,  5 Apr 2023 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA54401E1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49805C0037;
	Wed,  5 Apr 2023 20:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F28B4C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8269417A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8269417A1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KET6742x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1jCHSokvqDb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14066408EE
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14066408EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso121218366b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Apr 2023 13:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680725053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qeq6stMWdZs3jAUdnCyOnUHBvyNDWCT5pxImRBQv33k=;
 b=KET6742x9iuXrTvQHP+9XK877ik/eAXlu0GgrNDUy5OJP5KaeaPCw5EHWZxDyJ0oYw
 ob3oNdeKlGSQUa7yt319+ZRqViaRmXMKPm83JrwOi/I1ZIBRIPSJ4FiO8HBjXgP56M+s
 lssJBYiRCxI2h7RHMbkoVWsqGj1MMfn1zv5IDzQIqNFq2I0Gsu9C4fMdbbXIOYPvemDY
 ng7u9apnNlD2rpdIHz8CrIJJlsObZ7kdMIbAgLSuPpQPVY7Kwjru3ctvWsnRuk7LQF0f
 cxwzSRXTs1Yt3/ISEGo6OZFkMvgw9xSA9AjH5CjFnd3K55xhaqoJFwDnIuDBCU/VZc6I
 eOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680725053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qeq6stMWdZs3jAUdnCyOnUHBvyNDWCT5pxImRBQv33k=;
 b=7SyX0MqaeycDAPZNx+3tZ3tnhrkucy+kA4pd7QsyL8m9wIQVVEHTYYj8dN26DvUHJd
 +rRljYFDTC3DcB5sxdi1y4IxxLsYkLjxgwOev+q0BTURSjqEAvni9kmPHTov2QycnG3h
 TATFbAXSlAaZ2CXf1rF3YFMoKXpXedIOccgdTAGJanCWPd/1rBzCQM+INzJ8p5RkoWAB
 TpdTSRh7fJQk25PKhHoffDymRkJ1Yv5edRzwEpkAb9nqwMus1MiSdceCJ9dqmx/iNl3+
 9KTMfGL//jDb03pGDleLzkdi3sRxmYmnxz1Rm2atDTjurZ2v4BI9LvkW+0BQggmcqn3D
 dJQg==
X-Gm-Message-State: AAQBX9cpyR96Iqo11TWVemhM98djMgE/zOOxphYPrjoed0PrX4mrT/Ss
 CTvE4SH0gdyeYVTLllB5Fxg=
X-Google-Smtp-Source: AKy350ZPXeb5mCV8txycSZmCPdPT9yLoGy/tXpowsiDeHt81VCxgync7lPxUrUkGb634mIJ/k+UEqA==
X-Received: by 2002:a17:906:5195:b0:92c:fc0:b229 with SMTP id
 y21-20020a170906519500b0092c0fc0b229mr3275187ejk.0.1680725052955; 
 Wed, 05 Apr 2023 13:04:12 -0700 (PDT)
Received: from [192.168.10.16] ([37.252.92.225])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a50c385000000b004ad601533a3sm7750604edf.55.2023.04.05.13.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 13:04:12 -0700 (PDT)
Message-ID: <63569398-5487-92e4-3c80-48b11f3fb097@gmail.com>
Date: Thu, 6 Apr 2023 00:04:11 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] selftests: media_tests: Add new subtest to
 video_device_test
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>
References: <20230401092207.16667-1-ivan.orlov0322@gmail.com>
 <8038b636-7275-4f44-0b1f-df4190b94a40@linuxfoundation.org>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <8038b636-7275-4f44-0b1f-df4190b94a40@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

On 4/5/23 23:03, Shuah Khan wrote:
> Leave this text here so it is easy to spot. There is no need to move this
> down.
> 

> Otherwise looks good to me.
> 
> thanks,
> -- Shuah

Thank you for the review! I'll send the v2 with the mentioned changes.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
