Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB79C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:36:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8F120672
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv/uEpNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8F120672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 540F087861;
	Tue,  7 Jul 2020 17:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjElj_P8mqeE; Tue,  7 Jul 2020 17:36:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E788387E28;
	Tue,  7 Jul 2020 17:36:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6047C07FF;
	Tue,  7 Jul 2020 17:36:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D15FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 68F49885EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFwQB7c4JkUl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:36:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E72CF885A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:36:24 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id k5so9243925pjg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hD+v1VwjgoeBfusFCbIYd6+V9RKkmN7xz9LUMK9w9XU=;
 b=Qv/uEpNWiakSuZNYA5rbzaOVChoyrZxuHlViO3KTV7XI6WH15OgKLlOFjNo1OxvCo3
 mv389p+O9FjSGJgY3gKdVuaPowMcstPA6vpiLWD1X/l2erLUadryvFN+qe0MSsnFqP6N
 3kWSEccbINtlLux5TRFxA3tGRoGRLQii+MmpmneyhG5Zfqo2EyD85jxWSjLS5NBZi235
 wNo2tZWXNAq+xTM1qqc8sFU4Uez7W2SVglEVsw2DN+9M0TtgA1vfp6YBDU2FBg6ungz8
 1E/rwAby402S4OHpGgVHY4dby0JtSxRuQAsB6BsgK6tuxR50TUhIf/XWOFXHQOUa4A87
 ecaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hD+v1VwjgoeBfusFCbIYd6+V9RKkmN7xz9LUMK9w9XU=;
 b=p6vNO9g+0ZjfEHvO2khfC2EUgNOpxbR28H9rpoA09vXJ1/3Y+5jJ6I6fEmbTWbTLF3
 F+yW97Aa9xB3n/5gBb+SECou0rqBeg3TdlUlCe7cXgy8B3OFVFX+44fYJvxiOlcyb2Pr
 PgU9rEzgUz/t6V8dN+Az4QxOTKgvqsmEo0ggJp1ZOG2bVHRvwSwuR7dXtvtBS8FMqjIi
 Mt1M6Xjv6qxBqgO/EayOBT+3cBKH3C7Q/kPhFv/DJDEmZEkkE8wQAQViyIJI+ldx3Eos
 romvEez8XqFrmYtNF9JXZtQgjmB5il5hhFT1t/XQ3seBkZW3fgAyegoTkECZe1QAa4Qd
 wvtg==
X-Gm-Message-State: AOAM5315BKPHbCgVZDDZLyiF2ClrVkdmYVOPxiuLh4+uTXa/oDIkx+iB
 u2ee5vM7eSvYLraUKPOQumumAfH9
X-Google-Smtp-Source: ABdhPJy3v1cAGREGtVx9lCAdWMpeWbRUW51kXJcikmNKcG38AoWdWxTkdOWfaMxLFnjl3Fmv1r1k7A==
X-Received: by 2002:a17:902:7611:: with SMTP id
 k17mr46664468pll.255.1594143384186; 
 Tue, 07 Jul 2020 10:36:24 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id c188sm22817275pfc.143.2020.07.07.10.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 10:36:23 -0700 (PDT)
From: Eric Dumazet <eric.dumazet@gmail.com>
To: izabela.bakollari@gmail.com, nhorman@tuxdriver.com, davem@davemloft.net,
 kuba@kernel.org
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <8aa6bcfe-8117-0fc9-1bc5-9b6a600e0972@gmail.com>
Message-ID: <48534d9d-49c3-5e43-d1f6-51b96ba7fd90@gmail.com>
Date: Tue, 7 Jul 2020 10:36:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8aa6bcfe-8117-0fc9-1bc5-9b6a600e0972@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH net-next] dropwatch: Support
	monitoring of dropped frames
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



On 7/7/20 10:33 AM, Eric Dumazet wrote:
> 
> 
> What happens after this monitoring is started, then the admin does :
> 
> rmmod ifb
> 

I meant  :  rmmod dummy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
