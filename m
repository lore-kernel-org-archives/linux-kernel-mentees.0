Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C36EB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jun 2023 20:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FD360F69;
	Sun, 18 Jun 2023 20:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3FD360F69
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EZ4Mblc/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jwz0_M7hnal; Sun, 18 Jun 2023 20:26:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9A44860F3F;
	Sun, 18 Jun 2023 20:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A44860F3F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84138C007A;
	Sun, 18 Jun 2023 20:26:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1974DC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 20:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5D4E4155E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 20:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D4E4155E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EZ4Mblc/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9NPsweFlTkl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 20:26:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87374148B
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87374148B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 20:26:41 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-97ea801b0d0so74498866b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687120000; x=1689712000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JtpsaaTsTXJO+sfNJLIul5lew5oYM95owcw4xKGdHxI=;
 b=EZ4Mblc/3gcELGv63dRY6ntzs7K/IIz5+LSZRi2SoiyOE1osPjyASwslgQVCO2Q5pS
 g6t0kjz1jflwpYIFT2c0gXeJyBX045ALhajL0O/9yixKwDLTFJoG80yQYk4Aq5WoHLfi
 By7ixFv4YauvLk6RzWyGHl42YRn1HrlUGjI8ZyA4NtVeQgcsBJqHSEgCtalsde/vR+cn
 DxkEeLOZf5BiUq+ItrndHjChbc+Bb77LFhy+RKD+WYZV0lV+bx9JPL5dKVkplkvmpwnX
 GfpRfOSEaiyXB0ybL3XMtTxKtzYiK1I0ghAJhzNyRiqResKzZ4a5DmAsGww7+R7nz3iP
 NyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687120000; x=1689712000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JtpsaaTsTXJO+sfNJLIul5lew5oYM95owcw4xKGdHxI=;
 b=KC/gNphxNfnPJhqnvsBLi4SdgNi6Xw4hZSJcQ1Hl0zsj2vD8cZbFb0Dsw6lzvGiMz0
 Amiglub3IHAaKA7vHFw3d3HozNB77jBS7MGYkSIMbrFnspp19OaJ7+7n9+xcDS5cHami
 Ch5ocS76dlPItbHUuT+ljVfvfayH1dlRKHZbQ6Tf5fIRZXAD8m9tLjVA4AdImy8rfR1C
 5tM3PSRJSc9PBDwbz/hWmuZLeOUt5pqJOg3ZeNuGJ8+EXZumDjbyQkyCU1eEqGrIh5k5
 rl/Rw0HPiK18VewoWy7NKqv7rivTR1gtXu9EUPdipBp0gl22Mhhdex8PFd1f9GH5a/cM
 QnkQ==
X-Gm-Message-State: AC+VfDzL3LToHUB18M/iqaEPfSbPWlELQt3cx6/7aWwNWrGBUjSK98Cv
 BCD11LfVd6bg4OENi7WZYaQ=
X-Google-Smtp-Source: ACHHUZ6jVRofnMnicdJKzt1bOfVINJNv2wm3DpK/rcO7hRC6oTxDDT2UKXTup18XZEz9CxlSn/8woQ==
X-Received: by 2002:a17:906:74cd:b0:987:f332:5329 with SMTP id
 z13-20020a17090674cd00b00987f3325329mr2607902ejl.1.1687119999834; 
 Sun, 18 Jun 2023 13:26:39 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
 by smtp.gmail.com with ESMTPSA id
 gz17-20020a170906f2d100b00988936b142bsm825165ejb.147.2023.06.18.13.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 13:26:38 -0700 (PDT)
Message-ID: <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
Date: Sun, 18 Jun 2023 22:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1687092111.git.yogi.kernel@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1687092111.git.yogi.kernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, dan.carpenter@linaro.org
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

On 6/18/23 15:03, Yogesh Hegde wrote:
> Rename variables in struct rtllib_device to avoid CamelCase which is not
> accepted by checkpatch.
> 
> ---
> v3: The driver is split into 2 modules, calling the functions directly which
>      the v2 of the patchset does breaks compile. So reverting back to v1 of
>      the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.
> 
> v2: Removed the variable and called the function directly instead of
>      just renaming the variable as suggested by Greg Kroah-Hartman
>      <gregkh@linuxfoundation.org>.
> 
> 
> 
> Yogesh Hegde (4):
>    staging: rtl8192e: Rename variable SetWirelessMode
>    staging: rtl8192e: Rename variable SetBWModeHandler
>    staging: rtl8192e: Rename variable LeisurePSLeave
>    staging: rtl8192e: Rename variable InitialGainHandler
> 
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
>   drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
>   drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
>   drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
>   7 files changed, 24 insertions(+), 24 deletions(-)
>
This patch series alone is fine. But when my patch series ([PATCH 0/9] 
staging: rtl8192e: Remove unsupported modes a and 5G) is applied before 
it fails as we change same lines. Will see what happens.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
