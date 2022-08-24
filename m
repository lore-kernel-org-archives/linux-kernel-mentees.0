Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B10CC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 12:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B69409AA;
	Wed, 24 Aug 2022 12:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B69409AA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rciuwxHp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsap6sKwh0gu; Wed, 24 Aug 2022 12:53:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BB27A4030A;
	Wed, 24 Aug 2022 12:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB27A4030A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87544C0033;
	Wed, 24 Aug 2022 12:53:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD8E3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 12:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3296402E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 12:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3296402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilAXtX6q7lIF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 12:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB0D402B1
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DB0D402B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 12:53:38 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id m15so8904764pjj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4x7rCbb98jj2MaSBdFm3SDEQp0i7SVqT+8rNiIgDvNQ=;
 b=rciuwxHpu+evpljQNfKJs+0b1dm0bOGf5k6J4GfJ8Ob2IKOQQrElCqhhYKDsCIIjl0
 h/tsTCQrEI6c4+WjnVOEhYSt42CA9ky8fTpdqnMSizqPvWuwMgXbMsOEBN4/qbQ5RJ6K
 WKaHxejxgDk5o0x3wvahIeAo8FdrxqQc9IaGT9ncDJC+6ufUu5Q2rEDXvBfUlqiTBvJo
 d2S+WEo4OjaJci8aN0GrQupoKi9P9KbiR+J2DN64lO23y+D0bY08felAedr/11/FUTP7
 AdQsPuCGg6OTPw1xE1ZDnbfobion26t++Hy4Ac9io7PbM52n6wfVNEb6NdubzgCenD4t
 jgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4x7rCbb98jj2MaSBdFm3SDEQp0i7SVqT+8rNiIgDvNQ=;
 b=ao92m4gQfjgxkxOhhxkxks3nry+h7WDqqbQJbJ9cmJmby46BYm5oZqKnUFcI3L6PAX
 yBosagLN4x/cpKmTxe9k3FNZyAMOL+5kw8ptmu8GgShE6SP2zmitjhe9H5N6Y7zhEuAz
 ffjM2/rY7bG0XPUNiTiJxldg/4DEsq2eqJ/glTthDo4A5zl872rs303+lKUV+osoIThz
 81Rae9OztNlkVh7PP7Je+gFJ9hnTjYdQCzXWrfbt25qYxqsJm1K6mW/cZYPqIhls1+I1
 L9ZKxekUBRLk/pUFwgU2ZKQCHI5/W8nWgAjECSttF/BMAIMnFznT7VVDIv7MQbWCjYOz
 s3Jg==
X-Gm-Message-State: ACgBeo0vIFg/WQOiLX+YlDImrD5sI65fX2v/5jFXxvfoNWScCAWiq3VH
 eXCi0pKr8jr6DbSk7VK0iPXjOQ==
X-Google-Smtp-Source: AA6agR77A1nkMFGgKB89xERjp52vEWHB5SOhbqG7h6vi9MrZLvKLm1L+Fj0SrOLng6jFSwdPvfIbQA==
X-Received: by 2002:a17:903:258e:b0:173:10fb:10d6 with SMTP id
 jb14-20020a170903258e00b0017310fb10d6mr4172092plb.67.1661345617755; 
 Wed, 24 Aug 2022 05:53:37 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a635253000000b0040d75537824sm6722788pgl.86.2022.08.24.05.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 05:53:37 -0700 (PDT)
Message-ID: <202a2d80-5290-452e-db8e-3a0c10b79840@kernel.dk>
Date: Wed, 24 Aug 2022 06:53:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] loop: Check for overflow while configuring loop
Content-Language: en-US
To: Siddh Raman Pant <code@siddh.me>
References: <20220823160810.181275-1-code@siddh.me>
 <166127140632.124225.483036207879834754.b4-ty@kernel.dk>
 <182cee8e2a7.5a62eb4811173.7413734946973464259@siddh.me>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <182cee8e2a7.5a62eb4811173.7413734946973464259@siddh.me>
Cc: linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 syzbot+a8e049cd3abd342936b6
 <syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com>
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

On 8/24/22 2:12 AM, Siddh Raman Pant wrote:
> On Tue, 23 Aug 2022 21:46:46 +0530  Jens Axboe  wrote:
>> Applied, thanks!
>>
>> [1/1] loop: Check for overflow while configuring loop
>>       commit: f11ebc7347340d291ba032a3872e40d3283fc351
> 
> Thanks!
> 
> Though, it seems that you have used the mailing list's address
> (linux-kernel-mentees@lists.linuxfoundation.org) in the author
> field instead of the Signed-off email.

Weird! I'll let Konstantin know about this one, I've manually
fixed it up.

-- 
Jens Axboe


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
