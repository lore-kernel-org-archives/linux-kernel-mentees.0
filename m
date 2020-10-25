Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF5C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 10:01:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB74720936
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 10:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzTbgpTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB74720936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7A69B2034B;
	Sun, 25 Oct 2020 10:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxlXHTKOiVvn; Sun, 25 Oct 2020 10:01:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DA02820349;
	Sun, 25 Oct 2020 10:01:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB82AC0893;
	Sun, 25 Oct 2020 10:01:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37765C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 10:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1B5D7868F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 10:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VI5Jc7fTGP6Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 10:01:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09C7B868BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 10:01:15 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t14so4359144pgg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q13Jql1sdI804M5ZiLBZ94tm21VCHGnpKBlZzlDjLjs=;
 b=ZzTbgpTB6dDexvdKHQ9yYQbFZNwscgxoibXRpvz0vbVOjwIaNAV//PEe+mm8Jtb0sX
 O2DqR0WP1RcpyiQnkTX4HL8Nj1gh1QI3G9bzi795gy30Uknl8yJ3Voiee15cuns4eEJE
 Csxsg+rwMQ3/9wp/nCcxv+Xvi5Kic/oKbjIr5zJyUinoGGJS9Z96s6nLnL+vP6qhOAEJ
 1uY9bPDL7TrYH/ZfW0lOksLKLRQscxdHiMG5OQzFjwT0wtVE0hRmcJmqATiPcKQCHyKQ
 frDDbOWUj/We3mUEQO4OHwK2tnwqlhHeVP9DO8qoNnu2K1bl2f4NX9BpDH+8PeLglfP6
 DEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q13Jql1sdI804M5ZiLBZ94tm21VCHGnpKBlZzlDjLjs=;
 b=WQeQ3ZY05Bx51zt3+CqsPDlJpwmxJLEnE8Nce7h8gwfBuB9AU3UX5Q1BuIS05ZWh0b
 Nw3w54XGAiu1e5+7w3OiuaEsF98rhjEKv13dv8e+yTNS3/Gua3JLi6JADuOD8zACNZZh
 IELYiQtBh/V/HtIxHp+FjCpymJg33rzwuaN0XD9CfzXi0uqDoarnESR24IKi93rjeFEx
 58+GgskPnN8Q49ZoHNgCNirRK8BIgkv0jJUTOV311nmQtFBbeXxMGDGMp4mqghBxzTlH
 oXx+Tuh0x6q9rlYMvdkHXs4lwhCyWqI1+C/RrYQXIq23S/HDThjTPN1OC6zCa9xtL3JK
 5+HA==
X-Gm-Message-State: AOAM530e3WqxJ1+urBNEwb1+i0G31sbEPLAzZTXtK8iRgZ1dNzuEBXRj
 bq+yRvV/ZYlC9XCbWeM01rI=
X-Google-Smtp-Source: ABdhPJzjT6JBVEW8fIjIbts7DQiRyWR/R88GdNW0hTa+XNKLrBRhVs5EEF8V2HuSWFFo4CUdTh0OzQ==
X-Received: by 2002:a63:e40e:: with SMTP id a14mr11465635pgi.222.1603620074459; 
 Sun, 25 Oct 2020 03:01:14 -0700 (PDT)
Received: from ?IPv6:2402:3a80:40f:8add:e07b:1496:e76b:799?
 ([2402:3a80:40f:8add:e07b:1496:e76b:799])
 by smtp.gmail.com with ESMTPSA id bx24sm9350331pjb.20.2020.10.25.03.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Oct 2020 03:01:13 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>
References: <20201023133828.19609-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2010232104150.11676@felia>
 <c9512657-d7d0-bf04-0e40-b3463c9f5e1b@gmail.com>
 <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
 <alpine.DEB.2.21.2010250627370.6697@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <091ba604-d5a3-fe13-f13b-6b7e31ec63f6@gmail.com>
Date: Sun, 25 Oct 2020 15:31:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010250627370.6697@felia>
Content-Language: en-US
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 25/10/20 11:21 am, Lukas Bulwahn wrote:

> This is a nice idea as well. And I recommend to do this kind of research 
> looking at checkpatch and clang-format; both will not be the 'final tools' 
> but I think if you can identify a good mix and combination of those two 
> tools, we will get a good step forward of documenting the 
> commonalities and differences of coding styles in the different 
> subcommunities (the preferences of specific maintainers and subsystems).
> 
> A last nice idea to consider:
> 
> I would like to have an interactive checkpatch.pl mode where an authors
> can say that they ran checkpatch.pl, seen the warning and errors 
> reported, but disagree and comment why they disagree. Then this kind of
> information is added to the patch in a non-disturbing area of the patch
> and we can pick up and aggregate that information from the patches to see
> the complaints, false positives to address or suggestions which rules
> should be disabled for some subcommunities.
> 
> Aditya, your task is now to make those ideas more specific and write down 
> a one to two page project proposal for the mentorship. It can be to some 
> extent in bullet points as long as it is roughly understandable to all of 
> us what you plan and would like to do.
> 
> With that proposal accepted, you have shown to be applicable to the 
> mentorship program here and we take care of the last organisational points 
> before the start.
> 
> Lukas
> 

Alright Sir. I'll be sending my proposal in few days time, on the
basis of my formulated ideas.
Will let you know if I face any doubts during the procedure :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
