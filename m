Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B101C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 16:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50A260EB9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 16:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A50A260EB9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B5C74020D;
	Wed, 28 Jul 2021 16:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wfHVi6VM1Fv; Wed, 28 Jul 2021 16:37:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F20F2401DB;
	Wed, 28 Jul 2021 16:37:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3E8DC0010;
	Wed, 28 Jul 2021 16:37:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88090C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FAF7405AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BMR3W_YrCNJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 16:37:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C10B24052B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 16:37:40 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id a19so4464678oiw.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6FOAH42Q985G5izu2SG1lTzbohVF1CmwnnP39yPkHw0=;
 b=WYgquUVodyHB40ZpI3/eEjfOKGVMbOGQGXFl+IyNyxxAwLLIUs3hUOF6/4m2tWn0qe
 GuzqC+/OcMmWU301usVULGerA4Mo4CF5d5OmWbRlUDbIi4aQbQSXcD49+YaVD8oz+oB0
 hqaxPJNCwFDGj6fZSTLdbajfOwyWsRMpOGr4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FOAH42Q985G5izu2SG1lTzbohVF1CmwnnP39yPkHw0=;
 b=KOIwzu1NHuXNw69wtCNv1eMa6SbnZfb7xQb5fJodcDBpW3z2UrX86FGiKc+HEWEjEn
 Wnbi8ojg8aabApJEZ0KJ6dbViSKijUD7fkOoaMBruJTQs0IpiJYh8o4ZDROLBAUM4iqN
 ugbOECp/Lc0wKfcKqAdOjYIeDiH+vCU9a16OV8Tld1shQEjuflCH7y0XEyAOWnPHKPoy
 mrzh306XBrfTDmGmCKH2C0Za5YumCilT7i3HrceMup/oR9+v/uKx6/LedtFZwKYRM1lZ
 NN5UzxX4NT7xJ/Ep61w602DhzyOH9bNKfIs71gC21kdAlCuTgwX6h5J86vnEfQgUGLLg
 juDw==
X-Gm-Message-State: AOAM532posgAosunkYhZsJ4Gz7L7UEtPWypbhECYiJ08VdFg08k5OHOJ
 psRETIpdBw1jTV+YTiE64UwfJ+T2
X-Google-Smtp-Source: ABdhPJz5uVhf0+XMeim195I9QZOe1alHKb0NpQmLCf9SdOKYIpwglq2m6DlSJoJLQVDNGVux3AjmxQ==
X-Received: by 2002:aca:4a8d:: with SMTP id x135mr264124oia.6.1627490259880;
 Wed, 28 Jul 2021 09:37:39 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i20sm64297ook.12.2021.07.28.09.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 09:37:39 -0700 (PDT)
Subject: Re: [PATCH v8 2/2] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
To: Anirudh Rayabharam <mail@anirudhrb.com>, mcgrof@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <20210728085107.4141-1-mail@anirudhrb.com>
 <20210728085107.4141-3-mail@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a3c433b2-3bda-67cc-1ec3-220e4530a12a@linuxfoundation.org>
Date: Wed, 28 Jul 2021 10:37:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210728085107.4141-3-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+de271708674e2093097b@syzkaller.appspotmail.com
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

On 7/28/21 2:51 AM, Anirudh Rayabharam wrote:
> This use-after-free happens when a fw_priv object has been freed but
> hasn't been removed from the pending list (pending_fw_head). The next
> time fw_load_sysfs_fallback tries to insert into the list, it ends up
> accessing the pending_list member of the previously freed fw_priv.
> 
> The root cause here is that all code paths that abort the fw load
> don't delete it from the pending list. For example:
> 
>          _request_firmware()
>            -> fw_abort_batch_reqs()
>                -> fw_state_aborted()
> 
> To fix this, delete the fw_priv from the list in __fw_set_state() if
> the new state is DONE or ABORTED. This way, all aborts will remove
> the fw_priv from the list. Accordingly, remove calls to list_del_init
> that were being made before calling fw_state_(aborted|done).
> 
> Also, in fw_load_sysfs_fallback, don't add the fw_priv to the pending
> list if it is already aborted. Instead, just jump out and return early.
> 
> Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
> Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/base/firmware_loader/fallback.c | 12 ++++++++----
>   drivers/base/firmware_loader/firmware.h | 10 +++++++++-
>   drivers/base/firmware_loader/main.c     |  2 ++
>   3 files changed, 19 insertions(+), 5 deletions(-)
> 

Thank you. Looks good.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
