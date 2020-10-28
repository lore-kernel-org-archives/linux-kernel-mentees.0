Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB90EC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:18:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487FE2220B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXrj5ksc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 487FE2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A96A786B71;
	Wed, 28 Oct 2020 08:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NXP80xnnIEM; Wed, 28 Oct 2020 08:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1A8886937;
	Wed, 28 Oct 2020 08:18:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6E19C088B;
	Wed, 28 Oct 2020 08:18:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ED1AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5302C86783
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWVAYukE5O7M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:18:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CCE786813
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:18:28 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 126so2488641pfu.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TZEpCxo6dxSCWUEUhhmKDI2wMxQMtpvMHi/UWsChB3M=;
 b=OXrj5kscHfpX4D+wxXv+eo39xa/lAjPKPGcO7r6uUVkUL31yBswZRBmGNkOWcGgScK
 Kk3+yH5dXssOFj75xCRkFuDaj8EjLAATLCWpsy3d1bMLZeeOc+j/3E//8rzJ1JKj3C5P
 LyVgRucR+5JNEjVwcIt+aA8ayPn6VBFNV+vH3hvcqCWB3yGkX7voS9CbEy5PmaOwMpaC
 GYC5oy0ykdXev7iIEbGAAnbMCxQ6HrojPTTEdn0UqL0aViTi7KUXkl7tYU+gx65Qn4Bg
 5DcKGSjJ2ZXMpLiAwnnUyAHlxgK6yA1X1qJfw8LJT1sG6rMaMnPcm62r1BxTjuKh+J6r
 YkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TZEpCxo6dxSCWUEUhhmKDI2wMxQMtpvMHi/UWsChB3M=;
 b=J6TJ9xCZCK+jB5h2J8Ovqdv7KcQNkhDB9o2/78UamhAZYUWxvziPJs4mJgRBfAHECV
 VuEc/HIRvPSS1N98SmA9+idAYNjZPyB6NT59gbW0Uf1I+cJCp/HRQKed9cMkXx9PZE2Q
 xfDF4xGSV4JFBOUDSEmv2RZOw7H+qSlddPI0bger0ajtkIeSpF3Ehi0vkpeKSCJbEOgK
 67TNYhHwITwMna/2/hla5uNivdXsPIbMsArE9CAGA1YsKr1JpOi/61ISjR1vfeOO1bul
 UUO/M9HGLjDzKQm6I7wO02F2gNjaqdnti3SvVX60VlkcABvbPW5VJXb52ooiy+sNqMzU
 wjZA==
X-Gm-Message-State: AOAM530CnGc60X24PSilPV7rk3KKr8kCavL0k+eeEz/dU1boz/7Mjgze
 iitGtp+HdZVKXdMhSLiruaYoBy51YoReow==
X-Google-Smtp-Source: ABdhPJzkmDhqRTQG46BG4BrTZhvFbHUwIVhzD00F65ESw2lFdT9A4ELnl05sbsX7nfA447AFY+c92g==
X-Received: by 2002:a63:c154:: with SMTP id p20mr5527736pgi.252.1603873107504; 
 Wed, 28 Oct 2020 01:18:27 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41e:761b:bced:2dbd:bcac:3631?
 ([2402:3a80:41e:761b:bced:2dbd:bcac:3631])
 by smtp.gmail.com with ESMTPSA id p22sm4209851pju.48.2020.10.28.01.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 01:18:27 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
 <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
 <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
 <CAKXUXMyuLhmCwR8rK-Nw2L3__5gXFcDn86fVMEz--b3Nizqa-g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <ae7f0aa5-80e6-1ae7-6763-f62791982e89@gmail.com>
Date: Wed, 28 Oct 2020 13:48:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyuLhmCwR8rK-Nw2L3__5gXFcDn86fVMEz--b3Nizqa-g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On 28/10/20 11:03 am, Lukas Bulwahn wrote:
> 
> I added some comments.
> I suggest committing for the first three weeks to create at least five
> new fix features in checkpatch.pl and get those patches accepted..
> 
> Maybe you can already make a list of suggestions for automatic fix
> features that you think are worth being implemented?
> 
> What do you think?
> 
> Lukas
> 

I agree. I'll try to be more specific on this one.
As I have not used this feature in past, I'd appreciate if others can
help me regarding more issues they faced using it. This could also
help me focus on more relevant issues.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
