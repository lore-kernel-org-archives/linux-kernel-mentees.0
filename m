Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B736EC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 15:25:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7A9206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 15:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/9vKvvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7A9206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAF8885899;
	Sun,  4 Oct 2020 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VT-9F8-zlsq7; Sun,  4 Oct 2020 15:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC11684BCF;
	Sun,  4 Oct 2020 15:25:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF538C016F;
	Sun,  4 Oct 2020 15:25:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E13D6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D47B784B46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 15:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOzDI8OnxAyE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 15:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3AE15845C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 15:25:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d6so4830790pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=61Y9XXa32aHa2HBH5bKa29Ys7Tpne59ThWARVK1VO5M=;
 b=S/9vKvvNgK6Nw/O7vNDqpFYfPPRkGTRDHFm4Liv+pjE8n0McxtM9JKVieg6pvxyIAI
 mg2fO1mmY3MaVzzQwu4WqZ8mHX3GFbPM9mLSsGaAayWu+euQzELw7Lg5wFPRibD6J0Bv
 2zvSAWMfueSWaXeGuMNizP2MYcHzbtd046vnj09llBpIek/rJwpSYo5jcIAE/aHxky0V
 sYrkKDCldPUTyGrlM4JU7MrrCpLxZizijbdNcZGehttMA58KX+sPtAPCKZN3GD125TCk
 eWoh9RIVtDQYtV1hIiCSo6IacX0rLxYHbfHyhvnYj4ER3YFsZdKF7op6o3PhBum4dLDm
 GE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=61Y9XXa32aHa2HBH5bKa29Ys7Tpne59ThWARVK1VO5M=;
 b=H4rifDmk8g5xfvZ1oWUrKIFsfY8aQnLpwe/zJwsMYw69gKZpoB34rQxvxDAhtxsuMb
 yap5WgQoIwnHwr0m4Rno1APmnTBhWN3makLaeWo2pg7OPnNG7FxbRhTKU/FKwU0NdXBs
 EazdHFYxABQuPL9S1COtdfS7TvFxnCKM+C5y+o0CXaHOfvHSfIKlYUwI44HqSy8G5uBa
 oh/n0PKk221jt74UhH/SwQ3qT/CmHrym4FdYmCLr5sUbVmOpwZz7VEjMKkHvoYUU1yAi
 kkjBCucEDZZYix3njceMsyde0egfF7ekduWthntDqRdskcFfumUk+BHGeGVgVyCew2gp
 TMXw==
X-Gm-Message-State: AOAM531pw2CW0J72QsJW6HXquNyRa7M0+wMf5l4Plknx+swGchzZVAbn
 9rwxr4CriazUNk260yWPSp0=
X-Google-Smtp-Source: ABdhPJx97wWLfx3WjXcyASNCqXzkrzVfdDgRFx87Yag9PXstJOg4yR1urxl581eZE2Q9026h1+snWA==
X-Received: by 2002:a65:644c:: with SMTP id s12mr1176142pgv.327.1601825134548; 
 Sun, 04 Oct 2020 08:25:34 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id v10sm7698991pjf.34.2020.10.04.08.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 08:25:33 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
 <20200916054157.GC825@sol.localdomain>
 <20200917002238.GO3421308@ZenIV.linux.org.uk>
 <20200919144451.GF2712238@kroah.com>
 <20200919161727.GG3421308@ZenIV.linux.org.uk>
 <20200919165558.GH3421308@ZenIV.linux.org.uk>
 <26d881e5-f68a-b3b7-4cb0-04a3c6c384ac@gmail.com>
 <e8b218d4-e64a-ac0a-ea53-567d07a58f42@gmail.com>
Message-ID: <0537f532-1499-f644-2c91-ad91da7901df@gmail.com>
Date: Sun, 4 Oct 2020 20:55:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e8b218d4-e64a-ac0a-ea53-567d07a58f42@gmail.com>
Content-Language: en-US
Cc: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 20-09-2020 01:47, Anant Thazhemadam wrote:
> On 19-09-2020 17:03, Anant Thazhemadam wrote:
>> On 19-09-2020 22:25, Al Viro wrote:
>>> On Sat, Sep 19, 2020 at 05:17:27PM +0100, Al Viro wrote:
>>>
>>>> Lovely...  That would get an empty path and non-directory for a starti=
ng
>>>> point, but it should end up with LAST_ROOT in nd->last_type.  Which sh=
ould
>>>> not be able to reach the readers of those fields...  Which kernel had
>>>> that been on?
>>> Yecchhh...  I see what's going on; I suspect that this ought to be enou=
gh.
>>> Folks, could somebody test it on the original reproducer setup?
>> Sure. I can do that.
> Looks like this patch actually fixes this bug.
> I made syzbot test the patch, and no issues were triggered!
>
> Note:=A0=A0=A0 syzbot tested the patch with the KMSAN kernel, which
> was recently rebased on v5.9-rc4.
>
> Thanks,
> Anant

Ping.
Has the patch that was tested been applied to any tree yet?
If yes, could someone please let me know the commit details, so we can close
the issue? (Unfortunately, I was unable to find it. :( )

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
